`default_nettype none

module top (
    input  wire         clk
);

// RCC
reg [7:0] reset_counter = 8'hFF;
wire reset = ~(reset_counter == 0);
always @(posedge clk) begin
    if (reset_counter > 0) begin
        reset_counter <= reset_counter - 1;
    end
end

wire              iBusAxi_ar_valid;
wire              iBusAxi_ar_ready;
wire     [31:0]   iBusAxi_ar_payload_addr;
wire     [7:0]    iBusAxi_ar_payload_len;
wire     [1:0]    iBusAxi_ar_payload_burst;
wire     [3:0]    iBusAxi_ar_payload_cache;
wire     [2:0]    iBusAxi_ar_payload_prot;
wire              iBusAxi_r_valid;
wire              iBusAxi_r_ready;
wire     [31:0]   iBusAxi_r_payload_data;
wire     [1:0]    iBusAxi_r_payload_resp;
wire              iBusAxi_r_payload_last;

wire              dBusAxi_ar_valid;
wire              dBusAxi_ar_ready;
wire     [31:0]   dBusAxi_ar_payload_addr;
wire     [0:0]    dBusAxi_ar_payload_id;
wire     [7:0]    dBusAxi_ar_payload_len;
wire     [2:0]    dBusAxi_ar_payload_size;
wire     [3:0]    dBusAxi_ar_payload_cache;
wire     [2:0]    dBusAxi_ar_payload_prot;
wire     [1:0]    dBusAxi_ar_payload_burst;
wire     [0:0]    dBusAxi_ar_payload_lock;

wire              dBusAxi_aw_valid;
wire              dBusAxi_aw_ready;
wire     [31:0]   dBusAxi_aw_payload_addr;
wire     [0:0]    dBusAxi_aw_payload_id;
wire     [2:0]    dBusAxi_aw_payload_size;
wire     [3:0]    dBusAxi_aw_payload_cache;
wire     [2:0]    dBusAxi_aw_payload_prot;
wire     [3:0]    dBusAxi_aw_payload_region;
wire     [7:0]    dBusAxi_aw_payload_len;
wire     [1:0]    dBusAxi_aw_payload_burst;
wire     [0:0]    dBusAxi_aw_payload_lock;
wire     [3:0]    dBusAxi_aw_payload_qos;

wire              dBusAxi_w_valid;
wire              dBusAxi_w_ready;
wire     [31:0]   dBusAxi_w_payload_data;
wire     [3:0]    dBusAxi_w_payload_strb;
wire              dBusAxi_w_payload_last;
wire     [0:0]    dBusAxi_w_payload_id;

wire              dBusAxi_b_payload_id;
wire              dBusAxi_b_valid;
wire              dBusAxi_b_ready;
wire     [1:0]    dBusAxi_b_payload_resp;

wire              dBusAxi_r_valid;
wire              dBusAxi_r_ready;
wire     [31:0]   dBusAxi_r_payload_data;
wire     [1:0]    dBusAxi_r_payload_resp;
wire              dBusAxi_r_payload_last;
wire     [0:0]    dBusAxi_r_payload_id;

VexRiscv cpu_tcp (
  .clk(clk),
  .reset(reset),

  // PC value after reset
  .externalResetVector(32'h3000_0000),
  // Interrupt sources
  .timerInterrupt(1'b0),
  .externalInterrupt(1'b0),
  .softwareInterrupt(1'b0),

  .iBusAxi_ar_valid         (iBusAxi_ar_valid         ),
  .iBusAxi_ar_ready         (iBusAxi_ar_ready         ),
  .iBusAxi_ar_payload_addr  (iBusAxi_ar_payload_addr  ),
  .iBusAxi_ar_payload_len   (iBusAxi_ar_payload_len   ),
  .iBusAxi_ar_payload_burst (iBusAxi_ar_payload_burst ),
  .iBusAxi_ar_payload_cache (iBusAxi_ar_payload_cache ),
  .iBusAxi_ar_payload_prot  (iBusAxi_ar_payload_prot  ),
  .iBusAxi_r_valid          (iBusAxi_r_valid          ),
  .iBusAxi_r_ready          (iBusAxi_r_ready          ),
  .iBusAxi_r_payload_data   (iBusAxi_r_payload_data   ),
  .iBusAxi_r_payload_resp   (iBusAxi_r_payload_resp   ),
  .iBusAxi_r_payload_last   (iBusAxi_r_payload_last   ),

  .dBusAxi_ar_valid        (dBusAxi_ar_valid        ),
  .dBusAxi_ar_ready        (dBusAxi_ar_ready        ),
  .dBusAxi_ar_payload_addr (dBusAxi_ar_payload_addr ),
  .dBusAxi_ar_payload_burst(dBusAxi_ar_payload_burst),
  .dBusAxi_ar_payload_lock (dBusAxi_ar_payload_lock ),
  .dBusAxi_ar_payload_id   (dBusAxi_ar_payload_id   ),
  .dBusAxi_ar_payload_len  (dBusAxi_ar_payload_len  ),
  .dBusAxi_ar_payload_size (dBusAxi_ar_payload_size ),
  .dBusAxi_ar_payload_cache(dBusAxi_ar_payload_cache),
  .dBusAxi_ar_payload_prot (dBusAxi_ar_payload_prot ),

  .dBusAxi_aw_valid        (dBusAxi_aw_valid        ),
  .dBusAxi_aw_ready        (dBusAxi_aw_ready        ),
  .dBusAxi_aw_payload_addr (dBusAxi_aw_payload_addr ),
  .dBusAxi_aw_payload_burst(dBusAxi_aw_payload_burst),
  .dBusAxi_aw_payload_lock (dBusAxi_aw_payload_lock ),
  .dBusAxi_aw_payload_id   (dBusAxi_aw_payload_id   ),
  .dBusAxi_aw_payload_len  (dBusAxi_aw_payload_len  ),
  .dBusAxi_aw_payload_size (dBusAxi_aw_payload_size ),
  .dBusAxi_aw_payload_cache(dBusAxi_aw_payload_cache),
  .dBusAxi_aw_payload_prot (dBusAxi_aw_payload_prot ),

  .dBusAxi_w_valid          (dBusAxi_w_valid          ),
  .dBusAxi_w_ready          (dBusAxi_w_ready          ),
  .dBusAxi_w_payload_data   (dBusAxi_w_payload_data   ),
  .dBusAxi_w_payload_strb   (dBusAxi_w_payload_strb   ),
  .dBusAxi_w_payload_last   (dBusAxi_w_payload_last   ),

  .dBusAxi_b_payload_id     (dBusAxi_b_payload_id     ),
  .dBusAxi_b_valid          (dBusAxi_b_valid          ),
  .dBusAxi_b_ready          (dBusAxi_b_ready          ),
  .dBusAxi_b_payload_resp   (dBusAxi_b_payload_resp   ),

  .dBusAxi_r_valid          (dBusAxi_r_valid          ),
  .dBusAxi_r_ready          (dBusAxi_r_ready          ),
  .dBusAxi_r_payload_data   (dBusAxi_r_payload_data   ),
  .dBusAxi_r_payload_resp   (dBusAxi_r_payload_resp   ),
  .dBusAxi_r_payload_last   (dBusAxi_r_payload_last   )
);

axi_ram #(
    .DATA_WIDTH(32),
    .ADDR_WIDTH(15),
    .ID_WIDTH(1),
    .PIPELINE_OUTPUT(0)
) axi_ram (
    .clk(clk),
    .rst(reset),

    .s_axi_awid        (dBusAxi_aw_payload_id),
    .s_axi_awaddr      (dBusAxi_aw_payload_addr ),
    .s_axi_awlen       (dBusAxi_aw_payload_len  ),
    .s_axi_awsize      (dBusAxi_aw_payload_size ),
    .s_axi_awburst     (dBusAxi_aw_payload_burst),
    .s_axi_awlock      (dBusAxi_aw_payload_lock),
    .s_axi_awcache     (dBusAxi_aw_payload_cache),
    .s_axi_awprot      (dBusAxi_aw_payload_prot),
    .s_axi_awvalid     (dBusAxi_aw_valid),
    .s_axi_awready     (dBusAxi_aw_ready),
    .s_axi_wdata       (dBusAxi_w_payload_data),
    .s_axi_wstrb       (dBusAxi_w_payload_strb),
    .s_axi_wlast       (dBusAxi_w_payload_last),
    .s_axi_wvalid      (dBusAxi_w_valid),
    .s_axi_wready      (dBusAxi_w_ready),

    .s_axi_arid        (dBusAxi_ar_payload_id),
    .s_axi_araddr      (dBusAxi_ar_payload_addr),
    .s_axi_arlen       (dBusAxi_ar_payload_len),
    .s_axi_arsize      (dBusAxi_ar_payload_size),
    .s_axi_arburst     (dBusAxi_ar_payload_burst),
    .s_axi_arlock      (dBusAxi_ar_payload_lock),
    .s_axi_arcache     (dBusAxi_ar_payload_cache),
    .s_axi_arprot      (dBusAxi_ar_payload_prot),
    .s_axi_arvalid     (dBusAxi_ar_valid),
    .s_axi_arready     (dBusAxi_ar_ready),
    .s_axi_rid         (dBusAxi_r_payload_id),
    .s_axi_rdata       (dBusAxi_r_payload_data),
    .s_axi_rresp       (dBusAxi_r_payload_resp),
    .s_axi_rlast       (dBusAxi_r_payload_last),
    .s_axi_rvalid      (dBusAxi_r_valid),
    .s_axi_rready      (dBusAxi_r_ready),

    .s_axi_bid         (dBusAxi_b_payload_id),
    .s_axi_bresp       (dBusAxi_b_payload_resp),
    .s_axi_bvalid      (dBusAxi_b_valid),
    .s_axi_bready      (dBusAxi_b_ready)
);

axi_ram #(
    .DATA_WIDTH(32),
    .ADDR_WIDTH(17),
    .ID_WIDTH(1),
    .INIT_HEX("firmware.hex"),
    .PIPELINE_OUTPUT(0)
) axi_rom (
    .clk(clk),
    .rst(reset),

    .s_axi_awid        (),
    .s_axi_awaddr      (),
    .s_axi_awlen       (),
    .s_axi_awsize      (),
    .s_axi_awburst     (),
    .s_axi_awlock      (),
    .s_axi_awcache     (),
    .s_axi_awprot      (),
    .s_axi_awvalid     (),
    .s_axi_awready     (),
    .s_axi_wdata       (),
    .s_axi_wstrb       (),
    .s_axi_wlast       (),
    .s_axi_wvalid      (),
    .s_axi_wready      (),

    .s_axi_arid        (),
    .s_axi_araddr      (iBusAxi_ar_payload_addr),
    .s_axi_arlen       (iBusAxi_ar_payload_len),
    .s_axi_arsize      (3'd4),
    .s_axi_arburst     (iBusAxi_ar_payload_burst),
    .s_axi_arlock      (),
    .s_axi_arcache     (iBusAxi_ar_payload_cache),
    .s_axi_arprot      (iBusAxi_ar_payload_prot),
    .s_axi_arvalid     (iBusAxi_ar_valid),
    .s_axi_arready     (iBusAxi_ar_ready),
    .s_axi_rid         (),
    .s_axi_rdata       (iBusAxi_r_payload_data),
    .s_axi_rresp       (iBusAxi_r_payload_resp),
    .s_axi_rlast       (iBusAxi_r_payload_last),
    .s_axi_rvalid      (iBusAxi_r_valid),
    .s_axi_rready      (iBusAxi_r_ready),

    .s_axi_bid         (),
    .s_axi_bresp       (),
    .s_axi_bvalid      (),
    .s_axi_bready      ()
);

endmodule
