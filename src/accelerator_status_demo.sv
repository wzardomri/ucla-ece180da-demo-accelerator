// Teaching sketch for CSR-to-accelerator completion status.
// See the course contract: common/csr_accelerator_if.sv.
module accelerator_status_demo (
    input  logic clk_i,
    input  logic rst_ni,
    input  logic activate_i,
    input  logic job_done_i,
    input  logic job_error_i,
    output logic done_o,
    output logic error_o
);
    // TODO: retain completion/error while activate remains asserted.
    always_ff @(posedge clk_i or negedge rst_ni) begin
        if (!rst_ni) begin
            done_o  <= 1'b0;
            error_o <= 1'b0;
        end else begin
            done_o  <= 1'b0;
            error_o <= 1'b0;
        end
    end
endmodule
