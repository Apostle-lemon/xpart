module PC(
    input clk,
    input rst,
    input [31:0] addr,
    input [31:0] cur_inst,
    input [63:0] mtvec_data,
    input [63:0] mepc_data,
    input [63:0] stvec_data,
    input [63:0] sepc_data,
    input pc_write,
    input set_pc_to_mepc,
    input set_pc_to_sepc,

    input mem_valid,
    input mmu_data_ready,

    output [31:0] new_addr
);

// PC 的逻辑是，如果取到的是 btype 或者 jtype 就会保持不变
// 如果取到的是 ecall 指令，就将 pc 的值设置为 mtvec_data (当然，这里可能会有问题)
// 在 mem 阶段将 if 取得的指令设置为 nop 后，取到的指令就不再是 btype 或者 jtype 了
// 而且 pc_write 因为判断的是 nop，因此 pc_write 为 1,即 pc 会加 4

    reg [31:0] addr_reg = 0;
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            addr_reg <= 0;
        end else begin
            if(cur_inst[6:0] == 7'b1101111 || cur_inst[6:0] == 7'b1100111 || cur_inst[6:0] == 7'b1100011) begin
                addr_reg <= addr_reg;
            end else if(mem_valid==1'b1 && mmu_data_ready==1'b0) begin
                addr_reg <= addr_reg; // 如果 mmu 没有执行好, 则应该 stall 住
            end else if(cur_inst == 32'h73) begin // ecall
                // 应该根据当期所处的模式来决定是跳转到 mtvec 还是 stvec,但是这里偷懒了
                if(mtvec_data[31:0]!=0)begin
                    addr_reg <= mtvec_data[31:0];
                end else begin
                    addr_reg <= stvec_data[31:0];
                end

                // addr_reg <= mtvec_data[31:0];
                // addr_reg <= stvec_data[31:0];
            end else if(cur_inst == 32'hc0001073) begin // unimp
                // 应该根据当期所处的模式来决定是跳转到 mtvec 还是 stvec,但是这里也偷懒了

                if(mtvec_data[31:0]!=0)begin
                    addr_reg <= mtvec_data[31:0];
                end else begin
                    addr_reg <= stvec_data[31:0];
                end

                // addr_reg <= mtvec_data[31:0];
                // addr_reg <= stvec_data[31:0];
            end else if(cur_inst == 32'h30200073) begin // mret
                addr_reg <= addr_reg; 
                // 如果当前取到的是 mret，那么就不要改变 pc 的值
            end else if(cur_inst == 32'h10200073) begin // sret
                addr_reg <= addr_reg; 
                // 如果当前取到的是 sret，那么就不要改变 pc 的值
            end else if (set_pc_to_mepc) begin // 如果设置了 set_pc_to_mepc，那么就将 pc 设置为 mepc
                addr_reg <= mepc_data[31:0];
            end else if (set_pc_to_sepc) begin // 如果设置了 set_pc_to_sepc，那么就将 pc 设置为 sepc
                addr_reg <= sepc_data[31:0];
            end else if (pc_write) begin
                addr_reg <= addr;
            end else begin
                addr_reg <= addr_reg;
            end
        end
    end
    
    assign new_addr = addr_reg;

endmodule