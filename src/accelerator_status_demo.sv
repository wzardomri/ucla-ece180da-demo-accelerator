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
    // Completion remains visible until the CSR side clears activation.
    always_ff @(posedge clk_i or negedge rst_ni) begin
        if (!rst_ni) begin
            done_o  <= 1'b0;
            error_o <= 1'b0;
        end else if (!activate_i) begin
            done_o  <= 1'b0;
            error_o <= 1'b0;
        end else if (job_done_i) begin
            done_o  <= 1'b1;
            error_o <= job_error_i;
        end
    end
endmodule
