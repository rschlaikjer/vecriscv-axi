// Generator : SpinalHDL v1.4.0    git head : ecb5a80b713566f417ea3ea061f9969e73770a7f
// Date      : 24/02/2021, 19:39:34
// Component : VexRiscv


`define Src2CtrlEnum_defaultEncoding_type [1:0]
`define Src2CtrlEnum_defaultEncoding_RS 2'b00
`define Src2CtrlEnum_defaultEncoding_IMI 2'b01
`define Src2CtrlEnum_defaultEncoding_IMS 2'b10
`define Src2CtrlEnum_defaultEncoding_PC 2'b11

`define EnvCtrlEnum_defaultEncoding_type [0:0]
`define EnvCtrlEnum_defaultEncoding_NONE 1'b0
`define EnvCtrlEnum_defaultEncoding_XRET 1'b1

`define AluBitwiseCtrlEnum_defaultEncoding_type [1:0]
`define AluBitwiseCtrlEnum_defaultEncoding_XOR_1 2'b00
`define AluBitwiseCtrlEnum_defaultEncoding_OR_1 2'b01
`define AluBitwiseCtrlEnum_defaultEncoding_AND_1 2'b10

`define BranchCtrlEnum_defaultEncoding_type [1:0]
`define BranchCtrlEnum_defaultEncoding_INC 2'b00
`define BranchCtrlEnum_defaultEncoding_B 2'b01
`define BranchCtrlEnum_defaultEncoding_JAL 2'b10
`define BranchCtrlEnum_defaultEncoding_JALR 2'b11

`define AluCtrlEnum_defaultEncoding_type [1:0]
`define AluCtrlEnum_defaultEncoding_ADD_SUB 2'b00
`define AluCtrlEnum_defaultEncoding_SLT_SLTU 2'b01
`define AluCtrlEnum_defaultEncoding_BITWISE 2'b10

`define Src1CtrlEnum_defaultEncoding_type [1:0]
`define Src1CtrlEnum_defaultEncoding_RS 2'b00
`define Src1CtrlEnum_defaultEncoding_IMU 2'b01
`define Src1CtrlEnum_defaultEncoding_PC_INCREMENT 2'b10
`define Src1CtrlEnum_defaultEncoding_URS1 2'b11

