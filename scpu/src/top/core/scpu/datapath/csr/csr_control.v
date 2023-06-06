module CSR_CONTROL(
    input [31:0] csrcontrolin_inst,
    output csrcontrolout_csr_write,
    output csrcontrolout_mem_is_mret
);

// 这个模组这个决定了要不要将 csr 的数据更新

    `include "csr_name.vh"

// parameter mtvec = 12'h305,
//           mepc  = 12'h341,
//           mstatus = 12'h300;

reg csrcontrolout_csr_write_reg;
reg csrcontrolout_mem_is_mret_reg;

always @(*) begin
    case(csrcontrolin_inst[6:0]) 
        7'b1110011: begin // if it is SYSTEM opcode
            case(csrcontrolin_inst[31:20]) // correct csr address
                mtvec: csrcontrolout_csr_write_reg = 1'b1;
                mepc: csrcontrolout_csr_write_reg = 1'b1;
                mstatus: csrcontrolout_csr_write_reg = 1'b1;
                12'b0: 
                    if (csrcontrolin_inst == 32'h73) begin // ecall
                        csrcontrolout_csr_write_reg = 1'b1; // ecall 当然是允许写入的，因为要写 mepc
                    end else begin
                        csrcontrolout_csr_write_reg = 1'b0;
                    end
                12'hc00: 
                    if (csrcontrolin_inst == 32'hc0001073) begin // unimp
                        csrcontrolout_csr_write_reg = 1'b1; // unimp 当然是允许写入的，因为要写 mepc
                    end else begin
                        csrcontrolout_csr_write_reg = 1'b0;
                    end
                default: csrcontrolout_csr_write_reg = 1'b0;
            endcase
        end
        default: csrcontrolout_csr_write_reg = 1'b0;
    endcase
end

always @(*) begin
    case(csrcontrolin_inst[31:0]) 
        32'h30200073: csrcontrolout_mem_is_mret_reg = 1'b1; // mret
        default: csrcontrolout_mem_is_mret_reg = 1'b0;
    endcase
end

assign csrcontrolout_csr_write = csrcontrolout_csr_write_reg;
assign csrcontrolout_mem_is_mret = csrcontrolout_mem_is_mret_reg;

endmodule