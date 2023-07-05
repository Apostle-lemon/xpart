module mmu(
    input clk,
    input rst,
    input flush,

    input[63:0] mem_addr,       // (DataPath)virtual mem address
    input[63:0] satp_val,       // (DataPath)value of satp reg
    input[63:0] data_to_write,  // (DataPath)data that need going to be stored in mem
    input write_mem_valid,      // (DataPath)write mem enable
    input mem_valid,            // (DataPath) whether need mem operation
    input vir_valid,            // (DataPath)read virtual mem enable
    input [31:0] datapath_mem_inst, // (DataPath)instruction from mem
    
    input[63:0] data_from_mem,  // (MEM)content from memory

    output reg[63:0] mem_read_addr, //(MEM)mem address
    output reg[63:0] mem_data,      //(MEM)data to write
    output reg mem_write_signal,    //(MEM)write mem signal

    output reg[63:0] mem_content,   //(DataPath)真正读到的mem内容
    output reg finish,               //(DataPath)read or write finish
    output reg[31:0] mem_inst
    

);
    reg wait_reg;
    reg[1:0] straight_read;
    reg[2:0] status;
    wire tlb_find;            // (TLB) tlb find the phy addr
    wire [63:0]tlb_real_addr;  // (TLB) tlb find the real addr
    
    reg[63:0] tlb_vir_addr;
    reg[63:0] tlb_phy_addr;
    reg[63:0] tlb_changed_vir_addr;
    reg tlb_vir_valid;
    reg tlb_phy_valid;       //(TLB)physical address enable


    tlb tlb_unit(
    .clk(clk),
    .reset(rst),
    .valid_read_address(tlb_vir_valid),
    .read_virtual_address(tlb_vir_addr),
    .read_physical_address(tlb_real_addr),             //output
    .hit(tlb_find),                                 //outpuut
    .process_switch(flush),//是否刷新tlb
    .change_virtual_address(tlb_changed_vir_addr),
    .change_physical_address(tlb_phy_addr),
    .valid_change_address(tlb_phy_valid)
);

    always@(posedge clk or posedge rst)
    begin
        if(rst == 1'b1)
        begin
            tlb_vir_addr <= 64'h0;
            tlb_phy_addr <= 64'h0;
            tlb_changed_vir_addr <= 64'h0;
            tlb_vir_valid <= 1'b0;
            tlb_phy_valid <= 1'b0;     
            mem_read_addr <= 64'h0; 
            mem_data <= 64'h0;
            mem_write_signal <= 1'b0;    
            mem_content <= 64'h0;  
            finish <= 1'b0;
            wait_reg <= 1'b0;
            status <= 3'b0;
            straight_read<=2'b0;
            mem_inst<=32'h00000000;
        end
        else
        begin
            if(mem_valid == 1'b1)
            begin
                if(tlb_find == 1'b1)
                begin
                    mem_read_addr <= tlb_real_addr;
                    mem_data <= data_to_write;
                    mem_write_signal <= write_mem_valid;
                    status <= 3'h4;
                    wait_reg <= 1'b1;
                    tlb_vir_valid = 1'b0;
                    straight_read<=2'b0;
                    finish <= 1'b0;
                end
                else
                begin
                    if(vir_valid == 1'b0)
                    begin
                        case(straight_read)
                            2'h0:
                            begin
                                finish <= 1'b0;
                                mem_read_addr <= mem_addr;
                                mem_data <= data_to_write;
                                mem_write_signal <= write_mem_valid;
                                straight_read <= 2'b1;
                            end
                            2'h1:
                            begin
                                straight_read<= 2'h2;
                            end
                            2'h2:
                            begin
                                straight_read <= 2'h0;
                                mem_content <= data_from_mem;
                                finish <= 1'b1;
                            end
                        endcase
                    end
                    else
                    begin
                        if(wait_reg == 1'b1)
                        begin
                            wait_reg <= 1'b0;
                        end
                        else 
                        begin
                            case(status)
                                3'h0:
                                begin
                                    tlb_vir_addr <= mem_addr;
                                    tlb_vir_valid <= 1'b1;
                                    tlb_phy_valid <= 1'b0;     
                                    mem_read_addr <= {8'h0,satp_val[43:0],mem_addr[38:30],3'h0}; 
                                    mem_write_signal <= 1'b0;
                                    finish <= 1'b0;
                                    wait_reg <= 1'b1;
                                    status <= 3'h1; 
                                    straight_read<=2'b0;
                                end
                                3'h1:
                                begin
                                    tlb_vir_addr <= mem_addr;
                                    tlb_vir_valid <= 1'b1;
                                    tlb_phy_valid <= 1'b0;     
                                    mem_read_addr <= {8'h0,data_from_mem[53:10],mem_addr[29:21],3'h0};
                                    mem_write_signal <= 1'b0;    
                                    finish <= 1'b0;
                                    wait_reg <= 1'b1;
                                    status <= 3'h2; 
                                    straight_read<=2'b0;
                                end
                                3'h2:
                                begin
                                    tlb_vir_valid <= 1'b0;
                                    tlb_phy_valid <= 1'b0;     
                                    mem_read_addr <= {8'h0,data_from_mem[53:10],mem_addr[20:12],3'h0}; 
                                    mem_write_signal <= 1'b0;    
                                    finish <= 1'b0;
                                    wait_reg <= 1'b1;
                                    status <= 3'h3;
                                    straight_read<=2'b0;
                                end
                                3'h3:
                                begin
                                    tlb_vir_valid <= 1'b0;
                                    tlb_phy_valid <= 1'b1; 
                                    tlb_phy_addr <= {8'h0,data_from_mem[53:10],mem_addr[11:0]};
                                    tlb_changed_vir_addr <= mem_addr;    
                                    mem_read_addr <= {8'h0,data_from_mem[53:10],mem_addr[11:0]};
                                    mem_data <= data_to_write;
                                    mem_write_signal <= write_mem_valid;
                                    finish <= 1'b0;
                                    wait_reg <= 1'b1;
                                    status <= 3'h4;
                                    straight_read<=2'b0;
                                end
                                3'h4:
                                begin
                                    tlb_vir_valid <= 1'b0;
                                    tlb_phy_valid <= 1'b0;  
                                    mem_write_signal <= 1'b0;    
                                    mem_content <= data_from_mem;  
                                    finish <= 1'b1;
                                    status <= 3'b0;  
                                    straight_read<=2'b0;
                                end
                            endcase
                        end
                    end
                end
            end
            else
            begin
                tlb_vir_addr <= 64'h0;
                tlb_phy_addr <= 64'h0;
                tlb_changed_vir_addr <= 64'h0;
                tlb_vir_valid <= 1'b0;
                tlb_phy_valid <= 1'b0;     
                mem_read_addr <= 64'h0; 
                mem_data <= 64'h0;
                mem_write_signal <= 1'b0;    
                mem_content <= 64'h0;  
                finish <= 1'b0;     
                wait_reg <= 1'b0;
                status <= 3'b0;  
                straight_read<=2'b0;
            end
        mem_inst <= datapath_mem_inst;
        end
    end

endmodule

module tlb (
    input wire clk,
    input wire reset,
    input wire valid_read_address,
    input wire [63:0] read_virtual_address,
    output wire [63:0] read_physical_address,             //output
    output wire hit,                                 //output
    input wire process_switch,    //是否刷新tlb
    input wire [63:0] change_virtual_address,
    input wire [63:0] change_physical_address,
    input wire valid_change_address
);

    parameter TLB_SIZE = 16;

    reg [63:0] tlb_virtual[0:TLB_SIZE-1];
    reg [63:0] tlb_physical[0:TLB_SIZE-1];
    reg        tlb_valid[0:TLB_SIZE-1];
    reg [63:0] physical_address_output;
    reg hit_now;
    integer i;

    always @(posedge clk or posedge reset) begin
        if (reset || process_switch) begin
            for(i=0; i < TLB_SIZE; i=i+1) begin
                tlb_virtual[i]  <= 64'b0;
                tlb_physical[i] <= 64'b0;
                tlb_valid[i]    <= 1'b0;
            end
        end
        else begin
            if (valid_change_address) begin
                tlb_virtual[change_virtual_address[3:0]]  <= change_virtual_address;
                tlb_physical[change_virtual_address[3:0]] <= change_physical_address;
                tlb_valid[change_virtual_address[3:0]]    <= 1'b1;
            end
        end
    end

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            hit_now <= 1'b0;
            physical_address_output <= 64'b0;
        end
        else begin
            if ((tlb_virtual[read_virtual_address[3:0]] == read_virtual_address) && (tlb_valid[read_virtual_address[3:0]]) && valid_read_address) begin
                hit_now <= 1'b1;
                physical_address_output <= tlb_physical[read_virtual_address[3:0]];
            end else begin
                hit_now <= 1'b0;
                physical_address_output <= 64'b0;
            end
        end
    end

    assign hit = hit_now;
    assign read_physical_address = physical_address_output;

endmodule