`define ShiftCtrlEnum_defaultEncoding_type [1:0]
`define ShiftCtrlEnum_defaultEncoding_DISABLE_1 2'b00
`define ShiftCtrlEnum_defaultEncoding_SLL_1 2'b01
`define ShiftCtrlEnum_defaultEncoding_SRL_1 2'b10
`define ShiftCtrlEnum_defaultEncoding_SRA_1 2'b11


module InstructionCache (
  input               io_flush,
  input               io_cpu_prefetch_isValid,
  output reg          io_cpu_prefetch_haltIt,
  input      [31:0]   io_cpu_prefetch_pc,
  input               io_cpu_fetch_isValid,
  input               io_cpu_fetch_isStuck,
  input               io_cpu_fetch_isRemoved,
  input      [31:0]   io_cpu_fetch_pc,
  output     [31:0]   io_cpu_fetch_data,
  output              io_cpu_fetch_mmuBus_cmd_isValid,
  output     [31:0]   io_cpu_fetch_mmuBus_cmd_virtualAddress,
  output              io_cpu_fetch_mmuBus_cmd_bypassTranslation,
  input      [31:0]   io_cpu_fetch_mmuBus_rsp_physicalAddress,
  input               io_cpu_fetch_mmuBus_rsp_isIoAccess,
  input               io_cpu_fetch_mmuBus_rsp_allowRead,
  input               io_cpu_fetch_mmuBus_rsp_allowWrite,
  input               io_cpu_fetch_mmuBus_rsp_allowExecute,
  input               io_cpu_fetch_mmuBus_rsp_exception,
  input               io_cpu_fetch_mmuBus_rsp_refilling,
  output              io_cpu_fetch_mmuBus_end,
  input               io_cpu_fetch_mmuBus_busy,
  output     [31:0]   io_cpu_fetch_physicalAddress,
  output              io_cpu_fetch_haltIt,
  input               io_cpu_decode_isValid,
  input               io_cpu_decode_isStuck,
  input      [31:0]   io_cpu_decode_pc,
  output     [31:0]   io_cpu_decode_physicalAddress,
  output     [31:0]   io_cpu_decode_data,
  output              io_cpu_decode_cacheMiss,
  output              io_cpu_decode_error,
  output              io_cpu_decode_mmuRefilling,
  output              io_cpu_decode_mmuException,
  input               io_cpu_decode_isUser,
  input               io_cpu_fill_valid,
  input      [31:0]   io_cpu_fill_payload,
  output              io_mem_cmd_valid,
  input               io_mem_cmd_ready,
  output     [31:0]   io_mem_cmd_payload_address,
  output     [2:0]    io_mem_cmd_payload_size,
  input               io_mem_rsp_valid,
  input      [31:0]   io_mem_rsp_payload_data,
  input               io_mem_rsp_payload_error,
  input               clk,
  input               reset 
);
  reg        [19:0]   _zz_11_;
  reg        [31:0]   _zz_12_;
  wire                _zz_13_;
  wire                _zz_14_;
  wire       [0:0]    _zz_15_;
  wire       [0:0]    _zz_16_;
  wire       [19:0]   _zz_17_;
  reg                 _zz_1_;
  reg                 _zz_2_;
  reg                 lineLoader_fire;
  reg                 lineLoader_valid;
  (* syn_keep , keep *) reg        [31:0]   lineLoader_address /* synthesis syn_keep = 1 */ ;
  reg                 lineLoader_hadError;
  reg                 lineLoader_flushPending;
  reg        [9:0]    lineLoader_flushCounter;
  reg                 _zz_3_;
  reg                 lineLoader_cmdSent;
  reg                 lineLoader_wayToAllocate_willIncrement;
  wire                lineLoader_wayToAllocate_willClear;
  wire                lineLoader_wayToAllocate_willOverflowIfInc;
  wire                lineLoader_wayToAllocate_willOverflow;
  (* syn_keep , keep *) reg        [2:0]    lineLoader_wordIndex /* synthesis syn_keep = 1 */ ;
  wire                lineLoader_write_tag_0_valid;
  wire       [8:0]    lineLoader_write_tag_0_payload_address;
  wire                lineLoader_write_tag_0_payload_data_valid;
  wire                lineLoader_write_tag_0_payload_data_error;
  wire       [17:0]   lineLoader_write_tag_0_payload_data_address;
  wire                lineLoader_write_data_0_valid;
  wire       [11:0]   lineLoader_write_data_0_payload_address;
  wire       [31:0]   lineLoader_write_data_0_payload_data;
  wire                _zz_4_;
  wire       [8:0]    _zz_5_;
  wire                _zz_6_;
  wire                fetchStage_read_waysValues_0_tag_valid;
  wire                fetchStage_read_waysValues_0_tag_error;
  wire       [17:0]   fetchStage_read_waysValues_0_tag_address;
  wire       [19:0]   _zz_7_;
  wire       [11:0]   _zz_8_;
  wire                _zz_9_;
  wire       [31:0]   fetchStage_read_waysValues_0_data;
  reg        [31:0]   decodeStage_mmuRsp_physicalAddress;
  reg                 decodeStage_mmuRsp_isIoAccess;
  reg                 decodeStage_mmuRsp_allowRead;
  reg                 decodeStage_mmuRsp_allowWrite;
  reg                 decodeStage_mmuRsp_allowExecute;
  reg                 decodeStage_mmuRsp_exception;
  reg                 decodeStage_mmuRsp_refilling;
  reg                 decodeStage_hit_tags_0_valid;
  reg                 decodeStage_hit_tags_0_error;
  reg        [17:0]   decodeStage_hit_tags_0_address;
  wire                decodeStage_hit_hits_0;
  wire                decodeStage_hit_valid;
  reg        [31:0]   _zz_10_;
  wire       [31:0]   decodeStage_hit_data;
  reg [19:0] ways_0_tags [0:511];
  reg [31:0] ways_0_datas [0:4095];

  assign _zz_13_ = (! lineLoader_flushCounter[9]);
  assign _zz_14_ = (lineLoader_flushPending && (! (lineLoader_valid || io_cpu_fetch_isValid)));
  assign _zz_15_ = _zz_7_[0 : 0];
  assign _zz_16_ = _zz_7_[1 : 1];
  assign _zz_17_ = {lineLoader_write_tag_0_payload_data_address,{lineLoader_write_tag_0_payload_data_error,lineLoader_write_tag_0_payload_data_valid}};
  always @ (posedge clk) begin
    if(_zz_2_) begin
      ways_0_tags[lineLoader_write_tag_0_payload_address] <= _zz_17_;
    end
  end

  always @ (posedge clk) begin
    if(_zz_6_) begin
      _zz_11_ <= ways_0_tags[_zz_5_];
    end
  end

  always @ (posedge clk) begin
    if(_zz_1_) begin
      ways_0_datas[lineLoader_write_data_0_payload_address] <= lineLoader_write_data_0_payload_data;
    end
  end

  always @ (posedge clk) begin
    if(_zz_9_) begin
      _zz_12_ <= ways_0_datas[_zz_8_];
    end
  end

  always @ (*) begin
    _zz_1_ = 1'b0;
    if(lineLoader_write_data_0_valid)begin
      _zz_1_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_2_ = 1'b0;
    if(lineLoader_write_tag_0_valid)begin
      _zz_2_ = 1'b1;
    end
  end

  assign io_cpu_fetch_haltIt = io_cpu_fetch_mmuBus_busy;
  always @ (*) begin
    lineLoader_fire = 1'b0;
    if(io_mem_rsp_valid)begin
      if((lineLoader_wordIndex == (3'b111)))begin
        lineLoader_fire = 1'b1;
      end
    end
  end

  always @ (*) begin
    io_cpu_prefetch_haltIt = (lineLoader_valid || lineLoader_flushPending);
    if(_zz_13_)begin
      io_cpu_prefetch_haltIt = 1'b1;
    end
    if((! _zz_3_))begin
      io_cpu_prefetch_haltIt = 1'b1;
    end
    if(io_flush)begin
      io_cpu_prefetch_haltIt = 1'b1;
    end
  end

  assign io_mem_cmd_valid = (lineLoader_valid && (! lineLoader_cmdSent));
  assign io_mem_cmd_payload_address = {lineLoader_address[31 : 5],5'h0};
  assign io_mem_cmd_payload_size = (3'b101);
  always @ (*) begin
    lineLoader_wayToAllocate_willIncrement = 1'b0;
    if((! lineLoader_valid))begin
      lineLoader_wayToAllocate_willIncrement = 1'b1;
    end
  end

  assign lineLoader_wayToAllocate_willClear = 1'b0;
  assign lineLoader_wayToAllocate_willOverflowIfInc = 1'b1;
  assign lineLoader_wayToAllocate_willOverflow = (lineLoader_wayToAllocate_willOverflowIfInc && lineLoader_wayToAllocate_willIncrement);
  assign _zz_4_ = 1'b1;
  assign lineLoader_write_tag_0_valid = ((_zz_4_ && lineLoader_fire) || (! lineLoader_flushCounter[9]));
  assign lineLoader_write_tag_0_payload_address = (lineLoader_flushCounter[9] ? lineLoader_address[13 : 5] : lineLoader_flushCounter[8 : 0]);
  assign lineLoader_write_tag_0_payload_data_valid = lineLoader_flushCounter[9];
  assign lineLoader_write_tag_0_payload_data_error = (lineLoader_hadError || io_mem_rsp_payload_error);
  assign lineLoader_write_tag_0_payload_data_address = lineLoader_address[31 : 14];
  assign lineLoader_write_data_0_valid = (io_mem_rsp_valid && _zz_4_);
  assign lineLoader_write_data_0_payload_address = {lineLoader_address[13 : 5],lineLoader_wordIndex};
  assign lineLoader_write_data_0_payload_data = io_mem_rsp_payload_data;
  assign _zz_5_ = io_cpu_prefetch_pc[13 : 5];
  assign _zz_6_ = (! io_cpu_fetch_isStuck);
  assign _zz_7_ = _zz_11_;
  assign fetchStage_read_waysValues_0_tag_valid = _zz_15_[0];
  assign fetchStage_read_waysValues_0_tag_error = _zz_16_[0];
  assign fetchStage_read_waysValues_0_tag_address = _zz_7_[19 : 2];
  assign _zz_8_ = io_cpu_prefetch_pc[13 : 2];
  assign _zz_9_ = (! io_cpu_fetch_isStuck);
  assign fetchStage_read_waysValues_0_data = _zz_12_;
  assign io_cpu_fetch_data = fetchStage_read_waysValues_0_data;
  assign io_cpu_fetch_mmuBus_cmd_isValid = io_cpu_fetch_isValid;
  assign io_cpu_fetch_mmuBus_cmd_virtualAddress = io_cpu_fetch_pc;
  assign io_cpu_fetch_mmuBus_cmd_bypassTranslation = 1'b0;
  assign io_cpu_fetch_mmuBus_end = ((! io_cpu_fetch_isStuck) || io_cpu_fetch_isRemoved);
  assign io_cpu_fetch_physicalAddress = io_cpu_fetch_mmuBus_rsp_physicalAddress;
  assign decodeStage_hit_hits_0 = (decodeStage_hit_tags_0_valid && (decodeStage_hit_tags_0_address == decodeStage_mmuRsp_physicalAddress[31 : 14]));
  assign decodeStage_hit_valid = (decodeStage_hit_hits_0 != (1'b0));
  assign decodeStage_hit_data = _zz_10_;
  assign io_cpu_decode_data = decodeStage_hit_data;
  assign io_cpu_decode_cacheMiss = (! decodeStage_hit_valid);
  assign io_cpu_decode_error = decodeStage_hit_tags_0_error;
  assign io_cpu_decode_mmuRefilling = decodeStage_mmuRsp_refilling;
  assign io_cpu_decode_mmuException = ((! decodeStage_mmuRsp_refilling) && (decodeStage_mmuRsp_exception || (! decodeStage_mmuRsp_allowExecute)));
  assign io_cpu_decode_physicalAddress = decodeStage_mmuRsp_physicalAddress;
  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      lineLoader_valid <= 1'b0;
      lineLoader_hadError <= 1'b0;
      lineLoader_flushPending <= 1'b1;
      lineLoader_cmdSent <= 1'b0;
      lineLoader_wordIndex <= (3'b000);
    end else begin
      if(lineLoader_fire)begin
        lineLoader_valid <= 1'b0;
      end
      if(lineLoader_fire)begin
        lineLoader_hadError <= 1'b0;
      end
      if(io_cpu_fill_valid)begin
        lineLoader_valid <= 1'b1;
      end
      if(io_flush)begin
        lineLoader_flushPending <= 1'b1;
      end
      if(_zz_14_)begin
        lineLoader_flushPending <= 1'b0;
      end
      if((io_mem_cmd_valid && io_mem_cmd_ready))begin
        lineLoader_cmdSent <= 1'b1;
      end
      if(lineLoader_fire)begin
        lineLoader_cmdSent <= 1'b0;
      end
      if(io_mem_rsp_valid)begin
        lineLoader_wordIndex <= (lineLoader_wordIndex + (3'b001));
        if(io_mem_rsp_payload_error)begin
          lineLoader_hadError <= 1'b1;
        end
      end
    end
  end

  always @ (posedge clk) begin
    if(io_cpu_fill_valid)begin
      lineLoader_address <= io_cpu_fill_payload;
    end
    if(_zz_13_)begin
      lineLoader_flushCounter <= (lineLoader_flushCounter + 10'h001);
    end
    _zz_3_ <= lineLoader_flushCounter[9];
    if(_zz_14_)begin
      lineLoader_flushCounter <= 10'h0;
    end
    if((! io_cpu_decode_isStuck))begin
      decodeStage_mmuRsp_physicalAddress <= io_cpu_fetch_mmuBus_rsp_physicalAddress;
      decodeStage_mmuRsp_isIoAccess <= io_cpu_fetch_mmuBus_rsp_isIoAccess;
      decodeStage_mmuRsp_allowRead <= io_cpu_fetch_mmuBus_rsp_allowRead;
      decodeStage_mmuRsp_allowWrite <= io_cpu_fetch_mmuBus_rsp_allowWrite;
      decodeStage_mmuRsp_allowExecute <= io_cpu_fetch_mmuBus_rsp_allowExecute;
      decodeStage_mmuRsp_exception <= io_cpu_fetch_mmuBus_rsp_exception;
      decodeStage_mmuRsp_refilling <= io_cpu_fetch_mmuBus_rsp_refilling;
    end
    if((! io_cpu_decode_isStuck))begin
      decodeStage_hit_tags_0_valid <= fetchStage_read_waysValues_0_tag_valid;
      decodeStage_hit_tags_0_error <= fetchStage_read_waysValues_0_tag_error;
      decodeStage_hit_tags_0_address <= fetchStage_read_waysValues_0_tag_address;
    end
    if((! io_cpu_decode_isStuck))begin
      _zz_10_ <= fetchStage_read_waysValues_0_data;
    end
  end


endmodule

module DataCache (
  input               io_cpu_execute_isValid,
  input      [31:0]   io_cpu_execute_address,
  input               io_cpu_execute_args_wr,
  input      [31:0]   io_cpu_execute_args_data,
  input      [1:0]    io_cpu_execute_args_size,
  input               io_cpu_execute_args_isLrsc,
  input               io_cpu_execute_args_isAmo,
  input               io_cpu_execute_args_amoCtrl_swap,
  input      [2:0]    io_cpu_execute_args_amoCtrl_alu,
  input               io_cpu_memory_isValid,
  input               io_cpu_memory_isStuck,
  input               io_cpu_memory_isRemoved,
  output              io_cpu_memory_isWrite,
  input      [31:0]   io_cpu_memory_address,
  output              io_cpu_memory_mmuBus_cmd_isValid,
  output     [31:0]   io_cpu_memory_mmuBus_cmd_virtualAddress,
  output              io_cpu_memory_mmuBus_cmd_bypassTranslation,
  input      [31:0]   io_cpu_memory_mmuBus_rsp_physicalAddress,
  input               io_cpu_memory_mmuBus_rsp_isIoAccess,
  input               io_cpu_memory_mmuBus_rsp_allowRead,
  input               io_cpu_memory_mmuBus_rsp_allowWrite,
  input               io_cpu_memory_mmuBus_rsp_allowExecute,
  input               io_cpu_memory_mmuBus_rsp_exception,
  input               io_cpu_memory_mmuBus_rsp_refilling,
  output              io_cpu_memory_mmuBus_end,
  input               io_cpu_memory_mmuBus_busy,
  input               io_cpu_writeBack_isValid,
  input               io_cpu_writeBack_isStuck,
  input               io_cpu_writeBack_isUser,
  output reg          io_cpu_writeBack_haltIt,
  output              io_cpu_writeBack_isWrite,
  output reg [31:0]   io_cpu_writeBack_data,
  input      [31:0]   io_cpu_writeBack_address,
  output              io_cpu_writeBack_mmuException,
  output              io_cpu_writeBack_unalignedAccess,
  output reg          io_cpu_writeBack_accessError,
  input               io_cpu_writeBack_clearLrsc,
  output reg          io_cpu_redo,
  input               io_cpu_flush_valid,
  output reg          io_cpu_flush_ready,
  output reg          io_mem_cmd_valid,
  input               io_mem_cmd_ready,
  output reg          io_mem_cmd_payload_wr,
  output reg [31:0]   io_mem_cmd_payload_address,
  output     [31:0]   io_mem_cmd_payload_data,
  output     [3:0]    io_mem_cmd_payload_mask,
  output reg [2:0]    io_mem_cmd_payload_length,
  output reg          io_mem_cmd_payload_last,
  input               io_mem_rsp_valid,
  input      [31:0]   io_mem_rsp_payload_data,
  input               io_mem_rsp_payload_error,
  input               clk,
  input               reset 
);
  reg        [21:0]   _zz_10_;
  reg        [31:0]   _zz_11_;
  wire                _zz_12_;
  wire                _zz_13_;
  wire                _zz_14_;
  wire                _zz_15_;
  wire                _zz_16_;
  wire                _zz_17_;
  wire                _zz_18_;
  wire                _zz_19_;
  wire                _zz_20_;
  wire       [2:0]    _zz_21_;
  wire       [0:0]    _zz_22_;
  wire       [0:0]    _zz_23_;
  wire       [31:0]   _zz_24_;
  wire       [31:0]   _zz_25_;
  wire       [31:0]   _zz_26_;
  wire       [31:0]   _zz_27_;
  wire       [1:0]    _zz_28_;
  wire       [31:0]   _zz_29_;
  wire       [1:0]    _zz_30_;
  wire       [1:0]    _zz_31_;
  wire       [0:0]    _zz_32_;
  wire       [0:0]    _zz_33_;
  wire       [2:0]    _zz_34_;
  wire       [1:0]    _zz_35_;
  wire       [21:0]   _zz_36_;
  reg                 _zz_1_;
  reg                 _zz_2_;
  wire                haltCpu;
  reg                 tagsReadCmd_valid;
  reg        [6:0]    tagsReadCmd_payload;
  reg                 tagsWriteCmd_valid;
  reg        [0:0]    tagsWriteCmd_payload_way;
  reg        [6:0]    tagsWriteCmd_payload_address;
  reg                 tagsWriteCmd_payload_data_valid;
  reg                 tagsWriteCmd_payload_data_error;
  reg        [19:0]   tagsWriteCmd_payload_data_address;
  reg                 tagsWriteLastCmd_valid;
  reg        [0:0]    tagsWriteLastCmd_payload_way;
  reg        [6:0]    tagsWriteLastCmd_payload_address;
  reg                 tagsWriteLastCmd_payload_data_valid;
  reg                 tagsWriteLastCmd_payload_data_error;
  reg        [19:0]   tagsWriteLastCmd_payload_data_address;
  reg                 dataReadCmd_valid;
  reg        [9:0]    dataReadCmd_payload;
  reg                 dataWriteCmd_valid;
  reg        [0:0]    dataWriteCmd_payload_way;
  reg        [9:0]    dataWriteCmd_payload_address;
  reg        [31:0]   dataWriteCmd_payload_data;
  reg        [3:0]    dataWriteCmd_payload_mask;
  wire                _zz_3_;
  wire                ways_0_tagsReadRsp_valid;
  wire                ways_0_tagsReadRsp_error;
  wire       [19:0]   ways_0_tagsReadRsp_address;
  wire       [21:0]   _zz_4_;
  wire                _zz_5_;
  wire       [31:0]   ways_0_dataReadRsp;
  reg        [3:0]    _zz_6_;
  wire       [3:0]    stage0_mask;
  wire       [0:0]    stage0_colisions;
  reg                 stageA_request_wr;
  reg        [31:0]   stageA_request_data;
  reg        [1:0]    stageA_request_size;
  reg                 stageA_request_isLrsc;
  reg                 stageA_request_isAmo;
  reg                 stageA_request_amoCtrl_swap;
  reg        [2:0]    stageA_request_amoCtrl_alu;
  reg        [3:0]    stageA_mask;
  wire                stageA_wayHits_0;
  reg        [0:0]    stage0_colisions_regNextWhen;
  wire       [0:0]    _zz_7_;
  wire       [0:0]    stageA_colisions;
  reg                 stageB_request_wr;
  reg        [31:0]   stageB_request_data;
  reg        [1:0]    stageB_request_size;
  reg                 stageB_request_isLrsc;
  reg                 stageB_request_isAmo;
  reg                 stageB_request_amoCtrl_swap;
  reg        [2:0]    stageB_request_amoCtrl_alu;
  reg                 stageB_mmuRspFreeze;
  reg        [31:0]   stageB_mmuRsp_physicalAddress;
  reg                 stageB_mmuRsp_isIoAccess;
  reg                 stageB_mmuRsp_allowRead;
  reg                 stageB_mmuRsp_allowWrite;
  reg                 stageB_mmuRsp_allowExecute;
  reg                 stageB_mmuRsp_exception;
  reg                 stageB_mmuRsp_refilling;
  reg                 stageB_tagsReadRsp_0_valid;
  reg                 stageB_tagsReadRsp_0_error;
  reg        [19:0]   stageB_tagsReadRsp_0_address;
  reg        [31:0]   stageB_dataReadRsp_0;
  wire       [0:0]    _zz_8_;
  reg        [0:0]    stageB_waysHits;
  wire                stageB_waysHit;
  wire       [31:0]   stageB_dataMux;
  reg        [3:0]    stageB_mask;
  reg        [0:0]    stageB_colisions;
  reg                 stageB_loaderValid;
  reg                 stageB_flusher_valid;
  reg                 stageB_flusher_start;
  reg                 stageB_lrsc_reserved;
  reg        [31:0]   stageB_requestDataBypass;
  wire                stageB_amo_compare;
  wire                stageB_amo_unsigned;
  wire       [31:0]   stageB_amo_addSub;
  wire                stageB_amo_less;
  wire                stageB_amo_selectRf;
  reg        [31:0]   stageB_amo_result;
  reg                 stageB_amo_resultRegValid;
  reg        [31:0]   stageB_amo_resultReg;
  reg                 stageB_memCmdSent;
  wire       [0:0]    _zz_9_;
  reg                 loader_valid;
  reg                 loader_counter_willIncrement;
  wire                loader_counter_willClear;
  reg        [2:0]    loader_counter_valueNext;
  reg        [2:0]    loader_counter_value;
  wire                loader_counter_willOverflowIfInc;
  wire                loader_counter_willOverflow;
  reg        [0:0]    loader_waysAllocator;
  reg                 loader_error;
  reg [21:0] ways_0_tags [0:127];
  reg [7:0] ways_0_data_symbol0 [0:1023];
  reg [7:0] ways_0_data_symbol1 [0:1023];
  reg [7:0] ways_0_data_symbol2 [0:1023];
  reg [7:0] ways_0_data_symbol3 [0:1023];
  reg [7:0] _zz_37_;
  reg [7:0] _zz_38_;
  reg [7:0] _zz_39_;
  reg [7:0] _zz_40_;

  assign _zz_12_ = (io_cpu_execute_isValid && (! io_cpu_memory_isStuck));
  assign _zz_13_ = (((stageB_mmuRsp_refilling || io_cpu_writeBack_accessError) || io_cpu_writeBack_mmuException) || io_cpu_writeBack_unalignedAccess);
  assign _zz_14_ = (stageB_waysHit || (stageB_request_wr && (! stageB_request_isAmo)));
  assign _zz_15_ = (! stageB_amo_resultRegValid);
  assign _zz_16_ = (stageB_request_isLrsc && (! stageB_lrsc_reserved));
  assign _zz_17_ = (loader_valid && io_mem_rsp_valid);
  assign _zz_18_ = (stageB_request_isLrsc && (! stageB_lrsc_reserved));
  assign _zz_19_ = (((! stageB_request_wr) || stageB_request_isAmo) && ((stageB_colisions & stageB_waysHits) != (1'b0)));
  assign _zz_20_ = (stageB_mmuRsp_physicalAddress[11 : 5] != 7'h7f);
  assign _zz_21_ = (stageB_request_amoCtrl_alu | {stageB_request_amoCtrl_swap,(2'b00)});
  assign _zz_22_ = _zz_4_[0 : 0];
  assign _zz_23_ = _zz_4_[1 : 1];
  assign _zz_24_ = ($signed(_zz_25_) + $signed(_zz_29_));
  assign _zz_25_ = ($signed(_zz_26_) + $signed(_zz_27_));
  assign _zz_26_ = stageB_request_data;
  assign _zz_27_ = (stageB_amo_compare ? (~ stageB_dataMux) : stageB_dataMux);
  assign _zz_28_ = (stageB_amo_compare ? _zz_30_ : _zz_31_);
  assign _zz_29_ = {{30{_zz_28_[1]}}, _zz_28_};
  assign _zz_30_ = (2'b01);
  assign _zz_31_ = (2'b00);
  assign _zz_32_ = (! stageB_lrsc_reserved);
  assign _zz_33_ = loader_counter_willIncrement;
  assign _zz_34_ = {2'd0, _zz_33_};
  assign _zz_35_ = {loader_waysAllocator,loader_waysAllocator[0]};
  assign _zz_36_ = {tagsWriteCmd_payload_data_address,{tagsWriteCmd_payload_data_error,tagsWriteCmd_payload_data_valid}};
  always @ (posedge clk) begin
    if(_zz_3_) begin
      _zz_10_ <= ways_0_tags[tagsReadCmd_payload];
    end
  end

  always @ (posedge clk) begin
    if(_zz_2_) begin
      ways_0_tags[tagsWriteCmd_payload_address] <= _zz_36_;
    end
  end

  always @ (*) begin
    _zz_11_ = {_zz_40_, _zz_39_, _zz_38_, _zz_37_};
  end
  always @ (posedge clk) begin
    if(_zz_5_) begin
      _zz_37_ <= ways_0_data_symbol0[dataReadCmd_payload];
      _zz_38_ <= ways_0_data_symbol1[dataReadCmd_payload];
      _zz_39_ <= ways_0_data_symbol2[dataReadCmd_payload];
      _zz_40_ <= ways_0_data_symbol3[dataReadCmd_payload];
    end
  end

  always @ (posedge clk) begin
    if(dataWriteCmd_payload_mask[0] && _zz_1_) begin
      ways_0_data_symbol0[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[7 : 0];
    end
    if(dataWriteCmd_payload_mask[1] && _zz_1_) begin
      ways_0_data_symbol1[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[15 : 8];
    end
    if(dataWriteCmd_payload_mask[2] && _zz_1_) begin
      ways_0_data_symbol2[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[23 : 16];
    end
    if(dataWriteCmd_payload_mask[3] && _zz_1_) begin
      ways_0_data_symbol3[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[31 : 24];
    end
  end

  always @ (*) begin
    _zz_1_ = 1'b0;
    if((dataWriteCmd_valid && dataWriteCmd_payload_way[0]))begin
      _zz_1_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_2_ = 1'b0;
    if((tagsWriteCmd_valid && tagsWriteCmd_payload_way[0]))begin
      _zz_2_ = 1'b1;
    end
  end

  assign haltCpu = 1'b0;
  assign _zz_3_ = (tagsReadCmd_valid && (! io_cpu_memory_isStuck));
  assign _zz_4_ = _zz_10_;
  assign ways_0_tagsReadRsp_valid = _zz_22_[0];
  assign ways_0_tagsReadRsp_error = _zz_23_[0];
  assign ways_0_tagsReadRsp_address = _zz_4_[21 : 2];
  assign _zz_5_ = (dataReadCmd_valid && (! io_cpu_memory_isStuck));
  assign ways_0_dataReadRsp = _zz_11_;
  always @ (*) begin
    tagsReadCmd_valid = 1'b0;
    if(_zz_12_)begin
      tagsReadCmd_valid = 1'b1;
    end
  end

  always @ (*) begin
    tagsReadCmd_payload = 7'h0;
    if(_zz_12_)begin
      tagsReadCmd_payload = io_cpu_execute_address[11 : 5];
    end
  end

  always @ (*) begin
    dataReadCmd_valid = 1'b0;
    if(_zz_12_)begin
      dataReadCmd_valid = 1'b1;
    end
  end

  always @ (*) begin
    dataReadCmd_payload = 10'h0;
    if(_zz_12_)begin
      dataReadCmd_payload = io_cpu_execute_address[11 : 2];
    end
  end

  always @ (*) begin
    tagsWriteCmd_valid = 1'b0;
    if(stageB_flusher_valid)begin
      tagsWriteCmd_valid = stageB_flusher_valid;
    end
    if(_zz_13_)begin
      tagsWriteCmd_valid = 1'b0;
    end
    if(loader_counter_willOverflow)begin
      tagsWriteCmd_valid = 1'b1;
    end
  end

  always @ (*) begin
    tagsWriteCmd_payload_way = (1'bx);
    if(stageB_flusher_valid)begin
      tagsWriteCmd_payload_way = (1'b1);
    end
    if(loader_counter_willOverflow)begin
      tagsWriteCmd_payload_way = loader_waysAllocator;
    end
  end

  always @ (*) begin
    tagsWriteCmd_payload_address = 7'h0;
    if(stageB_flusher_valid)begin
      tagsWriteCmd_payload_address = stageB_mmuRsp_physicalAddress[11 : 5];
    end
    if(loader_counter_willOverflow)begin
      tagsWriteCmd_payload_address = stageB_mmuRsp_physicalAddress[11 : 5];
    end
  end

  always @ (*) begin
    tagsWriteCmd_payload_data_valid = 1'bx;
    if(stageB_flusher_valid)begin
      tagsWriteCmd_payload_data_valid = 1'b0;
    end
    if(loader_counter_willOverflow)begin
      tagsWriteCmd_payload_data_valid = 1'b1;
    end
  end

  always @ (*) begin
    tagsWriteCmd_payload_data_error = 1'bx;
    if(loader_counter_willOverflow)begin
      tagsWriteCmd_payload_data_error = (loader_error || io_mem_rsp_payload_error);
    end
  end

  always @ (*) begin
    tagsWriteCmd_payload_data_address = 20'h0;
    if(loader_counter_willOverflow)begin
      tagsWriteCmd_payload_data_address = stageB_mmuRsp_physicalAddress[31 : 12];
    end
  end

  always @ (*) begin
    dataWriteCmd_valid = 1'b0;
    if(io_cpu_writeBack_isValid)begin
      if(! stageB_mmuRsp_isIoAccess) begin
        if(_zz_14_)begin
          if((stageB_request_wr && stageB_waysHit))begin
            dataWriteCmd_valid = 1'b1;
          end
          if(stageB_request_isAmo)begin
            if(_zz_15_)begin
              dataWriteCmd_valid = 1'b0;
            end
          end
          if(_zz_16_)begin
            dataWriteCmd_valid = 1'b0;
          end
        end
      end
    end
    if(_zz_13_)begin
      dataWriteCmd_valid = 1'b0;
    end
    if(_zz_17_)begin
      dataWriteCmd_valid = 1'b1;
    end
  end

  always @ (*) begin
    dataWriteCmd_payload_way = (1'bx);
    if(io_cpu_writeBack_isValid)begin
      if(! stageB_mmuRsp_isIoAccess) begin
        if(_zz_14_)begin
          dataWriteCmd_payload_way = stageB_waysHits;
        end
      end
    end
    if(_zz_17_)begin
      dataWriteCmd_payload_way = loader_waysAllocator;
    end
  end

  always @ (*) begin
    dataWriteCmd_payload_address = 10'h0;
    if(io_cpu_writeBack_isValid)begin
      if(! stageB_mmuRsp_isIoAccess) begin
        if(_zz_14_)begin
          dataWriteCmd_payload_address = stageB_mmuRsp_physicalAddress[11 : 2];
        end
      end
    end
    if(_zz_17_)begin
      dataWriteCmd_payload_address = {stageB_mmuRsp_physicalAddress[11 : 5],loader_counter_value};
    end
  end

  always @ (*) begin
    dataWriteCmd_payload_data = 32'h0;
    if(io_cpu_writeBack_isValid)begin
      if(! stageB_mmuRsp_isIoAccess) begin
        if(_zz_14_)begin
          dataWriteCmd_payload_data = stageB_requestDataBypass;
        end
      end
    end
    if(_zz_17_)begin
      dataWriteCmd_payload_data = io_mem_rsp_payload_data;
    end
  end

  always @ (*) begin
    dataWriteCmd_payload_mask = (4'bxxxx);
    if(io_cpu_writeBack_isValid)begin
      if(! stageB_mmuRsp_isIoAccess) begin
        if(_zz_14_)begin
          dataWriteCmd_payload_mask = stageB_mask;
        end
      end
    end
    if(_zz_17_)begin
      dataWriteCmd_payload_mask = (4'b1111);
    end
  end

  always @ (*) begin
    case(io_cpu_execute_args_size)
      2'b00 : begin
        _zz_6_ = (4'b0001);
      end
      2'b01 : begin
        _zz_6_ = (4'b0011);
      end
      default : begin
        _zz_6_ = (4'b1111);
      end
    endcase
  end

  assign stage0_mask = (_zz_6_ <<< io_cpu_execute_address[1 : 0]);
  assign stage0_colisions[0] = (((dataWriteCmd_valid && dataWriteCmd_payload_way[0]) && (dataWriteCmd_payload_address == io_cpu_execute_address[11 : 2])) && ((stage0_mask & dataWriteCmd_payload_mask) != (4'b0000)));
  assign io_cpu_memory_mmuBus_cmd_isValid = io_cpu_memory_isValid;
  assign io_cpu_memory_mmuBus_cmd_virtualAddress = io_cpu_memory_address;
  assign io_cpu_memory_mmuBus_cmd_bypassTranslation = 1'b0;
  assign io_cpu_memory_mmuBus_end = ((! io_cpu_memory_isStuck) || io_cpu_memory_isRemoved);
  assign io_cpu_memory_isWrite = stageA_request_wr;
  assign stageA_wayHits_0 = ((io_cpu_memory_mmuBus_rsp_physicalAddress[31 : 12] == ways_0_tagsReadRsp_address) && ways_0_tagsReadRsp_valid);
  assign _zz_7_[0] = (((dataWriteCmd_valid && dataWriteCmd_payload_way[0]) && (dataWriteCmd_payload_address == io_cpu_memory_address[11 : 2])) && ((stageA_mask & dataWriteCmd_payload_mask) != (4'b0000)));
  assign stageA_colisions = (stage0_colisions_regNextWhen | _zz_7_);
  always @ (*) begin
    stageB_mmuRspFreeze = 1'b0;
    if((stageB_loaderValid || loader_valid))begin
      stageB_mmuRspFreeze = 1'b1;
    end
  end

  assign _zz_8_[0] = stageA_wayHits_0;
  assign stageB_waysHit = (stageB_waysHits != (1'b0));
  assign stageB_dataMux = stageB_dataReadRsp_0;
  always @ (*) begin
    stageB_loaderValid = 1'b0;
    if(io_cpu_writeBack_isValid)begin
      if(! stageB_mmuRsp_isIoAccess) begin
        if(! _zz_14_) begin
          if(io_mem_cmd_ready)begin
            stageB_loaderValid = 1'b1;
          end
        end
      end
    end
    if(_zz_13_)begin
      stageB_loaderValid = 1'b0;
    end
  end

  always @ (*) begin
    io_cpu_writeBack_haltIt = io_cpu_writeBack_isValid;
    if(stageB_flusher_valid)begin
      io_cpu_writeBack_haltIt = 1'b1;
    end
    if(io_cpu_writeBack_isValid)begin
      if(stageB_mmuRsp_isIoAccess)begin
        if((stageB_request_wr ? io_mem_cmd_ready : io_mem_rsp_valid))begin
          io_cpu_writeBack_haltIt = 1'b0;
        end
        if(_zz_18_)begin
          io_cpu_writeBack_haltIt = 1'b0;
        end
      end else begin
        if(_zz_14_)begin
          if(((! stageB_request_wr) || io_mem_cmd_ready))begin
            io_cpu_writeBack_haltIt = 1'b0;
          end
          if(stageB_request_isAmo)begin
            if(_zz_15_)begin
              io_cpu_writeBack_haltIt = 1'b1;
            end
          end
          if(_zz_16_)begin
            io_cpu_writeBack_haltIt = 1'b0;
          end
        end
      end
    end
    if(_zz_13_)begin
      io_cpu_writeBack_haltIt = 1'b0;
    end
  end

  always @ (*) begin
    io_cpu_flush_ready = 1'b0;
    if(stageB_flusher_start)begin
      io_cpu_flush_ready = 1'b1;
    end
  end

  always @ (*) begin
    stageB_requestDataBypass = stageB_request_data;
    if(stageB_request_isAmo)begin
      stageB_requestDataBypass = stageB_amo_resultReg;
    end
  end

  assign stageB_amo_compare = stageB_request_amoCtrl_alu[2];
  assign stageB_amo_unsigned = (stageB_request_amoCtrl_alu[2 : 1] == (2'b11));
  assign stageB_amo_addSub = _zz_24_;
  assign stageB_amo_less = ((stageB_request_data[31] == stageB_dataMux[31]) ? stageB_amo_addSub[31] : (stageB_amo_unsigned ? stageB_dataMux[31] : stageB_request_data[31]));
  assign stageB_amo_selectRf = (stageB_request_amoCtrl_swap ? 1'b1 : (stageB_request_amoCtrl_alu[0] ^ stageB_amo_less));
  always @ (*) begin
    case(_zz_21_)
      3'b000 : begin
        stageB_amo_result = stageB_amo_addSub;
      end
      3'b001 : begin
        stageB_amo_result = (stageB_request_data ^ stageB_dataMux);
      end
      3'b010 : begin
        stageB_amo_result = (stageB_request_data | stageB_dataMux);
      end
      3'b011 : begin
        stageB_amo_result = (stageB_request_data & stageB_dataMux);
      end
      default : begin
        stageB_amo_result = (stageB_amo_selectRf ? stageB_request_data : stageB_dataMux);
      end
    endcase
  end

  always @ (*) begin
    io_cpu_redo = 1'b0;
    if(io_cpu_writeBack_isValid)begin
      if(! stageB_mmuRsp_isIoAccess) begin
        if(_zz_14_)begin
          if(_zz_19_)begin
            io_cpu_redo = 1'b1;
          end
        end
      end
    end
    if((io_cpu_writeBack_isValid && stageB_mmuRsp_refilling))begin
      io_cpu_redo = 1'b1;
    end
    if(loader_valid)begin
      io_cpu_redo = 1'b1;
    end
  end

  always @ (*) begin
    io_cpu_writeBack_accessError = 1'b0;
    if(stageB_mmuRsp_isIoAccess)begin
      io_cpu_writeBack_accessError = (io_mem_rsp_valid && io_mem_rsp_payload_error);
    end else begin
      io_cpu_writeBack_accessError = ((stageB_waysHits & _zz_9_) != (1'b0));
    end
  end

  assign io_cpu_writeBack_mmuException = (io_cpu_writeBack_isValid && ((stageB_mmuRsp_exception || ((! stageB_mmuRsp_allowWrite) && stageB_request_wr)) || ((! stageB_mmuRsp_allowRead) && ((! stageB_request_wr) || stageB_request_isAmo))));
  assign io_cpu_writeBack_unalignedAccess = (io_cpu_writeBack_isValid && (((stageB_request_size == (2'b10)) && (stageB_mmuRsp_physicalAddress[1 : 0] != (2'b00))) || ((stageB_request_size == (2'b01)) && (stageB_mmuRsp_physicalAddress[0 : 0] != (1'b0)))));
  assign io_cpu_writeBack_isWrite = stageB_request_wr;
  always @ (*) begin
    io_mem_cmd_valid = 1'b0;
    if(io_cpu_writeBack_isValid)begin
      if(stageB_mmuRsp_isIoAccess)begin
        io_mem_cmd_valid = (! stageB_memCmdSent);
        if(_zz_18_)begin
          io_mem_cmd_valid = 1'b0;
        end
      end else begin
        if(_zz_14_)begin
          if(stageB_request_wr)begin
            io_mem_cmd_valid = 1'b1;
          end
          if(stageB_request_isAmo)begin
            if(_zz_15_)begin
              io_mem_cmd_valid = 1'b0;
            end
          end
          if(_zz_19_)begin
            io_mem_cmd_valid = 1'b0;
          end
          if(_zz_16_)begin
            io_mem_cmd_valid = 1'b0;
          end
        end else begin
          if((! stageB_memCmdSent))begin
            io_mem_cmd_valid = 1'b1;
          end
        end
      end
    end
    if(_zz_13_)begin
      io_mem_cmd_valid = 1'b0;
    end
  end

  always @ (*) begin
    io_mem_cmd_payload_address = 32'h0;
    if(io_cpu_writeBack_isValid)begin
      if(stageB_mmuRsp_isIoAccess)begin
        io_mem_cmd_payload_address = {stageB_mmuRsp_physicalAddress[31 : 2],(2'b00)};
      end else begin
        if(_zz_14_)begin
          io_mem_cmd_payload_address = {stageB_mmuRsp_physicalAddress[31 : 2],(2'b00)};
        end else begin
          io_mem_cmd_payload_address = {stageB_mmuRsp_physicalAddress[31 : 5],5'h0};
        end
      end
    end
  end

  always @ (*) begin
    io_mem_cmd_payload_length = (3'bxxx);
    if(io_cpu_writeBack_isValid)begin
      if(stageB_mmuRsp_isIoAccess)begin
        io_mem_cmd_payload_length = (3'b000);
      end else begin
        if(_zz_14_)begin
          io_mem_cmd_payload_length = (3'b000);
        end else begin
          io_mem_cmd_payload_length = (3'b111);
        end
      end
    end
  end

  always @ (*) begin
    io_mem_cmd_payload_last = 1'bx;
    if(io_cpu_writeBack_isValid)begin
      if(stageB_mmuRsp_isIoAccess)begin
        io_mem_cmd_payload_last = 1'b1;
      end else begin
        if(_zz_14_)begin
          io_mem_cmd_payload_last = 1'b1;
        end else begin
          io_mem_cmd_payload_last = 1'b1;
        end
      end
    end
  end

  always @ (*) begin
    io_mem_cmd_payload_wr = stageB_request_wr;
    if(io_cpu_writeBack_isValid)begin
      if(! stageB_mmuRsp_isIoAccess) begin
        if(! _zz_14_) begin
          io_mem_cmd_payload_wr = 1'b0;
        end
      end
    end
  end

  assign io_mem_cmd_payload_mask = stageB_mask;
  assign io_mem_cmd_payload_data = stageB_requestDataBypass;
  always @ (*) begin
    if(stageB_mmuRsp_isIoAccess)begin
      io_cpu_writeBack_data = io_mem_rsp_payload_data;
    end else begin
      io_cpu_writeBack_data = stageB_dataMux;
    end
    if((stageB_request_isLrsc && stageB_request_wr))begin
      io_cpu_writeBack_data = {31'd0, _zz_32_};
    end
  end

  assign _zz_9_[0] = stageB_tagsReadRsp_0_error;
  always @ (*) begin
    loader_counter_willIncrement = 1'b0;
    if(_zz_17_)begin
      loader_counter_willIncrement = 1'b1;
    end
  end

  assign loader_counter_willClear = 1'b0;
  assign loader_counter_willOverflowIfInc = (loader_counter_value == (3'b111));
  assign loader_counter_willOverflow = (loader_counter_willOverflowIfInc && loader_counter_willIncrement);
  always @ (*) begin
    loader_counter_valueNext = (loader_counter_value + _zz_34_);
    if(loader_counter_willClear)begin
      loader_counter_valueNext = (3'b000);
    end
  end

  always @ (posedge clk) begin
    tagsWriteLastCmd_valid <= tagsWriteCmd_valid;
    tagsWriteLastCmd_payload_way <= tagsWriteCmd_payload_way;
    tagsWriteLastCmd_payload_address <= tagsWriteCmd_payload_address;
    tagsWriteLastCmd_payload_data_valid <= tagsWriteCmd_payload_data_valid;
    tagsWriteLastCmd_payload_data_error <= tagsWriteCmd_payload_data_error;
    tagsWriteLastCmd_payload_data_address <= tagsWriteCmd_payload_data_address;
    if((! io_cpu_memory_isStuck))begin
      stageA_request_wr <= io_cpu_execute_args_wr;
      stageA_request_data <= io_cpu_execute_args_data;
      stageA_request_size <= io_cpu_execute_args_size;
      stageA_request_isLrsc <= io_cpu_execute_args_isLrsc;
      stageA_request_isAmo <= io_cpu_execute_args_isAmo;
      stageA_request_amoCtrl_swap <= io_cpu_execute_args_amoCtrl_swap;
      stageA_request_amoCtrl_alu <= io_cpu_execute_args_amoCtrl_alu;
    end
    if((! io_cpu_memory_isStuck))begin
      stageA_mask <= stage0_mask;
    end
    if((! io_cpu_memory_isStuck))begin
      stage0_colisions_regNextWhen <= stage0_colisions;
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_request_wr <= stageA_request_wr;
      stageB_request_data <= stageA_request_data;
      stageB_request_size <= stageA_request_size;
      stageB_request_isLrsc <= stageA_request_isLrsc;
      stageB_request_isAmo <= stageA_request_isAmo;
      stageB_request_amoCtrl_swap <= stageA_request_amoCtrl_swap;
      stageB_request_amoCtrl_alu <= stageA_request_amoCtrl_alu;
    end
    if(((! io_cpu_writeBack_isStuck) && (! stageB_mmuRspFreeze)))begin
      stageB_mmuRsp_physicalAddress <= io_cpu_memory_mmuBus_rsp_physicalAddress;
      stageB_mmuRsp_isIoAccess <= io_cpu_memory_mmuBus_rsp_isIoAccess;
      stageB_mmuRsp_allowRead <= io_cpu_memory_mmuBus_rsp_allowRead;
      stageB_mmuRsp_allowWrite <= io_cpu_memory_mmuBus_rsp_allowWrite;
      stageB_mmuRsp_allowExecute <= io_cpu_memory_mmuBus_rsp_allowExecute;
      stageB_mmuRsp_exception <= io_cpu_memory_mmuBus_rsp_exception;
      stageB_mmuRsp_refilling <= io_cpu_memory_mmuBus_rsp_refilling;
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_tagsReadRsp_0_valid <= ways_0_tagsReadRsp_valid;
      stageB_tagsReadRsp_0_error <= ways_0_tagsReadRsp_error;
      stageB_tagsReadRsp_0_address <= ways_0_tagsReadRsp_address;
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_dataReadRsp_0 <= ways_0_dataReadRsp;
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_waysHits <= _zz_8_;
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_mask <= stageA_mask;
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_colisions <= stageA_colisions;
    end
    if(stageB_flusher_valid)begin
      if(_zz_20_)begin
        stageB_mmuRsp_physicalAddress[11 : 5] <= (stageB_mmuRsp_physicalAddress[11 : 5] + 7'h01);
      end
    end
    if(stageB_flusher_start)begin
      stageB_mmuRsp_physicalAddress[11 : 5] <= 7'h0;
    end
    stageB_amo_resultRegValid <= 1'b1;
    if((! io_cpu_writeBack_isStuck))begin
      stageB_amo_resultRegValid <= 1'b0;
    end
    stageB_amo_resultReg <= stageB_amo_result;
    `ifndef SYNTHESIS
      `ifdef FORMAL
        assert((! ((io_cpu_writeBack_isValid && (! io_cpu_writeBack_haltIt)) && io_cpu_writeBack_isStuck)))
      `else
        if(!(! ((io_cpu_writeBack_isValid && (! io_cpu_writeBack_haltIt)) && io_cpu_writeBack_isStuck))) begin
          $display("FAILURE writeBack stuck by another plugin is not allowed");
          $finish;
        end
      `endif
    `endif
  end

  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      stageB_flusher_valid <= 1'b0;
      stageB_flusher_start <= 1'b1;
      stageB_lrsc_reserved <= 1'b0;
      stageB_memCmdSent <= 1'b0;
      loader_valid <= 1'b0;
      loader_counter_value <= (3'b000);
      loader_waysAllocator <= (1'b1);
      loader_error <= 1'b0;
    end else begin
      if(stageB_flusher_valid)begin
        if(! _zz_20_) begin
          stageB_flusher_valid <= 1'b0;
        end
      end
      stageB_flusher_start <= ((((((! stageB_flusher_start) && io_cpu_flush_valid) && (! io_cpu_execute_isValid)) && (! io_cpu_memory_isValid)) && (! io_cpu_writeBack_isValid)) && (! io_cpu_redo));
      if(stageB_flusher_start)begin
        stageB_flusher_valid <= 1'b1;
      end
      if(((((io_cpu_writeBack_isValid && (! io_cpu_writeBack_isStuck)) && (! io_cpu_redo)) && stageB_request_isLrsc) && (! stageB_request_wr)))begin
        stageB_lrsc_reserved <= 1'b1;
      end
      if(io_cpu_writeBack_clearLrsc)begin
        stageB_lrsc_reserved <= 1'b0;
      end
      if(io_mem_cmd_ready)begin
        stageB_memCmdSent <= 1'b1;
      end
      if((! io_cpu_writeBack_isStuck))begin
        stageB_memCmdSent <= 1'b0;
      end
      if(stageB_loaderValid)begin
        loader_valid <= 1'b1;
      end
      loader_counter_value <= loader_counter_valueNext;
      if(_zz_17_)begin
        loader_error <= (loader_error || io_mem_rsp_payload_error);
      end
      if(loader_counter_willOverflow)begin
        loader_valid <= 1'b0;
        loader_error <= 1'b0;
      end
      if((! loader_valid))begin
        loader_waysAllocator <= _zz_35_[0:0];
      end
    end
  end


endmodule

module StreamFork (
  input               io_input_valid,
  output reg          io_input_ready,
  input               io_input_payload_wr,
  input      [31:0]   io_input_payload_address,
  input      [31:0]   io_input_payload_data,
  input      [3:0]    io_input_payload_mask,
  input      [2:0]    io_input_payload_length,
  input               io_input_payload_last,
  output              io_outputs_0_valid,
  input               io_outputs_0_ready,
  output              io_outputs_0_payload_wr,
  output     [31:0]   io_outputs_0_payload_address,
  output     [31:0]   io_outputs_0_payload_data,
  output     [3:0]    io_outputs_0_payload_mask,
  output     [2:0]    io_outputs_0_payload_length,
  output              io_outputs_0_payload_last,
  output              io_outputs_1_valid,
  input               io_outputs_1_ready,
  output              io_outputs_1_payload_wr,
  output     [31:0]   io_outputs_1_payload_address,
  output     [31:0]   io_outputs_1_payload_data,
  output     [3:0]    io_outputs_1_payload_mask,
  output     [2:0]    io_outputs_1_payload_length,
  output              io_outputs_1_payload_last,
  input               clk,
  input               reset 
);
  reg                 _zz_1_;
  reg                 _zz_2_;

  always @ (*) begin
    io_input_ready = 1'b1;
    if(((! io_outputs_0_ready) && _zz_1_))begin
      io_input_ready = 1'b0;
    end
    if(((! io_outputs_1_ready) && _zz_2_))begin
      io_input_ready = 1'b0;
    end
  end

  assign io_outputs_0_valid = (io_input_valid && _zz_1_);
  assign io_outputs_0_payload_wr = io_input_payload_wr;
  assign io_outputs_0_payload_address = io_input_payload_address;
  assign io_outputs_0_payload_data = io_input_payload_data;
  assign io_outputs_0_payload_mask = io_input_payload_mask;
  assign io_outputs_0_payload_length = io_input_payload_length;
  assign io_outputs_0_payload_last = io_input_payload_last;
  assign io_outputs_1_valid = (io_input_valid && _zz_2_);
  assign io_outputs_1_payload_wr = io_input_payload_wr;
  assign io_outputs_1_payload_address = io_input_payload_address;
  assign io_outputs_1_payload_data = io_input_payload_data;
  assign io_outputs_1_payload_mask = io_input_payload_mask;
  assign io_outputs_1_payload_length = io_input_payload_length;
  assign io_outputs_1_payload_last = io_input_payload_last;
  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      _zz_1_ <= 1'b1;
      _zz_2_ <= 1'b1;
    end else begin
      if((io_outputs_0_valid && io_outputs_0_ready))begin
        _zz_1_ <= 1'b0;
      end
      if((io_outputs_1_valid && io_outputs_1_ready))begin
        _zz_2_ <= 1'b0;
      end
      if(io_input_ready)begin
        _zz_1_ <= 1'b1;
        _zz_2_ <= 1'b1;
      end
    end
  end


endmodule

module VexRiscv (
  input      [31:0]   externalResetVector,
  input               timerInterrupt,
  input               externalInterrupt,
  input               softwareInterrupt,
  output              iBusAxi_ar_valid,
  input               iBusAxi_ar_ready,
  output     [31:0]   iBusAxi_ar_payload_addr,
  output     [7:0]    iBusAxi_ar_payload_len,
  output     [1:0]    iBusAxi_ar_payload_burst,
  output     [3:0]    iBusAxi_ar_payload_cache,
  output     [2:0]    iBusAxi_ar_payload_prot,
  input               iBusAxi_r_valid,
  output              iBusAxi_r_ready,
  input      [31:0]   iBusAxi_r_payload_data,
  input      [1:0]    iBusAxi_r_payload_resp,
  input               iBusAxi_r_payload_last,
  output              dBusAxi_aw_valid,
  input               dBusAxi_aw_ready,
  output     [31:0]   dBusAxi_aw_payload_addr,
  output     [0:0]    dBusAxi_aw_payload_id,
  output     [3:0]    dBusAxi_aw_payload_region,
  output     [7:0]    dBusAxi_aw_payload_len,
  output     [2:0]    dBusAxi_aw_payload_size,
  output     [1:0]    dBusAxi_aw_payload_burst,
  output     [0:0]    dBusAxi_aw_payload_lock,
  output     [3:0]    dBusAxi_aw_payload_cache,
  output     [3:0]    dBusAxi_aw_payload_qos,
  output     [2:0]    dBusAxi_aw_payload_prot,
  output              dBusAxi_w_valid,
  input               dBusAxi_w_ready,
  output     [31:0]   dBusAxi_w_payload_data,
  output     [3:0]    dBusAxi_w_payload_strb,
  output              dBusAxi_w_payload_last,
  input               dBusAxi_b_valid,
  output              dBusAxi_b_ready,
  input      [0:0]    dBusAxi_b_payload_id,
  input      [1:0]    dBusAxi_b_payload_resp,
  output              dBusAxi_ar_valid,
  input               dBusAxi_ar_ready,
  output     [31:0]   dBusAxi_ar_payload_addr,
  output     [0:0]    dBusAxi_ar_payload_id,
  output     [3:0]    dBusAxi_ar_payload_region,
  output     [7:0]    dBusAxi_ar_payload_len,
  output     [2:0]    dBusAxi_ar_payload_size,
  output     [1:0]    dBusAxi_ar_payload_burst,
  output     [0:0]    dBusAxi_ar_payload_lock,
  output     [3:0]    dBusAxi_ar_payload_cache,
  output     [3:0]    dBusAxi_ar_payload_qos,
  output     [2:0]    dBusAxi_ar_payload_prot,
  input               dBusAxi_r_valid,
  output              dBusAxi_r_ready,
  input      [31:0]   dBusAxi_r_payload_data,
  input      [0:0]    dBusAxi_r_payload_id,
  input      [1:0]    dBusAxi_r_payload_resp,
  input               dBusAxi_r_payload_last,
  input               clk,
  input               reset 
);
  wire                _zz_178_;
  wire                _zz_179_;
  wire                _zz_180_;
  wire                _zz_181_;
  wire                _zz_182_;
  wire                _zz_183_;
  wire                _zz_184_;
  reg                 _zz_185_;
  wire                _zz_186_;
  wire       [31:0]   _zz_187_;
  reg                 _zz_188_;
  wire                _zz_189_;
  wire       [2:0]    _zz_190_;
  wire                _zz_191_;
  wire       [31:0]   _zz_192_;
  reg                 _zz_193_;
  wire                _zz_194_;
  wire                _zz_195_;
  wire       [31:0]   _zz_196_;
  wire                _zz_197_;
  wire                _zz_198_;
  wire                _zz_199_;
  reg                 _zz_200_;
  reg                 _zz_201_;
  reg        [31:0]   _zz_202_;
  reg        [31:0]   _zz_203_;
  reg        [31:0]   _zz_204_;
  wire                IBusCachedPlugin_cache_io_cpu_prefetch_haltIt;
  wire       [31:0]   IBusCachedPlugin_cache_io_cpu_fetch_data;
  wire       [31:0]   IBusCachedPlugin_cache_io_cpu_fetch_physicalAddress;
  wire                IBusCachedPlugin_cache_io_cpu_fetch_haltIt;
  wire                IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_isValid;
  wire       [31:0]   IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_virtualAddress;
  wire                IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_bypassTranslation;
  wire                IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_end;
  wire                IBusCachedPlugin_cache_io_cpu_decode_error;
  wire                IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling;
  wire                IBusCachedPlugin_cache_io_cpu_decode_mmuException;
  wire       [31:0]   IBusCachedPlugin_cache_io_cpu_decode_data;
  wire                IBusCachedPlugin_cache_io_cpu_decode_cacheMiss;
  wire       [31:0]   IBusCachedPlugin_cache_io_cpu_decode_physicalAddress;
  wire                IBusCachedPlugin_cache_io_mem_cmd_valid;
  wire       [31:0]   IBusCachedPlugin_cache_io_mem_cmd_payload_address;
  wire       [2:0]    IBusCachedPlugin_cache_io_mem_cmd_payload_size;
  wire                dataCache_1__io_cpu_memory_isWrite;
  wire                dataCache_1__io_cpu_memory_mmuBus_cmd_isValid;
  wire       [31:0]   dataCache_1__io_cpu_memory_mmuBus_cmd_virtualAddress;
  wire                dataCache_1__io_cpu_memory_mmuBus_cmd_bypassTranslation;
  wire                dataCache_1__io_cpu_memory_mmuBus_end;
  wire                dataCache_1__io_cpu_writeBack_haltIt;
  wire       [31:0]   dataCache_1__io_cpu_writeBack_data;
  wire                dataCache_1__io_cpu_writeBack_mmuException;
  wire                dataCache_1__io_cpu_writeBack_unalignedAccess;
  wire                dataCache_1__io_cpu_writeBack_accessError;
  wire                dataCache_1__io_cpu_writeBack_isWrite;
  wire                dataCache_1__io_cpu_flush_ready;
  wire                dataCache_1__io_cpu_redo;
  wire                dataCache_1__io_mem_cmd_valid;
  wire                dataCache_1__io_mem_cmd_payload_wr;
  wire       [31:0]   dataCache_1__io_mem_cmd_payload_address;
  wire       [31:0]   dataCache_1__io_mem_cmd_payload_data;
  wire       [3:0]    dataCache_1__io_mem_cmd_payload_mask;
  wire       [2:0]    dataCache_1__io_mem_cmd_payload_length;
  wire                dataCache_1__io_mem_cmd_payload_last;
  wire                streamFork_1__io_input_ready;
  wire                streamFork_1__io_outputs_0_valid;
  wire                streamFork_1__io_outputs_0_payload_wr;
  wire       [31:0]   streamFork_1__io_outputs_0_payload_address;
  wire       [31:0]   streamFork_1__io_outputs_0_payload_data;
  wire       [3:0]    streamFork_1__io_outputs_0_payload_mask;
  wire       [2:0]    streamFork_1__io_outputs_0_payload_length;
  wire                streamFork_1__io_outputs_0_payload_last;
  wire                streamFork_1__io_outputs_1_valid;
  wire                streamFork_1__io_outputs_1_payload_wr;
  wire       [31:0]   streamFork_1__io_outputs_1_payload_address;
  wire       [31:0]   streamFork_1__io_outputs_1_payload_data;
  wire       [3:0]    streamFork_1__io_outputs_1_payload_mask;
  wire       [2:0]    streamFork_1__io_outputs_1_payload_length;
  wire                streamFork_1__io_outputs_1_payload_last;
  wire                _zz_205_;
  wire                _zz_206_;
  wire                _zz_207_;
  wire                _zz_208_;
  wire                _zz_209_;
  wire                _zz_210_;
  wire                _zz_211_;
  wire                _zz_212_;
  wire                _zz_213_;
  wire                _zz_214_;
  wire                _zz_215_;
  wire                _zz_216_;
  wire       [1:0]    _zz_217_;
  wire                _zz_218_;
  wire                _zz_219_;
  wire       [1:0]    _zz_220_;
  wire                _zz_221_;
  wire                _zz_222_;
  wire                _zz_223_;
  wire                _zz_224_;
  wire                _zz_225_;
  wire                _zz_226_;
  wire                _zz_227_;
  wire                _zz_228_;
  wire                _zz_229_;
  wire                _zz_230_;
  wire                _zz_231_;
  wire                _zz_232_;
  wire                _zz_233_;
  wire                _zz_234_;
  wire                _zz_235_;
  wire       [1:0]    _zz_236_;
  wire                _zz_237_;
  wire       [1:0]    _zz_238_;
  wire       [0:0]    _zz_239_;
  wire       [0:0]    _zz_240_;
  wire       [0:0]    _zz_241_;
  wire       [0:0]    _zz_242_;
  wire       [0:0]    _zz_243_;
  wire       [32:0]   _zz_244_;
  wire       [31:0]   _zz_245_;
  wire       [32:0]   _zz_246_;
  wire       [0:0]    _zz_247_;
  wire       [51:0]   _zz_248_;
  wire       [51:0]   _zz_249_;
  wire       [51:0]   _zz_250_;
  wire       [32:0]   _zz_251_;
  wire       [51:0]   _zz_252_;
  wire       [49:0]   _zz_253_;
  wire       [51:0]   _zz_254_;
  wire       [49:0]   _zz_255_;
  wire       [51:0]   _zz_256_;
  wire       [0:0]    _zz_257_;
  wire       [0:0]    _zz_258_;
  wire       [0:0]    _zz_259_;
  wire       [0:0]    _zz_260_;
  wire       [0:0]    _zz_261_;
  wire       [0:0]    _zz_262_;
  wire       [0:0]    _zz_263_;
  wire       [0:0]    _zz_264_;
  wire       [0:0]    _zz_265_;
  wire       [0:0]    _zz_266_;
  wire       [0:0]    _zz_267_;
  wire       [0:0]    _zz_268_;
  wire       [0:0]    _zz_269_;
  wire       [3:0]    _zz_270_;
  wire       [2:0]    _zz_271_;
  wire       [31:0]   _zz_272_;
  wire       [11:0]   _zz_273_;
  wire       [31:0]   _zz_274_;
  wire       [19:0]   _zz_275_;
  wire       [11:0]   _zz_276_;
  wire       [31:0]   _zz_277_;
  wire       [31:0]   _zz_278_;
  wire       [19:0]   _zz_279_;
  wire       [11:0]   _zz_280_;
  wire       [2:0]    _zz_281_;
  wire       [2:0]    _zz_282_;
  wire       [0:0]    _zz_283_;
  wire       [2:0]    _zz_284_;
  wire       [4:0]    _zz_285_;
  wire       [11:0]   _zz_286_;
  wire       [11:0]   _zz_287_;
  wire       [31:0]   _zz_288_;
  wire       [31:0]   _zz_289_;
  wire       [31:0]   _zz_290_;
  wire       [31:0]   _zz_291_;
  wire       [31:0]   _zz_292_;
  wire       [31:0]   _zz_293_;
  wire       [31:0]   _zz_294_;
  wire       [65:0]   _zz_295_;
  wire       [65:0]   _zz_296_;
  wire       [31:0]   _zz_297_;
  wire       [31:0]   _zz_298_;
  wire       [0:0]    _zz_299_;
  wire       [5:0]    _zz_300_;
  wire       [32:0]   _zz_301_;
  wire       [31:0]   _zz_302_;
  wire       [31:0]   _zz_303_;
  wire       [32:0]   _zz_304_;
  wire       [32:0]   _zz_305_;
  wire       [32:0]   _zz_306_;
  wire       [32:0]   _zz_307_;
  wire       [0:0]    _zz_308_;
  wire       [32:0]   _zz_309_;
  wire       [0:0]    _zz_310_;
  wire       [32:0]   _zz_311_;
  wire       [0:0]    _zz_312_;
  wire       [31:0]   _zz_313_;
  wire       [11:0]   _zz_314_;
  wire       [19:0]   _zz_315_;
  wire       [11:0]   _zz_316_;
  wire       [31:0]   _zz_317_;
  wire       [31:0]   _zz_318_;
  wire       [31:0]   _zz_319_;
  wire       [11:0]   _zz_320_;
  wire       [19:0]   _zz_321_;
  wire       [11:0]   _zz_322_;
  wire       [2:0]    _zz_323_;
  wire       [0:0]    _zz_324_;
  wire       [0:0]    _zz_325_;
  wire       [0:0]    _zz_326_;
  wire       [0:0]    _zz_327_;
  wire       [0:0]    _zz_328_;
  wire       [0:0]    _zz_329_;
  wire                _zz_330_;
  wire                _zz_331_;
  wire       [1:0]    _zz_332_;
  wire                _zz_333_;
  wire                _zz_334_;
  wire                _zz_335_;
  wire       [31:0]   _zz_336_;
  wire       [31:0]   _zz_337_;
  wire       [31:0]   _zz_338_;
  wire       [31:0]   _zz_339_;
  wire                _zz_340_;
  wire       [0:0]    _zz_341_;
  wire       [0:0]    _zz_342_;
  wire                _zz_343_;
  wire       [0:0]    _zz_344_;
  wire       [26:0]   _zz_345_;
  wire       [31:0]   _zz_346_;
  wire       [31:0]   _zz_347_;
  wire                _zz_348_;
  wire                _zz_349_;
  wire       [31:0]   _zz_350_;
  wire       [31:0]   _zz_351_;
  wire       [0:0]    _zz_352_;
  wire       [5:0]    _zz_353_;
  wire       [0:0]    _zz_354_;
  wire       [0:0]    _zz_355_;
  wire                _zz_356_;
  wire       [0:0]    _zz_357_;
  wire       [22:0]   _zz_358_;
  wire       [31:0]   _zz_359_;
  wire       [31:0]   _zz_360_;
  wire                _zz_361_;
  wire       [0:0]    _zz_362_;
  wire       [2:0]    _zz_363_;
  wire       [31:0]   _zz_364_;
  wire       [0:0]    _zz_365_;
  wire       [0:0]    _zz_366_;
  wire       [0:0]    _zz_367_;
  wire       [0:0]    _zz_368_;
  wire       [0:0]    _zz_369_;
  wire       [0:0]    _zz_370_;
  wire                _zz_371_;
  wire       [0:0]    _zz_372_;
  wire       [19:0]   _zz_373_;
  wire       [31:0]   _zz_374_;
  wire       [31:0]   _zz_375_;
  wire       [31:0]   _zz_376_;
  wire                _zz_377_;
  wire       [0:0]    _zz_378_;
  wire       [0:0]    _zz_379_;
  wire       [31:0]   _zz_380_;
  wire       [31:0]   _zz_381_;
  wire       [31:0]   _zz_382_;
  wire       [31:0]   _zz_383_;
  wire       [31:0]   _zz_384_;
  wire       [31:0]   _zz_385_;
  wire       [0:0]    _zz_386_;
  wire       [0:0]    _zz_387_;
  wire       [1:0]    _zz_388_;
  wire       [1:0]    _zz_389_;
  wire                _zz_390_;
  wire       [0:0]    _zz_391_;
  wire       [17:0]   _zz_392_;
  wire       [31:0]   _zz_393_;
  wire       [31:0]   _zz_394_;
  wire       [31:0]   _zz_395_;
  wire       [31:0]   _zz_396_;
  wire       [31:0]   _zz_397_;
  wire       [31:0]   _zz_398_;
  wire       [31:0]   _zz_399_;
  wire                _zz_400_;
  wire                _zz_401_;
  wire       [4:0]    _zz_402_;
  wire       [4:0]    _zz_403_;
  wire                _zz_404_;
  wire       [0:0]    _zz_405_;
  wire       [15:0]   _zz_406_;
  wire       [31:0]   _zz_407_;
  wire       [31:0]   _zz_408_;
  wire                _zz_409_;
  wire       [0:0]    _zz_410_;
  wire       [1:0]    _zz_411_;
  wire       [31:0]   _zz_412_;
  wire       [31:0]   _zz_413_;
  wire                _zz_414_;
  wire       [1:0]    _zz_415_;
  wire       [1:0]    _zz_416_;
  wire                _zz_417_;
  wire       [0:0]    _zz_418_;
  wire       [12:0]   _zz_419_;
  wire       [31:0]   _zz_420_;
  wire       [31:0]   _zz_421_;
  wire       [31:0]   _zz_422_;
  wire       [31:0]   _zz_423_;
  wire       [31:0]   _zz_424_;
  wire       [31:0]   _zz_425_;
  wire       [31:0]   _zz_426_;
  wire                _zz_427_;
  wire       [0:0]    _zz_428_;
  wire       [0:0]    _zz_429_;
  wire       [0:0]    _zz_430_;
  wire       [3:0]    _zz_431_;
  wire       [2:0]    _zz_432_;
  wire       [2:0]    _zz_433_;
  wire                _zz_434_;
  wire       [0:0]    _zz_435_;
  wire       [9:0]    _zz_436_;
  wire       [31:0]   _zz_437_;
  wire       [31:0]   _zz_438_;
  wire       [31:0]   _zz_439_;
  wire       [31:0]   _zz_440_;
  wire       [31:0]   _zz_441_;
  wire                _zz_442_;
  wire       [0:0]    _zz_443_;
  wire       [1:0]    _zz_444_;
  wire                _zz_445_;
  wire       [0:0]    _zz_446_;
  wire       [0:0]    _zz_447_;
  wire       [0:0]    _zz_448_;
  wire       [0:0]    _zz_449_;
  wire       [0:0]    _zz_450_;
  wire       [0:0]    _zz_451_;
  wire                _zz_452_;
  wire       [0:0]    _zz_453_;
  wire       [7:0]    _zz_454_;
  wire       [31:0]   _zz_455_;
  wire       [31:0]   _zz_456_;
  wire       [31:0]   _zz_457_;
  wire                _zz_458_;
  wire                _zz_459_;
  wire       [31:0]   _zz_460_;
  wire       [31:0]   _zz_461_;
  wire       [31:0]   _zz_462_;
  wire       [31:0]   _zz_463_;
  wire       [31:0]   _zz_464_;
  wire       [31:0]   _zz_465_;
  wire       [31:0]   _zz_466_;
  wire       [31:0]   _zz_467_;
  wire       [31:0]   _zz_468_;
  wire       [0:0]    _zz_469_;
  wire       [2:0]    _zz_470_;
  wire       [1:0]    _zz_471_;
  wire       [1:0]    _zz_472_;
  wire                _zz_473_;
  wire       [0:0]    _zz_474_;
  wire       [5:0]    _zz_475_;
  wire       [31:0]   _zz_476_;
  wire       [31:0]   _zz_477_;
  wire       [31:0]   _zz_478_;
  wire       [31:0]   _zz_479_;
  wire                _zz_480_;
  wire       [0:0]    _zz_481_;
  wire       [0:0]    _zz_482_;
  wire                _zz_483_;
  wire       [0:0]    _zz_484_;
  wire       [0:0]    _zz_485_;
  wire       [0:0]    _zz_486_;
  wire       [0:0]    _zz_487_;
  wire                _zz_488_;
  wire       [0:0]    _zz_489_;
  wire       [3:0]    _zz_490_;
  wire       [31:0]   _zz_491_;
  wire       [31:0]   _zz_492_;
  wire       [31:0]   _zz_493_;
  wire       [31:0]   _zz_494_;
  wire       [31:0]   _zz_495_;
  wire       [31:0]   _zz_496_;
  wire       [0:0]    _zz_497_;
  wire       [2:0]    _zz_498_;
  wire       [0:0]    _zz_499_;
  wire       [0:0]    _zz_500_;
  wire                _zz_501_;
  wire       [0:0]    _zz_502_;
  wire       [0:0]    _zz_503_;
  wire       [31:0]   _zz_504_;
  wire       [31:0]   _zz_505_;
  wire       [31:0]   _zz_506_;
  wire       [31:0]   _zz_507_;
  wire       [31:0]   _zz_508_;
  wire       [31:0]   _zz_509_;
  wire                _zz_510_;
  wire       [0:0]    _zz_511_;
  wire       [2:0]    _zz_512_;
  wire                _zz_513_;
  wire                _zz_514_;
  wire                _zz_515_;
  wire       `Src2CtrlEnum_defaultEncoding_type decode_SRC2_CTRL;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_1_;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_2_;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_3_;
  wire                decode_CSR_READ_OPCODE;
  wire                decode_CSR_WRITE_OPCODE;
  wire                memory_MEMORY_WR;
  wire                decode_MEMORY_WR;
  wire                decode_SRC_LESS_UNSIGNED;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_4_;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_5_;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_6_;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_7_;
  wire       `EnvCtrlEnum_defaultEncoding_type decode_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_8_;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_9_;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_10_;
  wire       [33:0]   memory_MUL_HH;
  wire       [33:0]   execute_MUL_HH;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type decode_ALU_BITWISE_CTRL;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_11_;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_12_;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_13_;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_14_;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_15_;
  wire       [31:0]   execute_BRANCH_CALC;
  wire                decode_PREDICTION_HAD_BRANCHED2;
  wire                execute_BYPASSABLE_MEMORY_STAGE;
  wire                decode_BYPASSABLE_MEMORY_STAGE;
  wire                decode_IS_RS2_SIGNED;
  wire       [31:0]   execute_REGFILE_WRITE_DATA;
  wire                decode_IS_DIV;
  wire       [33:0]   execute_MUL_LH;
  wire       [31:0]   execute_SHIFT_RIGHT;
  wire       `AluCtrlEnum_defaultEncoding_type decode_ALU_CTRL;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_16_;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_17_;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_18_;
  wire       `Src1CtrlEnum_defaultEncoding_type decode_SRC1_CTRL;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_19_;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_20_;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_21_;
  wire                decode_IS_RS1_SIGNED;
  wire       [31:0]   memory_PC;
  wire       [51:0]   memory_MUL_LOW;
  wire       [31:0]   writeBack_FORMAL_PC_NEXT;
  wire       [31:0]   memory_FORMAL_PC_NEXT;
  wire       [31:0]   execute_FORMAL_PC_NEXT;
  wire       [31:0]   decode_FORMAL_PC_NEXT;
  wire                decode_BYPASSABLE_EXECUTE_STAGE;
  wire                decode_MEMORY_MANAGMENT;
  wire                decode_IS_CSR;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_22_;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_23_;
  wire       `ShiftCtrlEnum_defaultEncoding_type decode_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_24_;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_25_;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_26_;
  wire                memory_IS_MUL;
  wire                execute_IS_MUL;
  wire                decode_IS_MUL;
  wire       [31:0]   execute_MUL_LL;
  wire                execute_BRANCH_DO;
  wire                decode_SRC2_FORCE_ZERO;
  wire       [1:0]    memory_MEMORY_ADDRESS_LOW;
  wire       [1:0]    execute_MEMORY_ADDRESS_LOW;
  wire       [33:0]   execute_MUL_HL;
  wire                decode_MEMORY_LRSC;
  wire                decode_MEMORY_AMO;
  wire       [31:0]   memory_BRANCH_CALC;
  wire                memory_BRANCH_DO;
  wire       [31:0]   execute_PC;
  wire                execute_PREDICTION_HAD_BRANCHED2;
  wire                execute_BRANCH_COND_RESULT;
  wire       `BranchCtrlEnum_defaultEncoding_type execute_BRANCH_CTRL;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_27_;
  wire                decode_RS2_USE;
  wire                decode_RS1_USE;
  wire                execute_REGFILE_WRITE_VALID;
  wire                execute_BYPASSABLE_EXECUTE_STAGE;
  wire                memory_REGFILE_WRITE_VALID;
  wire                memory_BYPASSABLE_MEMORY_STAGE;
  wire                writeBack_REGFILE_WRITE_VALID;
  reg        [31:0]   decode_RS2;
  reg        [31:0]   decode_RS1;
  wire                execute_IS_RS1_SIGNED;
  wire                execute_IS_DIV;
  wire                execute_IS_RS2_SIGNED;
  wire       [31:0]   memory_INSTRUCTION;
  wire                memory_IS_DIV;
  wire                writeBack_IS_MUL;
  wire       [33:0]   writeBack_MUL_HH;
  wire       [51:0]   writeBack_MUL_LOW;
  wire       [33:0]   memory_MUL_HL;
  wire       [33:0]   memory_MUL_LH;
  wire       [31:0]   memory_MUL_LL;
  (* syn_keep , keep *) wire       [31:0]   execute_RS1 /* synthesis syn_keep = 1 */ ;
  wire       [31:0]   memory_SHIFT_RIGHT;
  reg        [31:0]   _zz_28_;
  wire       `ShiftCtrlEnum_defaultEncoding_type memory_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_29_;
  wire       `ShiftCtrlEnum_defaultEncoding_type execute_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_30_;
  wire                execute_SRC_LESS_UNSIGNED;
  wire                execute_SRC2_FORCE_ZERO;
  wire                execute_SRC_USE_SUB_LESS;
  wire       [31:0]   _zz_31_;
  wire       `Src2CtrlEnum_defaultEncoding_type execute_SRC2_CTRL;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_32_;
  wire       `Src1CtrlEnum_defaultEncoding_type execute_SRC1_CTRL;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_33_;
  wire                decode_SRC_USE_SUB_LESS;
  wire                decode_SRC_ADD_ZERO;
  wire       [31:0]   execute_SRC_ADD_SUB;
  wire                execute_SRC_LESS;
  wire       `AluCtrlEnum_defaultEncoding_type execute_ALU_CTRL;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_34_;
  wire       [31:0]   execute_SRC2;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type execute_ALU_BITWISE_CTRL;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_35_;
  wire       [31:0]   _zz_36_;
  wire                _zz_37_;
  reg                 _zz_38_;
  wire       [31:0]   decode_INSTRUCTION_ANTICIPATED;
  reg                 decode_REGFILE_WRITE_VALID;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_39_;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_40_;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_41_;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_42_;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_43_;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_44_;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_45_;
  reg        [31:0]   _zz_46_;
  wire       [31:0]   execute_SRC1;
  wire                execute_CSR_READ_OPCODE;
  wire                execute_CSR_WRITE_OPCODE;
  wire                execute_IS_CSR;
  wire       `EnvCtrlEnum_defaultEncoding_type memory_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_47_;
  wire       `EnvCtrlEnum_defaultEncoding_type execute_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_48_;
  wire       `EnvCtrlEnum_defaultEncoding_type writeBack_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_49_;
  reg        [31:0]   _zz_50_;
  wire       [1:0]    writeBack_MEMORY_ADDRESS_LOW;
  wire                writeBack_MEMORY_WR;
  wire       [31:0]   writeBack_REGFILE_WRITE_DATA;
  wire                writeBack_MEMORY_ENABLE;
  wire       [31:0]   memory_REGFILE_WRITE_DATA;
  wire                memory_MEMORY_ENABLE;
  wire                execute_MEMORY_AMO;
  wire                execute_MEMORY_LRSC;
  wire                execute_MEMORY_MANAGMENT;
  (* syn_keep , keep *) wire       [31:0]   execute_RS2 /* synthesis syn_keep = 1 */ ;
  wire                execute_MEMORY_WR;
  wire       [31:0]   execute_SRC_ADD;
  wire                execute_MEMORY_ENABLE;
  wire       [31:0]   execute_INSTRUCTION;
  wire                decode_MEMORY_ENABLE;
  wire                decode_FLUSH_ALL;
  reg                 _zz_51_;
  reg                 _zz_51__2;
  reg                 _zz_51__1;
  reg                 _zz_51__0;
  wire       `BranchCtrlEnum_defaultEncoding_type decode_BRANCH_CTRL;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_52_;
  reg        [31:0]   _zz_53_;
  reg        [31:0]   _zz_54_;
  wire       [31:0]   decode_PC;
  wire       [31:0]   decode_INSTRUCTION;
  wire       [31:0]   writeBack_PC;
  wire       [31:0]   writeBack_INSTRUCTION;
  reg                 decode_arbitration_haltItself;
  reg                 decode_arbitration_haltByOther;
  reg                 decode_arbitration_removeIt;
  wire                decode_arbitration_flushIt;
  reg                 decode_arbitration_flushNext;
  wire                decode_arbitration_isValid;
  wire                decode_arbitration_isStuck;
  wire                decode_arbitration_isStuckByOthers;
  wire                decode_arbitration_isFlushed;
  wire                decode_arbitration_isMoving;
  wire                decode_arbitration_isFiring;
  reg                 execute_arbitration_haltItself;
  wire                execute_arbitration_haltByOther;
  reg                 execute_arbitration_removeIt;
  wire                execute_arbitration_flushIt;
  wire                execute_arbitration_flushNext;
  reg                 execute_arbitration_isValid;
  wire                execute_arbitration_isStuck;
  wire                execute_arbitration_isStuckByOthers;
  wire                execute_arbitration_isFlushed;
  wire                execute_arbitration_isMoving;
  wire                execute_arbitration_isFiring;
  reg                 memory_arbitration_haltItself;
  wire                memory_arbitration_haltByOther;
  reg                 memory_arbitration_removeIt;
  wire                memory_arbitration_flushIt;
  reg                 memory_arbitration_flushNext;
  reg                 memory_arbitration_isValid;
  wire                memory_arbitration_isStuck;
  wire                memory_arbitration_isStuckByOthers;
  wire                memory_arbitration_isFlushed;
  wire                memory_arbitration_isMoving;
  wire                memory_arbitration_isFiring;
  reg                 writeBack_arbitration_haltItself;
  wire                writeBack_arbitration_haltByOther;
  reg                 writeBack_arbitration_removeIt;
  reg                 writeBack_arbitration_flushIt;
  reg                 writeBack_arbitration_flushNext;
  reg                 writeBack_arbitration_isValid;
  wire                writeBack_arbitration_isStuck;
  wire                writeBack_arbitration_isStuckByOthers;
  wire                writeBack_arbitration_isFlushed;
  wire                writeBack_arbitration_isMoving;
  wire                writeBack_arbitration_isFiring;
  wire       [31:0]   lastStageInstruction /* verilator public */ ;
  wire       [31:0]   lastStagePc /* verilator public */ ;
  wire                lastStageIsValid /* verilator public */ ;
  wire                lastStageIsFiring /* verilator public */ ;
  reg                 IBusCachedPlugin_fetcherHalt;
  reg                 IBusCachedPlugin_incomingInstruction;
  wire                IBusCachedPlugin_predictionJumpInterface_valid;
  (* syn_keep , keep *) wire       [31:0]   IBusCachedPlugin_predictionJumpInterface_payload /* synthesis syn_keep = 1 */ ;
  reg                 IBusCachedPlugin_decodePrediction_cmd_hadBranch;
  wire                IBusCachedPlugin_decodePrediction_rsp_wasWrong;
  wire                IBusCachedPlugin_pcValids_0;
  wire                IBusCachedPlugin_pcValids_1;
  wire                IBusCachedPlugin_pcValids_2;
  wire                IBusCachedPlugin_pcValids_3;
  reg                 IBusCachedPlugin_decodeExceptionPort_valid;
  reg        [3:0]    IBusCachedPlugin_decodeExceptionPort_payload_code;
  wire       [31:0]   IBusCachedPlugin_decodeExceptionPort_payload_badAddr;
  wire                IBusCachedPlugin_mmuBus_cmd_isValid;
  wire       [31:0]   IBusCachedPlugin_mmuBus_cmd_virtualAddress;
  wire                IBusCachedPlugin_mmuBus_cmd_bypassTranslation;
  wire       [31:0]   IBusCachedPlugin_mmuBus_rsp_physicalAddress;
  wire                IBusCachedPlugin_mmuBus_rsp_isIoAccess;
  wire                IBusCachedPlugin_mmuBus_rsp_allowRead;
  wire                IBusCachedPlugin_mmuBus_rsp_allowWrite;
  wire                IBusCachedPlugin_mmuBus_rsp_allowExecute;
  wire                IBusCachedPlugin_mmuBus_rsp_exception;
  wire                IBusCachedPlugin_mmuBus_rsp_refilling;
  wire                IBusCachedPlugin_mmuBus_end;
  wire                IBusCachedPlugin_mmuBus_busy;
  wire                DBusCachedPlugin_mmuBus_cmd_isValid;
  wire       [31:0]   DBusCachedPlugin_mmuBus_cmd_virtualAddress;
  wire                DBusCachedPlugin_mmuBus_cmd_bypassTranslation;
  wire       [31:0]   DBusCachedPlugin_mmuBus_rsp_physicalAddress;
  wire                DBusCachedPlugin_mmuBus_rsp_isIoAccess;
  wire                DBusCachedPlugin_mmuBus_rsp_allowRead;
  wire                DBusCachedPlugin_mmuBus_rsp_allowWrite;
  wire                DBusCachedPlugin_mmuBus_rsp_allowExecute;
  wire                DBusCachedPlugin_mmuBus_rsp_exception;
  wire                DBusCachedPlugin_mmuBus_rsp_refilling;
  wire                DBusCachedPlugin_mmuBus_end;
  wire                DBusCachedPlugin_mmuBus_busy;
  reg                 DBusCachedPlugin_redoBranch_valid;
  wire       [31:0]   DBusCachedPlugin_redoBranch_payload;
  reg                 DBusCachedPlugin_exceptionBus_valid;
  reg        [3:0]    DBusCachedPlugin_exceptionBus_payload_code;
  wire       [31:0]   DBusCachedPlugin_exceptionBus_payload_badAddr;
  wire                CsrPlugin_inWfi /* verilator public */ ;
  wire                CsrPlugin_thirdPartyWake;
  reg                 CsrPlugin_jumpInterface_valid;
  reg        [31:0]   CsrPlugin_jumpInterface_payload;
  wire                CsrPlugin_exceptionPendings_0;
  wire                CsrPlugin_exceptionPendings_1;
  wire                CsrPlugin_exceptionPendings_2;
  wire                CsrPlugin_exceptionPendings_3;
  wire                contextSwitching;
  reg        [1:0]    CsrPlugin_privilege;
  wire                CsrPlugin_forceMachineWire;
  wire                CsrPlugin_allowInterrupts;
  wire                CsrPlugin_allowException;
  wire                BranchPlugin_jumpInterface_valid;
  wire       [31:0]   BranchPlugin_jumpInterface_payload;
  wire                IBusCachedPlugin_externalFlush;
  wire                IBusCachedPlugin_jump_pcLoad_valid;
  wire       [31:0]   IBusCachedPlugin_jump_pcLoad_payload;
  wire       [3:0]    _zz_55_;
  wire       [3:0]    _zz_56_;
  wire                _zz_57_;
  wire                _zz_58_;
  wire                _zz_59_;
  wire                IBusCachedPlugin_fetchPc_output_valid;
  wire                IBusCachedPlugin_fetchPc_output_ready;
  wire       [31:0]   IBusCachedPlugin_fetchPc_output_payload;
  reg        [31:0]   IBusCachedPlugin_fetchPc_pcReg /* verilator public */ ;
  reg                 IBusCachedPlugin_fetchPc_correction;
  reg                 IBusCachedPlugin_fetchPc_correctionReg;
  wire                IBusCachedPlugin_fetchPc_corrected;
  reg                 IBusCachedPlugin_fetchPc_pcRegPropagate;
  reg                 IBusCachedPlugin_fetchPc_booted;
  reg                 IBusCachedPlugin_fetchPc_inc;
  reg        [31:0]   IBusCachedPlugin_fetchPc_pc;
  wire                IBusCachedPlugin_fetchPc_redo_valid;
  wire       [31:0]   IBusCachedPlugin_fetchPc_redo_payload;
  reg                 IBusCachedPlugin_fetchPc_flushed;
  reg                 IBusCachedPlugin_iBusRsp_redoFetch;
  wire                IBusCachedPlugin_iBusRsp_stages_0_input_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_0_input_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_0_input_payload;
  wire                IBusCachedPlugin_iBusRsp_stages_0_output_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_0_output_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_0_output_payload;
  wire                IBusCachedPlugin_iBusRsp_stages_0_halt;
  wire                IBusCachedPlugin_iBusRsp_stages_1_input_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_1_input_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_1_input_payload;
  wire                IBusCachedPlugin_iBusRsp_stages_1_output_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_1_output_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_1_output_payload;
  reg                 IBusCachedPlugin_iBusRsp_stages_1_halt;
  wire                IBusCachedPlugin_iBusRsp_stages_2_input_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_2_input_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_2_input_payload;
  wire                IBusCachedPlugin_iBusRsp_stages_2_output_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_2_output_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_2_output_payload;
  reg                 IBusCachedPlugin_iBusRsp_stages_2_halt;
  wire                IBusCachedPlugin_iBusRsp_stages_3_input_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_3_input_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_3_input_payload;
  wire                IBusCachedPlugin_iBusRsp_stages_3_output_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_3_output_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_3_output_payload;
  reg                 IBusCachedPlugin_iBusRsp_stages_3_halt;
  wire                _zz_60_;
  wire                _zz_61_;
  wire                _zz_62_;
  wire                _zz_63_;
  wire                IBusCachedPlugin_iBusRsp_flush;
  wire                _zz_64_;
  wire                _zz_65_;
  reg                 _zz_66_;
  wire                _zz_67_;
  reg                 _zz_68_;
  reg        [31:0]   _zz_69_;
  wire                _zz_70_;
  reg                 _zz_71_;
  reg        [31:0]   _zz_72_;
  reg                 IBusCachedPlugin_iBusRsp_readyForError;
  wire                IBusCachedPlugin_iBusRsp_output_valid;
  wire                IBusCachedPlugin_iBusRsp_output_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_output_payload_pc;
  wire                IBusCachedPlugin_iBusRsp_output_payload_rsp_error;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_output_payload_rsp_inst;
  wire                IBusCachedPlugin_iBusRsp_output_payload_isRvc;
  wire                IBusCachedPlugin_injector_decodeInput_valid;
  wire                IBusCachedPlugin_injector_decodeInput_ready;
  wire       [31:0]   IBusCachedPlugin_injector_decodeInput_payload_pc;
  wire                IBusCachedPlugin_injector_decodeInput_payload_rsp_error;
  wire       [31:0]   IBusCachedPlugin_injector_decodeInput_payload_rsp_inst;
  wire                IBusCachedPlugin_injector_decodeInput_payload_isRvc;
  reg                 _zz_73_;
  reg        [31:0]   _zz_74_;
  reg                 _zz_75_;
  reg        [31:0]   _zz_76_;
  reg                 _zz_77_;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_0;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_1;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_2;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_3;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_4;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_5;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_6;
  reg        [31:0]   IBusCachedPlugin_injector_formal_rawInDecode;
  wire                _zz_78_;
  reg        [18:0]   _zz_79_;
  wire                _zz_80_;
  reg        [10:0]   _zz_81_;
  wire                _zz_82_;
  reg        [18:0]   _zz_83_;
  reg                 _zz_84_;
  wire                _zz_85_;
  reg        [10:0]   _zz_86_;
  wire                _zz_87_;
  reg        [18:0]   _zz_88_;
  wire                iBus_cmd_valid;
  wire                iBus_cmd_ready;
  reg        [31:0]   iBus_cmd_payload_address;
  wire       [2:0]    iBus_cmd_payload_size;
  wire                iBus_rsp_valid;
  wire       [31:0]   iBus_rsp_payload_data;
  wire                iBus_rsp_payload_error;
  wire       [31:0]   _zz_89_;
  reg        [31:0]   IBusCachedPlugin_rspCounter;
  wire                IBusCachedPlugin_s0_tightlyCoupledHit;
  reg                 IBusCachedPlugin_s1_tightlyCoupledHit;
  reg                 IBusCachedPlugin_s2_tightlyCoupledHit;
  wire                IBusCachedPlugin_rsp_iBusRspOutputHalt;
  wire                IBusCachedPlugin_rsp_issueDetected;
  reg                 IBusCachedPlugin_rsp_redoFetch;
  wire                dBus_cmd_valid;
  wire                dBus_cmd_ready;
  wire                dBus_cmd_payload_wr;
  wire       [31:0]   dBus_cmd_payload_address;
  wire       [31:0]   dBus_cmd_payload_data;
  wire       [3:0]    dBus_cmd_payload_mask;
  wire       [2:0]    dBus_cmd_payload_length;
  wire                dBus_cmd_payload_last;
  wire                dBus_rsp_valid;
  wire       [31:0]   dBus_rsp_payload_data;
  wire                dBus_rsp_payload_error;
  wire                dataCache_1__io_mem_cmd_s2mPipe_valid;
  wire                dataCache_1__io_mem_cmd_s2mPipe_ready;
  wire                dataCache_1__io_mem_cmd_s2mPipe_payload_wr;
  wire       [31:0]   dataCache_1__io_mem_cmd_s2mPipe_payload_address;
  wire       [31:0]   dataCache_1__io_mem_cmd_s2mPipe_payload_data;
  wire       [3:0]    dataCache_1__io_mem_cmd_s2mPipe_payload_mask;
  wire       [2:0]    dataCache_1__io_mem_cmd_s2mPipe_payload_length;
  wire                dataCache_1__io_mem_cmd_s2mPipe_payload_last;
  reg                 dataCache_1__io_mem_cmd_s2mPipe_rValid;
  reg                 dataCache_1__io_mem_cmd_s2mPipe_rData_wr;
  reg        [31:0]   dataCache_1__io_mem_cmd_s2mPipe_rData_address;
  reg        [31:0]   dataCache_1__io_mem_cmd_s2mPipe_rData_data;
  reg        [3:0]    dataCache_1__io_mem_cmd_s2mPipe_rData_mask;
  reg        [2:0]    dataCache_1__io_mem_cmd_s2mPipe_rData_length;
  reg                 dataCache_1__io_mem_cmd_s2mPipe_rData_last;
  wire                dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_valid;
  wire                dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_ready;
  wire                dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_wr;
  wire       [31:0]   dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_address;
  wire       [31:0]   dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_data;
  wire       [3:0]    dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_mask;
  wire       [2:0]    dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_length;
  wire                dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_last;
  reg                 dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_rValid;
  reg                 dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_rData_wr;
  reg        [31:0]   dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_rData_address;
  reg        [31:0]   dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_rData_data;
  reg        [3:0]    dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_rData_mask;
  reg        [2:0]    dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_rData_length;
  reg                 dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_rData_last;
  reg                 dBus_rsp_regNext_valid;
  reg        [31:0]   dBus_rsp_regNext_payload_data;
  reg                 dBus_rsp_regNext_payload_error;
  wire       [31:0]   _zz_90_;
  reg        [31:0]   DBusCachedPlugin_rspCounter;
  wire       [1:0]    execute_DBusCachedPlugin_size;
  reg        [31:0]   _zz_91_;
  reg        [31:0]   writeBack_DBusCachedPlugin_rspShifted;
  wire                _zz_92_;
  reg        [31:0]   _zz_93_;
  wire                _zz_94_;
  reg        [31:0]   _zz_95_;
  reg        [31:0]   writeBack_DBusCachedPlugin_rspFormated;
  wire       [1:0]    CsrPlugin_misa_base;
  wire       [25:0]   CsrPlugin_misa_extensions;
  reg        [1:0]    CsrPlugin_mtvec_mode;
  reg        [29:0]   CsrPlugin_mtvec_base;
  reg        [31:0]   CsrPlugin_mepc;
  reg                 CsrPlugin_mstatus_MIE;
  reg                 CsrPlugin_mstatus_MPIE;
  reg        [1:0]    CsrPlugin_mstatus_MPP;
  reg                 CsrPlugin_mip_MEIP;
  reg                 CsrPlugin_mip_MTIP;
  reg                 CsrPlugin_mip_MSIP;
  reg                 CsrPlugin_mie_MEIE;
  reg                 CsrPlugin_mie_MTIE;
  reg                 CsrPlugin_mie_MSIE;
  reg                 CsrPlugin_mcause_interrupt;
  reg        [3:0]    CsrPlugin_mcause_exceptionCode;
  reg        [31:0]   CsrPlugin_mtval;
  reg        [63:0]   CsrPlugin_mcycle = 64'b0000000000000000000000000000000000000000000000000000000000000000;
  reg        [63:0]   CsrPlugin_minstret = 64'b0000000000000000000000000000000000000000000000000000000000000000;
  wire                _zz_96_;
  wire                _zz_97_;
  wire                _zz_98_;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_decode;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_execute;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_memory;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
  reg        [3:0]    CsrPlugin_exceptionPortCtrl_exceptionContext_code;
  reg        [31:0]   CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr;
  wire       [1:0]    CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped;
  wire       [1:0]    CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege;
  reg                 CsrPlugin_interrupt_valid;
  reg        [3:0]    CsrPlugin_interrupt_code /* verilator public */ ;
  reg        [1:0]    CsrPlugin_interrupt_targetPrivilege;
  wire                CsrPlugin_exception;
  wire                CsrPlugin_lastStageWasWfi;
  reg                 CsrPlugin_pipelineLiberator_pcValids_0;
  reg                 CsrPlugin_pipelineLiberator_pcValids_1;
  reg                 CsrPlugin_pipelineLiberator_pcValids_2;
  wire                CsrPlugin_pipelineLiberator_active;
  reg                 CsrPlugin_pipelineLiberator_done;
  wire                CsrPlugin_interruptJump /* verilator public */ ;
  reg                 CsrPlugin_hadException;
  reg        [1:0]    CsrPlugin_targetPrivilege;
  reg        [3:0]    CsrPlugin_trapCause;
  reg        [1:0]    CsrPlugin_xtvec_mode;
  reg        [29:0]   CsrPlugin_xtvec_base;
  reg                 execute_CsrPlugin_wfiWake;
  wire                execute_CsrPlugin_blockedBySideEffects;
  reg                 execute_CsrPlugin_illegalAccess;
  reg                 execute_CsrPlugin_illegalInstruction;
  wire       [31:0]   execute_CsrPlugin_readData;
  reg                 execute_CsrPlugin_writeInstruction;
  reg                 execute_CsrPlugin_readInstruction;
  wire                execute_CsrPlugin_writeEnable;
  wire                execute_CsrPlugin_readEnable;
  wire       [31:0]   execute_CsrPlugin_readToWriteData;
  reg        [31:0]   execute_CsrPlugin_writeData;
  wire       [11:0]   execute_CsrPlugin_csrAddress;
  wire       [32:0]   _zz_99_;
  wire                _zz_100_;
  wire                _zz_101_;
  wire                _zz_102_;
  wire                _zz_103_;
  wire                _zz_104_;
  wire                _zz_105_;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_106_;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_107_;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_108_;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_109_;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_110_;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_111_;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_112_;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress1;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress2;
  wire       [31:0]   decode_RegFilePlugin_rs1Data;
  wire       [31:0]   decode_RegFilePlugin_rs2Data;
  reg                 lastStageRegFileWrite_valid /* verilator public */ ;
  wire       [4:0]    lastStageRegFileWrite_payload_address /* verilator public */ ;
  wire       [31:0]   lastStageRegFileWrite_payload_data /* verilator public */ ;
  reg                 _zz_113_;
  reg        [31:0]   execute_IntAluPlugin_bitwise;
  reg        [31:0]   _zz_114_;
  reg        [31:0]   _zz_115_;
  wire                _zz_116_;
  reg        [19:0]   _zz_117_;
  wire                _zz_118_;
  reg        [19:0]   _zz_119_;
  reg        [31:0]   _zz_120_;
  reg        [31:0]   execute_SrcPlugin_addSub;
  wire                execute_SrcPlugin_less;
  wire       [4:0]    execute_FullBarrelShifterPlugin_amplitude;
  reg        [31:0]   _zz_121_;
  wire       [31:0]   execute_FullBarrelShifterPlugin_reversed;
  reg        [31:0]   _zz_122_;
  reg                 execute_MulPlugin_aSigned;
  reg                 execute_MulPlugin_bSigned;
  wire       [31:0]   execute_MulPlugin_a;
  wire       [31:0]   execute_MulPlugin_b;
  wire       [15:0]   execute_MulPlugin_aULow;
  wire       [15:0]   execute_MulPlugin_bULow;
  wire       [16:0]   execute_MulPlugin_aSLow;
  wire       [16:0]   execute_MulPlugin_bSLow;
  wire       [16:0]   execute_MulPlugin_aHigh;
  wire       [16:0]   execute_MulPlugin_bHigh;
  wire       [65:0]   writeBack_MulPlugin_result;
  reg        [32:0]   memory_MulDivIterativePlugin_rs1;
  reg        [31:0]   memory_MulDivIterativePlugin_rs2;
  reg        [64:0]   memory_MulDivIterativePlugin_accumulator;
  wire                memory_MulDivIterativePlugin_frontendOk;
  reg                 memory_MulDivIterativePlugin_div_needRevert;
  reg                 memory_MulDivIterativePlugin_div_counter_willIncrement;
  reg                 memory_MulDivIterativePlugin_div_counter_willClear;
  reg        [5:0]    memory_MulDivIterativePlugin_div_counter_valueNext;
  reg        [5:0]    memory_MulDivIterativePlugin_div_counter_value;
  wire                memory_MulDivIterativePlugin_div_counter_willOverflowIfInc;
  wire                memory_MulDivIterativePlugin_div_counter_willOverflow;
  reg                 memory_MulDivIterativePlugin_div_done;
  reg        [31:0]   memory_MulDivIterativePlugin_div_result;
  wire       [31:0]   _zz_123_;
  wire       [32:0]   memory_MulDivIterativePlugin_div_stage_0_remainderShifted;
  wire       [32:0]   memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator;
  wire       [31:0]   memory_MulDivIterativePlugin_div_stage_0_outRemainder;
  wire       [31:0]   memory_MulDivIterativePlugin_div_stage_0_outNumerator;
  wire       [31:0]   _zz_124_;
  wire                _zz_125_;
  wire                _zz_126_;
  reg        [32:0]   _zz_127_;
  reg                 _zz_128_;
  reg                 _zz_129_;
  reg                 _zz_130_;
  reg        [4:0]    _zz_131_;
  reg        [31:0]   _zz_132_;
  wire                _zz_133_;
  wire                _zz_134_;
  wire                _zz_135_;
  wire                _zz_136_;
  wire                _zz_137_;
  wire                _zz_138_;
  wire                execute_BranchPlugin_eq;
  wire       [2:0]    _zz_139_;
  reg                 _zz_140_;
  reg                 _zz_141_;
  wire                _zz_142_;
  reg        [19:0]   _zz_143_;
  wire                _zz_144_;
  reg        [10:0]   _zz_145_;
  wire                _zz_146_;
  reg        [18:0]   _zz_147_;
  reg                 _zz_148_;
  wire                execute_BranchPlugin_missAlignedTarget;
  reg        [31:0]   execute_BranchPlugin_branch_src1;
  reg        [31:0]   execute_BranchPlugin_branch_src2;
  wire                _zz_149_;
  reg        [19:0]   _zz_150_;
  wire                _zz_151_;
  reg        [10:0]   _zz_152_;
  wire                _zz_153_;
  reg        [18:0]   _zz_154_;
  wire       [31:0]   execute_BranchPlugin_branchAdder;
  reg                 decode_to_execute_MEMORY_AMO;
  reg                 decode_to_execute_MEMORY_LRSC;
  reg        [33:0]   execute_to_memory_MUL_HL;
  reg        [1:0]    execute_to_memory_MEMORY_ADDRESS_LOW;
  reg        [1:0]    memory_to_writeBack_MEMORY_ADDRESS_LOW;
  reg                 decode_to_execute_SRC2_FORCE_ZERO;
  reg                 execute_to_memory_BRANCH_DO;
  reg        [31:0]   execute_to_memory_MUL_LL;
  reg                 decode_to_execute_IS_MUL;
  reg                 execute_to_memory_IS_MUL;
  reg                 memory_to_writeBack_IS_MUL;
  reg        `ShiftCtrlEnum_defaultEncoding_type decode_to_execute_SHIFT_CTRL;
  reg        `ShiftCtrlEnum_defaultEncoding_type execute_to_memory_SHIFT_CTRL;
  reg                 decode_to_execute_IS_CSR;
  reg                 decode_to_execute_MEMORY_MANAGMENT;
  reg                 decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  reg        [31:0]   decode_to_execute_INSTRUCTION;
  reg        [31:0]   execute_to_memory_INSTRUCTION;
  reg        [31:0]   memory_to_writeBack_INSTRUCTION;
  reg        [31:0]   decode_to_execute_FORMAL_PC_NEXT;
  reg        [31:0]   execute_to_memory_FORMAL_PC_NEXT;
  reg        [31:0]   memory_to_writeBack_FORMAL_PC_NEXT;
  reg        [31:0]   decode_to_execute_RS1;
  reg        [51:0]   memory_to_writeBack_MUL_LOW;
  reg        [31:0]   decode_to_execute_PC;
  reg        [31:0]   execute_to_memory_PC;
  reg        [31:0]   memory_to_writeBack_PC;
  reg                 decode_to_execute_IS_RS1_SIGNED;
  reg        `Src1CtrlEnum_defaultEncoding_type decode_to_execute_SRC1_CTRL;
  reg        `AluCtrlEnum_defaultEncoding_type decode_to_execute_ALU_CTRL;
  reg        [31:0]   execute_to_memory_SHIFT_RIGHT;
  reg        [33:0]   execute_to_memory_MUL_LH;
  reg                 decode_to_execute_IS_DIV;
  reg                 execute_to_memory_IS_DIV;
  reg                 decode_to_execute_SRC_USE_SUB_LESS;
  reg                 decode_to_execute_MEMORY_ENABLE;
  reg                 execute_to_memory_MEMORY_ENABLE;
  reg                 memory_to_writeBack_MEMORY_ENABLE;
  reg        [31:0]   execute_to_memory_REGFILE_WRITE_DATA;
  reg        [31:0]   memory_to_writeBack_REGFILE_WRITE_DATA;
  reg                 decode_to_execute_IS_RS2_SIGNED;
  reg                 decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  reg                 execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  reg                 decode_to_execute_REGFILE_WRITE_VALID;
  reg                 execute_to_memory_REGFILE_WRITE_VALID;
  reg                 memory_to_writeBack_REGFILE_WRITE_VALID;
  reg        [31:0]   decode_to_execute_RS2;
  reg                 decode_to_execute_PREDICTION_HAD_BRANCHED2;
  reg        [31:0]   execute_to_memory_BRANCH_CALC;
  reg        `BranchCtrlEnum_defaultEncoding_type decode_to_execute_BRANCH_CTRL;
  reg        `AluBitwiseCtrlEnum_defaultEncoding_type decode_to_execute_ALU_BITWISE_CTRL;
  reg        [33:0]   execute_to_memory_MUL_HH;
  reg        [33:0]   memory_to_writeBack_MUL_HH;
  reg        `EnvCtrlEnum_defaultEncoding_type decode_to_execute_ENV_CTRL;
  reg        `EnvCtrlEnum_defaultEncoding_type execute_to_memory_ENV_CTRL;
  reg        `EnvCtrlEnum_defaultEncoding_type memory_to_writeBack_ENV_CTRL;
  reg                 decode_to_execute_SRC_LESS_UNSIGNED;
  reg                 decode_to_execute_MEMORY_WR;
  reg                 execute_to_memory_MEMORY_WR;
  reg                 memory_to_writeBack_MEMORY_WR;
  reg                 decode_to_execute_CSR_WRITE_OPCODE;
  reg                 decode_to_execute_CSR_READ_OPCODE;
  reg        `Src2CtrlEnum_defaultEncoding_type decode_to_execute_SRC2_CTRL;
  reg                 execute_CsrPlugin_csr_768;
  reg                 execute_CsrPlugin_csr_836;
  reg                 execute_CsrPlugin_csr_772;
  reg                 execute_CsrPlugin_csr_773;
  reg                 execute_CsrPlugin_csr_834;
  reg                 execute_CsrPlugin_csr_2816;
  reg                 execute_CsrPlugin_csr_2944;
  reg                 execute_CsrPlugin_csr_3072;
  reg                 execute_CsrPlugin_csr_3200;
  reg        [31:0]   _zz_155_;
  reg        [31:0]   _zz_156_;
  reg        [31:0]   _zz_157_;
  reg        [31:0]   _zz_158_;
  reg        [31:0]   _zz_159_;
  reg        [31:0]   _zz_160_;
  reg        [31:0]   _zz_161_;
  reg        [31:0]   _zz_162_;
  reg        [31:0]   _zz_163_;
  wire                dBus_cmd_m2sPipe_valid;
  wire                dBus_cmd_m2sPipe_ready;
  wire                dBus_cmd_m2sPipe_payload_wr;
  wire       [31:0]   dBus_cmd_m2sPipe_payload_address;
  wire       [31:0]   dBus_cmd_m2sPipe_payload_data;
  wire       [3:0]    dBus_cmd_m2sPipe_payload_mask;
  wire       [2:0]    dBus_cmd_m2sPipe_payload_length;
  wire                dBus_cmd_m2sPipe_payload_last;
  reg                 dBus_cmd_m2sPipe_rValid;
  reg                 dBus_cmd_m2sPipe_rData_wr;
  reg        [31:0]   dBus_cmd_m2sPipe_rData_address;
  reg        [31:0]   dBus_cmd_m2sPipe_rData_data;
  reg        [3:0]    dBus_cmd_m2sPipe_rData_mask;
  reg        [2:0]    dBus_cmd_m2sPipe_rData_length;
  reg                 dBus_cmd_m2sPipe_rData_last;
  wire                dBus_cmd_m2sPipe_m2sPipe_valid;
  wire                dBus_cmd_m2sPipe_m2sPipe_ready;
  wire                dBus_cmd_m2sPipe_m2sPipe_payload_wr;
  wire       [31:0]   dBus_cmd_m2sPipe_m2sPipe_payload_address;
  wire       [31:0]   dBus_cmd_m2sPipe_m2sPipe_payload_data;
  wire       [3:0]    dBus_cmd_m2sPipe_m2sPipe_payload_mask;
  wire       [2:0]    dBus_cmd_m2sPipe_m2sPipe_payload_length;
  wire                dBus_cmd_m2sPipe_m2sPipe_payload_last;
  reg                 dBus_cmd_m2sPipe_m2sPipe_rValid;
  reg                 dBus_cmd_m2sPipe_m2sPipe_rData_wr;
  reg        [31:0]   dBus_cmd_m2sPipe_m2sPipe_rData_address;
  reg        [31:0]   dBus_cmd_m2sPipe_m2sPipe_rData_data;
  reg        [3:0]    dBus_cmd_m2sPipe_m2sPipe_rData_mask;
  reg        [2:0]    dBus_cmd_m2sPipe_m2sPipe_rData_length;
  reg                 dBus_cmd_m2sPipe_m2sPipe_rData_last;
  wire                dBus_cmd_m2sPipe_m2sPipe_s2mPipe_valid;
  wire                dBus_cmd_m2sPipe_m2sPipe_s2mPipe_ready;
  wire                dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_wr;
  wire       [31:0]   dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_address;
  wire       [31:0]   dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_data;
  wire       [3:0]    dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_mask;
  wire       [2:0]    dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_length;
  wire                dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_last;
  reg                 dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rValid;
  reg                 dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rData_wr;
  reg        [31:0]   dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rData_address;
  reg        [31:0]   dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rData_data;
  reg        [3:0]    dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rData_mask;
  reg        [2:0]    dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rData_length;
  reg                 dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rData_last;
  reg                 _zz_164_;
  reg                 _zz_165_;
  reg        [2:0]    _zz_166_;
  reg        [2:0]    _zz_167_;
  wire                _zz_168_;
  reg                 _zz_169_;
  reg                 streamFork_1__io_outputs_0_thrown_valid;
  wire                streamFork_1__io_outputs_0_thrown_ready;
  wire                streamFork_1__io_outputs_0_thrown_payload_wr;
  wire       [31:0]   streamFork_1__io_outputs_0_thrown_payload_address;
  wire       [31:0]   streamFork_1__io_outputs_0_thrown_payload_data;
  wire       [3:0]    streamFork_1__io_outputs_0_thrown_payload_mask;
  wire       [2:0]    streamFork_1__io_outputs_0_thrown_payload_length;
  wire                streamFork_1__io_outputs_0_thrown_payload_last;
  reg                 streamFork_1__io_outputs_1_thrown_valid;
  wire                streamFork_1__io_outputs_1_thrown_ready;
  wire                streamFork_1__io_outputs_1_thrown_payload_wr;
  wire       [31:0]   streamFork_1__io_outputs_1_thrown_payload_address;
  wire       [31:0]   streamFork_1__io_outputs_1_thrown_payload_data;
  wire       [3:0]    streamFork_1__io_outputs_1_thrown_payload_mask;
  wire       [2:0]    streamFork_1__io_outputs_1_thrown_payload_length;
  wire                streamFork_1__io_outputs_1_thrown_payload_last;
  wire                _zz_170_;
  wire       [31:0]   _zz_171_;
  wire       [7:0]    _zz_172_;
  wire                _zz_173_;
  wire       [0:0]    _zz_174_;
  wire       [3:0]    _zz_175_;
  wire       [0:0]    _zz_176_;
  wire       [3:0]    _zz_177_;
  `ifndef SYNTHESIS
  reg [23:0] decode_SRC2_CTRL_string;
  reg [23:0] _zz_1__string;
  reg [23:0] _zz_2__string;
  reg [23:0] _zz_3__string;
  reg [31:0] _zz_4__string;
  reg [31:0] _zz_5__string;
  reg [31:0] _zz_6__string;
  reg [31:0] _zz_7__string;
  reg [31:0] decode_ENV_CTRL_string;
  reg [31:0] _zz_8__string;
  reg [31:0] _zz_9__string;
  reg [31:0] _zz_10__string;
  reg [39:0] decode_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_11__string;
  reg [39:0] _zz_12__string;
  reg [39:0] _zz_13__string;
  reg [31:0] _zz_14__string;
  reg [31:0] _zz_15__string;
  reg [63:0] decode_ALU_CTRL_string;
  reg [63:0] _zz_16__string;
  reg [63:0] _zz_17__string;
  reg [63:0] _zz_18__string;
  reg [95:0] decode_SRC1_CTRL_string;
  reg [95:0] _zz_19__string;
  reg [95:0] _zz_20__string;
  reg [95:0] _zz_21__string;
  reg [71:0] _zz_22__string;
  reg [71:0] _zz_23__string;
  reg [71:0] decode_SHIFT_CTRL_string;
  reg [71:0] _zz_24__string;
  reg [71:0] _zz_25__string;
  reg [71:0] _zz_26__string;
  reg [31:0] execute_BRANCH_CTRL_string;
  reg [31:0] _zz_27__string;
  reg [71:0] memory_SHIFT_CTRL_string;
  reg [71:0] _zz_29__string;
  reg [71:0] execute_SHIFT_CTRL_string;
  reg [71:0] _zz_30__string;
  reg [23:0] execute_SRC2_CTRL_string;
  reg [23:0] _zz_32__string;
  reg [95:0] execute_SRC1_CTRL_string;
  reg [95:0] _zz_33__string;
  reg [63:0] execute_ALU_CTRL_string;
  reg [63:0] _zz_34__string;
  reg [39:0] execute_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_35__string;
  reg [31:0] _zz_39__string;
  reg [31:0] _zz_40__string;
  reg [95:0] _zz_41__string;
  reg [63:0] _zz_42__string;
  reg [71:0] _zz_43__string;
  reg [23:0] _zz_44__string;
  reg [39:0] _zz_45__string;
  reg [31:0] memory_ENV_CTRL_string;
  reg [31:0] _zz_47__string;
  reg [31:0] execute_ENV_CTRL_string;
  reg [31:0] _zz_48__string;
  reg [31:0] writeBack_ENV_CTRL_string;
  reg [31:0] _zz_49__string;
  reg [31:0] decode_BRANCH_CTRL_string;
  reg [31:0] _zz_52__string;
  reg [39:0] _zz_106__string;
  reg [23:0] _zz_107__string;
  reg [71:0] _zz_108__string;
  reg [63:0] _zz_109__string;
  reg [95:0] _zz_110__string;
  reg [31:0] _zz_111__string;
  reg [31:0] _zz_112__string;
  reg [71:0] decode_to_execute_SHIFT_CTRL_string;
  reg [71:0] execute_to_memory_SHIFT_CTRL_string;
  reg [95:0] decode_to_execute_SRC1_CTRL_string;
  reg [63:0] decode_to_execute_ALU_CTRL_string;
  reg [31:0] decode_to_execute_BRANCH_CTRL_string;
  reg [39:0] decode_to_execute_ALU_BITWISE_CTRL_string;
  reg [31:0] decode_to_execute_ENV_CTRL_string;
  reg [31:0] execute_to_memory_ENV_CTRL_string;
  reg [31:0] memory_to_writeBack_ENV_CTRL_string;
  reg [23:0] decode_to_execute_SRC2_CTRL_string;
  `endif

  reg [31:0] RegFilePlugin_regFile [0:31] /* verilator public */ ;

  assign _zz_205_ = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign _zz_206_ = 1'b1;
  assign _zz_207_ = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign _zz_208_ = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign _zz_209_ = (memory_arbitration_isValid && memory_IS_DIV);
  assign _zz_210_ = (execute_arbitration_isValid && execute_IS_CSR);
  assign _zz_211_ = ((_zz_182_ && IBusCachedPlugin_cache_io_cpu_decode_error) && (! _zz_51__2));
  assign _zz_212_ = ((_zz_182_ && IBusCachedPlugin_cache_io_cpu_decode_cacheMiss) && (! _zz_51__1));
  assign _zz_213_ = ((_zz_182_ && IBusCachedPlugin_cache_io_cpu_decode_mmuException) && (! _zz_51__0));
  assign _zz_214_ = ((_zz_182_ && IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling) && (! IBusCachedPlugin_rsp_issueDetected));
  assign _zz_215_ = (CsrPlugin_hadException || CsrPlugin_interruptJump);
  assign _zz_216_ = (writeBack_arbitration_isValid && (writeBack_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET));
  assign _zz_217_ = writeBack_INSTRUCTION[29 : 28];
  assign _zz_218_ = (writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE);
  assign _zz_219_ = (CsrPlugin_privilege < execute_CsrPlugin_csrAddress[9 : 8]);
  assign _zz_220_ = execute_INSTRUCTION[13 : 12];
  assign _zz_221_ = (memory_MulDivIterativePlugin_frontendOk && (! memory_MulDivIterativePlugin_div_done));
  assign _zz_222_ = (! memory_arbitration_isStuck);
  assign _zz_223_ = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign _zz_224_ = (1'b0 || (! 1'b1));
  assign _zz_225_ = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign _zz_226_ = (1'b0 || (! memory_BYPASSABLE_MEMORY_STAGE));
  assign _zz_227_ = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign _zz_228_ = (1'b0 || (! execute_BYPASSABLE_EXECUTE_STAGE));
  assign _zz_229_ = (! streamFork_1__io_outputs_1_payload_wr);
  assign _zz_230_ = (_zz_198_ && (! dataCache_1__io_mem_cmd_s2mPipe_ready));
  assign _zz_231_ = (CsrPlugin_mstatus_MIE || (CsrPlugin_privilege < (2'b11)));
  assign _zz_232_ = ((_zz_96_ && 1'b1) && (! 1'b0));
  assign _zz_233_ = ((_zz_97_ && 1'b1) && (! 1'b0));
  assign _zz_234_ = ((_zz_98_ && 1'b1) && (! 1'b0));
  assign _zz_235_ = (dBus_cmd_m2sPipe_m2sPipe_ready && (! dBus_cmd_m2sPipe_m2sPipe_s2mPipe_ready));
  assign _zz_236_ = writeBack_INSTRUCTION[13 : 12];
  assign _zz_237_ = execute_INSTRUCTION[13];
  assign _zz_238_ = writeBack_INSTRUCTION[13 : 12];
  assign _zz_239_ = _zz_99_[28 : 28];
  assign _zz_240_ = _zz_99_[21 : 21];
  assign _zz_241_ = _zz_99_[0 : 0];
  assign _zz_242_ = _zz_99_[19 : 19];
  assign _zz_243_ = _zz_99_[5 : 5];
  assign _zz_244_ = ($signed(_zz_246_) >>> execute_FullBarrelShifterPlugin_amplitude);
  assign _zz_245_ = _zz_244_[31 : 0];
  assign _zz_246_ = {((execute_SHIFT_CTRL == `ShiftCtrlEnum_defaultEncoding_SRA_1) && execute_FullBarrelShifterPlugin_reversed[31]),execute_FullBarrelShifterPlugin_reversed};
  assign _zz_247_ = _zz_99_[1 : 1];
  assign _zz_248_ = ($signed(_zz_249_) + $signed(_zz_254_));
  assign _zz_249_ = ($signed(_zz_250_) + $signed(_zz_252_));
  assign _zz_250_ = 52'h0;
  assign _zz_251_ = {1'b0,memory_MUL_LL};
  assign _zz_252_ = {{19{_zz_251_[32]}}, _zz_251_};
  assign _zz_253_ = ({16'd0,memory_MUL_LH} <<< 16);
  assign _zz_254_ = {{2{_zz_253_[49]}}, _zz_253_};
  assign _zz_255_ = ({16'd0,memory_MUL_HL} <<< 16);
  assign _zz_256_ = {{2{_zz_255_[49]}}, _zz_255_};
  assign _zz_257_ = _zz_99_[13 : 13];
  assign _zz_258_ = _zz_99_[22 : 22];
  assign _zz_259_ = _zz_99_[20 : 20];
  assign _zz_260_ = _zz_99_[27 : 27];
  assign _zz_261_ = _zz_99_[30 : 30];
  assign _zz_262_ = _zz_99_[6 : 6];
  assign _zz_263_ = _zz_99_[4 : 4];
  assign _zz_264_ = _zz_99_[18 : 18];
  assign _zz_265_ = _zz_99_[12 : 12];
  assign _zz_266_ = _zz_99_[10 : 10];
  assign _zz_267_ = _zz_99_[26 : 26];
  assign _zz_268_ = _zz_99_[11 : 11];
  assign _zz_269_ = _zz_99_[29 : 29];
  assign _zz_270_ = (_zz_55_ - (4'b0001));
  assign _zz_271_ = {IBusCachedPlugin_fetchPc_inc,(2'b00)};
  assign _zz_272_ = {29'd0, _zz_271_};
  assign _zz_273_ = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_274_ = {{_zz_79_,{{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0};
  assign _zz_275_ = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]};
  assign _zz_276_ = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_277_ = {{_zz_81_,{{{decode_INSTRUCTION[31],decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]}},1'b0};
  assign _zz_278_ = {{_zz_83_,{{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0};
  assign _zz_279_ = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]};
  assign _zz_280_ = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_281_ = (writeBack_MEMORY_WR ? (3'b111) : (3'b101));
  assign _zz_282_ = (writeBack_MEMORY_WR ? (3'b110) : (3'b100));
  assign _zz_283_ = execute_SRC_LESS;
  assign _zz_284_ = (3'b100);
  assign _zz_285_ = execute_INSTRUCTION[19 : 15];
  assign _zz_286_ = execute_INSTRUCTION[31 : 20];
  assign _zz_287_ = {execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]};
  assign _zz_288_ = ($signed(_zz_289_) + $signed(_zz_292_));
  assign _zz_289_ = ($signed(_zz_290_) + $signed(_zz_291_));
  assign _zz_290_ = execute_SRC1;
  assign _zz_291_ = (execute_SRC_USE_SUB_LESS ? (~ execute_SRC2) : execute_SRC2);
  assign _zz_292_ = (execute_SRC_USE_SUB_LESS ? _zz_293_ : _zz_294_);
  assign _zz_293_ = 32'h00000001;
  assign _zz_294_ = 32'h0;
  assign _zz_295_ = {{14{writeBack_MUL_LOW[51]}}, writeBack_MUL_LOW};
  assign _zz_296_ = ({32'd0,writeBack_MUL_HH} <<< 32);
  assign _zz_297_ = writeBack_MUL_LOW[31 : 0];
  assign _zz_298_ = writeBack_MulPlugin_result[63 : 32];
  assign _zz_299_ = memory_MulDivIterativePlugin_div_counter_willIncrement;
  assign _zz_300_ = {5'd0, _zz_299_};
  assign _zz_301_ = {1'd0, memory_MulDivIterativePlugin_rs2};
  assign _zz_302_ = memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator[31:0];
  assign _zz_303_ = memory_MulDivIterativePlugin_div_stage_0_remainderShifted[31:0];
  assign _zz_304_ = {_zz_123_,(! memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator[32])};
  assign _zz_305_ = _zz_306_;
  assign _zz_306_ = _zz_307_;
  assign _zz_307_ = ({1'b0,(memory_MulDivIterativePlugin_div_needRevert ? (~ _zz_124_) : _zz_124_)} + _zz_309_);
  assign _zz_308_ = memory_MulDivIterativePlugin_div_needRevert;
  assign _zz_309_ = {32'd0, _zz_308_};
  assign _zz_310_ = _zz_126_;
  assign _zz_311_ = {32'd0, _zz_310_};
  assign _zz_312_ = _zz_125_;
  assign _zz_313_ = {31'd0, _zz_312_};
  assign _zz_314_ = execute_INSTRUCTION[31 : 20];
  assign _zz_315_ = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz_316_ = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_317_ = {_zz_143_,execute_INSTRUCTION[31 : 20]};
  assign _zz_318_ = {{_zz_145_,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0};
  assign _zz_319_ = {{_zz_147_,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0};
  assign _zz_320_ = execute_INSTRUCTION[31 : 20];
  assign _zz_321_ = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz_322_ = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_323_ = (3'b100);
  assign _zz_324_ = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_325_ = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_326_ = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_327_ = execute_CsrPlugin_writeData[11 : 11];
  assign _zz_328_ = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_329_ = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_330_ = 1'b1;
  assign _zz_331_ = 1'b1;
  assign _zz_332_ = {_zz_59_,_zz_58_};
  assign _zz_333_ = decode_INSTRUCTION[31];
  assign _zz_334_ = decode_INSTRUCTION[31];
  assign _zz_335_ = decode_INSTRUCTION[7];
  assign _zz_336_ = (decode_INSTRUCTION & 32'h0000001c);
  assign _zz_337_ = 32'h00000004;
  assign _zz_338_ = (decode_INSTRUCTION & 32'h00000058);
  assign _zz_339_ = 32'h00000040;
  assign _zz_340_ = ((decode_INSTRUCTION & 32'h10000008) == 32'h10000008);
  assign _zz_341_ = ((decode_INSTRUCTION & 32'h00005048) == 32'h00001008);
  assign _zz_342_ = (1'b0);
  assign _zz_343_ = ({(_zz_346_ == _zz_347_),{_zz_348_,_zz_349_}} != (3'b000));
  assign _zz_344_ = ((_zz_350_ == _zz_351_) != (1'b0));
  assign _zz_345_ = {({_zz_352_,_zz_353_} != 7'h0),{(_zz_354_ != _zz_355_),{_zz_356_,{_zz_357_,_zz_358_}}}};
  assign _zz_346_ = (decode_INSTRUCTION & 32'h08000020);
  assign _zz_347_ = 32'h08000020;
  assign _zz_348_ = ((decode_INSTRUCTION & 32'h10000020) == 32'h00000020);
  assign _zz_349_ = ((decode_INSTRUCTION & 32'h00000028) == 32'h00000020);
  assign _zz_350_ = (decode_INSTRUCTION & 32'h02004074);
  assign _zz_351_ = 32'h02000030;
  assign _zz_352_ = _zz_105_;
  assign _zz_353_ = {(_zz_359_ == _zz_360_),{_zz_361_,{_zz_362_,_zz_363_}}};
  assign _zz_354_ = ((decode_INSTRUCTION & _zz_364_) == 32'h00000050);
  assign _zz_355_ = (1'b0);
  assign _zz_356_ = ({_zz_105_,{_zz_365_,_zz_366_}} != (3'b000));
  assign _zz_357_ = ({_zz_367_,_zz_368_} != (2'b00));
  assign _zz_358_ = {(_zz_369_ != _zz_370_),{_zz_371_,{_zz_372_,_zz_373_}}};
  assign _zz_359_ = (decode_INSTRUCTION & 32'h00001010);
  assign _zz_360_ = 32'h00001010;
  assign _zz_361_ = ((decode_INSTRUCTION & _zz_374_) == 32'h00002010);
  assign _zz_362_ = (_zz_375_ == _zz_376_);
  assign _zz_363_ = {_zz_377_,{_zz_378_,_zz_379_}};
  assign _zz_364_ = 32'h00003050;
  assign _zz_365_ = _zz_104_;
  assign _zz_366_ = (_zz_380_ == _zz_381_);
  assign _zz_367_ = _zz_104_;
  assign _zz_368_ = (_zz_382_ == _zz_383_);
  assign _zz_369_ = (_zz_384_ == _zz_385_);
  assign _zz_370_ = (1'b0);
  assign _zz_371_ = ({_zz_386_,_zz_387_} != (2'b00));
  assign _zz_372_ = (_zz_388_ != _zz_389_);
  assign _zz_373_ = {_zz_390_,{_zz_391_,_zz_392_}};
  assign _zz_374_ = 32'h00002010;
  assign _zz_375_ = (decode_INSTRUCTION & 32'h00002008);
  assign _zz_376_ = 32'h00002008;
  assign _zz_377_ = ((decode_INSTRUCTION & _zz_393_) == 32'h00000010);
  assign _zz_378_ = _zz_100_;
  assign _zz_379_ = (_zz_394_ == _zz_395_);
  assign _zz_380_ = (decode_INSTRUCTION & 32'h00002014);
  assign _zz_381_ = 32'h00000004;
  assign _zz_382_ = (decode_INSTRUCTION & 32'h0000004c);
  assign _zz_383_ = 32'h00000004;
  assign _zz_384_ = (decode_INSTRUCTION & 32'h00004048);
  assign _zz_385_ = 32'h00004008;
  assign _zz_386_ = (_zz_396_ == _zz_397_);
  assign _zz_387_ = (_zz_398_ == _zz_399_);
  assign _zz_388_ = {_zz_400_,_zz_401_};
  assign _zz_389_ = (2'b00);
  assign _zz_390_ = (_zz_101_ != (1'b0));
  assign _zz_391_ = (_zz_402_ != _zz_403_);
  assign _zz_392_ = {_zz_404_,{_zz_405_,_zz_406_}};
  assign _zz_393_ = 32'h00000050;
  assign _zz_394_ = (decode_INSTRUCTION & 32'h00000028);
  assign _zz_395_ = 32'h0;
  assign _zz_396_ = (decode_INSTRUCTION & 32'h00002010);
  assign _zz_397_ = 32'h00002000;
  assign _zz_398_ = (decode_INSTRUCTION & 32'h00005000);
  assign _zz_399_ = 32'h00001000;
  assign _zz_400_ = ((decode_INSTRUCTION & 32'h00001050) == 32'h00001050);
  assign _zz_401_ = ((decode_INSTRUCTION & 32'h00002050) == 32'h00002050);
  assign _zz_402_ = {(_zz_407_ == _zz_408_),{_zz_409_,{_zz_410_,_zz_411_}}};
  assign _zz_403_ = 5'h0;
  assign _zz_404_ = ((_zz_412_ == _zz_413_) != (1'b0));
  assign _zz_405_ = (_zz_414_ != (1'b0));
  assign _zz_406_ = {(_zz_415_ != _zz_416_),{_zz_417_,{_zz_418_,_zz_419_}}};
  assign _zz_407_ = (decode_INSTRUCTION & 32'h00000044);
  assign _zz_408_ = 32'h0;
  assign _zz_409_ = ((decode_INSTRUCTION & 32'h00000018) == 32'h0);
  assign _zz_410_ = ((decode_INSTRUCTION & _zz_420_) == 32'h00002000);
  assign _zz_411_ = {(_zz_421_ == _zz_422_),_zz_103_};
  assign _zz_412_ = (decode_INSTRUCTION & 32'h00004014);
  assign _zz_413_ = 32'h00004010;
  assign _zz_414_ = ((decode_INSTRUCTION & 32'h00006014) == 32'h00002010);
  assign _zz_415_ = {(_zz_423_ == _zz_424_),(_zz_425_ == _zz_426_)};
  assign _zz_416_ = (2'b00);
  assign _zz_417_ = ({_zz_427_,{_zz_428_,_zz_429_}} != (3'b000));
  assign _zz_418_ = ({_zz_430_,_zz_431_} != 5'h0);
  assign _zz_419_ = {(_zz_432_ != _zz_433_),{_zz_434_,{_zz_435_,_zz_436_}}};
  assign _zz_420_ = 32'h00006004;
  assign _zz_421_ = (decode_INSTRUCTION & 32'h00005004);
  assign _zz_422_ = 32'h00001000;
  assign _zz_423_ = (decode_INSTRUCTION & 32'h00007034);
  assign _zz_424_ = 32'h00005010;
  assign _zz_425_ = (decode_INSTRUCTION & 32'h02007064);
  assign _zz_426_ = 32'h00005020;
  assign _zz_427_ = ((decode_INSTRUCTION & _zz_437_) == 32'h40001010);
  assign _zz_428_ = (_zz_438_ == _zz_439_);
  assign _zz_429_ = (_zz_440_ == _zz_441_);
  assign _zz_430_ = _zz_100_;
  assign _zz_431_ = {_zz_442_,{_zz_443_,_zz_444_}};
  assign _zz_432_ = {_zz_445_,{_zz_446_,_zz_447_}};
  assign _zz_433_ = (3'b000);
  assign _zz_434_ = ({_zz_448_,_zz_449_} != (2'b00));
  assign _zz_435_ = (_zz_450_ != _zz_451_);
  assign _zz_436_ = {_zz_452_,{_zz_453_,_zz_454_}};
  assign _zz_437_ = 32'h40003054;
  assign _zz_438_ = (decode_INSTRUCTION & 32'h00007034);
  assign _zz_439_ = 32'h00001010;
  assign _zz_440_ = (decode_INSTRUCTION & 32'h02007054);
  assign _zz_441_ = 32'h00001010;
  assign _zz_442_ = ((decode_INSTRUCTION & _zz_455_) == 32'h00002010);
  assign _zz_443_ = (_zz_456_ == _zz_457_);
  assign _zz_444_ = {_zz_458_,_zz_459_};
  assign _zz_445_ = ((decode_INSTRUCTION & _zz_460_) == 32'h00000040);
  assign _zz_446_ = (_zz_461_ == _zz_462_);
  assign _zz_447_ = (_zz_463_ == _zz_464_);
  assign _zz_448_ = _zz_103_;
  assign _zz_449_ = (_zz_465_ == _zz_466_);
  assign _zz_450_ = (_zz_467_ == _zz_468_);
  assign _zz_451_ = (1'b0);
  assign _zz_452_ = ({_zz_469_,_zz_470_} != (4'b0000));
  assign _zz_453_ = (_zz_471_ != _zz_472_);
  assign _zz_454_ = {_zz_473_,{_zz_474_,_zz_475_}};
  assign _zz_455_ = 32'h00002030;
  assign _zz_456_ = (decode_INSTRUCTION & 32'h00001030);
  assign _zz_457_ = 32'h00000010;
  assign _zz_458_ = ((decode_INSTRUCTION & _zz_476_) == 32'h00000020);
  assign _zz_459_ = ((decode_INSTRUCTION & _zz_477_) == 32'h00002020);
  assign _zz_460_ = 32'h00000044;
  assign _zz_461_ = (decode_INSTRUCTION & 32'h00002014);
  assign _zz_462_ = 32'h00002010;
  assign _zz_463_ = (decode_INSTRUCTION & 32'h40000034);
  assign _zz_464_ = 32'h40000030;
  assign _zz_465_ = (decode_INSTRUCTION & 32'h00000058);
  assign _zz_466_ = 32'h0;
  assign _zz_467_ = (decode_INSTRUCTION & 32'h00000064);
  assign _zz_468_ = 32'h00000024;
  assign _zz_469_ = (_zz_478_ == _zz_479_);
  assign _zz_470_ = {_zz_480_,{_zz_481_,_zz_482_}};
  assign _zz_471_ = {_zz_102_,_zz_483_};
  assign _zz_472_ = (2'b00);
  assign _zz_473_ = ({_zz_484_,_zz_485_} != (2'b00));
  assign _zz_474_ = (_zz_486_ != _zz_487_);
  assign _zz_475_ = {_zz_488_,{_zz_489_,_zz_490_}};
  assign _zz_476_ = 32'h02003020;
  assign _zz_477_ = 32'h02002068;
  assign _zz_478_ = (decode_INSTRUCTION & 32'h00000050);
  assign _zz_479_ = 32'h00000040;
  assign _zz_480_ = ((decode_INSTRUCTION & 32'h00003040) == 32'h00000040);
  assign _zz_481_ = ((decode_INSTRUCTION & _zz_491_) == 32'h0);
  assign _zz_482_ = ((decode_INSTRUCTION & _zz_492_) == 32'h10002008);
  assign _zz_483_ = ((decode_INSTRUCTION & 32'h00000070) == 32'h00000020);
  assign _zz_484_ = _zz_102_;
  assign _zz_485_ = ((decode_INSTRUCTION & _zz_493_) == 32'h0);
  assign _zz_486_ = ((decode_INSTRUCTION & _zz_494_) == 32'h00000008);
  assign _zz_487_ = (1'b0);
  assign _zz_488_ = ((_zz_495_ == _zz_496_) != (1'b0));
  assign _zz_489_ = ({_zz_497_,_zz_498_} != (4'b0000));
  assign _zz_490_ = {(_zz_499_ != _zz_500_),{_zz_501_,{_zz_502_,_zz_503_}}};
  assign _zz_491_ = 32'h00000038;
  assign _zz_492_ = 32'h18002008;
  assign _zz_493_ = 32'h00000020;
  assign _zz_494_ = 32'h10000008;
  assign _zz_495_ = (decode_INSTRUCTION & 32'h02004064);
  assign _zz_496_ = 32'h02004020;
  assign _zz_497_ = ((decode_INSTRUCTION & 32'h00000034) == 32'h00000020);
  assign _zz_498_ = {((decode_INSTRUCTION & _zz_504_) == 32'h00000020),{(_zz_505_ == _zz_506_),(_zz_507_ == _zz_508_)}};
  assign _zz_499_ = ((decode_INSTRUCTION & 32'h00001000) == 32'h00001000);
  assign _zz_500_ = (1'b0);
  assign _zz_501_ = (((decode_INSTRUCTION & _zz_509_) == 32'h00002000) != (1'b0));
  assign _zz_502_ = (_zz_101_ != (1'b0));
  assign _zz_503_ = ({_zz_510_,{_zz_511_,_zz_512_}} != 5'h0);
  assign _zz_504_ = 32'h00000064;
  assign _zz_505_ = (decode_INSTRUCTION & 32'h08000070);
  assign _zz_506_ = 32'h08000020;
  assign _zz_507_ = (decode_INSTRUCTION & 32'h10000070);
  assign _zz_508_ = 32'h00000020;
  assign _zz_509_ = 32'h00003000;
  assign _zz_510_ = ((decode_INSTRUCTION & 32'h00000040) == 32'h00000040);
  assign _zz_511_ = ((decode_INSTRUCTION & 32'h00004020) == 32'h00004020);
  assign _zz_512_ = {((decode_INSTRUCTION & 32'h00000030) == 32'h00000010),{_zz_100_,((decode_INSTRUCTION & 32'h02000028) == 32'h00000020)}};
  assign _zz_513_ = execute_INSTRUCTION[31];
  assign _zz_514_ = execute_INSTRUCTION[31];
  assign _zz_515_ = execute_INSTRUCTION[7];
  always @ (posedge clk) begin
    if(_zz_330_) begin
      _zz_202_ <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress1];
    end
  end

  always @ (posedge clk) begin
    if(_zz_331_) begin
      _zz_203_ <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress2];
    end
  end

  always @ (posedge clk) begin
    if(_zz_38_) begin
      RegFilePlugin_regFile[lastStageRegFileWrite_payload_address] <= lastStageRegFileWrite_payload_data;
    end
  end

  InstructionCache IBusCachedPlugin_cache ( 
    .io_flush                                     (_zz_178_                                                             ), //i
    .io_cpu_prefetch_isValid                      (_zz_179_                                                             ), //i
    .io_cpu_prefetch_haltIt                       (IBusCachedPlugin_cache_io_cpu_prefetch_haltIt                        ), //o
    .io_cpu_prefetch_pc                           (IBusCachedPlugin_iBusRsp_stages_1_input_payload[31:0]                ), //i
    .io_cpu_fetch_isValid                         (_zz_180_                                                             ), //i
    .io_cpu_fetch_isStuck                         (_zz_181_                                                             ), //i
    .io_cpu_fetch_isRemoved                       (IBusCachedPlugin_externalFlush                                       ), //i
    .io_cpu_fetch_pc                              (IBusCachedPlugin_iBusRsp_stages_2_input_payload[31:0]                ), //i
    .io_cpu_fetch_data                            (IBusCachedPlugin_cache_io_cpu_fetch_data[31:0]                       ), //o
    .io_cpu_fetch_mmuBus_cmd_isValid              (IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_isValid               ), //o
    .io_cpu_fetch_mmuBus_cmd_virtualAddress       (IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_virtualAddress[31:0]  ), //o
    .io_cpu_fetch_mmuBus_cmd_bypassTranslation    (IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_bypassTranslation     ), //o
    .io_cpu_fetch_mmuBus_rsp_physicalAddress      (IBusCachedPlugin_mmuBus_rsp_physicalAddress[31:0]                    ), //i
    .io_cpu_fetch_mmuBus_rsp_isIoAccess           (IBusCachedPlugin_mmuBus_rsp_isIoAccess                               ), //i
    .io_cpu_fetch_mmuBus_rsp_allowRead            (IBusCachedPlugin_mmuBus_rsp_allowRead                                ), //i
    .io_cpu_fetch_mmuBus_rsp_allowWrite           (IBusCachedPlugin_mmuBus_rsp_allowWrite                               ), //i
    .io_cpu_fetch_mmuBus_rsp_allowExecute         (IBusCachedPlugin_mmuBus_rsp_allowExecute                             ), //i
    .io_cpu_fetch_mmuBus_rsp_exception            (IBusCachedPlugin_mmuBus_rsp_exception                                ), //i
    .io_cpu_fetch_mmuBus_rsp_refilling            (IBusCachedPlugin_mmuBus_rsp_refilling                                ), //i
    .io_cpu_fetch_mmuBus_end                      (IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_end                       ), //o
    .io_cpu_fetch_mmuBus_busy                     (IBusCachedPlugin_mmuBus_busy                                         ), //i
    .io_cpu_fetch_physicalAddress                 (IBusCachedPlugin_cache_io_cpu_fetch_physicalAddress[31:0]            ), //o
    .io_cpu_fetch_haltIt                          (IBusCachedPlugin_cache_io_cpu_fetch_haltIt                           ), //o
    .io_cpu_decode_isValid                        (_zz_182_                                                             ), //i
    .io_cpu_decode_isStuck                        (_zz_183_                                                             ), //i
    .io_cpu_decode_pc                             (IBusCachedPlugin_iBusRsp_stages_3_input_payload[31:0]                ), //i
    .io_cpu_decode_physicalAddress                (IBusCachedPlugin_cache_io_cpu_decode_physicalAddress[31:0]           ), //o
    .io_cpu_decode_data                           (IBusCachedPlugin_cache_io_cpu_decode_data[31:0]                      ), //o
    .io_cpu_decode_cacheMiss                      (IBusCachedPlugin_cache_io_cpu_decode_cacheMiss                       ), //o
    .io_cpu_decode_error                          (IBusCachedPlugin_cache_io_cpu_decode_error                           ), //o
    .io_cpu_decode_mmuRefilling                   (IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling                    ), //o
    .io_cpu_decode_mmuException                   (IBusCachedPlugin_cache_io_cpu_decode_mmuException                    ), //o
    .io_cpu_decode_isUser                         (_zz_184_                                                             ), //i
    .io_cpu_fill_valid                            (_zz_185_                                                             ), //i
    .io_cpu_fill_payload                          (IBusCachedPlugin_cache_io_cpu_decode_physicalAddress[31:0]           ), //i
    .io_mem_cmd_valid                             (IBusCachedPlugin_cache_io_mem_cmd_valid                              ), //o
    .io_mem_cmd_ready                             (iBus_cmd_ready                                                       ), //i
    .io_mem_cmd_payload_address                   (IBusCachedPlugin_cache_io_mem_cmd_payload_address[31:0]              ), //o
    .io_mem_cmd_payload_size                      (IBusCachedPlugin_cache_io_mem_cmd_payload_size[2:0]                  ), //o
    .io_mem_rsp_valid                             (iBus_rsp_valid                                                       ), //i
    .io_mem_rsp_payload_data                      (iBus_rsp_payload_data[31:0]                                          ), //i
    .io_mem_rsp_payload_error                     (iBus_rsp_payload_error                                               ), //i
    .clk                                          (clk                                                                  ), //i
    .reset                                        (reset                                                                )  //i
  );
  DataCache dataCache_1_ ( 
    .io_cpu_execute_isValid                        (_zz_186_                                                    ), //i
    .io_cpu_execute_address                        (_zz_187_[31:0]                                              ), //i
    .io_cpu_execute_args_wr                        (execute_MEMORY_WR                                           ), //i
    .io_cpu_execute_args_data                      (_zz_91_[31:0]                                               ), //i
    .io_cpu_execute_args_size                      (execute_DBusCachedPlugin_size[1:0]                          ), //i
    .io_cpu_execute_args_isLrsc                    (_zz_188_                                                    ), //i
    .io_cpu_execute_args_isAmo                     (execute_MEMORY_AMO                                          ), //i
    .io_cpu_execute_args_amoCtrl_swap              (_zz_189_                                                    ), //i
    .io_cpu_execute_args_amoCtrl_alu               (_zz_190_[2:0]                                               ), //i
    .io_cpu_memory_isValid                         (_zz_191_                                                    ), //i
    .io_cpu_memory_isStuck                         (memory_arbitration_isStuck                                  ), //i
    .io_cpu_memory_isRemoved                       (memory_arbitration_removeIt                                 ), //i
    .io_cpu_memory_isWrite                         (dataCache_1__io_cpu_memory_isWrite                          ), //o
    .io_cpu_memory_address                         (_zz_192_[31:0]                                              ), //i
    .io_cpu_memory_mmuBus_cmd_isValid              (dataCache_1__io_cpu_memory_mmuBus_cmd_isValid               ), //o
    .io_cpu_memory_mmuBus_cmd_virtualAddress       (dataCache_1__io_cpu_memory_mmuBus_cmd_virtualAddress[31:0]  ), //o
    .io_cpu_memory_mmuBus_cmd_bypassTranslation    (dataCache_1__io_cpu_memory_mmuBus_cmd_bypassTranslation     ), //o
    .io_cpu_memory_mmuBus_rsp_physicalAddress      (DBusCachedPlugin_mmuBus_rsp_physicalAddress[31:0]           ), //i
    .io_cpu_memory_mmuBus_rsp_isIoAccess           (_zz_193_                                                    ), //i
    .io_cpu_memory_mmuBus_rsp_allowRead            (DBusCachedPlugin_mmuBus_rsp_allowRead                       ), //i
    .io_cpu_memory_mmuBus_rsp_allowWrite           (DBusCachedPlugin_mmuBus_rsp_allowWrite                      ), //i
    .io_cpu_memory_mmuBus_rsp_allowExecute         (DBusCachedPlugin_mmuBus_rsp_allowExecute                    ), //i
    .io_cpu_memory_mmuBus_rsp_exception            (DBusCachedPlugin_mmuBus_rsp_exception                       ), //i
    .io_cpu_memory_mmuBus_rsp_refilling            (DBusCachedPlugin_mmuBus_rsp_refilling                       ), //i
    .io_cpu_memory_mmuBus_end                      (dataCache_1__io_cpu_memory_mmuBus_end                       ), //o
    .io_cpu_memory_mmuBus_busy                     (DBusCachedPlugin_mmuBus_busy                                ), //i
    .io_cpu_writeBack_isValid                      (_zz_194_                                                    ), //i
    .io_cpu_writeBack_isStuck                      (writeBack_arbitration_isStuck                               ), //i
    .io_cpu_writeBack_isUser                       (_zz_195_                                                    ), //i
    .io_cpu_writeBack_haltIt                       (dataCache_1__io_cpu_writeBack_haltIt                        ), //o
    .io_cpu_writeBack_isWrite                      (dataCache_1__io_cpu_writeBack_isWrite                       ), //o
    .io_cpu_writeBack_data                         (dataCache_1__io_cpu_writeBack_data[31:0]                    ), //o
    .io_cpu_writeBack_address                      (_zz_196_[31:0]                                              ), //i
    .io_cpu_writeBack_mmuException                 (dataCache_1__io_cpu_writeBack_mmuException                  ), //o
    .io_cpu_writeBack_unalignedAccess              (dataCache_1__io_cpu_writeBack_unalignedAccess               ), //o
    .io_cpu_writeBack_accessError                  (dataCache_1__io_cpu_writeBack_accessError                   ), //o
    .io_cpu_writeBack_clearLrsc                    (contextSwitching                                            ), //i
    .io_cpu_redo                                   (dataCache_1__io_cpu_redo                                    ), //o
    .io_cpu_flush_valid                            (_zz_197_                                                    ), //i
    .io_cpu_flush_ready                            (dataCache_1__io_cpu_flush_ready                             ), //o
    .io_mem_cmd_valid                              (dataCache_1__io_mem_cmd_valid                               ), //o
    .io_mem_cmd_ready                              (_zz_198_                                                    ), //i
    .io_mem_cmd_payload_wr                         (dataCache_1__io_mem_cmd_payload_wr                          ), //o
    .io_mem_cmd_payload_address                    (dataCache_1__io_mem_cmd_payload_address[31:0]               ), //o
    .io_mem_cmd_payload_data                       (dataCache_1__io_mem_cmd_payload_data[31:0]                  ), //o
    .io_mem_cmd_payload_mask                       (dataCache_1__io_mem_cmd_payload_mask[3:0]                   ), //o
    .io_mem_cmd_payload_length                     (dataCache_1__io_mem_cmd_payload_length[2:0]                 ), //o
    .io_mem_cmd_payload_last                       (dataCache_1__io_mem_cmd_payload_last                        ), //o
    .io_mem_rsp_valid                              (dBus_rsp_regNext_valid                                      ), //i
    .io_mem_rsp_payload_data                       (dBus_rsp_regNext_payload_data[31:0]                         ), //i
    .io_mem_rsp_payload_error                      (dBus_rsp_regNext_payload_error                              ), //i
    .clk                                           (clk                                                         ), //i
    .reset                                         (reset                                                       )  //i
  );
  StreamFork streamFork_1_ ( 
    .io_input_valid                  (_zz_199_                                                ), //i
    .io_input_ready                  (streamFork_1__io_input_ready                            ), //o
    .io_input_payload_wr             (dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_wr             ), //i
    .io_input_payload_address        (dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_address[31:0]  ), //i
    .io_input_payload_data           (dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_data[31:0]     ), //i
    .io_input_payload_mask           (dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_mask[3:0]      ), //i
    .io_input_payload_length         (dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_length[2:0]    ), //i
    .io_input_payload_last           (dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_last           ), //i
    .io_outputs_0_valid              (streamFork_1__io_outputs_0_valid                        ), //o
    .io_outputs_0_ready              (_zz_200_                                                ), //i
    .io_outputs_0_payload_wr         (streamFork_1__io_outputs_0_payload_wr                   ), //o
    .io_outputs_0_payload_address    (streamFork_1__io_outputs_0_payload_address[31:0]        ), //o
    .io_outputs_0_payload_data       (streamFork_1__io_outputs_0_payload_data[31:0]           ), //o
    .io_outputs_0_payload_mask       (streamFork_1__io_outputs_0_payload_mask[3:0]            ), //o
    .io_outputs_0_payload_length     (streamFork_1__io_outputs_0_payload_length[2:0]          ), //o
    .io_outputs_0_payload_last       (streamFork_1__io_outputs_0_payload_last                 ), //o
    .io_outputs_1_valid              (streamFork_1__io_outputs_1_valid                        ), //o
    .io_outputs_1_ready              (_zz_201_                                                ), //i
    .io_outputs_1_payload_wr         (streamFork_1__io_outputs_1_payload_wr                   ), //o
    .io_outputs_1_payload_address    (streamFork_1__io_outputs_1_payload_address[31:0]        ), //o
    .io_outputs_1_payload_data       (streamFork_1__io_outputs_1_payload_data[31:0]           ), //o
    .io_outputs_1_payload_mask       (streamFork_1__io_outputs_1_payload_mask[3:0]            ), //o
    .io_outputs_1_payload_length     (streamFork_1__io_outputs_1_payload_length[2:0]          ), //o
    .io_outputs_1_payload_last       (streamFork_1__io_outputs_1_payload_last                 ), //o
    .clk                             (clk                                                     ), //i
    .reset                           (reset                                                   )  //i
  );
  always @(*) begin
    case(_zz_332_)
      2'b00 : begin
        _zz_204_ = DBusCachedPlugin_redoBranch_payload;
      end
      2'b01 : begin
        _zz_204_ = CsrPlugin_jumpInterface_payload;
      end
      2'b10 : begin
        _zz_204_ = BranchPlugin_jumpInterface_payload;
      end
      default : begin
        _zz_204_ = IBusCachedPlugin_predictionJumpInterface_payload;
      end
    endcase
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(decode_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : decode_SRC2_CTRL_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : decode_SRC2_CTRL_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : decode_SRC2_CTRL_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : decode_SRC2_CTRL_string = "PC ";
      default : decode_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_1_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_1__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_1__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_1__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_1__string = "PC ";
      default : _zz_1__string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_2_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_2__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_2__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_2__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_2__string = "PC ";
      default : _zz_2__string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_3_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_3__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_3__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_3__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_3__string = "PC ";
      default : _zz_3__string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_4_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_4__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_4__string = "XRET";
      default : _zz_4__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_5_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_5__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_5__string = "XRET";
      default : _zz_5__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_6_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_6__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_6__string = "XRET";
      default : _zz_6__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_7_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_7__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_7__string = "XRET";
      default : _zz_7__string = "????";
    endcase
  end
  always @(*) begin
    case(decode_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : decode_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : decode_ENV_CTRL_string = "XRET";
      default : decode_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_8_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_8__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_8__string = "XRET";
      default : _zz_8__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_9_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_9__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_9__string = "XRET";
      default : _zz_9__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_10_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_10__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_10__string = "XRET";
      default : _zz_10__string = "????";
    endcase
  end
  always @(*) begin
    case(decode_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : decode_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : decode_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : decode_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_11_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_11__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_11__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_11__string = "AND_1";
      default : _zz_11__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_12_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_12__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_12__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_12__string = "AND_1";
      default : _zz_12__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_13_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_13__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_13__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_13__string = "AND_1";
      default : _zz_13__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_14_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_14__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_14__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_14__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_14__string = "JALR";
      default : _zz_14__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_15_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_15__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_15__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_15__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_15__string = "JALR";
      default : _zz_15__string = "????";
    endcase
  end
  always @(*) begin
    case(decode_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : decode_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : decode_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : decode_ALU_CTRL_string = "BITWISE ";
      default : decode_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_16_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_16__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_16__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_16__string = "BITWISE ";
      default : _zz_16__string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_17_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_17__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_17__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_17__string = "BITWISE ";
      default : _zz_17__string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_18_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_18__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_18__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_18__string = "BITWISE ";
      default : _zz_18__string = "????????";
    endcase
  end
  always @(*) begin
    case(decode_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : decode_SRC1_CTRL_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : decode_SRC1_CTRL_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : decode_SRC1_CTRL_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : decode_SRC1_CTRL_string = "URS1        ";
      default : decode_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_19_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_19__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_19__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_19__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_19__string = "URS1        ";
      default : _zz_19__string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_20_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_20__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_20__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_20__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_20__string = "URS1        ";
      default : _zz_20__string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_21_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_21__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_21__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_21__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_21__string = "URS1        ";
      default : _zz_21__string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_22_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_22__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_22__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_22__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_22__string = "SRA_1    ";
      default : _zz_22__string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_23_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_23__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_23__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_23__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_23__string = "SRA_1    ";
      default : _zz_23__string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : decode_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : decode_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : decode_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : decode_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_24_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_24__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_24__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_24__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_24__string = "SRA_1    ";
      default : _zz_24__string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_25_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_25__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_25__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_25__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_25__string = "SRA_1    ";
      default : _zz_25__string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_26_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_26__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_26__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_26__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_26__string = "SRA_1    ";
      default : _zz_26__string = "?????????";
    endcase
  end
  always @(*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : execute_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : execute_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : execute_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : execute_BRANCH_CTRL_string = "JALR";
      default : execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_27_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_27__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_27__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_27__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_27__string = "JALR";
      default : _zz_27__string = "????";
    endcase
  end
  always @(*) begin
    case(memory_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : memory_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : memory_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : memory_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : memory_SHIFT_CTRL_string = "SRA_1    ";
      default : memory_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_29_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_29__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_29__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_29__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_29__string = "SRA_1    ";
      default : _zz_29__string = "?????????";
    endcase
  end
  always @(*) begin
    case(execute_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : execute_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : execute_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : execute_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : execute_SHIFT_CTRL_string = "SRA_1    ";
      default : execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_30_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_30__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_30__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_30__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_30__string = "SRA_1    ";
      default : _zz_30__string = "?????????";
    endcase
  end
  always @(*) begin
    case(execute_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : execute_SRC2_CTRL_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : execute_SRC2_CTRL_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : execute_SRC2_CTRL_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : execute_SRC2_CTRL_string = "PC ";
      default : execute_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_32_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_32__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_32__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_32__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_32__string = "PC ";
      default : _zz_32__string = "???";
    endcase
  end
  always @(*) begin
    case(execute_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : execute_SRC1_CTRL_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : execute_SRC1_CTRL_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : execute_SRC1_CTRL_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : execute_SRC1_CTRL_string = "URS1        ";
      default : execute_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_33_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_33__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_33__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_33__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_33__string = "URS1        ";
      default : _zz_33__string = "????????????";
    endcase
  end
  always @(*) begin
    case(execute_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : execute_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : execute_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : execute_ALU_CTRL_string = "BITWISE ";
      default : execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_34_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_34__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_34__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_34__string = "BITWISE ";
      default : _zz_34__string = "????????";
    endcase
  end
  always @(*) begin
    case(execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : execute_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_35_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_35__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_35__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_35__string = "AND_1";
      default : _zz_35__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_39_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_39__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_39__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_39__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_39__string = "JALR";
      default : _zz_39__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_40_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_40__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_40__string = "XRET";
      default : _zz_40__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_41_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_41__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_41__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_41__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_41__string = "URS1        ";
      default : _zz_41__string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_42_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_42__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_42__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_42__string = "BITWISE ";
      default : _zz_42__string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_43_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_43__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_43__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_43__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_43__string = "SRA_1    ";
      default : _zz_43__string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_44_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_44__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_44__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_44__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_44__string = "PC ";
      default : _zz_44__string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_45_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_45__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_45__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_45__string = "AND_1";
      default : _zz_45__string = "?????";
    endcase
  end
  always @(*) begin
    case(memory_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : memory_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : memory_ENV_CTRL_string = "XRET";
      default : memory_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_47_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_47__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_47__string = "XRET";
      default : _zz_47__string = "????";
    endcase
  end
  always @(*) begin
    case(execute_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : execute_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : execute_ENV_CTRL_string = "XRET";
      default : execute_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_48_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_48__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_48__string = "XRET";
      default : _zz_48__string = "????";
    endcase
  end
  always @(*) begin
    case(writeBack_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : writeBack_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : writeBack_ENV_CTRL_string = "XRET";
      default : writeBack_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_49_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_49__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_49__string = "XRET";
      default : _zz_49__string = "????";
    endcase
  end
  always @(*) begin
    case(decode_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : decode_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : decode_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : decode_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : decode_BRANCH_CTRL_string = "JALR";
      default : decode_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_52_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_52__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_52__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_52__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_52__string = "JALR";
      default : _zz_52__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_106_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_106__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_106__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_106__string = "AND_1";
      default : _zz_106__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_107_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_107__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_107__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_107__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_107__string = "PC ";
      default : _zz_107__string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_108_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_108__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_108__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_108__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_108__string = "SRA_1    ";
      default : _zz_108__string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_109_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_109__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_109__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_109__string = "BITWISE ";
      default : _zz_109__string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_110_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_110__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_110__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_110__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_110__string = "URS1        ";
      default : _zz_110__string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_111_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_111__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_111__string = "XRET";
      default : _zz_111__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_112_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_112__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_112__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_112__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_112__string = "JALR";
      default : _zz_112__string = "????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : decode_to_execute_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : decode_to_execute_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : decode_to_execute_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : decode_to_execute_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_to_execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(execute_to_memory_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : execute_to_memory_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : execute_to_memory_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : execute_to_memory_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : execute_to_memory_SHIFT_CTRL_string = "SRA_1    ";
      default : execute_to_memory_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : decode_to_execute_SRC1_CTRL_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : decode_to_execute_SRC1_CTRL_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : decode_to_execute_SRC1_CTRL_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : decode_to_execute_SRC1_CTRL_string = "URS1        ";
      default : decode_to_execute_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : decode_to_execute_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : decode_to_execute_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : decode_to_execute_ALU_CTRL_string = "BITWISE ";
      default : decode_to_execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : decode_to_execute_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : decode_to_execute_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : decode_to_execute_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : decode_to_execute_BRANCH_CTRL_string = "JALR";
      default : decode_to_execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_to_execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : decode_to_execute_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : decode_to_execute_ENV_CTRL_string = "XRET";
      default : decode_to_execute_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(execute_to_memory_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : execute_to_memory_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : execute_to_memory_ENV_CTRL_string = "XRET";
      default : execute_to_memory_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(memory_to_writeBack_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : memory_to_writeBack_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : memory_to_writeBack_ENV_CTRL_string = "XRET";
      default : memory_to_writeBack_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : decode_to_execute_SRC2_CTRL_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : decode_to_execute_SRC2_CTRL_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : decode_to_execute_SRC2_CTRL_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : decode_to_execute_SRC2_CTRL_string = "PC ";
      default : decode_to_execute_SRC2_CTRL_string = "???";
    endcase
  end
  `endif

  assign decode_SRC2_CTRL = _zz_1_;
  assign _zz_2_ = _zz_3_;
  assign decode_CSR_READ_OPCODE = (decode_INSTRUCTION[13 : 7] != 7'h20);
  assign decode_CSR_WRITE_OPCODE = (! (((decode_INSTRUCTION[14 : 13] == (2'b01)) && (decode_INSTRUCTION[19 : 15] == 5'h0)) || ((decode_INSTRUCTION[14 : 13] == (2'b11)) && (decode_INSTRUCTION[19 : 15] == 5'h0))));
  assign memory_MEMORY_WR = execute_to_memory_MEMORY_WR;
  assign decode_MEMORY_WR = _zz_239_[0];
  assign decode_SRC_LESS_UNSIGNED = _zz_240_[0];
  assign _zz_4_ = _zz_5_;
  assign _zz_6_ = _zz_7_;
  assign decode_ENV_CTRL = _zz_8_;
  assign _zz_9_ = _zz_10_;
  assign memory_MUL_HH = execute_to_memory_MUL_HH;
  assign execute_MUL_HH = ($signed(execute_MulPlugin_aHigh) * $signed(execute_MulPlugin_bHigh));
  assign decode_ALU_BITWISE_CTRL = _zz_11_;
  assign _zz_12_ = _zz_13_;
  assign _zz_14_ = _zz_15_;
  assign execute_BRANCH_CALC = {execute_BranchPlugin_branchAdder[31 : 1],(1'b0)};
  assign decode_PREDICTION_HAD_BRANCHED2 = IBusCachedPlugin_decodePrediction_cmd_hadBranch;
  assign execute_BYPASSABLE_MEMORY_STAGE = decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  assign decode_BYPASSABLE_MEMORY_STAGE = _zz_241_[0];
  assign decode_IS_RS2_SIGNED = _zz_242_[0];
  assign execute_REGFILE_WRITE_DATA = _zz_114_;
  assign decode_IS_DIV = _zz_243_[0];
  assign execute_MUL_LH = ($signed(execute_MulPlugin_aSLow) * $signed(execute_MulPlugin_bHigh));
  assign execute_SHIFT_RIGHT = _zz_245_;
  assign decode_ALU_CTRL = _zz_16_;
  assign _zz_17_ = _zz_18_;
  assign decode_SRC1_CTRL = _zz_19_;
  assign _zz_20_ = _zz_21_;
  assign decode_IS_RS1_SIGNED = _zz_247_[0];
  assign memory_PC = execute_to_memory_PC;
  assign memory_MUL_LOW = ($signed(_zz_248_) + $signed(_zz_256_));
  assign writeBack_FORMAL_PC_NEXT = memory_to_writeBack_FORMAL_PC_NEXT;
  assign memory_FORMAL_PC_NEXT = execute_to_memory_FORMAL_PC_NEXT;
  assign execute_FORMAL_PC_NEXT = decode_to_execute_FORMAL_PC_NEXT;
  assign decode_FORMAL_PC_NEXT = (decode_PC + 32'h00000004);
  assign decode_BYPASSABLE_EXECUTE_STAGE = _zz_257_[0];
  assign decode_MEMORY_MANAGMENT = _zz_258_[0];
  assign decode_IS_CSR = _zz_259_[0];
  assign _zz_22_ = _zz_23_;
  assign decode_SHIFT_CTRL = _zz_24_;
  assign _zz_25_ = _zz_26_;
  assign memory_IS_MUL = execute_to_memory_IS_MUL;
  assign execute_IS_MUL = decode_to_execute_IS_MUL;
  assign decode_IS_MUL = _zz_260_[0];
  assign execute_MUL_LL = (execute_MulPlugin_aULow * execute_MulPlugin_bULow);
  assign execute_BRANCH_DO = ((execute_PREDICTION_HAD_BRANCHED2 != execute_BRANCH_COND_RESULT) || execute_BranchPlugin_missAlignedTarget);
  assign decode_SRC2_FORCE_ZERO = (decode_SRC_ADD_ZERO && (! decode_SRC_USE_SUB_LESS));
  assign memory_MEMORY_ADDRESS_LOW = execute_to_memory_MEMORY_ADDRESS_LOW;
  assign execute_MEMORY_ADDRESS_LOW = _zz_187_[1 : 0];
  assign execute_MUL_HL = ($signed(execute_MulPlugin_aHigh) * $signed(execute_MulPlugin_bSLow));
  assign decode_MEMORY_LRSC = _zz_261_[0];
  assign decode_MEMORY_AMO = _zz_262_[0];
  assign memory_BRANCH_CALC = execute_to_memory_BRANCH_CALC;
  assign memory_BRANCH_DO = execute_to_memory_BRANCH_DO;
  assign execute_PC = decode_to_execute_PC;
  assign execute_PREDICTION_HAD_BRANCHED2 = decode_to_execute_PREDICTION_HAD_BRANCHED2;
  assign execute_BRANCH_COND_RESULT = _zz_141_;
  assign execute_BRANCH_CTRL = _zz_27_;
  assign decode_RS2_USE = _zz_263_[0];
  assign decode_RS1_USE = _zz_264_[0];
  assign execute_REGFILE_WRITE_VALID = decode_to_execute_REGFILE_WRITE_VALID;
  assign execute_BYPASSABLE_EXECUTE_STAGE = decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  assign memory_REGFILE_WRITE_VALID = execute_to_memory_REGFILE_WRITE_VALID;
  assign memory_BYPASSABLE_MEMORY_STAGE = execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  assign writeBack_REGFILE_WRITE_VALID = memory_to_writeBack_REGFILE_WRITE_VALID;
  always @ (*) begin
    decode_RS2 = decode_RegFilePlugin_rs2Data;
    if(_zz_130_)begin
      if((_zz_131_ == decode_INSTRUCTION[24 : 20]))begin
        decode_RS2 = _zz_132_;
      end
    end
    if(_zz_205_)begin
      if(_zz_206_)begin
        if(_zz_134_)begin
          decode_RS2 = _zz_50_;
        end
      end
    end
    if(_zz_207_)begin
      if(memory_BYPASSABLE_MEMORY_STAGE)begin
        if(_zz_136_)begin
          decode_RS2 = _zz_28_;
        end
      end
    end
    if(_zz_208_)begin
      if(execute_BYPASSABLE_EXECUTE_STAGE)begin
        if(_zz_138_)begin
          decode_RS2 = _zz_46_;
        end
      end
    end
  end

  always @ (*) begin
    decode_RS1 = decode_RegFilePlugin_rs1Data;
    if(_zz_130_)begin
      if((_zz_131_ == decode_INSTRUCTION[19 : 15]))begin
        decode_RS1 = _zz_132_;
      end
    end
    if(_zz_205_)begin
      if(_zz_206_)begin
        if(_zz_133_)begin
          decode_RS1 = _zz_50_;
        end
      end
    end
    if(_zz_207_)begin
      if(memory_BYPASSABLE_MEMORY_STAGE)begin
        if(_zz_135_)begin
          decode_RS1 = _zz_28_;
        end
      end
    end
    if(_zz_208_)begin
      if(execute_BYPASSABLE_EXECUTE_STAGE)begin
        if(_zz_137_)begin
          decode_RS1 = _zz_46_;
        end
      end
    end
  end

  assign execute_IS_RS1_SIGNED = decode_to_execute_IS_RS1_SIGNED;
  assign execute_IS_DIV = decode_to_execute_IS_DIV;
  assign execute_IS_RS2_SIGNED = decode_to_execute_IS_RS2_SIGNED;
  assign memory_INSTRUCTION = execute_to_memory_INSTRUCTION;
  assign memory_IS_DIV = execute_to_memory_IS_DIV;
  assign writeBack_IS_MUL = memory_to_writeBack_IS_MUL;
  assign writeBack_MUL_HH = memory_to_writeBack_MUL_HH;
  assign writeBack_MUL_LOW = memory_to_writeBack_MUL_LOW;
  assign memory_MUL_HL = execute_to_memory_MUL_HL;
  assign memory_MUL_LH = execute_to_memory_MUL_LH;
  assign memory_MUL_LL = execute_to_memory_MUL_LL;
  assign execute_RS1 = decode_to_execute_RS1;
  assign memory_SHIFT_RIGHT = execute_to_memory_SHIFT_RIGHT;
  always @ (*) begin
    _zz_28_ = memory_REGFILE_WRITE_DATA;
    if(memory_arbitration_isValid)begin
      case(memory_SHIFT_CTRL)
        `ShiftCtrlEnum_defaultEncoding_SLL_1 : begin
          _zz_28_ = _zz_122_;
        end
        `ShiftCtrlEnum_defaultEncoding_SRL_1, `ShiftCtrlEnum_defaultEncoding_SRA_1 : begin
          _zz_28_ = memory_SHIFT_RIGHT;
        end
        default : begin
        end
      endcase
    end
    if(_zz_209_)begin
      _zz_28_ = memory_MulDivIterativePlugin_div_result;
    end
  end

  assign memory_SHIFT_CTRL = _zz_29_;
  assign execute_SHIFT_CTRL = _zz_30_;
  assign execute_SRC_LESS_UNSIGNED = decode_to_execute_SRC_LESS_UNSIGNED;
  assign execute_SRC2_FORCE_ZERO = decode_to_execute_SRC2_FORCE_ZERO;
  assign execute_SRC_USE_SUB_LESS = decode_to_execute_SRC_USE_SUB_LESS;
  assign _zz_31_ = execute_PC;
  assign execute_SRC2_CTRL = _zz_32_;
  assign execute_SRC1_CTRL = _zz_33_;
  assign decode_SRC_USE_SUB_LESS = _zz_265_[0];
  assign decode_SRC_ADD_ZERO = _zz_266_[0];
  assign execute_SRC_ADD_SUB = execute_SrcPlugin_addSub;
  assign execute_SRC_LESS = execute_SrcPlugin_less;
  assign execute_ALU_CTRL = _zz_34_;
  assign execute_SRC2 = _zz_120_;
  assign execute_ALU_BITWISE_CTRL = _zz_35_;
  assign _zz_36_ = writeBack_INSTRUCTION;
  assign _zz_37_ = writeBack_REGFILE_WRITE_VALID;
  always @ (*) begin
    _zz_38_ = 1'b0;
    if(lastStageRegFileWrite_valid)begin
      _zz_38_ = 1'b1;
    end
  end

  assign decode_INSTRUCTION_ANTICIPATED = (decode_arbitration_isStuck ? decode_INSTRUCTION : IBusCachedPlugin_iBusRsp_output_payload_rsp_inst);
  always @ (*) begin
    decode_REGFILE_WRITE_VALID = _zz_267_[0];
    if((decode_INSTRUCTION[11 : 7] == 5'h0))begin
      decode_REGFILE_WRITE_VALID = 1'b0;
    end
  end

  always @ (*) begin
    _zz_46_ = execute_REGFILE_WRITE_DATA;
    if(_zz_210_)begin
      _zz_46_ = execute_CsrPlugin_readData;
    end
  end

  assign execute_SRC1 = _zz_115_;
  assign execute_CSR_READ_OPCODE = decode_to_execute_CSR_READ_OPCODE;
  assign execute_CSR_WRITE_OPCODE = decode_to_execute_CSR_WRITE_OPCODE;
  assign execute_IS_CSR = decode_to_execute_IS_CSR;
  assign memory_ENV_CTRL = _zz_47_;
  assign execute_ENV_CTRL = _zz_48_;
  assign writeBack_ENV_CTRL = _zz_49_;
  always @ (*) begin
    _zz_50_ = writeBack_REGFILE_WRITE_DATA;
    if((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE))begin
      _zz_50_ = writeBack_DBusCachedPlugin_rspFormated;
    end
    if((writeBack_arbitration_isValid && writeBack_IS_MUL))begin
      case(_zz_238_)
        2'b00 : begin
          _zz_50_ = _zz_297_;
        end
        default : begin
          _zz_50_ = _zz_298_;
        end
      endcase
    end
  end

  assign writeBack_MEMORY_ADDRESS_LOW = memory_to_writeBack_MEMORY_ADDRESS_LOW;
  assign writeBack_MEMORY_WR = memory_to_writeBack_MEMORY_WR;
  assign writeBack_REGFILE_WRITE_DATA = memory_to_writeBack_REGFILE_WRITE_DATA;
  assign writeBack_MEMORY_ENABLE = memory_to_writeBack_MEMORY_ENABLE;
  assign memory_REGFILE_WRITE_DATA = execute_to_memory_REGFILE_WRITE_DATA;
  assign memory_MEMORY_ENABLE = execute_to_memory_MEMORY_ENABLE;
  assign execute_MEMORY_AMO = decode_to_execute_MEMORY_AMO;
  assign execute_MEMORY_LRSC = decode_to_execute_MEMORY_LRSC;
  assign execute_MEMORY_MANAGMENT = decode_to_execute_MEMORY_MANAGMENT;
  assign execute_RS2 = decode_to_execute_RS2;
  assign execute_MEMORY_WR = decode_to_execute_MEMORY_WR;
  assign execute_SRC_ADD = execute_SrcPlugin_addSub;
  assign execute_MEMORY_ENABLE = decode_to_execute_MEMORY_ENABLE;
  assign execute_INSTRUCTION = decode_to_execute_INSTRUCTION;
  assign decode_MEMORY_ENABLE = _zz_268_[0];
  assign decode_FLUSH_ALL = _zz_269_[0];
  always @ (*) begin
    _zz_51_ = _zz_51__2;
    if(_zz_211_)begin
      _zz_51_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_51__2 = _zz_51__1;
    if(_zz_212_)begin
      _zz_51__2 = 1'b1;
    end
  end

  always @ (*) begin
    _zz_51__1 = _zz_51__0;
    if(_zz_213_)begin
      _zz_51__1 = 1'b1;
    end
  end

  always @ (*) begin
    _zz_51__0 = IBusCachedPlugin_rsp_issueDetected;
    if(_zz_214_)begin
      _zz_51__0 = 1'b1;
    end
  end

  assign decode_BRANCH_CTRL = _zz_52_;
  always @ (*) begin
    _zz_53_ = memory_FORMAL_PC_NEXT;
    if(BranchPlugin_jumpInterface_valid)begin
      _zz_53_ = BranchPlugin_jumpInterface_payload;
    end
  end

  always @ (*) begin
    _zz_54_ = decode_FORMAL_PC_NEXT;
    if(IBusCachedPlugin_predictionJumpInterface_valid)begin
      _zz_54_ = IBusCachedPlugin_predictionJumpInterface_payload;
    end
  end

  assign decode_PC = IBusCachedPlugin_injector_decodeInput_payload_pc;
  assign decode_INSTRUCTION = IBusCachedPlugin_injector_decodeInput_payload_rsp_inst;
  assign writeBack_PC = memory_to_writeBack_PC;
  assign writeBack_INSTRUCTION = memory_to_writeBack_INSTRUCTION;
  always @ (*) begin
    decode_arbitration_haltItself = 1'b0;
    if(((DBusCachedPlugin_mmuBus_busy && decode_arbitration_isValid) && decode_MEMORY_ENABLE))begin
      decode_arbitration_haltItself = 1'b1;
    end
  end

  always @ (*) begin
    decode_arbitration_haltByOther = 1'b0;
    if(CsrPlugin_pipelineLiberator_active)begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if(({(writeBack_arbitration_isValid && (writeBack_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)),{(memory_arbitration_isValid && (memory_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)),(execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET))}} != (3'b000)))begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if((decode_arbitration_isValid && (_zz_128_ || _zz_129_)))begin
      decode_arbitration_haltByOther = 1'b1;
    end
  end

  always @ (*) begin
    decode_arbitration_removeIt = 1'b0;
    if(IBusCachedPlugin_decodeExceptionPort_valid)begin
      decode_arbitration_removeIt = 1'b1;
    end
    if(decode_arbitration_isFlushed)begin
      decode_arbitration_removeIt = 1'b1;
    end
  end

  assign decode_arbitration_flushIt = 1'b0;
  always @ (*) begin
    decode_arbitration_flushNext = 1'b0;
    if(IBusCachedPlugin_predictionJumpInterface_valid)begin
      decode_arbitration_flushNext = 1'b1;
    end
    if(IBusCachedPlugin_decodeExceptionPort_valid)begin
      decode_arbitration_flushNext = 1'b1;
    end
  end

  always @ (*) begin
    execute_arbitration_haltItself = 1'b0;
    if((_zz_197_ && (! dataCache_1__io_cpu_flush_ready)))begin
      execute_arbitration_haltItself = 1'b1;
    end
    if(((dataCache_1__io_cpu_redo && execute_arbitration_isValid) && execute_MEMORY_ENABLE))begin
      execute_arbitration_haltItself = 1'b1;
    end
    if(_zz_210_)begin
      if(execute_CsrPlugin_blockedBySideEffects)begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
  end

  assign execute_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    execute_arbitration_removeIt = 1'b0;
    if(execute_arbitration_isFlushed)begin
      execute_arbitration_removeIt = 1'b1;
    end
  end

  assign execute_arbitration_flushIt = 1'b0;
  assign execute_arbitration_flushNext = 1'b0;
  always @ (*) begin
    memory_arbitration_haltItself = 1'b0;
    if(_zz_209_)begin
      if(((! memory_MulDivIterativePlugin_frontendOk) || (! memory_MulDivIterativePlugin_div_done)))begin
        memory_arbitration_haltItself = 1'b1;
      end
    end
  end

  assign memory_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    memory_arbitration_removeIt = 1'b0;
    if(memory_arbitration_isFlushed)begin
      memory_arbitration_removeIt = 1'b1;
    end
  end

  assign memory_arbitration_flushIt = 1'b0;
  always @ (*) begin
    memory_arbitration_flushNext = 1'b0;
    if(BranchPlugin_jumpInterface_valid)begin
      memory_arbitration_flushNext = 1'b1;
    end
  end

  always @ (*) begin
    writeBack_arbitration_haltItself = 1'b0;
    if(dataCache_1__io_cpu_writeBack_haltIt)begin
      writeBack_arbitration_haltItself = 1'b1;
    end
  end

  assign writeBack_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    writeBack_arbitration_removeIt = 1'b0;
    if(DBusCachedPlugin_exceptionBus_valid)begin
      writeBack_arbitration_removeIt = 1'b1;
    end
    if(writeBack_arbitration_isFlushed)begin
      writeBack_arbitration_removeIt = 1'b1;
    end
  end

  always @ (*) begin
    writeBack_arbitration_flushIt = 1'b0;
    if(DBusCachedPlugin_redoBranch_valid)begin
      writeBack_arbitration_flushIt = 1'b1;
    end
  end

  always @ (*) begin
    writeBack_arbitration_flushNext = 1'b0;
    if(DBusCachedPlugin_redoBranch_valid)begin
      writeBack_arbitration_flushNext = 1'b1;
    end
    if(DBusCachedPlugin_exceptionBus_valid)begin
      writeBack_arbitration_flushNext = 1'b1;
    end
    if(_zz_215_)begin
      writeBack_arbitration_flushNext = 1'b1;
    end
    if(_zz_216_)begin
      writeBack_arbitration_flushNext = 1'b1;
    end
  end

  assign lastStageInstruction = writeBack_INSTRUCTION;
  assign lastStagePc = writeBack_PC;
  assign lastStageIsValid = writeBack_arbitration_isValid;
  assign lastStageIsFiring = writeBack_arbitration_isFiring;
  always @ (*) begin
    IBusCachedPlugin_fetcherHalt = 1'b0;
    if(({CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack,{CsrPlugin_exceptionPortCtrl_exceptionValids_memory,{CsrPlugin_exceptionPortCtrl_exceptionValids_execute,CsrPlugin_exceptionPortCtrl_exceptionValids_decode}}} != (4'b0000)))begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(_zz_215_)begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(_zz_216_)begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_incomingInstruction = 1'b0;
    if(((IBusCachedPlugin_iBusRsp_stages_1_input_valid || IBusCachedPlugin_iBusRsp_stages_2_input_valid) || IBusCachedPlugin_iBusRsp_stages_3_input_valid))begin
      IBusCachedPlugin_incomingInstruction = 1'b1;
    end
    if(IBusCachedPlugin_injector_decodeInput_valid)begin
      IBusCachedPlugin_incomingInstruction = 1'b1;
    end
  end

  assign CsrPlugin_inWfi = 1'b0;
  assign CsrPlugin_thirdPartyWake = 1'b0;
  always @ (*) begin
    CsrPlugin_jumpInterface_valid = 1'b0;
    if(_zz_215_)begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
    if(_zz_216_)begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_jumpInterface_payload = 32'h0;
    if(_zz_215_)begin
      CsrPlugin_jumpInterface_payload = {CsrPlugin_xtvec_base,(2'b00)};
    end
    if(_zz_216_)begin
      case(_zz_217_)
        2'b11 : begin
          CsrPlugin_jumpInterface_payload = CsrPlugin_mepc;
        end
        default : begin
        end
      endcase
    end
  end

  assign CsrPlugin_forceMachineWire = 1'b0;
  assign CsrPlugin_allowInterrupts = 1'b1;
  assign CsrPlugin_allowException = 1'b1;
  assign IBusCachedPlugin_externalFlush = ({writeBack_arbitration_flushNext,{memory_arbitration_flushNext,{execute_arbitration_flushNext,decode_arbitration_flushNext}}} != (4'b0000));
  assign IBusCachedPlugin_jump_pcLoad_valid = ({BranchPlugin_jumpInterface_valid,{CsrPlugin_jumpInterface_valid,{DBusCachedPlugin_redoBranch_valid,IBusCachedPlugin_predictionJumpInterface_valid}}} != (4'b0000));
  assign _zz_55_ = {IBusCachedPlugin_predictionJumpInterface_valid,{BranchPlugin_jumpInterface_valid,{CsrPlugin_jumpInterface_valid,DBusCachedPlugin_redoBranch_valid}}};
  assign _zz_56_ = (_zz_55_ & (~ _zz_270_));
  assign _zz_57_ = _zz_56_[3];
  assign _zz_58_ = (_zz_56_[1] || _zz_57_);
  assign _zz_59_ = (_zz_56_[2] || _zz_57_);
  assign IBusCachedPlugin_jump_pcLoad_payload = _zz_204_;
  always @ (*) begin
    IBusCachedPlugin_fetchPc_correction = 1'b0;
    if(IBusCachedPlugin_fetchPc_redo_valid)begin
      IBusCachedPlugin_fetchPc_correction = 1'b1;
    end
    if(IBusCachedPlugin_jump_pcLoad_valid)begin
      IBusCachedPlugin_fetchPc_correction = 1'b1;
    end
  end

  assign IBusCachedPlugin_fetchPc_corrected = (IBusCachedPlugin_fetchPc_correction || IBusCachedPlugin_fetchPc_correctionReg);
  always @ (*) begin
    IBusCachedPlugin_fetchPc_pcRegPropagate = 1'b0;
    if(IBusCachedPlugin_iBusRsp_stages_1_input_ready)begin
      IBusCachedPlugin_fetchPc_pcRegPropagate = 1'b1;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_fetchPc_pc = (IBusCachedPlugin_fetchPc_pcReg + _zz_272_);
    if(IBusCachedPlugin_fetchPc_redo_valid)begin
      IBusCachedPlugin_fetchPc_pc = IBusCachedPlugin_fetchPc_redo_payload;
    end
    if(IBusCachedPlugin_jump_pcLoad_valid)begin
      IBusCachedPlugin_fetchPc_pc = IBusCachedPlugin_jump_pcLoad_payload;
    end
    IBusCachedPlugin_fetchPc_pc[0] = 1'b0;
    IBusCachedPlugin_fetchPc_pc[1] = 1'b0;
  end

  always @ (*) begin
    IBusCachedPlugin_fetchPc_flushed = 1'b0;
    if(IBusCachedPlugin_fetchPc_redo_valid)begin
      IBusCachedPlugin_fetchPc_flushed = 1'b1;
    end
    if(IBusCachedPlugin_jump_pcLoad_valid)begin
      IBusCachedPlugin_fetchPc_flushed = 1'b1;
    end
  end

  assign IBusCachedPlugin_fetchPc_output_valid = ((! IBusCachedPlugin_fetcherHalt) && IBusCachedPlugin_fetchPc_booted);
  assign IBusCachedPlugin_fetchPc_output_payload = IBusCachedPlugin_fetchPc_pc;
  always @ (*) begin
    IBusCachedPlugin_iBusRsp_redoFetch = 1'b0;
    if(IBusCachedPlugin_rsp_redoFetch)begin
      IBusCachedPlugin_iBusRsp_redoFetch = 1'b1;
    end
  end

  assign IBusCachedPlugin_iBusRsp_stages_0_input_valid = IBusCachedPlugin_fetchPc_output_valid;
  assign IBusCachedPlugin_fetchPc_output_ready = IBusCachedPlugin_iBusRsp_stages_0_input_ready;
  assign IBusCachedPlugin_iBusRsp_stages_0_input_payload = IBusCachedPlugin_fetchPc_output_payload;
  assign IBusCachedPlugin_iBusRsp_stages_0_halt = 1'b0;
  assign _zz_60_ = (! IBusCachedPlugin_iBusRsp_stages_0_halt);
  assign IBusCachedPlugin_iBusRsp_stages_0_input_ready = (IBusCachedPlugin_iBusRsp_stages_0_output_ready && _zz_60_);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_valid = (IBusCachedPlugin_iBusRsp_stages_0_input_valid && _zz_60_);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_payload = IBusCachedPlugin_iBusRsp_stages_0_input_payload;
  always @ (*) begin
    IBusCachedPlugin_iBusRsp_stages_1_halt = 1'b0;
    if(IBusCachedPlugin_cache_io_cpu_prefetch_haltIt)begin
      IBusCachedPlugin_iBusRsp_stages_1_halt = 1'b1;
    end
  end

  assign _zz_61_ = (! IBusCachedPlugin_iBusRsp_stages_1_halt);
  assign IBusCachedPlugin_iBusRsp_stages_1_input_ready = (IBusCachedPlugin_iBusRsp_stages_1_output_ready && _zz_61_);
  assign IBusCachedPlugin_iBusRsp_stages_1_output_valid = (IBusCachedPlugin_iBusRsp_stages_1_input_valid && _zz_61_);
  assign IBusCachedPlugin_iBusRsp_stages_1_output_payload = IBusCachedPlugin_iBusRsp_stages_1_input_payload;
  always @ (*) begin
    IBusCachedPlugin_iBusRsp_stages_2_halt = 1'b0;
    if(IBusCachedPlugin_cache_io_cpu_fetch_haltIt)begin
      IBusCachedPlugin_iBusRsp_stages_2_halt = 1'b1;
    end
  end

  assign _zz_62_ = (! IBusCachedPlugin_iBusRsp_stages_2_halt);
  assign IBusCachedPlugin_iBusRsp_stages_2_input_ready = (IBusCachedPlugin_iBusRsp_stages_2_output_ready && _zz_62_);
  assign IBusCachedPlugin_iBusRsp_stages_2_output_valid = (IBusCachedPlugin_iBusRsp_stages_2_input_valid && _zz_62_);
  assign IBusCachedPlugin_iBusRsp_stages_2_output_payload = IBusCachedPlugin_iBusRsp_stages_2_input_payload;
  always @ (*) begin
    IBusCachedPlugin_iBusRsp_stages_3_halt = 1'b0;
    if((_zz_51_ || IBusCachedPlugin_rsp_iBusRspOutputHalt))begin
      IBusCachedPlugin_iBusRsp_stages_3_halt = 1'b1;
    end
  end

  assign _zz_63_ = (! IBusCachedPlugin_iBusRsp_stages_3_halt);
  assign IBusCachedPlugin_iBusRsp_stages_3_input_ready = (IBusCachedPlugin_iBusRsp_stages_3_output_ready && _zz_63_);
  assign IBusCachedPlugin_iBusRsp_stages_3_output_valid = (IBusCachedPlugin_iBusRsp_stages_3_input_valid && _zz_63_);
  assign IBusCachedPlugin_iBusRsp_stages_3_output_payload = IBusCachedPlugin_iBusRsp_stages_3_input_payload;
  assign IBusCachedPlugin_fetchPc_redo_valid = IBusCachedPlugin_iBusRsp_redoFetch;
  assign IBusCachedPlugin_fetchPc_redo_payload = IBusCachedPlugin_iBusRsp_stages_3_input_payload;
  assign IBusCachedPlugin_iBusRsp_flush = (IBusCachedPlugin_externalFlush || IBusCachedPlugin_iBusRsp_redoFetch);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_ready = _zz_64_;
  assign _zz_64_ = ((1'b0 && (! _zz_65_)) || IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign _zz_65_ = _zz_66_;
  assign IBusCachedPlugin_iBusRsp_stages_1_input_valid = _zz_65_;
  assign IBusCachedPlugin_iBusRsp_stages_1_input_payload = IBusCachedPlugin_fetchPc_pcReg;
  assign IBusCachedPlugin_iBusRsp_stages_1_output_ready = ((1'b0 && (! _zz_67_)) || IBusCachedPlugin_iBusRsp_stages_2_input_ready);
  assign _zz_67_ = _zz_68_;
  assign IBusCachedPlugin_iBusRsp_stages_2_input_valid = _zz_67_;
  assign IBusCachedPlugin_iBusRsp_stages_2_input_payload = _zz_69_;
  assign IBusCachedPlugin_iBusRsp_stages_2_output_ready = ((1'b0 && (! _zz_70_)) || IBusCachedPlugin_iBusRsp_stages_3_input_ready);
  assign _zz_70_ = _zz_71_;
  assign IBusCachedPlugin_iBusRsp_stages_3_input_valid = _zz_70_;
  assign IBusCachedPlugin_iBusRsp_stages_3_input_payload = _zz_72_;
  always @ (*) begin
    IBusCachedPlugin_iBusRsp_readyForError = 1'b1;
    if(IBusCachedPlugin_injector_decodeInput_valid)begin
      IBusCachedPlugin_iBusRsp_readyForError = 1'b0;
    end
    if((! IBusCachedPlugin_pcValids_0))begin
      IBusCachedPlugin_iBusRsp_readyForError = 1'b0;
    end
  end

  assign IBusCachedPlugin_iBusRsp_output_ready = ((1'b0 && (! IBusCachedPlugin_injector_decodeInput_valid)) || IBusCachedPlugin_injector_decodeInput_ready);
  assign IBusCachedPlugin_injector_decodeInput_valid = _zz_73_;
  assign IBusCachedPlugin_injector_decodeInput_payload_pc = _zz_74_;
  assign IBusCachedPlugin_injector_decodeInput_payload_rsp_error = _zz_75_;
  assign IBusCachedPlugin_injector_decodeInput_payload_rsp_inst = _zz_76_;
  assign IBusCachedPlugin_injector_decodeInput_payload_isRvc = _zz_77_;
  assign IBusCachedPlugin_pcValids_0 = IBusCachedPlugin_injector_nextPcCalc_valids_3;
  assign IBusCachedPlugin_pcValids_1 = IBusCachedPlugin_injector_nextPcCalc_valids_4;
  assign IBusCachedPlugin_pcValids_2 = IBusCachedPlugin_injector_nextPcCalc_valids_5;
  assign IBusCachedPlugin_pcValids_3 = IBusCachedPlugin_injector_nextPcCalc_valids_6;
  assign IBusCachedPlugin_injector_decodeInput_ready = (! decode_arbitration_isStuck);
  assign decode_arbitration_isValid = IBusCachedPlugin_injector_decodeInput_valid;
  assign _zz_78_ = _zz_273_[11];
  always @ (*) begin
    _zz_79_[18] = _zz_78_;
    _zz_79_[17] = _zz_78_;
    _zz_79_[16] = _zz_78_;
    _zz_79_[15] = _zz_78_;
    _zz_79_[14] = _zz_78_;
    _zz_79_[13] = _zz_78_;
    _zz_79_[12] = _zz_78_;
    _zz_79_[11] = _zz_78_;
    _zz_79_[10] = _zz_78_;
    _zz_79_[9] = _zz_78_;
    _zz_79_[8] = _zz_78_;
    _zz_79_[7] = _zz_78_;
    _zz_79_[6] = _zz_78_;
    _zz_79_[5] = _zz_78_;
    _zz_79_[4] = _zz_78_;
    _zz_79_[3] = _zz_78_;
    _zz_79_[2] = _zz_78_;
    _zz_79_[1] = _zz_78_;
    _zz_79_[0] = _zz_78_;
  end

  always @ (*) begin
    IBusCachedPlugin_decodePrediction_cmd_hadBranch = ((decode_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JAL) || ((decode_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_B) && _zz_274_[31]));
    if(_zz_84_)begin
      IBusCachedPlugin_decodePrediction_cmd_hadBranch = 1'b0;
    end
  end

  assign _zz_80_ = _zz_275_[19];
  always @ (*) begin
    _zz_81_[10] = _zz_80_;
    _zz_81_[9] = _zz_80_;
    _zz_81_[8] = _zz_80_;
    _zz_81_[7] = _zz_80_;
    _zz_81_[6] = _zz_80_;
    _zz_81_[5] = _zz_80_;
    _zz_81_[4] = _zz_80_;
    _zz_81_[3] = _zz_80_;
    _zz_81_[2] = _zz_80_;
    _zz_81_[1] = _zz_80_;
    _zz_81_[0] = _zz_80_;
  end

  assign _zz_82_ = _zz_276_[11];
  always @ (*) begin
    _zz_83_[18] = _zz_82_;
    _zz_83_[17] = _zz_82_;
    _zz_83_[16] = _zz_82_;
    _zz_83_[15] = _zz_82_;
    _zz_83_[14] = _zz_82_;
    _zz_83_[13] = _zz_82_;
    _zz_83_[12] = _zz_82_;
    _zz_83_[11] = _zz_82_;
    _zz_83_[10] = _zz_82_;
    _zz_83_[9] = _zz_82_;
    _zz_83_[8] = _zz_82_;
    _zz_83_[7] = _zz_82_;
    _zz_83_[6] = _zz_82_;
    _zz_83_[5] = _zz_82_;
    _zz_83_[4] = _zz_82_;
    _zz_83_[3] = _zz_82_;
    _zz_83_[2] = _zz_82_;
    _zz_83_[1] = _zz_82_;
    _zz_83_[0] = _zz_82_;
  end

  always @ (*) begin
    case(decode_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_84_ = _zz_277_[1];
      end
      default : begin
        _zz_84_ = _zz_278_[1];
      end
    endcase
  end

  assign IBusCachedPlugin_predictionJumpInterface_valid = (decode_arbitration_isValid && IBusCachedPlugin_decodePrediction_cmd_hadBranch);
  assign _zz_85_ = _zz_279_[19];
  always @ (*) begin
    _zz_86_[10] = _zz_85_;
    _zz_86_[9] = _zz_85_;
    _zz_86_[8] = _zz_85_;
    _zz_86_[7] = _zz_85_;
    _zz_86_[6] = _zz_85_;
    _zz_86_[5] = _zz_85_;
    _zz_86_[4] = _zz_85_;
    _zz_86_[3] = _zz_85_;
    _zz_86_[2] = _zz_85_;
    _zz_86_[1] = _zz_85_;
    _zz_86_[0] = _zz_85_;
  end

  assign _zz_87_ = _zz_280_[11];
  always @ (*) begin
    _zz_88_[18] = _zz_87_;
    _zz_88_[17] = _zz_87_;
    _zz_88_[16] = _zz_87_;
    _zz_88_[15] = _zz_87_;
    _zz_88_[14] = _zz_87_;
    _zz_88_[13] = _zz_87_;
    _zz_88_[12] = _zz_87_;
    _zz_88_[11] = _zz_87_;
    _zz_88_[10] = _zz_87_;
    _zz_88_[9] = _zz_87_;
    _zz_88_[8] = _zz_87_;
    _zz_88_[7] = _zz_87_;
    _zz_88_[6] = _zz_87_;
    _zz_88_[5] = _zz_87_;
    _zz_88_[4] = _zz_87_;
    _zz_88_[3] = _zz_87_;
    _zz_88_[2] = _zz_87_;
    _zz_88_[1] = _zz_87_;
    _zz_88_[0] = _zz_87_;
  end

  assign IBusCachedPlugin_predictionJumpInterface_payload = (decode_PC + ((decode_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JAL) ? {{_zz_86_,{{{_zz_333_,decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]}},1'b0} : {{_zz_88_,{{{_zz_334_,_zz_335_},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0}));
  assign iBus_cmd_valid = IBusCachedPlugin_cache_io_mem_cmd_valid;
  always @ (*) begin
    iBus_cmd_payload_address = IBusCachedPlugin_cache_io_mem_cmd_payload_address;
    iBus_cmd_payload_address = IBusCachedPlugin_cache_io_mem_cmd_payload_address;
  end

  assign iBus_cmd_payload_size = IBusCachedPlugin_cache_io_mem_cmd_payload_size;
  assign IBusCachedPlugin_s0_tightlyCoupledHit = 1'b0;
  assign _zz_179_ = (IBusCachedPlugin_iBusRsp_stages_1_input_valid && (! IBusCachedPlugin_s0_tightlyCoupledHit));
  assign _zz_180_ = (IBusCachedPlugin_iBusRsp_stages_2_input_valid && (! IBusCachedPlugin_s1_tightlyCoupledHit));
  assign _zz_181_ = (! IBusCachedPlugin_iBusRsp_stages_2_input_ready);
  assign _zz_182_ = (IBusCachedPlugin_iBusRsp_stages_3_input_valid && (! IBusCachedPlugin_s2_tightlyCoupledHit));
  assign _zz_183_ = (! IBusCachedPlugin_iBusRsp_stages_3_input_ready);
  assign _zz_184_ = (CsrPlugin_privilege == (2'b00));
  assign IBusCachedPlugin_rsp_iBusRspOutputHalt = 1'b0;
  assign IBusCachedPlugin_rsp_issueDetected = 1'b0;
  always @ (*) begin
    IBusCachedPlugin_rsp_redoFetch = 1'b0;
    if(_zz_214_)begin
      IBusCachedPlugin_rsp_redoFetch = 1'b1;
    end
    if(_zz_212_)begin
      IBusCachedPlugin_rsp_redoFetch = 1'b1;
    end
  end

  always @ (*) begin
    _zz_185_ = (IBusCachedPlugin_rsp_redoFetch && (! IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling));
    if(_zz_212_)begin
      _zz_185_ = 1'b1;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_decodeExceptionPort_valid = 1'b0;
    if(_zz_213_)begin
      IBusCachedPlugin_decodeExceptionPort_valid = IBusCachedPlugin_iBusRsp_readyForError;
    end
    if(_zz_211_)begin
      IBusCachedPlugin_decodeExceptionPort_valid = IBusCachedPlugin_iBusRsp_readyForError;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_decodeExceptionPort_payload_code = (4'bxxxx);
    if(_zz_213_)begin
      IBusCachedPlugin_decodeExceptionPort_payload_code = (4'b1100);
    end
    if(_zz_211_)begin
      IBusCachedPlugin_decodeExceptionPort_payload_code = (4'b0001);
    end
  end

  assign IBusCachedPlugin_decodeExceptionPort_payload_badAddr = {IBusCachedPlugin_iBusRsp_stages_3_input_payload[31 : 2],(2'b00)};
  assign IBusCachedPlugin_iBusRsp_output_valid = IBusCachedPlugin_iBusRsp_stages_3_output_valid;
  assign IBusCachedPlugin_iBusRsp_stages_3_output_ready = IBusCachedPlugin_iBusRsp_output_ready;
  assign IBusCachedPlugin_iBusRsp_output_payload_rsp_inst = IBusCachedPlugin_cache_io_cpu_decode_data;
  assign IBusCachedPlugin_iBusRsp_output_payload_pc = IBusCachedPlugin_iBusRsp_stages_3_output_payload;
  assign IBusCachedPlugin_mmuBus_cmd_isValid = IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_isValid;
  assign IBusCachedPlugin_mmuBus_cmd_virtualAddress = IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_virtualAddress;
  assign IBusCachedPlugin_mmuBus_cmd_bypassTranslation = IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_bypassTranslation;
  assign IBusCachedPlugin_mmuBus_end = IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_end;
  assign _zz_178_ = (decode_arbitration_isValid && decode_FLUSH_ALL);
  assign dataCache_1__io_mem_cmd_s2mPipe_valid = (dataCache_1__io_mem_cmd_valid || dataCache_1__io_mem_cmd_s2mPipe_rValid);
  assign _zz_198_ = (! dataCache_1__io_mem_cmd_s2mPipe_rValid);
  assign dataCache_1__io_mem_cmd_s2mPipe_payload_wr = (dataCache_1__io_mem_cmd_s2mPipe_rValid ? dataCache_1__io_mem_cmd_s2mPipe_rData_wr : dataCache_1__io_mem_cmd_payload_wr);
  assign dataCache_1__io_mem_cmd_s2mPipe_payload_address = (dataCache_1__io_mem_cmd_s2mPipe_rValid ? dataCache_1__io_mem_cmd_s2mPipe_rData_address : dataCache_1__io_mem_cmd_payload_address);
  assign dataCache_1__io_mem_cmd_s2mPipe_payload_data = (dataCache_1__io_mem_cmd_s2mPipe_rValid ? dataCache_1__io_mem_cmd_s2mPipe_rData_data : dataCache_1__io_mem_cmd_payload_data);
  assign dataCache_1__io_mem_cmd_s2mPipe_payload_mask = (dataCache_1__io_mem_cmd_s2mPipe_rValid ? dataCache_1__io_mem_cmd_s2mPipe_rData_mask : dataCache_1__io_mem_cmd_payload_mask);
  assign dataCache_1__io_mem_cmd_s2mPipe_payload_length = (dataCache_1__io_mem_cmd_s2mPipe_rValid ? dataCache_1__io_mem_cmd_s2mPipe_rData_length : dataCache_1__io_mem_cmd_payload_length);
  assign dataCache_1__io_mem_cmd_s2mPipe_payload_last = (dataCache_1__io_mem_cmd_s2mPipe_rValid ? dataCache_1__io_mem_cmd_s2mPipe_rData_last : dataCache_1__io_mem_cmd_payload_last);
  assign dataCache_1__io_mem_cmd_s2mPipe_ready = ((1'b1 && (! dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_valid)) || dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_ready);
  assign dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_valid = dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_rValid;
  assign dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_wr = dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_rData_wr;
  assign dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_address = dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_rData_address;
  assign dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_data = dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_rData_data;
  assign dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_mask = dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_rData_mask;
  assign dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_length = dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_rData_length;
  assign dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_last = dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_rData_last;
  assign dBus_cmd_valid = dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_valid;
  assign dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_ready = dBus_cmd_ready;
  assign dBus_cmd_payload_wr = dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_wr;
  assign dBus_cmd_payload_address = dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_address;
  assign dBus_cmd_payload_data = dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_data;
  assign dBus_cmd_payload_mask = dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_mask;
  assign dBus_cmd_payload_length = dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_length;
  assign dBus_cmd_payload_last = dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_last;
  assign execute_DBusCachedPlugin_size = execute_INSTRUCTION[13 : 12];
  assign _zz_186_ = (execute_arbitration_isValid && execute_MEMORY_ENABLE);
  assign _zz_187_ = execute_SRC_ADD;
  always @ (*) begin
    case(execute_DBusCachedPlugin_size)
      2'b00 : begin
        _zz_91_ = {{{execute_RS2[7 : 0],execute_RS2[7 : 0]},execute_RS2[7 : 0]},execute_RS2[7 : 0]};
      end
      2'b01 : begin
        _zz_91_ = {execute_RS2[15 : 0],execute_RS2[15 : 0]};
      end
      default : begin
        _zz_91_ = execute_RS2[31 : 0];
      end
    endcase
  end

  assign _zz_197_ = (execute_arbitration_isValid && execute_MEMORY_MANAGMENT);
  always @ (*) begin
    _zz_188_ = 1'b0;
    if(execute_MEMORY_LRSC)begin
      _zz_188_ = 1'b1;
    end
  end

  assign _zz_190_ = execute_INSTRUCTION[31 : 29];
  assign _zz_189_ = execute_INSTRUCTION[27];
  assign _zz_191_ = (memory_arbitration_isValid && memory_MEMORY_ENABLE);
  assign _zz_192_ = memory_REGFILE_WRITE_DATA;
  assign DBusCachedPlugin_mmuBus_cmd_isValid = dataCache_1__io_cpu_memory_mmuBus_cmd_isValid;
  assign DBusCachedPlugin_mmuBus_cmd_virtualAddress = dataCache_1__io_cpu_memory_mmuBus_cmd_virtualAddress;
  assign DBusCachedPlugin_mmuBus_cmd_bypassTranslation = dataCache_1__io_cpu_memory_mmuBus_cmd_bypassTranslation;
  always @ (*) begin
    _zz_193_ = DBusCachedPlugin_mmuBus_rsp_isIoAccess;
    if((1'b0 && (! dataCache_1__io_cpu_memory_isWrite)))begin
      _zz_193_ = 1'b1;
    end
  end

  assign DBusCachedPlugin_mmuBus_end = dataCache_1__io_cpu_memory_mmuBus_end;
  assign _zz_194_ = (writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE);
  assign _zz_195_ = (CsrPlugin_privilege == (2'b00));
  assign _zz_196_ = writeBack_REGFILE_WRITE_DATA;
  always @ (*) begin
    DBusCachedPlugin_redoBranch_valid = 1'b0;
    if(_zz_218_)begin
      if(dataCache_1__io_cpu_redo)begin
        DBusCachedPlugin_redoBranch_valid = 1'b1;
      end
    end
  end

  assign DBusCachedPlugin_redoBranch_payload = writeBack_PC;
  always @ (*) begin
    DBusCachedPlugin_exceptionBus_valid = 1'b0;
    if(_zz_218_)begin
      if(dataCache_1__io_cpu_writeBack_accessError)begin
        DBusCachedPlugin_exceptionBus_valid = 1'b1;
      end
      if(dataCache_1__io_cpu_writeBack_unalignedAccess)begin
        DBusCachedPlugin_exceptionBus_valid = 1'b1;
      end
      if(dataCache_1__io_cpu_writeBack_mmuException)begin
        DBusCachedPlugin_exceptionBus_valid = 1'b1;
      end
      if(dataCache_1__io_cpu_redo)begin
        DBusCachedPlugin_exceptionBus_valid = 1'b0;
      end
    end
  end

  assign DBusCachedPlugin_exceptionBus_payload_badAddr = writeBack_REGFILE_WRITE_DATA;
  always @ (*) begin
    DBusCachedPlugin_exceptionBus_payload_code = (4'bxxxx);
    if(_zz_218_)begin
      if(dataCache_1__io_cpu_writeBack_accessError)begin
        DBusCachedPlugin_exceptionBus_payload_code = {1'd0, _zz_281_};
      end
      if(dataCache_1__io_cpu_writeBack_unalignedAccess)begin
        DBusCachedPlugin_exceptionBus_payload_code = {1'd0, _zz_282_};
      end
      if(dataCache_1__io_cpu_writeBack_mmuException)begin
        DBusCachedPlugin_exceptionBus_payload_code = (writeBack_MEMORY_WR ? (4'b1111) : (4'b1101));
      end
    end
  end

  always @ (*) begin
    writeBack_DBusCachedPlugin_rspShifted = dataCache_1__io_cpu_writeBack_data;
    case(writeBack_MEMORY_ADDRESS_LOW)
      2'b01 : begin
        writeBack_DBusCachedPlugin_rspShifted[7 : 0] = dataCache_1__io_cpu_writeBack_data[15 : 8];
      end
      2'b10 : begin
        writeBack_DBusCachedPlugin_rspShifted[15 : 0] = dataCache_1__io_cpu_writeBack_data[31 : 16];
      end
      2'b11 : begin
        writeBack_DBusCachedPlugin_rspShifted[7 : 0] = dataCache_1__io_cpu_writeBack_data[31 : 24];
      end
      default : begin
      end
    endcase
  end

  assign _zz_92_ = (writeBack_DBusCachedPlugin_rspShifted[7] && (! writeBack_INSTRUCTION[14]));
  always @ (*) begin
    _zz_93_[31] = _zz_92_;
    _zz_93_[30] = _zz_92_;
    _zz_93_[29] = _zz_92_;
    _zz_93_[28] = _zz_92_;
    _zz_93_[27] = _zz_92_;
    _zz_93_[26] = _zz_92_;
    _zz_93_[25] = _zz_92_;
    _zz_93_[24] = _zz_92_;
    _zz_93_[23] = _zz_92_;
    _zz_93_[22] = _zz_92_;
    _zz_93_[21] = _zz_92_;
    _zz_93_[20] = _zz_92_;
    _zz_93_[19] = _zz_92_;
    _zz_93_[18] = _zz_92_;
    _zz_93_[17] = _zz_92_;
    _zz_93_[16] = _zz_92_;
    _zz_93_[15] = _zz_92_;
    _zz_93_[14] = _zz_92_;
    _zz_93_[13] = _zz_92_;
    _zz_93_[12] = _zz_92_;
    _zz_93_[11] = _zz_92_;
    _zz_93_[10] = _zz_92_;
    _zz_93_[9] = _zz_92_;
    _zz_93_[8] = _zz_92_;
    _zz_93_[7 : 0] = writeBack_DBusCachedPlugin_rspShifted[7 : 0];
  end

  assign _zz_94_ = (writeBack_DBusCachedPlugin_rspShifted[15] && (! writeBack_INSTRUCTION[14]));
  always @ (*) begin
    _zz_95_[31] = _zz_94_;
    _zz_95_[30] = _zz_94_;
    _zz_95_[29] = _zz_94_;
    _zz_95_[28] = _zz_94_;
    _zz_95_[27] = _zz_94_;
    _zz_95_[26] = _zz_94_;
    _zz_95_[25] = _zz_94_;
    _zz_95_[24] = _zz_94_;
    _zz_95_[23] = _zz_94_;
    _zz_95_[22] = _zz_94_;
    _zz_95_[21] = _zz_94_;
    _zz_95_[20] = _zz_94_;
    _zz_95_[19] = _zz_94_;
    _zz_95_[18] = _zz_94_;
    _zz_95_[17] = _zz_94_;
    _zz_95_[16] = _zz_94_;
    _zz_95_[15 : 0] = writeBack_DBusCachedPlugin_rspShifted[15 : 0];
  end

  always @ (*) begin
    case(_zz_236_)
      2'b00 : begin
        writeBack_DBusCachedPlugin_rspFormated = _zz_93_;
      end
      2'b01 : begin
        writeBack_DBusCachedPlugin_rspFormated = _zz_95_;
      end
      default : begin
        writeBack_DBusCachedPlugin_rspFormated = writeBack_DBusCachedPlugin_rspShifted;
      end
    endcase
  end

  assign IBusCachedPlugin_mmuBus_rsp_physicalAddress = IBusCachedPlugin_mmuBus_cmd_virtualAddress;
  assign IBusCachedPlugin_mmuBus_rsp_allowRead = 1'b1;
  assign IBusCachedPlugin_mmuBus_rsp_allowWrite = 1'b1;
  assign IBusCachedPlugin_mmuBus_rsp_allowExecute = 1'b1;
  assign IBusCachedPlugin_mmuBus_rsp_isIoAccess = (IBusCachedPlugin_mmuBus_rsp_physicalAddress[31 : 31] == (1'b1));
  assign IBusCachedPlugin_mmuBus_rsp_exception = 1'b0;
  assign IBusCachedPlugin_mmuBus_rsp_refilling = 1'b0;
  assign IBusCachedPlugin_mmuBus_busy = 1'b0;
  assign DBusCachedPlugin_mmuBus_rsp_physicalAddress = DBusCachedPlugin_mmuBus_cmd_virtualAddress;
  assign DBusCachedPlugin_mmuBus_rsp_allowRead = 1'b1;
  assign DBusCachedPlugin_mmuBus_rsp_allowWrite = 1'b1;
  assign DBusCachedPlugin_mmuBus_rsp_allowExecute = 1'b1;
  assign DBusCachedPlugin_mmuBus_rsp_isIoAccess = (DBusCachedPlugin_mmuBus_rsp_physicalAddress[31 : 31] == (1'b1));
  assign DBusCachedPlugin_mmuBus_rsp_exception = 1'b0;
  assign DBusCachedPlugin_mmuBus_rsp_refilling = 1'b0;
  assign DBusCachedPlugin_mmuBus_busy = 1'b0;
  always @ (*) begin
    CsrPlugin_privilege = (2'b11);
    if(CsrPlugin_forceMachineWire)begin
      CsrPlugin_privilege = (2'b11);
    end
  end

  assign CsrPlugin_misa_base = (2'b01);
  assign CsrPlugin_misa_extensions = 26'h0000042;
  assign _zz_96_ = (CsrPlugin_mip_MTIP && CsrPlugin_mie_MTIE);
  assign _zz_97_ = (CsrPlugin_mip_MSIP && CsrPlugin_mie_MSIE);
  assign _zz_98_ = (CsrPlugin_mip_MEIP && CsrPlugin_mie_MEIE);
  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = (2'b11);
  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege = ((CsrPlugin_privilege < CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped) ? CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped : CsrPlugin_privilege);
  always @ (*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_decode = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
    if(IBusCachedPlugin_decodeExceptionPort_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_decode = 1'b1;
    end
    if(decode_arbitration_isFlushed)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_decode = 1'b0;
    end
  end

  always @ (*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_execute = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
    if(execute_arbitration_isFlushed)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_execute = 1'b0;
    end
  end

  always @ (*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_memory = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
    if(memory_arbitration_isFlushed)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_memory = 1'b0;
    end
  end

  always @ (*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
    if(DBusCachedPlugin_exceptionBus_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack = 1'b1;
    end
    if(writeBack_arbitration_isFlushed)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack = 1'b0;
    end
  end

  assign CsrPlugin_exceptionPendings_0 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  assign CsrPlugin_exceptionPendings_1 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
  assign CsrPlugin_exceptionPendings_2 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
  assign CsrPlugin_exceptionPendings_3 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
  assign CsrPlugin_exception = (CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack && CsrPlugin_allowException);
  assign CsrPlugin_lastStageWasWfi = 1'b0;
  assign CsrPlugin_pipelineLiberator_active = ((CsrPlugin_interrupt_valid && CsrPlugin_allowInterrupts) && decode_arbitration_isValid);
  always @ (*) begin
    CsrPlugin_pipelineLiberator_done = CsrPlugin_pipelineLiberator_pcValids_2;
    if(({CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack,{CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory,CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute}} != (3'b000)))begin
      CsrPlugin_pipelineLiberator_done = 1'b0;
    end
    if(CsrPlugin_hadException)begin
      CsrPlugin_pipelineLiberator_done = 1'b0;
    end
  end

  assign CsrPlugin_interruptJump = ((CsrPlugin_interrupt_valid && CsrPlugin_pipelineLiberator_done) && CsrPlugin_allowInterrupts);
  always @ (*) begin
    CsrPlugin_targetPrivilege = CsrPlugin_interrupt_targetPrivilege;
    if(CsrPlugin_hadException)begin
      CsrPlugin_targetPrivilege = CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege;
    end
  end

  always @ (*) begin
    CsrPlugin_trapCause = CsrPlugin_interrupt_code;
    if(CsrPlugin_hadException)begin
      CsrPlugin_trapCause = CsrPlugin_exceptionPortCtrl_exceptionContext_code;
    end
  end

  always @ (*) begin
    CsrPlugin_xtvec_mode = (2'bxx);
    case(CsrPlugin_targetPrivilege)
      2'b11 : begin
        CsrPlugin_xtvec_mode = CsrPlugin_mtvec_mode;
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    CsrPlugin_xtvec_base = 30'h0;
    case(CsrPlugin_targetPrivilege)
      2'b11 : begin
        CsrPlugin_xtvec_base = CsrPlugin_mtvec_base;
      end
      default : begin
      end
    endcase
  end

  assign contextSwitching = CsrPlugin_jumpInterface_valid;
  assign execute_CsrPlugin_blockedBySideEffects = ({writeBack_arbitration_isValid,memory_arbitration_isValid} != (2'b00));
  always @ (*) begin
    execute_CsrPlugin_illegalAccess = 1'b1;
    if(execute_CsrPlugin_csr_768)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_836)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_772)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_773)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_834)begin
      if(execute_CSR_READ_OPCODE)begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_2816)begin
      if(execute_CSR_READ_OPCODE)begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_2944)begin
      if(execute_CSR_READ_OPCODE)begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_3072)begin
      if(execute_CSR_READ_OPCODE)begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_3200)begin
      if(execute_CSR_READ_OPCODE)begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(_zz_219_)begin
      execute_CsrPlugin_illegalAccess = 1'b1;
    end
    if(((! execute_arbitration_isValid) || (! execute_IS_CSR)))begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
  end

  always @ (*) begin
    execute_CsrPlugin_illegalInstruction = 1'b0;
    if((execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)))begin
      if((CsrPlugin_privilege < execute_INSTRUCTION[29 : 28]))begin
        execute_CsrPlugin_illegalInstruction = 1'b1;
      end
    end
  end

  always @ (*) begin
    execute_CsrPlugin_writeInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_WRITE_OPCODE);
    if(_zz_219_)begin
      execute_CsrPlugin_writeInstruction = 1'b0;
    end
  end

  always @ (*) begin
    execute_CsrPlugin_readInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_READ_OPCODE);
    if(_zz_219_)begin
      execute_CsrPlugin_readInstruction = 1'b0;
    end
  end

  assign execute_CsrPlugin_writeEnable = (execute_CsrPlugin_writeInstruction && (! execute_arbitration_isStuck));
  assign execute_CsrPlugin_readEnable = (execute_CsrPlugin_readInstruction && (! execute_arbitration_isStuck));
  assign execute_CsrPlugin_readToWriteData = execute_CsrPlugin_readData;
  always @ (*) begin
    case(_zz_237_)
      1'b0 : begin
        execute_CsrPlugin_writeData = execute_SRC1;
      end
      default : begin
        execute_CsrPlugin_writeData = (execute_INSTRUCTION[12] ? (execute_CsrPlugin_readToWriteData & (~ execute_SRC1)) : (execute_CsrPlugin_readToWriteData | execute_SRC1));
      end
    endcase
  end

  assign execute_CsrPlugin_csrAddress = execute_INSTRUCTION[31 : 20];
  assign _zz_100_ = ((decode_INSTRUCTION & 32'h0000000c) == 32'h00000004);
  assign _zz_101_ = ((decode_INSTRUCTION & 32'h00001000) == 32'h0);
  assign _zz_102_ = ((decode_INSTRUCTION & 32'h00000004) == 32'h00000004);
  assign _zz_103_ = ((decode_INSTRUCTION & 32'h00002050) == 32'h00002000);
  assign _zz_104_ = ((decode_INSTRUCTION & 32'h00004050) == 32'h00004050);
  assign _zz_105_ = ((decode_INSTRUCTION & 32'h00000048) == 32'h00000048);
  assign _zz_99_ = {({_zz_105_,(_zz_336_ == _zz_337_)} != (2'b00)),{((_zz_338_ == _zz_339_) != (1'b0)),{(_zz_340_ != (1'b0)),{(_zz_341_ != _zz_342_),{_zz_343_,{_zz_344_,_zz_345_}}}}}};
  assign _zz_106_ = _zz_99_[3 : 2];
  assign _zz_45_ = _zz_106_;
  assign _zz_107_ = _zz_99_[8 : 7];
  assign _zz_44_ = _zz_107_;
  assign _zz_108_ = _zz_99_[15 : 14];
  assign _zz_43_ = _zz_108_;
  assign _zz_109_ = _zz_99_[17 : 16];
  assign _zz_42_ = _zz_109_;
  assign _zz_110_ = _zz_99_[24 : 23];
  assign _zz_41_ = _zz_110_;
  assign _zz_111_ = _zz_99_[25 : 25];
  assign _zz_40_ = _zz_111_;
  assign _zz_112_ = _zz_99_[32 : 31];
  assign _zz_39_ = _zz_112_;
  assign decode_RegFilePlugin_regFileReadAddress1 = decode_INSTRUCTION_ANTICIPATED[19 : 15];
  assign decode_RegFilePlugin_regFileReadAddress2 = decode_INSTRUCTION_ANTICIPATED[24 : 20];
  assign decode_RegFilePlugin_rs1Data = _zz_202_;
  assign decode_RegFilePlugin_rs2Data = _zz_203_;
  always @ (*) begin
    lastStageRegFileWrite_valid = (_zz_37_ && writeBack_arbitration_isFiring);
    if(_zz_113_)begin
      lastStageRegFileWrite_valid = 1'b1;
    end
  end

  assign lastStageRegFileWrite_payload_address = _zz_36_[11 : 7];
  assign lastStageRegFileWrite_payload_data = _zz_50_;
  always @ (*) begin
    case(execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 & execute_SRC2);
      end
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 | execute_SRC2);
      end
      default : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 ^ execute_SRC2);
      end
    endcase
  end

  always @ (*) begin
    case(execute_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_BITWISE : begin
        _zz_114_ = execute_IntAluPlugin_bitwise;
      end
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : begin
        _zz_114_ = {31'd0, _zz_283_};
      end
      default : begin
        _zz_114_ = execute_SRC_ADD_SUB;
      end
    endcase
  end

  always @ (*) begin
    case(execute_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : begin
        _zz_115_ = execute_RS1;
      end
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : begin
        _zz_115_ = {29'd0, _zz_284_};
      end
      `Src1CtrlEnum_defaultEncoding_IMU : begin
        _zz_115_ = {execute_INSTRUCTION[31 : 12],12'h0};
      end
      default : begin
        _zz_115_ = {27'd0, _zz_285_};
      end
    endcase
  end

  assign _zz_116_ = _zz_286_[11];
  always @ (*) begin
    _zz_117_[19] = _zz_116_;
    _zz_117_[18] = _zz_116_;
    _zz_117_[17] = _zz_116_;
    _zz_117_[16] = _zz_116_;
    _zz_117_[15] = _zz_116_;
    _zz_117_[14] = _zz_116_;
    _zz_117_[13] = _zz_116_;
    _zz_117_[12] = _zz_116_;
    _zz_117_[11] = _zz_116_;
    _zz_117_[10] = _zz_116_;
    _zz_117_[9] = _zz_116_;
    _zz_117_[8] = _zz_116_;
    _zz_117_[7] = _zz_116_;
    _zz_117_[6] = _zz_116_;
    _zz_117_[5] = _zz_116_;
    _zz_117_[4] = _zz_116_;
    _zz_117_[3] = _zz_116_;
    _zz_117_[2] = _zz_116_;
    _zz_117_[1] = _zz_116_;
    _zz_117_[0] = _zz_116_;
  end

  assign _zz_118_ = _zz_287_[11];
  always @ (*) begin
    _zz_119_[19] = _zz_118_;
    _zz_119_[18] = _zz_118_;
    _zz_119_[17] = _zz_118_;
    _zz_119_[16] = _zz_118_;
    _zz_119_[15] = _zz_118_;
    _zz_119_[14] = _zz_118_;
    _zz_119_[13] = _zz_118_;
    _zz_119_[12] = _zz_118_;
    _zz_119_[11] = _zz_118_;
    _zz_119_[10] = _zz_118_;
    _zz_119_[9] = _zz_118_;
    _zz_119_[8] = _zz_118_;
    _zz_119_[7] = _zz_118_;
    _zz_119_[6] = _zz_118_;
    _zz_119_[5] = _zz_118_;
    _zz_119_[4] = _zz_118_;
    _zz_119_[3] = _zz_118_;
    _zz_119_[2] = _zz_118_;
    _zz_119_[1] = _zz_118_;
    _zz_119_[0] = _zz_118_;
  end

  always @ (*) begin
    case(execute_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : begin
        _zz_120_ = execute_RS2;
      end
      `Src2CtrlEnum_defaultEncoding_IMI : begin
        _zz_120_ = {_zz_117_,execute_INSTRUCTION[31 : 20]};
      end
      `Src2CtrlEnum_defaultEncoding_IMS : begin
        _zz_120_ = {_zz_119_,{execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]}};
      end
      default : begin
        _zz_120_ = _zz_31_;
      end
    endcase
  end

  always @ (*) begin
    execute_SrcPlugin_addSub = _zz_288_;
    if(execute_SRC2_FORCE_ZERO)begin
      execute_SrcPlugin_addSub = execute_SRC1;
    end
  end

  assign execute_SrcPlugin_less = ((execute_SRC1[31] == execute_SRC2[31]) ? execute_SrcPlugin_addSub[31] : (execute_SRC_LESS_UNSIGNED ? execute_SRC2[31] : execute_SRC1[31]));
  assign execute_FullBarrelShifterPlugin_amplitude = execute_SRC2[4 : 0];
  always @ (*) begin
    _zz_121_[0] = execute_SRC1[31];
    _zz_121_[1] = execute_SRC1[30];
    _zz_121_[2] = execute_SRC1[29];
    _zz_121_[3] = execute_SRC1[28];
    _zz_121_[4] = execute_SRC1[27];
    _zz_121_[5] = execute_SRC1[26];
    _zz_121_[6] = execute_SRC1[25];
    _zz_121_[7] = execute_SRC1[24];
    _zz_121_[8] = execute_SRC1[23];
    _zz_121_[9] = execute_SRC1[22];
    _zz_121_[10] = execute_SRC1[21];
    _zz_121_[11] = execute_SRC1[20];
    _zz_121_[12] = execute_SRC1[19];
    _zz_121_[13] = execute_SRC1[18];
    _zz_121_[14] = execute_SRC1[17];
    _zz_121_[15] = execute_SRC1[16];
    _zz_121_[16] = execute_SRC1[15];
    _zz_121_[17] = execute_SRC1[14];
    _zz_121_[18] = execute_SRC1[13];
    _zz_121_[19] = execute_SRC1[12];
    _zz_121_[20] = execute_SRC1[11];
    _zz_121_[21] = execute_SRC1[10];
    _zz_121_[22] = execute_SRC1[9];
    _zz_121_[23] = execute_SRC1[8];
    _zz_121_[24] = execute_SRC1[7];
    _zz_121_[25] = execute_SRC1[6];
    _zz_121_[26] = execute_SRC1[5];
    _zz_121_[27] = execute_SRC1[4];
    _zz_121_[28] = execute_SRC1[3];
    _zz_121_[29] = execute_SRC1[2];
    _zz_121_[30] = execute_SRC1[1];
    _zz_121_[31] = execute_SRC1[0];
  end

  assign execute_FullBarrelShifterPlugin_reversed = ((execute_SHIFT_CTRL == `ShiftCtrlEnum_defaultEncoding_SLL_1) ? _zz_121_ : execute_SRC1);
  always @ (*) begin
    _zz_122_[0] = memory_SHIFT_RIGHT[31];
    _zz_122_[1] = memory_SHIFT_RIGHT[30];
    _zz_122_[2] = memory_SHIFT_RIGHT[29];
    _zz_122_[3] = memory_SHIFT_RIGHT[28];
    _zz_122_[4] = memory_SHIFT_RIGHT[27];
    _zz_122_[5] = memory_SHIFT_RIGHT[26];
    _zz_122_[6] = memory_SHIFT_RIGHT[25];
    _zz_122_[7] = memory_SHIFT_RIGHT[24];
    _zz_122_[8] = memory_SHIFT_RIGHT[23];
    _zz_122_[9] = memory_SHIFT_RIGHT[22];
    _zz_122_[10] = memory_SHIFT_RIGHT[21];
    _zz_122_[11] = memory_SHIFT_RIGHT[20];
    _zz_122_[12] = memory_SHIFT_RIGHT[19];
    _zz_122_[13] = memory_SHIFT_RIGHT[18];
    _zz_122_[14] = memory_SHIFT_RIGHT[17];
    _zz_122_[15] = memory_SHIFT_RIGHT[16];
    _zz_122_[16] = memory_SHIFT_RIGHT[15];
    _zz_122_[17] = memory_SHIFT_RIGHT[14];
    _zz_122_[18] = memory_SHIFT_RIGHT[13];
    _zz_122_[19] = memory_SHIFT_RIGHT[12];
    _zz_122_[20] = memory_SHIFT_RIGHT[11];
    _zz_122_[21] = memory_SHIFT_RIGHT[10];
    _zz_122_[22] = memory_SHIFT_RIGHT[9];
    _zz_122_[23] = memory_SHIFT_RIGHT[8];
    _zz_122_[24] = memory_SHIFT_RIGHT[7];
    _zz_122_[25] = memory_SHIFT_RIGHT[6];
    _zz_122_[26] = memory_SHIFT_RIGHT[5];
    _zz_122_[27] = memory_SHIFT_RIGHT[4];
    _zz_122_[28] = memory_SHIFT_RIGHT[3];
    _zz_122_[29] = memory_SHIFT_RIGHT[2];
    _zz_122_[30] = memory_SHIFT_RIGHT[1];
    _zz_122_[31] = memory_SHIFT_RIGHT[0];
  end

  assign execute_MulPlugin_a = execute_RS1;
  assign execute_MulPlugin_b = execute_RS2;
  always @ (*) begin
    case(_zz_220_)
      2'b01 : begin
        execute_MulPlugin_aSigned = 1'b1;
      end
      2'b10 : begin
        execute_MulPlugin_aSigned = 1'b1;
      end
      default : begin
        execute_MulPlugin_aSigned = 1'b0;
      end
    endcase
  end

  always @ (*) begin
    case(_zz_220_)
      2'b01 : begin
        execute_MulPlugin_bSigned = 1'b1;
      end
      2'b10 : begin
        execute_MulPlugin_bSigned = 1'b0;
      end
      default : begin
        execute_MulPlugin_bSigned = 1'b0;
      end
    endcase
  end

  assign execute_MulPlugin_aULow = execute_MulPlugin_a[15 : 0];
  assign execute_MulPlugin_bULow = execute_MulPlugin_b[15 : 0];
  assign execute_MulPlugin_aSLow = {1'b0,execute_MulPlugin_a[15 : 0]};
  assign execute_MulPlugin_bSLow = {1'b0,execute_MulPlugin_b[15 : 0]};
  assign execute_MulPlugin_aHigh = {(execute_MulPlugin_aSigned && execute_MulPlugin_a[31]),execute_MulPlugin_a[31 : 16]};
  assign execute_MulPlugin_bHigh = {(execute_MulPlugin_bSigned && execute_MulPlugin_b[31]),execute_MulPlugin_b[31 : 16]};
  assign writeBack_MulPlugin_result = ($signed(_zz_295_) + $signed(_zz_296_));
  assign memory_MulDivIterativePlugin_frontendOk = 1'b1;
  always @ (*) begin
    memory_MulDivIterativePlugin_div_counter_willIncrement = 1'b0;
    if(_zz_209_)begin
      if(_zz_221_)begin
        memory_MulDivIterativePlugin_div_counter_willIncrement = 1'b1;
      end
    end
  end

  always @ (*) begin
    memory_MulDivIterativePlugin_div_counter_willClear = 1'b0;
    if(_zz_222_)begin
      memory_MulDivIterativePlugin_div_counter_willClear = 1'b1;
    end
  end

  assign memory_MulDivIterativePlugin_div_counter_willOverflowIfInc = (memory_MulDivIterativePlugin_div_counter_value == 6'h21);
  assign memory_MulDivIterativePlugin_div_counter_willOverflow = (memory_MulDivIterativePlugin_div_counter_willOverflowIfInc && memory_MulDivIterativePlugin_div_counter_willIncrement);
  always @ (*) begin
    if(memory_MulDivIterativePlugin_div_counter_willOverflow)begin
      memory_MulDivIterativePlugin_div_counter_valueNext = 6'h0;
    end else begin
      memory_MulDivIterativePlugin_div_counter_valueNext = (memory_MulDivIterativePlugin_div_counter_value + _zz_300_);
    end
    if(memory_MulDivIterativePlugin_div_counter_willClear)begin
      memory_MulDivIterativePlugin_div_counter_valueNext = 6'h0;
    end
  end

  assign _zz_123_ = memory_MulDivIterativePlugin_rs1[31 : 0];
  assign memory_MulDivIterativePlugin_div_stage_0_remainderShifted = {memory_MulDivIterativePlugin_accumulator[31 : 0],_zz_123_[31]};
  assign memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator = (memory_MulDivIterativePlugin_div_stage_0_remainderShifted - _zz_301_);
  assign memory_MulDivIterativePlugin_div_stage_0_outRemainder = ((! memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator[32]) ? _zz_302_ : _zz_303_);
  assign memory_MulDivIterativePlugin_div_stage_0_outNumerator = _zz_304_[31:0];
  assign _zz_124_ = (memory_INSTRUCTION[13] ? memory_MulDivIterativePlugin_accumulator[31 : 0] : memory_MulDivIterativePlugin_rs1[31 : 0]);
  assign _zz_125_ = (execute_RS2[31] && execute_IS_RS2_SIGNED);
  assign _zz_126_ = (1'b0 || ((execute_IS_DIV && execute_RS1[31]) && execute_IS_RS1_SIGNED));
  always @ (*) begin
    _zz_127_[32] = (execute_IS_RS1_SIGNED && execute_RS1[31]);
    _zz_127_[31 : 0] = execute_RS1;
  end

  always @ (*) begin
    _zz_128_ = 1'b0;
    if(_zz_223_)begin
      if(_zz_224_)begin
        if(_zz_133_)begin
          _zz_128_ = 1'b1;
        end
      end
    end
    if(_zz_225_)begin
      if(_zz_226_)begin
        if(_zz_135_)begin
          _zz_128_ = 1'b1;
        end
      end
    end
    if(_zz_227_)begin
      if(_zz_228_)begin
        if(_zz_137_)begin
          _zz_128_ = 1'b1;
        end
      end
    end
    if((! decode_RS1_USE))begin
      _zz_128_ = 1'b0;
    end
  end

  always @ (*) begin
    _zz_129_ = 1'b0;
    if(_zz_223_)begin
      if(_zz_224_)begin
        if(_zz_134_)begin
          _zz_129_ = 1'b1;
        end
      end
    end
    if(_zz_225_)begin
      if(_zz_226_)begin
        if(_zz_136_)begin
          _zz_129_ = 1'b1;
        end
      end
    end
    if(_zz_227_)begin
      if(_zz_228_)begin
        if(_zz_138_)begin
          _zz_129_ = 1'b1;
        end
      end
    end
    if((! decode_RS2_USE))begin
      _zz_129_ = 1'b0;
    end
  end

  assign _zz_133_ = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_134_ = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign _zz_135_ = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_136_ = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign _zz_137_ = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_138_ = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign execute_BranchPlugin_eq = (execute_SRC1 == execute_SRC2);
  assign _zz_139_ = execute_INSTRUCTION[14 : 12];
  always @ (*) begin
    if((_zz_139_ == (3'b000))) begin
        _zz_140_ = execute_BranchPlugin_eq;
    end else if((_zz_139_ == (3'b001))) begin
        _zz_140_ = (! execute_BranchPlugin_eq);
    end else if((((_zz_139_ & (3'b101)) == (3'b101)))) begin
        _zz_140_ = (! execute_SRC_LESS);
    end else begin
        _zz_140_ = execute_SRC_LESS;
    end
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : begin
        _zz_141_ = 1'b0;
      end
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_141_ = 1'b1;
      end
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_141_ = 1'b1;
      end
      default : begin
        _zz_141_ = _zz_140_;
      end
    endcase
  end

  assign _zz_142_ = _zz_314_[11];
  always @ (*) begin
    _zz_143_[19] = _zz_142_;
    _zz_143_[18] = _zz_142_;
    _zz_143_[17] = _zz_142_;
    _zz_143_[16] = _zz_142_;
    _zz_143_[15] = _zz_142_;
    _zz_143_[14] = _zz_142_;
    _zz_143_[13] = _zz_142_;
    _zz_143_[12] = _zz_142_;
    _zz_143_[11] = _zz_142_;
    _zz_143_[10] = _zz_142_;
    _zz_143_[9] = _zz_142_;
    _zz_143_[8] = _zz_142_;
    _zz_143_[7] = _zz_142_;
    _zz_143_[6] = _zz_142_;
    _zz_143_[5] = _zz_142_;
    _zz_143_[4] = _zz_142_;
    _zz_143_[3] = _zz_142_;
    _zz_143_[2] = _zz_142_;
    _zz_143_[1] = _zz_142_;
    _zz_143_[0] = _zz_142_;
  end

  assign _zz_144_ = _zz_315_[19];
  always @ (*) begin
    _zz_145_[10] = _zz_144_;
    _zz_145_[9] = _zz_144_;
    _zz_145_[8] = _zz_144_;
    _zz_145_[7] = _zz_144_;
    _zz_145_[6] = _zz_144_;
    _zz_145_[5] = _zz_144_;
    _zz_145_[4] = _zz_144_;
    _zz_145_[3] = _zz_144_;
    _zz_145_[2] = _zz_144_;
    _zz_145_[1] = _zz_144_;
    _zz_145_[0] = _zz_144_;
  end

  assign _zz_146_ = _zz_316_[11];
  always @ (*) begin
    _zz_147_[18] = _zz_146_;
    _zz_147_[17] = _zz_146_;
    _zz_147_[16] = _zz_146_;
    _zz_147_[15] = _zz_146_;
    _zz_147_[14] = _zz_146_;
    _zz_147_[13] = _zz_146_;
    _zz_147_[12] = _zz_146_;
    _zz_147_[11] = _zz_146_;
    _zz_147_[10] = _zz_146_;
    _zz_147_[9] = _zz_146_;
    _zz_147_[8] = _zz_146_;
    _zz_147_[7] = _zz_146_;
    _zz_147_[6] = _zz_146_;
    _zz_147_[5] = _zz_146_;
    _zz_147_[4] = _zz_146_;
    _zz_147_[3] = _zz_146_;
    _zz_147_[2] = _zz_146_;
    _zz_147_[1] = _zz_146_;
    _zz_147_[0] = _zz_146_;
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_148_ = (_zz_317_[1] ^ execute_RS1[1]);
      end
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_148_ = _zz_318_[1];
      end
      default : begin
        _zz_148_ = _zz_319_[1];
      end
    endcase
  end

  assign execute_BranchPlugin_missAlignedTarget = (execute_BRANCH_COND_RESULT && _zz_148_);
  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        execute_BranchPlugin_branch_src1 = execute_RS1;
      end
      default : begin
        execute_BranchPlugin_branch_src1 = execute_PC;
      end
    endcase
  end

  assign _zz_149_ = _zz_320_[11];
  always @ (*) begin
    _zz_150_[19] = _zz_149_;
    _zz_150_[18] = _zz_149_;
    _zz_150_[17] = _zz_149_;
    _zz_150_[16] = _zz_149_;
    _zz_150_[15] = _zz_149_;
    _zz_150_[14] = _zz_149_;
    _zz_150_[13] = _zz_149_;
    _zz_150_[12] = _zz_149_;
    _zz_150_[11] = _zz_149_;
    _zz_150_[10] = _zz_149_;
    _zz_150_[9] = _zz_149_;
    _zz_150_[8] = _zz_149_;
    _zz_150_[7] = _zz_149_;
    _zz_150_[6] = _zz_149_;
    _zz_150_[5] = _zz_149_;
    _zz_150_[4] = _zz_149_;
    _zz_150_[3] = _zz_149_;
    _zz_150_[2] = _zz_149_;
    _zz_150_[1] = _zz_149_;
    _zz_150_[0] = _zz_149_;
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        execute_BranchPlugin_branch_src2 = {_zz_150_,execute_INSTRUCTION[31 : 20]};
      end
      default : begin
        execute_BranchPlugin_branch_src2 = ((execute_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JAL) ? {{_zz_152_,{{{_zz_513_,execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0} : {{_zz_154_,{{{_zz_514_,_zz_515_},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0});
        if(execute_PREDICTION_HAD_BRANCHED2)begin
          execute_BranchPlugin_branch_src2 = {29'd0, _zz_323_};
        end
      end
    endcase
  end

  assign _zz_151_ = _zz_321_[19];
  always @ (*) begin
    _zz_152_[10] = _zz_151_;
    _zz_152_[9] = _zz_151_;
    _zz_152_[8] = _zz_151_;
    _zz_152_[7] = _zz_151_;
    _zz_152_[6] = _zz_151_;
    _zz_152_[5] = _zz_151_;
    _zz_152_[4] = _zz_151_;
    _zz_152_[3] = _zz_151_;
    _zz_152_[2] = _zz_151_;
    _zz_152_[1] = _zz_151_;
    _zz_152_[0] = _zz_151_;
  end

  assign _zz_153_ = _zz_322_[11];
  always @ (*) begin
    _zz_154_[18] = _zz_153_;
    _zz_154_[17] = _zz_153_;
    _zz_154_[16] = _zz_153_;
    _zz_154_[15] = _zz_153_;
    _zz_154_[14] = _zz_153_;
    _zz_154_[13] = _zz_153_;
    _zz_154_[12] = _zz_153_;
    _zz_154_[11] = _zz_153_;
    _zz_154_[10] = _zz_153_;
    _zz_154_[9] = _zz_153_;
    _zz_154_[8] = _zz_153_;
    _zz_154_[7] = _zz_153_;
    _zz_154_[6] = _zz_153_;
    _zz_154_[5] = _zz_153_;
    _zz_154_[4] = _zz_153_;
    _zz_154_[3] = _zz_153_;
    _zz_154_[2] = _zz_153_;
    _zz_154_[1] = _zz_153_;
    _zz_154_[0] = _zz_153_;
  end

  assign execute_BranchPlugin_branchAdder = (execute_BranchPlugin_branch_src1 + execute_BranchPlugin_branch_src2);
  assign BranchPlugin_jumpInterface_valid = ((memory_arbitration_isValid && memory_BRANCH_DO) && (! 1'b0));
  assign BranchPlugin_jumpInterface_payload = memory_BRANCH_CALC;
  assign IBusCachedPlugin_decodePrediction_rsp_wasWrong = BranchPlugin_jumpInterface_valid;
  assign _zz_26_ = decode_SHIFT_CTRL;
  assign _zz_23_ = execute_SHIFT_CTRL;
  assign _zz_24_ = _zz_43_;
  assign _zz_30_ = decode_to_execute_SHIFT_CTRL;
  assign _zz_29_ = execute_to_memory_SHIFT_CTRL;
  assign _zz_21_ = decode_SRC1_CTRL;
  assign _zz_19_ = _zz_41_;
  assign _zz_33_ = decode_to_execute_SRC1_CTRL;
  assign _zz_18_ = decode_ALU_CTRL;
  assign _zz_16_ = _zz_42_;
  assign _zz_34_ = decode_to_execute_ALU_CTRL;
  assign _zz_15_ = decode_BRANCH_CTRL;
  assign _zz_52_ = _zz_39_;
  assign _zz_27_ = decode_to_execute_BRANCH_CTRL;
  assign _zz_13_ = decode_ALU_BITWISE_CTRL;
  assign _zz_11_ = _zz_45_;
  assign _zz_35_ = decode_to_execute_ALU_BITWISE_CTRL;
  assign _zz_10_ = decode_ENV_CTRL;
  assign _zz_7_ = execute_ENV_CTRL;
  assign _zz_5_ = memory_ENV_CTRL;
  assign _zz_8_ = _zz_40_;
  assign _zz_48_ = decode_to_execute_ENV_CTRL;
  assign _zz_47_ = execute_to_memory_ENV_CTRL;
  assign _zz_49_ = memory_to_writeBack_ENV_CTRL;
  assign _zz_3_ = decode_SRC2_CTRL;
  assign _zz_1_ = _zz_44_;
  assign _zz_32_ = decode_to_execute_SRC2_CTRL;
  assign decode_arbitration_isFlushed = (({writeBack_arbitration_flushNext,{memory_arbitration_flushNext,execute_arbitration_flushNext}} != (3'b000)) || ({writeBack_arbitration_flushIt,{memory_arbitration_flushIt,{execute_arbitration_flushIt,decode_arbitration_flushIt}}} != (4'b0000)));
  assign execute_arbitration_isFlushed = (({writeBack_arbitration_flushNext,memory_arbitration_flushNext} != (2'b00)) || ({writeBack_arbitration_flushIt,{memory_arbitration_flushIt,execute_arbitration_flushIt}} != (3'b000)));
  assign memory_arbitration_isFlushed = ((writeBack_arbitration_flushNext != (1'b0)) || ({writeBack_arbitration_flushIt,memory_arbitration_flushIt} != (2'b00)));
  assign writeBack_arbitration_isFlushed = (1'b0 || (writeBack_arbitration_flushIt != (1'b0)));
  assign decode_arbitration_isStuckByOthers = (decode_arbitration_haltByOther || (((1'b0 || execute_arbitration_isStuck) || memory_arbitration_isStuck) || writeBack_arbitration_isStuck));
  assign decode_arbitration_isStuck = (decode_arbitration_haltItself || decode_arbitration_isStuckByOthers);
  assign decode_arbitration_isMoving = ((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt));
  assign decode_arbitration_isFiring = ((decode_arbitration_isValid && (! decode_arbitration_isStuck)) && (! decode_arbitration_removeIt));
  assign execute_arbitration_isStuckByOthers = (execute_arbitration_haltByOther || ((1'b0 || memory_arbitration_isStuck) || writeBack_arbitration_isStuck));
  assign execute_arbitration_isStuck = (execute_arbitration_haltItself || execute_arbitration_isStuckByOthers);
  assign execute_arbitration_isMoving = ((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt));
  assign execute_arbitration_isFiring = ((execute_arbitration_isValid && (! execute_arbitration_isStuck)) && (! execute_arbitration_removeIt));
  assign memory_arbitration_isStuckByOthers = (memory_arbitration_haltByOther || (1'b0 || writeBack_arbitration_isStuck));
  assign memory_arbitration_isStuck = (memory_arbitration_haltItself || memory_arbitration_isStuckByOthers);
  assign memory_arbitration_isMoving = ((! memory_arbitration_isStuck) && (! memory_arbitration_removeIt));
  assign memory_arbitration_isFiring = ((memory_arbitration_isValid && (! memory_arbitration_isStuck)) && (! memory_arbitration_removeIt));
  assign writeBack_arbitration_isStuckByOthers = (writeBack_arbitration_haltByOther || 1'b0);
  assign writeBack_arbitration_isStuck = (writeBack_arbitration_haltItself || writeBack_arbitration_isStuckByOthers);
  assign writeBack_arbitration_isMoving = ((! writeBack_arbitration_isStuck) && (! writeBack_arbitration_removeIt));
  assign writeBack_arbitration_isFiring = ((writeBack_arbitration_isValid && (! writeBack_arbitration_isStuck)) && (! writeBack_arbitration_removeIt));
  always @ (*) begin
    _zz_155_ = 32'h0;
    if(execute_CsrPlugin_csr_768)begin
      _zz_155_[12 : 11] = CsrPlugin_mstatus_MPP;
      _zz_155_[7 : 7] = CsrPlugin_mstatus_MPIE;
      _zz_155_[3 : 3] = CsrPlugin_mstatus_MIE;
    end
  end

  always @ (*) begin
    _zz_156_ = 32'h0;
    if(execute_CsrPlugin_csr_836)begin
      _zz_156_[11 : 11] = CsrPlugin_mip_MEIP;
      _zz_156_[7 : 7] = CsrPlugin_mip_MTIP;
      _zz_156_[3 : 3] = CsrPlugin_mip_MSIP;
    end
  end

  always @ (*) begin
    _zz_157_ = 32'h0;
    if(execute_CsrPlugin_csr_772)begin
      _zz_157_[11 : 11] = CsrPlugin_mie_MEIE;
      _zz_157_[7 : 7] = CsrPlugin_mie_MTIE;
      _zz_157_[3 : 3] = CsrPlugin_mie_MSIE;
    end
  end

  always @ (*) begin
    _zz_158_ = 32'h0;
    if(execute_CsrPlugin_csr_773)begin
      _zz_158_[31 : 2] = CsrPlugin_mtvec_base;
      _zz_158_[1 : 0] = CsrPlugin_mtvec_mode;
    end
  end

  always @ (*) begin
    _zz_159_ = 32'h0;
    if(execute_CsrPlugin_csr_834)begin
      _zz_159_[31 : 31] = CsrPlugin_mcause_interrupt;
      _zz_159_[3 : 0] = CsrPlugin_mcause_exceptionCode;
    end
  end

  always @ (*) begin
    _zz_160_ = 32'h0;
    if(execute_CsrPlugin_csr_2816)begin
      _zz_160_[31 : 0] = CsrPlugin_mcycle[31 : 0];
    end
  end

  always @ (*) begin
    _zz_161_ = 32'h0;
    if(execute_CsrPlugin_csr_2944)begin
      _zz_161_[31 : 0] = CsrPlugin_mcycle[63 : 32];
    end
  end

  always @ (*) begin
    _zz_162_ = 32'h0;
    if(execute_CsrPlugin_csr_3072)begin
      _zz_162_[31 : 0] = CsrPlugin_mcycle[31 : 0];
    end
  end

  always @ (*) begin
    _zz_163_ = 32'h0;
    if(execute_CsrPlugin_csr_3200)begin
      _zz_163_[31 : 0] = CsrPlugin_mcycle[63 : 32];
    end
  end

  assign execute_CsrPlugin_readData = ((((_zz_155_ | _zz_156_) | (_zz_157_ | _zz_158_)) | ((_zz_159_ | _zz_160_) | (_zz_161_ | _zz_162_))) | _zz_163_);
  assign iBusAxi_ar_valid = iBus_cmd_valid;
  assign iBusAxi_ar_payload_len = 8'h07;
  assign iBusAxi_ar_payload_addr = iBus_cmd_payload_address;
  assign iBusAxi_ar_payload_prot = (3'b110);
  assign iBusAxi_ar_payload_cache = (4'b1111);
  assign iBusAxi_ar_payload_burst = (2'b01);
  assign iBus_cmd_ready = iBusAxi_ar_ready;
  assign iBus_rsp_valid = iBusAxi_r_valid;
  assign iBus_rsp_payload_data = iBusAxi_r_payload_data;
  assign iBus_rsp_payload_error = (! (iBusAxi_r_payload_resp == (2'b00)));
  assign iBusAxi_r_ready = 1'b1;
  assign dBus_cmd_ready = ((1'b1 && (! dBus_cmd_m2sPipe_valid)) || dBus_cmd_m2sPipe_ready);
  assign dBus_cmd_m2sPipe_valid = dBus_cmd_m2sPipe_rValid;
  assign dBus_cmd_m2sPipe_payload_wr = dBus_cmd_m2sPipe_rData_wr;
  assign dBus_cmd_m2sPipe_payload_address = dBus_cmd_m2sPipe_rData_address;
  assign dBus_cmd_m2sPipe_payload_data = dBus_cmd_m2sPipe_rData_data;
  assign dBus_cmd_m2sPipe_payload_mask = dBus_cmd_m2sPipe_rData_mask;
  assign dBus_cmd_m2sPipe_payload_length = dBus_cmd_m2sPipe_rData_length;
  assign dBus_cmd_m2sPipe_payload_last = dBus_cmd_m2sPipe_rData_last;
  assign dBus_cmd_m2sPipe_ready = ((1'b1 && (! dBus_cmd_m2sPipe_m2sPipe_valid)) || dBus_cmd_m2sPipe_m2sPipe_ready);
  assign dBus_cmd_m2sPipe_m2sPipe_valid = dBus_cmd_m2sPipe_m2sPipe_rValid;
  assign dBus_cmd_m2sPipe_m2sPipe_payload_wr = dBus_cmd_m2sPipe_m2sPipe_rData_wr;
  assign dBus_cmd_m2sPipe_m2sPipe_payload_address = dBus_cmd_m2sPipe_m2sPipe_rData_address;
  assign dBus_cmd_m2sPipe_m2sPipe_payload_data = dBus_cmd_m2sPipe_m2sPipe_rData_data;
  assign dBus_cmd_m2sPipe_m2sPipe_payload_mask = dBus_cmd_m2sPipe_m2sPipe_rData_mask;
  assign dBus_cmd_m2sPipe_m2sPipe_payload_length = dBus_cmd_m2sPipe_m2sPipe_rData_length;
  assign dBus_cmd_m2sPipe_m2sPipe_payload_last = dBus_cmd_m2sPipe_m2sPipe_rData_last;
  assign dBus_cmd_m2sPipe_m2sPipe_s2mPipe_valid = (dBus_cmd_m2sPipe_m2sPipe_valid || dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rValid);
  assign dBus_cmd_m2sPipe_m2sPipe_ready = (! dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rValid);
  assign dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_wr = (dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rValid ? dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rData_wr : dBus_cmd_m2sPipe_m2sPipe_payload_wr);
  assign dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_address = (dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rValid ? dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rData_address : dBus_cmd_m2sPipe_m2sPipe_payload_address);
  assign dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_data = (dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rValid ? dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rData_data : dBus_cmd_m2sPipe_m2sPipe_payload_data);
  assign dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_mask = (dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rValid ? dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rData_mask : dBus_cmd_m2sPipe_m2sPipe_payload_mask);
  assign dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_length = (dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rValid ? dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rData_length : dBus_cmd_m2sPipe_m2sPipe_payload_length);
  assign dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_last = (dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rValid ? dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rData_last : dBus_cmd_m2sPipe_m2sPipe_payload_last);
  always @ (*) begin
    _zz_164_ = 1'b0;
    if(((dBus_cmd_m2sPipe_m2sPipe_s2mPipe_valid && dBus_cmd_m2sPipe_m2sPipe_s2mPipe_ready) && dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_wr))begin
      _zz_164_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_165_ = 1'b0;
    if((dBusAxi_b_valid && 1'b1))begin
      _zz_165_ = 1'b1;
    end
  end

  always @ (*) begin
    if((_zz_164_ && (! _zz_165_)))begin
      _zz_167_ = (3'b001);
    end else begin
      if(((! _zz_164_) && _zz_165_))begin
        _zz_167_ = (3'b111);
      end else begin
        _zz_167_ = (3'b000);
      end
    end
  end

  assign _zz_168_ = (! (((_zz_166_ != (3'b000)) && (! dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_wr)) || (_zz_166_ == (3'b111))));
  assign dBus_cmd_m2sPipe_m2sPipe_s2mPipe_ready = (streamFork_1__io_input_ready && _zz_168_);
  assign _zz_199_ = (dBus_cmd_m2sPipe_m2sPipe_s2mPipe_valid && _zz_168_);
  always @ (*) begin
    streamFork_1__io_outputs_0_thrown_valid = streamFork_1__io_outputs_0_valid;
    if(_zz_169_)begin
      streamFork_1__io_outputs_0_thrown_valid = 1'b0;
    end
  end

  always @ (*) begin
    _zz_200_ = streamFork_1__io_outputs_0_thrown_ready;
    if(_zz_169_)begin
      _zz_200_ = 1'b1;
    end
  end

  assign streamFork_1__io_outputs_0_thrown_payload_wr = streamFork_1__io_outputs_0_payload_wr;
  assign streamFork_1__io_outputs_0_thrown_payload_address = streamFork_1__io_outputs_0_payload_address;
  assign streamFork_1__io_outputs_0_thrown_payload_data = streamFork_1__io_outputs_0_payload_data;
  assign streamFork_1__io_outputs_0_thrown_payload_mask = streamFork_1__io_outputs_0_payload_mask;
  assign streamFork_1__io_outputs_0_thrown_payload_length = streamFork_1__io_outputs_0_payload_length;
  assign streamFork_1__io_outputs_0_thrown_payload_last = streamFork_1__io_outputs_0_payload_last;
  always @ (*) begin
    streamFork_1__io_outputs_1_thrown_valid = streamFork_1__io_outputs_1_valid;
    if(_zz_229_)begin
      streamFork_1__io_outputs_1_thrown_valid = 1'b0;
    end
  end

  always @ (*) begin
    _zz_201_ = streamFork_1__io_outputs_1_thrown_ready;
    if(_zz_229_)begin
      _zz_201_ = 1'b1;
    end
  end

  assign streamFork_1__io_outputs_1_thrown_payload_wr = streamFork_1__io_outputs_1_payload_wr;
  assign streamFork_1__io_outputs_1_thrown_payload_address = streamFork_1__io_outputs_1_payload_address;
  assign streamFork_1__io_outputs_1_thrown_payload_data = streamFork_1__io_outputs_1_payload_data;
  assign streamFork_1__io_outputs_1_thrown_payload_mask = streamFork_1__io_outputs_1_payload_mask;
  assign streamFork_1__io_outputs_1_thrown_payload_length = streamFork_1__io_outputs_1_payload_length;
  assign streamFork_1__io_outputs_1_thrown_payload_last = streamFork_1__io_outputs_1_payload_last;
  assign streamFork_1__io_outputs_0_thrown_ready = (_zz_173_ ? dBusAxi_aw_ready : dBusAxi_ar_ready);
  assign streamFork_1__io_outputs_1_thrown_ready = dBusAxi_w_ready;
  assign dBus_rsp_valid = dBusAxi_r_valid;
  assign dBus_rsp_payload_error = (! (dBusAxi_r_payload_resp == (2'b00)));
  assign dBus_rsp_payload_data = dBusAxi_r_payload_data;
  assign _zz_170_ = streamFork_1__io_outputs_0_thrown_valid;
  assign _zz_171_ = streamFork_1__io_outputs_0_thrown_payload_address;
  assign _zz_172_ = {5'd0, streamFork_1__io_outputs_0_thrown_payload_length};
  assign _zz_173_ = streamFork_1__io_outputs_0_thrown_payload_wr;
  assign dBusAxi_ar_valid = (_zz_170_ && (! _zz_173_));
  assign dBusAxi_ar_payload_addr = _zz_171_;
  assign _zz_174_[0 : 0] = (1'b0);
  assign dBusAxi_ar_payload_id = _zz_174_;
  assign _zz_175_[3 : 0] = (4'b0000);
  assign dBusAxi_ar_payload_region = _zz_175_;
  assign dBusAxi_ar_payload_len = _zz_172_;
  assign dBusAxi_ar_payload_size = (3'b010);
  assign dBusAxi_ar_payload_burst = (2'b01);
  assign dBusAxi_ar_payload_lock = (1'b0);
  assign dBusAxi_ar_payload_cache = (4'b1111);
  assign dBusAxi_ar_payload_qos = (4'b0000);
  assign dBusAxi_ar_payload_prot = (3'b010);
  assign dBusAxi_aw_valid = (_zz_170_ && _zz_173_);
  assign dBusAxi_aw_payload_addr = _zz_171_;
  assign _zz_176_[0 : 0] = (1'b0);
  assign dBusAxi_aw_payload_id = _zz_176_;
  assign _zz_177_[3 : 0] = (4'b0000);
  assign dBusAxi_aw_payload_region = _zz_177_;
  assign dBusAxi_aw_payload_len = _zz_172_;
  assign dBusAxi_aw_payload_size = (3'b010);
  assign dBusAxi_aw_payload_burst = (2'b01);
  assign dBusAxi_aw_payload_lock = (1'b0);
  assign dBusAxi_aw_payload_cache = (4'b1111);
  assign dBusAxi_aw_payload_qos = (4'b0000);
  assign dBusAxi_aw_payload_prot = (3'b010);
  assign dBusAxi_w_valid = streamFork_1__io_outputs_1_thrown_valid;
  assign dBusAxi_w_payload_data = streamFork_1__io_outputs_1_thrown_payload_data;
  assign dBusAxi_w_payload_strb = streamFork_1__io_outputs_1_thrown_payload_mask;
  assign dBusAxi_w_payload_last = streamFork_1__io_outputs_1_thrown_payload_last;
  assign dBusAxi_r_ready = 1'b1;
  assign dBusAxi_b_ready = 1'b1;
  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      IBusCachedPlugin_fetchPc_pcReg <= externalResetVector;
      IBusCachedPlugin_fetchPc_correctionReg <= 1'b0;
      IBusCachedPlugin_fetchPc_booted <= 1'b0;
      IBusCachedPlugin_fetchPc_inc <= 1'b0;
      _zz_66_ <= 1'b0;
      _zz_68_ <= 1'b0;
      _zz_71_ <= 1'b0;
      _zz_73_ <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_5 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_6 <= 1'b0;
      IBusCachedPlugin_rspCounter <= _zz_89_;
      IBusCachedPlugin_rspCounter <= 32'h0;
      dataCache_1__io_mem_cmd_s2mPipe_rValid <= 1'b0;
      dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_rValid <= 1'b0;
      dBus_rsp_regNext_valid <= 1'b0;
      DBusCachedPlugin_rspCounter <= _zz_90_;
      DBusCachedPlugin_rspCounter <= 32'h0;
      CsrPlugin_mstatus_MIE <= 1'b0;
      CsrPlugin_mstatus_MPIE <= 1'b0;
      CsrPlugin_mstatus_MPP <= (2'b11);
      CsrPlugin_mie_MEIE <= 1'b0;
      CsrPlugin_mie_MTIE <= 1'b0;
      CsrPlugin_mie_MSIE <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= 1'b0;
      CsrPlugin_interrupt_valid <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_1 <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_2 <= 1'b0;
      CsrPlugin_hadException <= 1'b0;
      execute_CsrPlugin_wfiWake <= 1'b0;
      _zz_113_ <= 1'b1;
      memory_MulDivIterativePlugin_div_counter_value <= 6'h0;
      _zz_130_ <= 1'b0;
      execute_arbitration_isValid <= 1'b0;
      memory_arbitration_isValid <= 1'b0;
      writeBack_arbitration_isValid <= 1'b0;
      memory_to_writeBack_REGFILE_WRITE_DATA <= 32'h0;
      memory_to_writeBack_INSTRUCTION <= 32'h0;
      dBus_cmd_m2sPipe_rValid <= 1'b0;
      dBus_cmd_m2sPipe_m2sPipe_rValid <= 1'b0;
      dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rValid <= 1'b0;
      _zz_166_ <= (3'b000);
      _zz_169_ <= 1'b0;
    end else begin
      if(IBusCachedPlugin_fetchPc_correction)begin
        IBusCachedPlugin_fetchPc_correctionReg <= 1'b1;
      end
      if((IBusCachedPlugin_fetchPc_output_valid && IBusCachedPlugin_fetchPc_output_ready))begin
        IBusCachedPlugin_fetchPc_correctionReg <= 1'b0;
      end
      IBusCachedPlugin_fetchPc_booted <= 1'b1;
      if((IBusCachedPlugin_fetchPc_correction || IBusCachedPlugin_fetchPc_pcRegPropagate))begin
        IBusCachedPlugin_fetchPc_inc <= 1'b0;
      end
      if((IBusCachedPlugin_fetchPc_output_valid && IBusCachedPlugin_fetchPc_output_ready))begin
        IBusCachedPlugin_fetchPc_inc <= 1'b1;
      end
      if(((! IBusCachedPlugin_fetchPc_output_valid) && IBusCachedPlugin_fetchPc_output_ready))begin
        IBusCachedPlugin_fetchPc_inc <= 1'b0;
      end
      if((IBusCachedPlugin_fetchPc_booted && ((IBusCachedPlugin_fetchPc_output_ready || IBusCachedPlugin_fetchPc_correction) || IBusCachedPlugin_fetchPc_pcRegPropagate)))begin
        IBusCachedPlugin_fetchPc_pcReg <= IBusCachedPlugin_fetchPc_pc;
      end
      if(IBusCachedPlugin_iBusRsp_flush)begin
        _zz_66_ <= 1'b0;
      end
      if(_zz_64_)begin
        _zz_66_ <= (IBusCachedPlugin_iBusRsp_stages_0_output_valid && (! 1'b0));
      end
      if(IBusCachedPlugin_iBusRsp_flush)begin
        _zz_68_ <= 1'b0;
      end
      if(IBusCachedPlugin_iBusRsp_stages_1_output_ready)begin
        _zz_68_ <= (IBusCachedPlugin_iBusRsp_stages_1_output_valid && (! IBusCachedPlugin_iBusRsp_flush));
      end
      if(IBusCachedPlugin_iBusRsp_flush)begin
        _zz_71_ <= 1'b0;
      end
      if(IBusCachedPlugin_iBusRsp_stages_2_output_ready)begin
        _zz_71_ <= (IBusCachedPlugin_iBusRsp_stages_2_output_valid && (! IBusCachedPlugin_iBusRsp_flush));
      end
      if(decode_arbitration_removeIt)begin
        _zz_73_ <= 1'b0;
      end
      if(IBusCachedPlugin_iBusRsp_output_ready)begin
        _zz_73_ <= (IBusCachedPlugin_iBusRsp_output_valid && (! IBusCachedPlugin_externalFlush));
      end
      if(IBusCachedPlugin_fetchPc_flushed)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      end
      if((! (! IBusCachedPlugin_iBusRsp_stages_1_input_ready)))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b1;
      end
      if(IBusCachedPlugin_fetchPc_flushed)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if((! (! IBusCachedPlugin_iBusRsp_stages_2_input_ready)))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_1 <= IBusCachedPlugin_injector_nextPcCalc_valids_0;
      end
      if(IBusCachedPlugin_fetchPc_flushed)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if(IBusCachedPlugin_fetchPc_flushed)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if((! (! IBusCachedPlugin_iBusRsp_stages_3_input_ready)))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_2 <= IBusCachedPlugin_injector_nextPcCalc_valids_1;
      end
      if(IBusCachedPlugin_fetchPc_flushed)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if(IBusCachedPlugin_fetchPc_flushed)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      if((! (! IBusCachedPlugin_injector_decodeInput_ready)))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_3 <= IBusCachedPlugin_injector_nextPcCalc_valids_2;
      end
      if(IBusCachedPlugin_fetchPc_flushed)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      if(IBusCachedPlugin_fetchPc_flushed)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      end
      if((! execute_arbitration_isStuck))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_4 <= IBusCachedPlugin_injector_nextPcCalc_valids_3;
      end
      if(IBusCachedPlugin_fetchPc_flushed)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      end
      if(IBusCachedPlugin_fetchPc_flushed)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_5 <= 1'b0;
      end
      if((! memory_arbitration_isStuck))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_5 <= IBusCachedPlugin_injector_nextPcCalc_valids_4;
      end
      if(IBusCachedPlugin_fetchPc_flushed)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_5 <= 1'b0;
      end
      if(IBusCachedPlugin_fetchPc_flushed)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_6 <= 1'b0;
      end
      if((! writeBack_arbitration_isStuck))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_6 <= IBusCachedPlugin_injector_nextPcCalc_valids_5;
      end
      if(IBusCachedPlugin_fetchPc_flushed)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_6 <= 1'b0;
      end
      if(iBus_rsp_valid)begin
        IBusCachedPlugin_rspCounter <= (IBusCachedPlugin_rspCounter + 32'h00000001);
      end
      if(dataCache_1__io_mem_cmd_s2mPipe_ready)begin
        dataCache_1__io_mem_cmd_s2mPipe_rValid <= 1'b0;
      end
      if(_zz_230_)begin
        dataCache_1__io_mem_cmd_s2mPipe_rValid <= dataCache_1__io_mem_cmd_valid;
      end
      if(dataCache_1__io_mem_cmd_s2mPipe_ready)begin
        dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_rValid <= dataCache_1__io_mem_cmd_s2mPipe_valid;
      end
      dBus_rsp_regNext_valid <= dBus_rsp_valid;
      if(dBus_rsp_valid)begin
        DBusCachedPlugin_rspCounter <= (DBusCachedPlugin_rspCounter + 32'h00000001);
      end
      if((! decode_arbitration_isStuck))begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= 1'b0;
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= CsrPlugin_exceptionPortCtrl_exceptionValids_decode;
      end
      if((! execute_arbitration_isStuck))begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= (CsrPlugin_exceptionPortCtrl_exceptionValids_decode && (! decode_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= CsrPlugin_exceptionPortCtrl_exceptionValids_execute;
      end
      if((! memory_arbitration_isStuck))begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= (CsrPlugin_exceptionPortCtrl_exceptionValids_execute && (! execute_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= CsrPlugin_exceptionPortCtrl_exceptionValids_memory;
      end
      if((! writeBack_arbitration_isStuck))begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= (CsrPlugin_exceptionPortCtrl_exceptionValids_memory && (! memory_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= 1'b0;
      end
      CsrPlugin_interrupt_valid <= 1'b0;
      if(_zz_231_)begin
        if(_zz_232_)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(_zz_233_)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(_zz_234_)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
      end
      if(CsrPlugin_pipelineLiberator_active)begin
        if((! execute_arbitration_isStuck))begin
          CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b1;
        end
        if((! memory_arbitration_isStuck))begin
          CsrPlugin_pipelineLiberator_pcValids_1 <= CsrPlugin_pipelineLiberator_pcValids_0;
        end
        if((! writeBack_arbitration_isStuck))begin
          CsrPlugin_pipelineLiberator_pcValids_2 <= CsrPlugin_pipelineLiberator_pcValids_1;
        end
      end
      if(((! CsrPlugin_pipelineLiberator_active) || decode_arbitration_removeIt))begin
        CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b0;
        CsrPlugin_pipelineLiberator_pcValids_1 <= 1'b0;
        CsrPlugin_pipelineLiberator_pcValids_2 <= 1'b0;
      end
      if(CsrPlugin_interruptJump)begin
        CsrPlugin_interrupt_valid <= 1'b0;
      end
      CsrPlugin_hadException <= CsrPlugin_exception;
      if(_zz_215_)begin
        case(CsrPlugin_targetPrivilege)
          2'b11 : begin
            CsrPlugin_mstatus_MIE <= 1'b0;
            CsrPlugin_mstatus_MPIE <= CsrPlugin_mstatus_MIE;
            CsrPlugin_mstatus_MPP <= CsrPlugin_privilege;
          end
          default : begin
          end
        endcase
      end
      if(_zz_216_)begin
        case(_zz_217_)
          2'b11 : begin
            CsrPlugin_mstatus_MPP <= (2'b00);
            CsrPlugin_mstatus_MIE <= CsrPlugin_mstatus_MPIE;
            CsrPlugin_mstatus_MPIE <= 1'b1;
          end
          default : begin
          end
        endcase
      end
      execute_CsrPlugin_wfiWake <= (({_zz_98_,{_zz_97_,_zz_96_}} != (3'b000)) || CsrPlugin_thirdPartyWake);
      _zz_113_ <= 1'b0;
      memory_MulDivIterativePlugin_div_counter_value <= memory_MulDivIterativePlugin_div_counter_valueNext;
      _zz_130_ <= (_zz_37_ && writeBack_arbitration_isFiring);
      if((! writeBack_arbitration_isStuck))begin
        memory_to_writeBack_INSTRUCTION <= memory_INSTRUCTION;
      end
      if((! writeBack_arbitration_isStuck))begin
        memory_to_writeBack_REGFILE_WRITE_DATA <= _zz_28_;
      end
      if(((! execute_arbitration_isStuck) || execute_arbitration_removeIt))begin
        execute_arbitration_isValid <= 1'b0;
      end
      if(((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt)))begin
        execute_arbitration_isValid <= decode_arbitration_isValid;
      end
      if(((! memory_arbitration_isStuck) || memory_arbitration_removeIt))begin
        memory_arbitration_isValid <= 1'b0;
      end
      if(((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt)))begin
        memory_arbitration_isValid <= execute_arbitration_isValid;
      end
      if(((! writeBack_arbitration_isStuck) || writeBack_arbitration_removeIt))begin
        writeBack_arbitration_isValid <= 1'b0;
      end
      if(((! memory_arbitration_isStuck) && (! memory_arbitration_removeIt)))begin
        writeBack_arbitration_isValid <= memory_arbitration_isValid;
      end
      if(execute_CsrPlugin_csr_768)begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mstatus_MPP <= execute_CsrPlugin_writeData[12 : 11];
          CsrPlugin_mstatus_MPIE <= _zz_324_[0];
          CsrPlugin_mstatus_MIE <= _zz_325_[0];
        end
      end
      if(execute_CsrPlugin_csr_772)begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mie_MEIE <= _zz_327_[0];
          CsrPlugin_mie_MTIE <= _zz_328_[0];
          CsrPlugin_mie_MSIE <= _zz_329_[0];
        end
      end
      if(dBus_cmd_ready)begin
        dBus_cmd_m2sPipe_rValid <= dBus_cmd_valid;
      end
      if(dBus_cmd_m2sPipe_ready)begin
        dBus_cmd_m2sPipe_m2sPipe_rValid <= dBus_cmd_m2sPipe_valid;
      end
      if(dBus_cmd_m2sPipe_m2sPipe_s2mPipe_ready)begin
        dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rValid <= 1'b0;
      end
      if(_zz_235_)begin
        dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rValid <= dBus_cmd_m2sPipe_m2sPipe_valid;
      end
      _zz_166_ <= (_zz_166_ + _zz_167_);
      if((streamFork_1__io_outputs_0_valid && _zz_200_))begin
        _zz_169_ <= (! streamFork_1__io_outputs_0_payload_last);
      end
    end
  end

  always @ (posedge clk) begin
    if(IBusCachedPlugin_iBusRsp_stages_1_output_ready)begin
      _zz_69_ <= IBusCachedPlugin_iBusRsp_stages_1_output_payload;
    end
    if(IBusCachedPlugin_iBusRsp_stages_2_output_ready)begin
      _zz_72_ <= IBusCachedPlugin_iBusRsp_stages_2_output_payload;
    end
    if(IBusCachedPlugin_iBusRsp_output_ready)begin
      _zz_74_ <= IBusCachedPlugin_iBusRsp_output_payload_pc;
      _zz_75_ <= IBusCachedPlugin_iBusRsp_output_payload_rsp_error;
      _zz_76_ <= IBusCachedPlugin_iBusRsp_output_payload_rsp_inst;
      _zz_77_ <= IBusCachedPlugin_iBusRsp_output_payload_isRvc;
    end
    if(IBusCachedPlugin_injector_decodeInput_ready)begin
      IBusCachedPlugin_injector_formal_rawInDecode <= IBusCachedPlugin_iBusRsp_output_payload_rsp_inst;
    end
    if(IBusCachedPlugin_iBusRsp_stages_2_input_ready)begin
      IBusCachedPlugin_s1_tightlyCoupledHit <= IBusCachedPlugin_s0_tightlyCoupledHit;
    end
    if(IBusCachedPlugin_iBusRsp_stages_3_input_ready)begin
      IBusCachedPlugin_s2_tightlyCoupledHit <= IBusCachedPlugin_s1_tightlyCoupledHit;
    end
    if(_zz_230_)begin
      dataCache_1__io_mem_cmd_s2mPipe_rData_wr <= dataCache_1__io_mem_cmd_payload_wr;
      dataCache_1__io_mem_cmd_s2mPipe_rData_address <= dataCache_1__io_mem_cmd_payload_address;
      dataCache_1__io_mem_cmd_s2mPipe_rData_data <= dataCache_1__io_mem_cmd_payload_data;
      dataCache_1__io_mem_cmd_s2mPipe_rData_mask <= dataCache_1__io_mem_cmd_payload_mask;
      dataCache_1__io_mem_cmd_s2mPipe_rData_length <= dataCache_1__io_mem_cmd_payload_length;
      dataCache_1__io_mem_cmd_s2mPipe_rData_last <= dataCache_1__io_mem_cmd_payload_last;
    end
    if(dataCache_1__io_mem_cmd_s2mPipe_ready)begin
      dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_rData_wr <= dataCache_1__io_mem_cmd_s2mPipe_payload_wr;
      dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_rData_address <= dataCache_1__io_mem_cmd_s2mPipe_payload_address;
      dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_rData_data <= dataCache_1__io_mem_cmd_s2mPipe_payload_data;
      dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_rData_mask <= dataCache_1__io_mem_cmd_s2mPipe_payload_mask;
      dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_rData_length <= dataCache_1__io_mem_cmd_s2mPipe_payload_length;
      dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_rData_last <= dataCache_1__io_mem_cmd_s2mPipe_payload_last;
    end
    dBus_rsp_regNext_payload_data <= dBus_rsp_payload_data;
    dBus_rsp_regNext_payload_error <= dBus_rsp_payload_error;
    CsrPlugin_mip_MEIP <= externalInterrupt;
    CsrPlugin_mip_MTIP <= timerInterrupt;
    CsrPlugin_mip_MSIP <= softwareInterrupt;
    CsrPlugin_mcycle <= (CsrPlugin_mcycle + 64'h0000000000000001);
    if(writeBack_arbitration_isFiring)begin
      CsrPlugin_minstret <= (CsrPlugin_minstret + 64'h0000000000000001);
    end
    if(IBusCachedPlugin_decodeExceptionPort_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= IBusCachedPlugin_decodeExceptionPort_payload_code;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= IBusCachedPlugin_decodeExceptionPort_payload_badAddr;
    end
    if(DBusCachedPlugin_exceptionBus_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= DBusCachedPlugin_exceptionBus_payload_code;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= DBusCachedPlugin_exceptionBus_payload_badAddr;
    end
    if(_zz_231_)begin
      if(_zz_232_)begin
        CsrPlugin_interrupt_code <= (4'b0111);
        CsrPlugin_interrupt_targetPrivilege <= (2'b11);
      end
      if(_zz_233_)begin
        CsrPlugin_interrupt_code <= (4'b0011);
        CsrPlugin_interrupt_targetPrivilege <= (2'b11);
      end
      if(_zz_234_)begin
        CsrPlugin_interrupt_code <= (4'b1011);
        CsrPlugin_interrupt_targetPrivilege <= (2'b11);
      end
    end
    if(_zz_215_)begin
      case(CsrPlugin_targetPrivilege)
        2'b11 : begin
          CsrPlugin_mcause_interrupt <= (! CsrPlugin_hadException);
          CsrPlugin_mcause_exceptionCode <= CsrPlugin_trapCause;
          CsrPlugin_mepc <= writeBack_PC;
          if(CsrPlugin_hadException)begin
            CsrPlugin_mtval <= CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr;
          end
        end
        default : begin
        end
      endcase
    end
    if((memory_MulDivIterativePlugin_div_counter_value == 6'h20))begin
      memory_MulDivIterativePlugin_div_done <= 1'b1;
    end
    if((! memory_arbitration_isStuck))begin
      memory_MulDivIterativePlugin_div_done <= 1'b0;
    end
    if(_zz_209_)begin
      if(_zz_221_)begin
        memory_MulDivIterativePlugin_rs1[31 : 0] <= memory_MulDivIterativePlugin_div_stage_0_outNumerator;
        memory_MulDivIterativePlugin_accumulator[31 : 0] <= memory_MulDivIterativePlugin_div_stage_0_outRemainder;
        if((memory_MulDivIterativePlugin_div_counter_value == 6'h20))begin
          memory_MulDivIterativePlugin_div_result <= _zz_305_[31:0];
        end
      end
    end
    if(_zz_222_)begin
      memory_MulDivIterativePlugin_accumulator <= 65'h0;
      memory_MulDivIterativePlugin_rs1 <= ((_zz_126_ ? (~ _zz_127_) : _zz_127_) + _zz_311_);
      memory_MulDivIterativePlugin_rs2 <= ((_zz_125_ ? (~ execute_RS2) : execute_RS2) + _zz_313_);
      memory_MulDivIterativePlugin_div_needRevert <= ((_zz_126_ ^ (_zz_125_ && (! execute_INSTRUCTION[13]))) && (! (((execute_RS2 == 32'h0) && execute_IS_RS2_SIGNED) && (! execute_INSTRUCTION[13]))));
    end
    _zz_131_ <= _zz_36_[11 : 7];
    _zz_132_ <= _zz_50_;
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_AMO <= decode_MEMORY_AMO;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_LRSC <= decode_MEMORY_LRSC;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_HL <= execute_MUL_HL;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_ADDRESS_LOW <= execute_MEMORY_ADDRESS_LOW;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_ADDRESS_LOW <= memory_MEMORY_ADDRESS_LOW;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2_FORCE_ZERO <= decode_SRC2_FORCE_ZERO;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BRANCH_DO <= execute_BRANCH_DO;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_LL <= execute_MUL_LL;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_MUL <= decode_IS_MUL;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_IS_MUL <= execute_IS_MUL;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_IS_MUL <= memory_IS_MUL;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SHIFT_CTRL <= _zz_25_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_SHIFT_CTRL <= _zz_22_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_CSR <= decode_IS_CSR;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_MANAGMENT <= decode_MEMORY_MANAGMENT;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BYPASSABLE_EXECUTE_STAGE <= decode_BYPASSABLE_EXECUTE_STAGE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_INSTRUCTION <= decode_INSTRUCTION;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_INSTRUCTION <= execute_INSTRUCTION;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_FORMAL_PC_NEXT <= _zz_54_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_FORMAL_PC_NEXT <= execute_FORMAL_PC_NEXT;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_FORMAL_PC_NEXT <= _zz_53_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_RS1 <= decode_RS1;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MUL_LOW <= memory_MUL_LOW;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_PC <= decode_PC;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_PC <= _zz_31_;
    end
    if(((! writeBack_arbitration_isStuck) && (! CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack)))begin
      memory_to_writeBack_PC <= memory_PC;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_RS1_SIGNED <= decode_IS_RS1_SIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC1_CTRL <= _zz_20_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_CTRL <= _zz_17_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_SHIFT_RIGHT <= execute_SHIFT_RIGHT;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_LH <= execute_MUL_LH;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_DIV <= decode_IS_DIV;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_IS_DIV <= execute_IS_DIV;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_USE_SUB_LESS <= decode_SRC_USE_SUB_LESS;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_ENABLE <= decode_MEMORY_ENABLE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_ENABLE <= execute_MEMORY_ENABLE;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_ENABLE <= memory_MEMORY_ENABLE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_REGFILE_WRITE_DATA <= _zz_46_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_RS2_SIGNED <= decode_IS_RS2_SIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BYPASSABLE_MEMORY_STAGE <= decode_BYPASSABLE_MEMORY_STAGE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BYPASSABLE_MEMORY_STAGE <= execute_BYPASSABLE_MEMORY_STAGE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_REGFILE_WRITE_VALID <= decode_REGFILE_WRITE_VALID;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_REGFILE_WRITE_VALID <= execute_REGFILE_WRITE_VALID;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_REGFILE_WRITE_VALID <= memory_REGFILE_WRITE_VALID;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_RS2 <= decode_RS2;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_PREDICTION_HAD_BRANCHED2 <= decode_PREDICTION_HAD_BRANCHED2;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BRANCH_CALC <= execute_BRANCH_CALC;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BRANCH_CTRL <= _zz_14_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_BITWISE_CTRL <= _zz_12_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_HH <= execute_MUL_HH;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MUL_HH <= memory_MUL_HH;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ENV_CTRL <= _zz_9_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_ENV_CTRL <= _zz_6_;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_ENV_CTRL <= _zz_4_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_LESS_UNSIGNED <= decode_SRC_LESS_UNSIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_WR <= decode_MEMORY_WR;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_WR <= execute_MEMORY_WR;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_WR <= memory_MEMORY_WR;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_WRITE_OPCODE <= decode_CSR_WRITE_OPCODE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_READ_OPCODE <= decode_CSR_READ_OPCODE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2_CTRL <= _zz_2_;
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_768 <= (decode_INSTRUCTION[31 : 20] == 12'h300);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_836 <= (decode_INSTRUCTION[31 : 20] == 12'h344);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_772 <= (decode_INSTRUCTION[31 : 20] == 12'h304);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_773 <= (decode_INSTRUCTION[31 : 20] == 12'h305);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_834 <= (decode_INSTRUCTION[31 : 20] == 12'h342);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_2816 <= (decode_INSTRUCTION[31 : 20] == 12'hb00);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_2944 <= (decode_INSTRUCTION[31 : 20] == 12'hb80);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_3072 <= (decode_INSTRUCTION[31 : 20] == 12'hc00);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_3200 <= (decode_INSTRUCTION[31 : 20] == 12'hc80);
    end
    if(execute_CsrPlugin_csr_836)begin
      if(execute_CsrPlugin_writeEnable)begin
        CsrPlugin_mip_MSIP <= _zz_326_[0];
      end
    end
    if(execute_CsrPlugin_csr_773)begin
      if(execute_CsrPlugin_writeEnable)begin
        CsrPlugin_mtvec_base <= execute_CsrPlugin_writeData[31 : 2];
        CsrPlugin_mtvec_mode <= execute_CsrPlugin_writeData[1 : 0];
      end
    end
    if(dBus_cmd_ready)begin
      dBus_cmd_m2sPipe_rData_wr <= dBus_cmd_payload_wr;
      dBus_cmd_m2sPipe_rData_address <= dBus_cmd_payload_address;
      dBus_cmd_m2sPipe_rData_data <= dBus_cmd_payload_data;
      dBus_cmd_m2sPipe_rData_mask <= dBus_cmd_payload_mask;
      dBus_cmd_m2sPipe_rData_length <= dBus_cmd_payload_length;
      dBus_cmd_m2sPipe_rData_last <= dBus_cmd_payload_last;
    end
    if(dBus_cmd_m2sPipe_ready)begin
      dBus_cmd_m2sPipe_m2sPipe_rData_wr <= dBus_cmd_m2sPipe_payload_wr;
      dBus_cmd_m2sPipe_m2sPipe_rData_address <= dBus_cmd_m2sPipe_payload_address;
      dBus_cmd_m2sPipe_m2sPipe_rData_data <= dBus_cmd_m2sPipe_payload_data;
      dBus_cmd_m2sPipe_m2sPipe_rData_mask <= dBus_cmd_m2sPipe_payload_mask;
      dBus_cmd_m2sPipe_m2sPipe_rData_length <= dBus_cmd_m2sPipe_payload_length;
      dBus_cmd_m2sPipe_m2sPipe_rData_last <= dBus_cmd_m2sPipe_payload_last;
    end
    if(_zz_235_)begin
      dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rData_wr <= dBus_cmd_m2sPipe_m2sPipe_payload_wr;
      dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rData_address <= dBus_cmd_m2sPipe_m2sPipe_payload_address;
      dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rData_data <= dBus_cmd_m2sPipe_m2sPipe_payload_data;
      dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rData_mask <= dBus_cmd_m2sPipe_m2sPipe_payload_mask;
      dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rData_length <= dBus_cmd_m2sPipe_m2sPipe_payload_length;
      dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rData_last <= dBus_cmd_m2sPipe_m2sPipe_payload_last;
    end
  end


endmodule
