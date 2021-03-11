// Generator : SpinalHDL v1.4.4    git head : 3097aa38e8419acac302cfacff70f1cd700b1865
// Component : VexRiscv
// Git hash  : be81cc1e0e18ade1c1e1a73fb6c2847cbd6f8d46


`define BranchCtrlEnum_defaultEncoding_type [1:0]
`define BranchCtrlEnum_defaultEncoding_INC 2'b00
`define BranchCtrlEnum_defaultEncoding_B 2'b01
`define BranchCtrlEnum_defaultEncoding_JAL 2'b10
`define BranchCtrlEnum_defaultEncoding_JALR 2'b11

`define ShiftCtrlEnum_defaultEncoding_type [1:0]
`define ShiftCtrlEnum_defaultEncoding_DISABLE_1 2'b00
`define ShiftCtrlEnum_defaultEncoding_SLL_1 2'b01
`define ShiftCtrlEnum_defaultEncoding_SRL_1 2'b10
`define ShiftCtrlEnum_defaultEncoding_SRA_1 2'b11

`define AluBitwiseCtrlEnum_defaultEncoding_type [1:0]
`define AluBitwiseCtrlEnum_defaultEncoding_XOR_1 2'b00
`define AluBitwiseCtrlEnum_defaultEncoding_OR_1 2'b01
`define AluBitwiseCtrlEnum_defaultEncoding_AND_1 2'b10

`define EnvCtrlEnum_defaultEncoding_type [0:0]
`define EnvCtrlEnum_defaultEncoding_NONE 1'b0
`define EnvCtrlEnum_defaultEncoding_XRET 1'b1

`define Src2CtrlEnum_defaultEncoding_type [1:0]
`define Src2CtrlEnum_defaultEncoding_RS 2'b00
`define Src2CtrlEnum_defaultEncoding_IMI 2'b01
`define Src2CtrlEnum_defaultEncoding_IMS 2'b10
`define Src2CtrlEnum_defaultEncoding_PC 2'b11

`define AluCtrlEnum_defaultEncoding_type [1:0]
`define AluCtrlEnum_defaultEncoding_ADD_SUB 2'b00
`define AluCtrlEnum_defaultEncoding_SLT_SLTU 2'b01
`define AluCtrlEnum_defaultEncoding_BITWISE 2'b10

`define Src1CtrlEnum_defaultEncoding_type [1:0]
`define Src1CtrlEnum_defaultEncoding_RS 2'b00
`define Src1CtrlEnum_defaultEncoding_IMU 2'b01
`define Src1CtrlEnum_defaultEncoding_PC_INCREMENT 2'b10
`define Src1CtrlEnum_defaultEncoding_URS1 2'b11


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
  wire                _zz_173;
  wire                _zz_174;
  wire                _zz_175;
  wire                _zz_176;
  wire                _zz_177;
  wire                _zz_178;
  wire                _zz_179;
  wire                _zz_180;
  reg                 _zz_181;
  wire                _zz_182;
  wire       [31:0]   _zz_183;
  reg                 _zz_184;
  wire                _zz_185;
  wire       [2:0]    _zz_186;
  wire                _zz_187;
  wire       [31:0]   _zz_188;
  reg                 _zz_189;
  wire                _zz_190;
  wire                _zz_191;
  wire       [31:0]   _zz_192;
  wire                _zz_193;
  wire                _zz_194;
  wire                _zz_195;
  wire                _zz_196;
  wire                _zz_197;
  wire                _zz_198;
  wire                _zz_199;
  wire                _zz_200;
  wire       [3:0]    _zz_201;
  wire                _zz_202;
  wire                _zz_203;
  wire                _zz_204;
  reg                 _zz_205;
  reg                 _zz_206;
  reg        [31:0]   _zz_207;
  reg        [31:0]   _zz_208;
  reg        [31:0]   _zz_209;
  wire                IBusCachedPlugin_cache_io_cpu_prefetch_haltIt;
  wire       [31:0]   IBusCachedPlugin_cache_io_cpu_fetch_data;
  wire       [31:0]   IBusCachedPlugin_cache_io_cpu_fetch_physicalAddress;
  wire                IBusCachedPlugin_cache_io_cpu_decode_error;
  wire                IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling;
  wire                IBusCachedPlugin_cache_io_cpu_decode_mmuException;
  wire       [31:0]   IBusCachedPlugin_cache_io_cpu_decode_data;
  wire                IBusCachedPlugin_cache_io_cpu_decode_cacheMiss;
  wire       [31:0]   IBusCachedPlugin_cache_io_cpu_decode_physicalAddress;
  wire                IBusCachedPlugin_cache_io_mem_cmd_valid;
  wire       [31:0]   IBusCachedPlugin_cache_io_mem_cmd_payload_address;
  wire       [2:0]    IBusCachedPlugin_cache_io_mem_cmd_payload_size;
  wire                dataCache_1_io_cpu_execute_haltIt;
  wire                dataCache_1_io_cpu_execute_refilling;
  wire                dataCache_1_io_cpu_memory_isWrite;
  wire                dataCache_1_io_cpu_writeBack_haltIt;
  wire       [31:0]   dataCache_1_io_cpu_writeBack_data;
  wire                dataCache_1_io_cpu_writeBack_mmuException;
  wire                dataCache_1_io_cpu_writeBack_unalignedAccess;
  wire                dataCache_1_io_cpu_writeBack_accessError;
  wire                dataCache_1_io_cpu_writeBack_isWrite;
  wire                dataCache_1_io_cpu_writeBack_keepMemRspData;
  wire                dataCache_1_io_cpu_flush_ready;
  wire                dataCache_1_io_cpu_redo;
  wire                dataCache_1_io_mem_cmd_valid;
  wire                dataCache_1_io_mem_cmd_payload_wr;
  wire                dataCache_1_io_mem_cmd_payload_uncached;
  wire       [31:0]   dataCache_1_io_mem_cmd_payload_address;
  wire       [31:0]   dataCache_1_io_mem_cmd_payload_data;
  wire       [3:0]    dataCache_1_io_mem_cmd_payload_mask;
  wire       [2:0]    dataCache_1_io_mem_cmd_payload_length;
  wire                dataCache_1_io_mem_cmd_payload_last;
  wire                streamFork_1_io_input_ready;
  wire                streamFork_1_io_outputs_0_valid;
  wire                streamFork_1_io_outputs_0_payload_wr;
  wire                streamFork_1_io_outputs_0_payload_uncached;
  wire       [31:0]   streamFork_1_io_outputs_0_payload_address;
  wire       [31:0]   streamFork_1_io_outputs_0_payload_data;
  wire       [3:0]    streamFork_1_io_outputs_0_payload_mask;
  wire       [2:0]    streamFork_1_io_outputs_0_payload_length;
  wire                streamFork_1_io_outputs_0_payload_last;
  wire                streamFork_1_io_outputs_1_valid;
  wire                streamFork_1_io_outputs_1_payload_wr;
  wire                streamFork_1_io_outputs_1_payload_uncached;
  wire       [31:0]   streamFork_1_io_outputs_1_payload_address;
  wire       [31:0]   streamFork_1_io_outputs_1_payload_data;
  wire       [3:0]    streamFork_1_io_outputs_1_payload_mask;
  wire       [2:0]    streamFork_1_io_outputs_1_payload_length;
  wire                streamFork_1_io_outputs_1_payload_last;
  wire                _zz_210;
  wire                _zz_211;
  wire                _zz_212;
  wire                _zz_213;
  wire                _zz_214;
  wire                _zz_215;
  wire                _zz_216;
  wire                _zz_217;
  wire                _zz_218;
  wire                _zz_219;
  wire                _zz_220;
  wire                _zz_221;
  wire       [1:0]    _zz_222;
  wire                _zz_223;
  wire                _zz_224;
  wire       [1:0]    _zz_225;
  wire                _zz_226;
  wire                _zz_227;
  wire                _zz_228;
  wire                _zz_229;
  wire                _zz_230;
  wire                _zz_231;
  wire                _zz_232;
  wire                _zz_233;
  wire                _zz_234;
  wire                _zz_235;
  wire                _zz_236;
  wire                _zz_237;
  wire                _zz_238;
  wire                _zz_239;
  wire                _zz_240;
  wire       [1:0]    _zz_241;
  wire                _zz_242;
  wire       [1:0]    _zz_243;
  wire       [51:0]   _zz_244;
  wire       [51:0]   _zz_245;
  wire       [51:0]   _zz_246;
  wire       [32:0]   _zz_247;
  wire       [51:0]   _zz_248;
  wire       [49:0]   _zz_249;
  wire       [51:0]   _zz_250;
  wire       [49:0]   _zz_251;
  wire       [51:0]   _zz_252;
  wire       [32:0]   _zz_253;
  wire       [31:0]   _zz_254;
  wire       [32:0]   _zz_255;
  wire       [0:0]    _zz_256;
  wire       [0:0]    _zz_257;
  wire       [0:0]    _zz_258;
  wire       [0:0]    _zz_259;
  wire       [0:0]    _zz_260;
  wire       [0:0]    _zz_261;
  wire       [0:0]    _zz_262;
  wire       [0:0]    _zz_263;
  wire       [0:0]    _zz_264;
  wire       [0:0]    _zz_265;
  wire       [0:0]    _zz_266;
  wire       [0:0]    _zz_267;
  wire       [0:0]    _zz_268;
  wire       [0:0]    _zz_269;
  wire       [0:0]    _zz_270;
  wire       [0:0]    _zz_271;
  wire       [0:0]    _zz_272;
  wire       [0:0]    _zz_273;
  wire       [0:0]    _zz_274;
  wire       [3:0]    _zz_275;
  wire       [2:0]    _zz_276;
  wire       [31:0]   _zz_277;
  wire       [11:0]   _zz_278;
  wire       [31:0]   _zz_279;
  wire       [19:0]   _zz_280;
  wire       [11:0]   _zz_281;
  wire       [31:0]   _zz_282;
  wire       [31:0]   _zz_283;
  wire       [19:0]   _zz_284;
  wire       [11:0]   _zz_285;
  wire       [2:0]    _zz_286;
  wire       [2:0]    _zz_287;
  wire       [0:0]    _zz_288;
  wire       [2:0]    _zz_289;
  wire       [4:0]    _zz_290;
  wire       [11:0]   _zz_291;
  wire       [11:0]   _zz_292;
  wire       [31:0]   _zz_293;
  wire       [31:0]   _zz_294;
  wire       [31:0]   _zz_295;
  wire       [31:0]   _zz_296;
  wire       [31:0]   _zz_297;
  wire       [31:0]   _zz_298;
  wire       [31:0]   _zz_299;
  wire       [65:0]   _zz_300;
  wire       [65:0]   _zz_301;
  wire       [31:0]   _zz_302;
  wire       [31:0]   _zz_303;
  wire       [0:0]    _zz_304;
  wire       [5:0]    _zz_305;
  wire       [32:0]   _zz_306;
  wire       [31:0]   _zz_307;
  wire       [31:0]   _zz_308;
  wire       [32:0]   _zz_309;
  wire       [32:0]   _zz_310;
  wire       [32:0]   _zz_311;
  wire       [32:0]   _zz_312;
  wire       [0:0]    _zz_313;
  wire       [32:0]   _zz_314;
  wire       [0:0]    _zz_315;
  wire       [32:0]   _zz_316;
  wire       [0:0]    _zz_317;
  wire       [31:0]   _zz_318;
  wire       [11:0]   _zz_319;
  wire       [19:0]   _zz_320;
  wire       [11:0]   _zz_321;
  wire       [31:0]   _zz_322;
  wire       [31:0]   _zz_323;
  wire       [31:0]   _zz_324;
  wire       [11:0]   _zz_325;
  wire       [19:0]   _zz_326;
  wire       [11:0]   _zz_327;
  wire       [2:0]    _zz_328;
  wire       [0:0]    _zz_329;
  wire       [0:0]    _zz_330;
  wire       [0:0]    _zz_331;
  wire       [0:0]    _zz_332;
  wire       [0:0]    _zz_333;
  wire       [0:0]    _zz_334;
  wire                _zz_335;
  wire                _zz_336;
  wire       [1:0]    _zz_337;
  wire                _zz_338;
  wire                _zz_339;
  wire                _zz_340;
  wire       [31:0]   _zz_341;
  wire       [31:0]   _zz_342;
  wire       [31:0]   _zz_343;
  wire       [31:0]   _zz_344;
  wire       [0:0]    _zz_345;
  wire       [0:0]    _zz_346;
  wire                _zz_347;
  wire       [0:0]    _zz_348;
  wire       [26:0]   _zz_349;
  wire       [31:0]   _zz_350;
  wire                _zz_351;
  wire                _zz_352;
  wire       [0:0]    _zz_353;
  wire       [1:0]    _zz_354;
  wire       [0:0]    _zz_355;
  wire       [0:0]    _zz_356;
  wire                _zz_357;
  wire       [0:0]    _zz_358;
  wire       [21:0]   _zz_359;
  wire       [31:0]   _zz_360;
  wire       [31:0]   _zz_361;
  wire       [31:0]   _zz_362;
  wire       [31:0]   _zz_363;
  wire       [31:0]   _zz_364;
  wire       [31:0]   _zz_365;
  wire       [31:0]   _zz_366;
  wire       [31:0]   _zz_367;
  wire       [0:0]    _zz_368;
  wire       [0:0]    _zz_369;
  wire       [0:0]    _zz_370;
  wire       [0:0]    _zz_371;
  wire                _zz_372;
  wire       [0:0]    _zz_373;
  wire       [18:0]   _zz_374;
  wire       [31:0]   _zz_375;
  wire       [31:0]   _zz_376;
  wire       [31:0]   _zz_377;
  wire                _zz_378;
  wire                _zz_379;
  wire                _zz_380;
  wire       [0:0]    _zz_381;
  wire       [0:0]    _zz_382;
  wire                _zz_383;
  wire       [0:0]    _zz_384;
  wire       [15:0]   _zz_385;
  wire       [31:0]   _zz_386;
  wire                _zz_387;
  wire       [0:0]    _zz_388;
  wire       [1:0]    _zz_389;
  wire                _zz_390;
  wire       [0:0]    _zz_391;
  wire       [0:0]    _zz_392;
  wire                _zz_393;
  wire       [0:0]    _zz_394;
  wire       [12:0]   _zz_395;
  wire       [31:0]   _zz_396;
  wire       [31:0]   _zz_397;
  wire       [31:0]   _zz_398;
  wire       [31:0]   _zz_399;
  wire       [31:0]   _zz_400;
  wire       [31:0]   _zz_401;
  wire                _zz_402;
  wire       [0:0]    _zz_403;
  wire       [1:0]    _zz_404;
  wire       [0:0]    _zz_405;
  wire       [1:0]    _zz_406;
  wire       [4:0]    _zz_407;
  wire       [4:0]    _zz_408;
  wire                _zz_409;
  wire       [0:0]    _zz_410;
  wire       [9:0]    _zz_411;
  wire       [31:0]   _zz_412;
  wire       [31:0]   _zz_413;
  wire       [31:0]   _zz_414;
  wire                _zz_415;
  wire                _zz_416;
  wire       [31:0]   _zz_417;
  wire       [31:0]   _zz_418;
  wire                _zz_419;
  wire                _zz_420;
  wire                _zz_421;
  wire       [0:0]    _zz_422;
  wire       [2:0]    _zz_423;
  wire       [0:0]    _zz_424;
  wire       [3:0]    _zz_425;
  wire       [6:0]    _zz_426;
  wire       [6:0]    _zz_427;
  wire                _zz_428;
  wire       [0:0]    _zz_429;
  wire       [7:0]    _zz_430;
  wire       [31:0]   _zz_431;
  wire       [31:0]   _zz_432;
  wire       [31:0]   _zz_433;
  wire       [31:0]   _zz_434;
  wire       [31:0]   _zz_435;
  wire       [31:0]   _zz_436;
  wire       [31:0]   _zz_437;
  wire                _zz_438;
  wire       [0:0]    _zz_439;
  wire       [0:0]    _zz_440;
  wire                _zz_441;
  wire       [0:0]    _zz_442;
  wire       [1:0]    _zz_443;
  wire       [0:0]    _zz_444;
  wire       [4:0]    _zz_445;
  wire       [0:0]    _zz_446;
  wire       [0:0]    _zz_447;
  wire       [1:0]    _zz_448;
  wire       [1:0]    _zz_449;
  wire                _zz_450;
  wire       [0:0]    _zz_451;
  wire       [5:0]    _zz_452;
  wire       [31:0]   _zz_453;
  wire       [31:0]   _zz_454;
  wire       [31:0]   _zz_455;
  wire       [31:0]   _zz_456;
  wire       [31:0]   _zz_457;
  wire       [31:0]   _zz_458;
  wire                _zz_459;
  wire                _zz_460;
  wire       [31:0]   _zz_461;
  wire       [31:0]   _zz_462;
  wire                _zz_463;
  wire       [0:0]    _zz_464;
  wire       [2:0]    _zz_465;
  wire       [31:0]   _zz_466;
  wire       [31:0]   _zz_467;
  wire                _zz_468;
  wire                _zz_469;
  wire       [0:0]    _zz_470;
  wire       [0:0]    _zz_471;
  wire                _zz_472;
  wire       [0:0]    _zz_473;
  wire       [3:0]    _zz_474;
  wire       [31:0]   _zz_475;
  wire       [31:0]   _zz_476;
  wire       [31:0]   _zz_477;
  wire       [31:0]   _zz_478;
  wire       [31:0]   _zz_479;
  wire                _zz_480;
  wire       [0:0]    _zz_481;
  wire       [0:0]    _zz_482;
  wire       [31:0]   _zz_483;
  wire       [31:0]   _zz_484;
  wire       [31:0]   _zz_485;
  wire       [31:0]   _zz_486;
  wire       [0:0]    _zz_487;
  wire       [3:0]    _zz_488;
  wire       [1:0]    _zz_489;
  wire       [1:0]    _zz_490;
  wire                _zz_491;
  wire       [0:0]    _zz_492;
  wire       [1:0]    _zz_493;
  wire       [31:0]   _zz_494;
  wire       [31:0]   _zz_495;
  wire       [31:0]   _zz_496;
  wire       [31:0]   _zz_497;
  wire       [31:0]   _zz_498;
  wire                _zz_499;
  wire       [0:0]    _zz_500;
  wire       [1:0]    _zz_501;
  wire                _zz_502;
  wire       [0:0]    _zz_503;
  wire       [1:0]    _zz_504;
  wire       [2:0]    _zz_505;
  wire       [2:0]    _zz_506;
  wire                _zz_507;
  wire                _zz_508;
  wire       [31:0]   _zz_509;
  wire       [31:0]   _zz_510;
  wire       [31:0]   _zz_511;
  wire                _zz_512;
  wire       [31:0]   _zz_513;
  wire       [31:0]   _zz_514;
  wire       [31:0]   _zz_515;
  wire                _zz_516;
  wire                _zz_517;
  wire       [0:0]    _zz_518;
  wire       [0:0]    _zz_519;
  wire       [0:0]    _zz_520;
  wire       [0:0]    _zz_521;
  wire                _zz_522;
  wire                _zz_523;
  wire                _zz_524;
  wire                _zz_525;
  wire       [51:0]   memory_MUL_LOW;
  wire       [31:0]   execute_BRANCH_CALC;
  wire                execute_BRANCH_DO;
  wire       [33:0]   memory_MUL_HH;
  wire       [33:0]   execute_MUL_HH;
  wire       [33:0]   execute_MUL_HL;
  wire       [33:0]   execute_MUL_LH;
  wire       [31:0]   execute_MUL_LL;
  wire       [31:0]   execute_SHIFT_RIGHT;
  wire       [31:0]   execute_REGFILE_WRITE_DATA;
  wire       [1:0]    memory_MEMORY_ADDRESS_LOW;
  wire       [1:0]    execute_MEMORY_ADDRESS_LOW;
  wire                decode_PREDICTION_HAD_BRANCHED2;
  wire                decode_SRC2_FORCE_ZERO;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_1;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_2;
  wire                decode_IS_RS2_SIGNED;
  wire                decode_IS_RS1_SIGNED;
  wire                decode_IS_DIV;
  wire                memory_IS_MUL;
  wire                execute_IS_MUL;
  wire                decode_IS_MUL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_3;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_4;
  wire       `ShiftCtrlEnum_defaultEncoding_type decode_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_5;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_6;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_7;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type decode_ALU_BITWISE_CTRL;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_8;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_9;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_10;
  wire                decode_SRC_LESS_UNSIGNED;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_11;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_12;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_13;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_14;
  wire       `EnvCtrlEnum_defaultEncoding_type decode_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_15;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_16;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_17;
  wire                decode_IS_CSR;
  wire                decode_MEMORY_MANAGMENT;
  wire                memory_MEMORY_WR;
  wire                decode_MEMORY_WR;
  wire                execute_BYPASSABLE_MEMORY_STAGE;
  wire                decode_BYPASSABLE_MEMORY_STAGE;
  wire                decode_BYPASSABLE_EXECUTE_STAGE;
  wire       `Src2CtrlEnum_defaultEncoding_type decode_SRC2_CTRL;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_18;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_19;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_20;
  wire       `AluCtrlEnum_defaultEncoding_type decode_ALU_CTRL;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_21;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_22;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_23;
  wire       `Src1CtrlEnum_defaultEncoding_type decode_SRC1_CTRL;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_24;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_25;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_26;
  wire                decode_CSR_READ_OPCODE;
  wire                decode_CSR_WRITE_OPCODE;
  wire                decode_MEMORY_FORCE_CONSTISTENCY;
  wire       [31:0]   writeBack_FORMAL_PC_NEXT;
  wire       [31:0]   memory_FORMAL_PC_NEXT;
  wire       [31:0]   execute_FORMAL_PC_NEXT;
  wire       [31:0]   decode_FORMAL_PC_NEXT;
  wire       [31:0]   memory_PC;
  wire       [31:0]   memory_BRANCH_CALC;
  wire                memory_BRANCH_DO;
  wire       [31:0]   execute_PC;
  wire                execute_PREDICTION_HAD_BRANCHED2;
  wire                execute_BRANCH_COND_RESULT;
  wire       `BranchCtrlEnum_defaultEncoding_type execute_BRANCH_CTRL;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_27;
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
  (* keep , syn_keep *) wire       [31:0]   execute_RS1 /* synthesis syn_keep = 1 */ ;
  wire       [31:0]   memory_SHIFT_RIGHT;
  reg        [31:0]   _zz_28;
  wire       `ShiftCtrlEnum_defaultEncoding_type memory_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_29;
  wire       `ShiftCtrlEnum_defaultEncoding_type execute_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_30;
  wire                execute_SRC_LESS_UNSIGNED;
  wire                execute_SRC2_FORCE_ZERO;
  wire                execute_SRC_USE_SUB_LESS;
  wire       [31:0]   _zz_31;
  wire       `Src2CtrlEnum_defaultEncoding_type execute_SRC2_CTRL;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_32;
  wire       `Src1CtrlEnum_defaultEncoding_type execute_SRC1_CTRL;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_33;
  wire                decode_SRC_USE_SUB_LESS;
  wire                decode_SRC_ADD_ZERO;
  wire       [31:0]   execute_SRC_ADD_SUB;
  wire                execute_SRC_LESS;
  wire       `AluCtrlEnum_defaultEncoding_type execute_ALU_CTRL;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_34;
  wire       [31:0]   execute_SRC2;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type execute_ALU_BITWISE_CTRL;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_35;
  wire       [31:0]   _zz_36;
  wire                _zz_37;
  reg                 _zz_38;
  wire       [31:0]   decode_INSTRUCTION_ANTICIPATED;
  reg                 decode_REGFILE_WRITE_VALID;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_39;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_40;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_41;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_42;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_43;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_44;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_45;
  reg        [31:0]   _zz_46;
  wire       [31:0]   execute_SRC1;
  wire                execute_CSR_READ_OPCODE;
  wire                execute_CSR_WRITE_OPCODE;
  wire                execute_IS_CSR;
  wire       `EnvCtrlEnum_defaultEncoding_type memory_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_47;
  wire       `EnvCtrlEnum_defaultEncoding_type execute_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_48;
  wire       `EnvCtrlEnum_defaultEncoding_type writeBack_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_49;
  reg        [31:0]   _zz_50;
  wire       [1:0]    writeBack_MEMORY_ADDRESS_LOW;
  wire                writeBack_MEMORY_WR;
  wire       [31:0]   writeBack_REGFILE_WRITE_DATA;
  wire                writeBack_MEMORY_ENABLE;
  wire       [31:0]   memory_REGFILE_WRITE_DATA;
  wire                memory_MEMORY_ENABLE;
  wire                execute_MEMORY_AMO;
  wire                execute_MEMORY_LRSC;
  wire                execute_MEMORY_FORCE_CONSTISTENCY;
  wire                execute_MEMORY_MANAGMENT;
  (* keep , syn_keep *) wire       [31:0]   execute_RS2 /* synthesis syn_keep = 1 */ ;
  wire                execute_MEMORY_WR;
  wire       [31:0]   execute_SRC_ADD;
  wire                execute_MEMORY_ENABLE;
  wire       [31:0]   execute_INSTRUCTION;
  wire                decode_MEMORY_AMO;
  wire                decode_MEMORY_LRSC;
  reg                 _zz_51;
  wire                decode_MEMORY_ENABLE;
  wire                decode_FLUSH_ALL;
  reg                 IBusCachedPlugin_rsp_issueDetected_4;
  reg                 IBusCachedPlugin_rsp_issueDetected_3;
  reg                 IBusCachedPlugin_rsp_issueDetected_2;
  reg                 IBusCachedPlugin_rsp_issueDetected_1;
  wire       `BranchCtrlEnum_defaultEncoding_type decode_BRANCH_CTRL;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_52;
  reg        [31:0]   _zz_53;
  reg        [31:0]   _zz_54;
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
  reg                 execute_arbitration_haltByOther;
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
  (* keep , syn_keep *) wire       [31:0]   IBusCachedPlugin_predictionJumpInterface_payload /* synthesis syn_keep = 1 */ ;
  reg                 IBusCachedPlugin_decodePrediction_cmd_hadBranch;
  wire                IBusCachedPlugin_decodePrediction_rsp_wasWrong;
  wire                IBusCachedPlugin_pcValids_0;
  wire                IBusCachedPlugin_pcValids_1;
  wire                IBusCachedPlugin_pcValids_2;
  wire                IBusCachedPlugin_pcValids_3;
  reg                 IBusCachedPlugin_decodeExceptionPort_valid;
  reg        [3:0]    IBusCachedPlugin_decodeExceptionPort_payload_code;
  wire       [31:0]   IBusCachedPlugin_decodeExceptionPort_payload_badAddr;
  wire                IBusCachedPlugin_mmuBus_cmd_0_isValid;
  wire                IBusCachedPlugin_mmuBus_cmd_0_isStuck;
  wire       [31:0]   IBusCachedPlugin_mmuBus_cmd_0_virtualAddress;
  wire                IBusCachedPlugin_mmuBus_cmd_0_bypassTranslation;
  wire       [31:0]   IBusCachedPlugin_mmuBus_rsp_physicalAddress;
  wire                IBusCachedPlugin_mmuBus_rsp_isIoAccess;
  wire                IBusCachedPlugin_mmuBus_rsp_isPaging;
  wire                IBusCachedPlugin_mmuBus_rsp_allowRead;
  wire                IBusCachedPlugin_mmuBus_rsp_allowWrite;
  wire                IBusCachedPlugin_mmuBus_rsp_allowExecute;
  wire                IBusCachedPlugin_mmuBus_rsp_exception;
  wire                IBusCachedPlugin_mmuBus_rsp_refilling;
  wire                IBusCachedPlugin_mmuBus_rsp_bypassTranslation;
  wire                IBusCachedPlugin_mmuBus_end;
  wire                IBusCachedPlugin_mmuBus_busy;
  wire                dBus_cmd_valid;
  wire                dBus_cmd_ready;
  wire                dBus_cmd_payload_wr;
  wire                dBus_cmd_payload_uncached;
  wire       [31:0]   dBus_cmd_payload_address;
  wire       [31:0]   dBus_cmd_payload_data;
  wire       [3:0]    dBus_cmd_payload_mask;
  wire       [2:0]    dBus_cmd_payload_length;
  wire                dBus_cmd_payload_last;
  wire                dBus_rsp_valid;
  wire                dBus_rsp_payload_last;
  wire       [31:0]   dBus_rsp_payload_data;
  wire                dBus_rsp_payload_error;
  wire                DBusCachedPlugin_mmuBus_cmd_0_isValid;
  wire                DBusCachedPlugin_mmuBus_cmd_0_isStuck;
  wire       [31:0]   DBusCachedPlugin_mmuBus_cmd_0_virtualAddress;
  wire                DBusCachedPlugin_mmuBus_cmd_0_bypassTranslation;
  wire       [31:0]   DBusCachedPlugin_mmuBus_rsp_physicalAddress;
  wire                DBusCachedPlugin_mmuBus_rsp_isIoAccess;
  wire                DBusCachedPlugin_mmuBus_rsp_isPaging;
  wire                DBusCachedPlugin_mmuBus_rsp_allowRead;
  wire                DBusCachedPlugin_mmuBus_rsp_allowWrite;
  wire                DBusCachedPlugin_mmuBus_rsp_allowExecute;
  wire                DBusCachedPlugin_mmuBus_rsp_exception;
  wire                DBusCachedPlugin_mmuBus_rsp_refilling;
  wire                DBusCachedPlugin_mmuBus_rsp_bypassTranslation;
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
  wire       [3:0]    _zz_55;
  wire       [3:0]    _zz_56;
  wire                _zz_57;
  wire                _zz_58;
  wire                _zz_59;
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
  wire                _zz_60;
  wire                _zz_61;
  wire                _zz_62;
  wire                _zz_63;
  wire                IBusCachedPlugin_iBusRsp_flush;
  wire                _zz_64;
  wire                _zz_65;
  reg                 _zz_66;
  wire                _zz_67;
  reg                 _zz_68;
  reg        [31:0]   _zz_69;
  wire                _zz_70;
  reg                 _zz_71;
  reg        [31:0]   _zz_72;
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
  reg                 _zz_73;
  reg        [31:0]   _zz_74;
  reg                 _zz_75;
  reg        [31:0]   _zz_76;
  reg                 _zz_77;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_0;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_1;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_2;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_3;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_4;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_5;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_6;
  reg        [31:0]   IBusCachedPlugin_injector_formal_rawInDecode;
  wire                _zz_78;
  reg        [18:0]   _zz_79;
  wire                _zz_80;
  reg        [10:0]   _zz_81;
  wire                _zz_82;
  reg        [18:0]   _zz_83;
  reg                 _zz_84;
  wire                _zz_85;
  reg        [10:0]   _zz_86;
  wire                _zz_87;
  reg        [18:0]   _zz_88;
  wire                iBus_cmd_valid;
  wire                iBus_cmd_ready;
  reg        [31:0]   iBus_cmd_payload_address;
  wire       [2:0]    iBus_cmd_payload_size;
  wire                iBus_rsp_valid;
  wire       [31:0]   iBus_rsp_payload_data;
  wire                iBus_rsp_payload_error;
  wire       [31:0]   _zz_89;
  reg        [31:0]   IBusCachedPlugin_rspCounter;
  wire                IBusCachedPlugin_s0_tightlyCoupledHit;
  reg                 IBusCachedPlugin_s1_tightlyCoupledHit;
  reg                 IBusCachedPlugin_s2_tightlyCoupledHit;
  wire                IBusCachedPlugin_rsp_iBusRspOutputHalt;
  wire                IBusCachedPlugin_rsp_issueDetected;
  reg                 IBusCachedPlugin_rsp_redoFetch;
  wire                dataCache_1_io_mem_cmd_s2mPipe_valid;
  wire                dataCache_1_io_mem_cmd_s2mPipe_ready;
  wire                dataCache_1_io_mem_cmd_s2mPipe_payload_wr;
  wire                dataCache_1_io_mem_cmd_s2mPipe_payload_uncached;
  wire       [31:0]   dataCache_1_io_mem_cmd_s2mPipe_payload_address;
  wire       [31:0]   dataCache_1_io_mem_cmd_s2mPipe_payload_data;
  wire       [3:0]    dataCache_1_io_mem_cmd_s2mPipe_payload_mask;
  wire       [2:0]    dataCache_1_io_mem_cmd_s2mPipe_payload_length;
  wire                dataCache_1_io_mem_cmd_s2mPipe_payload_last;
  reg                 dataCache_1_io_mem_cmd_s2mPipe_rValid;
  reg                 dataCache_1_io_mem_cmd_s2mPipe_rData_wr;
  reg                 dataCache_1_io_mem_cmd_s2mPipe_rData_uncached;
  reg        [31:0]   dataCache_1_io_mem_cmd_s2mPipe_rData_address;
  reg        [31:0]   dataCache_1_io_mem_cmd_s2mPipe_rData_data;
  reg        [3:0]    dataCache_1_io_mem_cmd_s2mPipe_rData_mask;
  reg        [2:0]    dataCache_1_io_mem_cmd_s2mPipe_rData_length;
  reg                 dataCache_1_io_mem_cmd_s2mPipe_rData_last;
  wire                dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_valid;
  wire                dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_ready;
  wire                dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_wr;
  wire                dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_uncached;
  wire       [31:0]   dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_address;
  wire       [31:0]   dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_data;
  wire       [3:0]    dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_mask;
  wire       [2:0]    dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_length;
  wire                dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_last;
  reg                 dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_rValid;
  reg                 dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_rData_wr;
  reg                 dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_rData_uncached;
  reg        [31:0]   dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_rData_address;
  reg        [31:0]   dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_rData_data;
  reg        [3:0]    dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_rData_mask;
  reg        [2:0]    dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_rData_length;
  reg                 dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_rData_last;
  reg                 dBus_rsp_regNext_valid;
  reg                 dBus_rsp_regNext_payload_last;
  reg        [31:0]   dBus_rsp_regNext_payload_data;
  reg                 dBus_rsp_regNext_payload_error;
  wire       [31:0]   _zz_90;
  reg        [31:0]   DBusCachedPlugin_rspCounter;
  wire       [1:0]    execute_DBusCachedPlugin_size;
  reg        [31:0]   _zz_91;
  reg        [31:0]   writeBack_DBusCachedPlugin_rspShifted;
  wire                _zz_92;
  reg        [31:0]   _zz_93;
  wire                _zz_94;
  reg        [31:0]   _zz_95;
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
  wire                _zz_96;
  wire                _zz_97;
  wire                _zz_98;
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
  reg                 CsrPlugin_hadException /* verilator public */ ;
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
  wire       [32:0]   _zz_99;
  wire                _zz_100;
  wire                _zz_101;
  wire                _zz_102;
  wire                _zz_103;
  wire                _zz_104;
  wire                _zz_105;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_106;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_107;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_108;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_109;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_110;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_111;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_112;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress1;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress2;
  wire       [31:0]   decode_RegFilePlugin_rs1Data;
  wire       [31:0]   decode_RegFilePlugin_rs2Data;
  reg                 lastStageRegFileWrite_valid /* verilator public */ ;
  reg        [4:0]    lastStageRegFileWrite_payload_address /* verilator public */ ;
  reg        [31:0]   lastStageRegFileWrite_payload_data /* verilator public */ ;
  reg                 _zz_113;
  reg        [31:0]   execute_IntAluPlugin_bitwise;
  reg        [31:0]   _zz_114;
  reg        [31:0]   _zz_115;
  wire                _zz_116;
  reg        [19:0]   _zz_117;
  wire                _zz_118;
  reg        [19:0]   _zz_119;
  reg        [31:0]   _zz_120;
  reg        [31:0]   execute_SrcPlugin_addSub;
  wire                execute_SrcPlugin_less;
  wire       [4:0]    execute_FullBarrelShifterPlugin_amplitude;
  reg        [31:0]   _zz_121;
  wire       [31:0]   execute_FullBarrelShifterPlugin_reversed;
  reg        [31:0]   _zz_122;
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
  wire       [31:0]   _zz_123;
  wire       [32:0]   memory_MulDivIterativePlugin_div_stage_0_remainderShifted;
  wire       [32:0]   memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator;
  wire       [31:0]   memory_MulDivIterativePlugin_div_stage_0_outRemainder;
  wire       [31:0]   memory_MulDivIterativePlugin_div_stage_0_outNumerator;
  wire       [31:0]   _zz_124;
  wire                _zz_125;
  wire                _zz_126;
  reg        [32:0]   _zz_127;
  reg                 HazardSimplePlugin_src0Hazard;
  reg                 HazardSimplePlugin_src1Hazard;
  wire                HazardSimplePlugin_writeBackWrites_valid;
  wire       [4:0]    HazardSimplePlugin_writeBackWrites_payload_address;
  wire       [31:0]   HazardSimplePlugin_writeBackWrites_payload_data;
  reg                 HazardSimplePlugin_writeBackBuffer_valid;
  reg        [4:0]    HazardSimplePlugin_writeBackBuffer_payload_address;
  reg        [31:0]   HazardSimplePlugin_writeBackBuffer_payload_data;
  wire                HazardSimplePlugin_addr0Match;
  wire                HazardSimplePlugin_addr1Match;
  wire                _zz_128;
  wire                _zz_129;
  wire                _zz_130;
  wire                _zz_131;
  wire                _zz_132;
  wire                _zz_133;
  wire                execute_BranchPlugin_eq;
  wire       [2:0]    _zz_134;
  reg                 _zz_135;
  reg                 _zz_136;
  wire                _zz_137;
  reg        [19:0]   _zz_138;
  wire                _zz_139;
  reg        [10:0]   _zz_140;
  wire                _zz_141;
  reg        [18:0]   _zz_142;
  reg                 _zz_143;
  wire                execute_BranchPlugin_missAlignedTarget;
  reg        [31:0]   execute_BranchPlugin_branch_src1;
  reg        [31:0]   execute_BranchPlugin_branch_src2;
  wire                _zz_144;
  reg        [19:0]   _zz_145;
  wire                _zz_146;
  reg        [10:0]   _zz_147;
  wire                _zz_148;
  reg        [18:0]   _zz_149;
  wire       [31:0]   execute_BranchPlugin_branchAdder;
  reg        [31:0]   decode_to_execute_PC;
  reg        [31:0]   execute_to_memory_PC;
  reg        [31:0]   memory_to_writeBack_PC;
  reg        [31:0]   decode_to_execute_INSTRUCTION;
  reg        [31:0]   execute_to_memory_INSTRUCTION;
  reg        [31:0]   memory_to_writeBack_INSTRUCTION;
  reg        [31:0]   decode_to_execute_FORMAL_PC_NEXT;
  reg        [31:0]   execute_to_memory_FORMAL_PC_NEXT;
  reg        [31:0]   memory_to_writeBack_FORMAL_PC_NEXT;
  reg                 decode_to_execute_MEMORY_FORCE_CONSTISTENCY;
  reg                 decode_to_execute_CSR_WRITE_OPCODE;
  reg                 decode_to_execute_CSR_READ_OPCODE;
  reg        `Src1CtrlEnum_defaultEncoding_type decode_to_execute_SRC1_CTRL;
  reg                 decode_to_execute_SRC_USE_SUB_LESS;
  reg                 decode_to_execute_MEMORY_ENABLE;
  reg                 execute_to_memory_MEMORY_ENABLE;
  reg                 memory_to_writeBack_MEMORY_ENABLE;
  reg        `AluCtrlEnum_defaultEncoding_type decode_to_execute_ALU_CTRL;
  reg        `Src2CtrlEnum_defaultEncoding_type decode_to_execute_SRC2_CTRL;
  reg                 decode_to_execute_REGFILE_WRITE_VALID;
  reg                 execute_to_memory_REGFILE_WRITE_VALID;
  reg                 memory_to_writeBack_REGFILE_WRITE_VALID;
  reg                 decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  reg                 decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  reg                 execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  reg                 decode_to_execute_MEMORY_WR;
  reg                 execute_to_memory_MEMORY_WR;
  reg                 memory_to_writeBack_MEMORY_WR;
  reg                 decode_to_execute_MEMORY_LRSC;
  reg                 decode_to_execute_MEMORY_AMO;
  reg                 decode_to_execute_MEMORY_MANAGMENT;
  reg                 decode_to_execute_IS_CSR;
  reg        `EnvCtrlEnum_defaultEncoding_type decode_to_execute_ENV_CTRL;
  reg        `EnvCtrlEnum_defaultEncoding_type execute_to_memory_ENV_CTRL;
  reg        `EnvCtrlEnum_defaultEncoding_type memory_to_writeBack_ENV_CTRL;
  reg                 decode_to_execute_SRC_LESS_UNSIGNED;
  reg        `AluBitwiseCtrlEnum_defaultEncoding_type decode_to_execute_ALU_BITWISE_CTRL;
  reg        `ShiftCtrlEnum_defaultEncoding_type decode_to_execute_SHIFT_CTRL;
  reg        `ShiftCtrlEnum_defaultEncoding_type execute_to_memory_SHIFT_CTRL;
  reg                 decode_to_execute_IS_MUL;
  reg                 execute_to_memory_IS_MUL;
  reg                 memory_to_writeBack_IS_MUL;
  reg                 decode_to_execute_IS_DIV;
  reg                 execute_to_memory_IS_DIV;
  reg                 decode_to_execute_IS_RS1_SIGNED;
  reg                 decode_to_execute_IS_RS2_SIGNED;
  reg        `BranchCtrlEnum_defaultEncoding_type decode_to_execute_BRANCH_CTRL;
  reg        [31:0]   decode_to_execute_RS1;
  reg        [31:0]   decode_to_execute_RS2;
  reg                 decode_to_execute_SRC2_FORCE_ZERO;
  reg                 decode_to_execute_PREDICTION_HAD_BRANCHED2;
  reg        [1:0]    execute_to_memory_MEMORY_ADDRESS_LOW;
  reg        [1:0]    memory_to_writeBack_MEMORY_ADDRESS_LOW;
  reg        [31:0]   execute_to_memory_REGFILE_WRITE_DATA;
  reg        [31:0]   memory_to_writeBack_REGFILE_WRITE_DATA;
  reg        [31:0]   execute_to_memory_SHIFT_RIGHT;
  reg        [31:0]   execute_to_memory_MUL_LL;
  reg        [33:0]   execute_to_memory_MUL_LH;
  reg        [33:0]   execute_to_memory_MUL_HL;
  reg        [33:0]   execute_to_memory_MUL_HH;
  reg        [33:0]   memory_to_writeBack_MUL_HH;
  reg                 execute_to_memory_BRANCH_DO;
  reg        [31:0]   execute_to_memory_BRANCH_CALC;
  reg        [51:0]   memory_to_writeBack_MUL_LOW;
  reg                 execute_CsrPlugin_csr_768;
  reg                 execute_CsrPlugin_csr_836;
  reg                 execute_CsrPlugin_csr_772;
  reg                 execute_CsrPlugin_csr_773;
  reg                 execute_CsrPlugin_csr_834;
  reg                 execute_CsrPlugin_csr_2816;
  reg                 execute_CsrPlugin_csr_2944;
  reg                 execute_CsrPlugin_csr_3072;
  reg                 execute_CsrPlugin_csr_3200;
  reg        [31:0]   _zz_150;
  reg        [31:0]   _zz_151;
  reg        [31:0]   _zz_152;
  reg        [31:0]   _zz_153;
  reg        [31:0]   _zz_154;
  reg        [31:0]   _zz_155;
  reg        [31:0]   _zz_156;
  reg        [31:0]   _zz_157;
  reg        [31:0]   _zz_158;
  wire                _zz_159;
  wire       [31:0]   _zz_160;
  wire       [7:0]    _zz_161;
  wire                _zz_162;
  wire                dBus_cmd_m2sPipe_valid;
  wire                dBus_cmd_m2sPipe_ready;
  wire                dBus_cmd_m2sPipe_payload_wr;
  wire                dBus_cmd_m2sPipe_payload_uncached;
  wire       [31:0]   dBus_cmd_m2sPipe_payload_address;
  wire       [31:0]   dBus_cmd_m2sPipe_payload_data;
  wire       [3:0]    dBus_cmd_m2sPipe_payload_mask;
  wire       [2:0]    dBus_cmd_m2sPipe_payload_length;
  wire                dBus_cmd_m2sPipe_payload_last;
  reg                 dBus_cmd_m2sPipe_rValid;
  reg                 dBus_cmd_m2sPipe_rData_wr;
  reg                 dBus_cmd_m2sPipe_rData_uncached;
  reg        [31:0]   dBus_cmd_m2sPipe_rData_address;
  reg        [31:0]   dBus_cmd_m2sPipe_rData_data;
  reg        [3:0]    dBus_cmd_m2sPipe_rData_mask;
  reg        [2:0]    dBus_cmd_m2sPipe_rData_length;
  reg                 dBus_cmd_m2sPipe_rData_last;
  wire                dBus_cmd_m2sPipe_m2sPipe_valid;
  wire                dBus_cmd_m2sPipe_m2sPipe_ready;
  wire                dBus_cmd_m2sPipe_m2sPipe_payload_wr;
  wire                dBus_cmd_m2sPipe_m2sPipe_payload_uncached;
  wire       [31:0]   dBus_cmd_m2sPipe_m2sPipe_payload_address;
  wire       [31:0]   dBus_cmd_m2sPipe_m2sPipe_payload_data;
  wire       [3:0]    dBus_cmd_m2sPipe_m2sPipe_payload_mask;
  wire       [2:0]    dBus_cmd_m2sPipe_m2sPipe_payload_length;
  wire                dBus_cmd_m2sPipe_m2sPipe_payload_last;
  reg                 dBus_cmd_m2sPipe_m2sPipe_rValid;
  reg                 dBus_cmd_m2sPipe_m2sPipe_rData_wr;
  reg                 dBus_cmd_m2sPipe_m2sPipe_rData_uncached;
  reg        [31:0]   dBus_cmd_m2sPipe_m2sPipe_rData_address;
  reg        [31:0]   dBus_cmd_m2sPipe_m2sPipe_rData_data;
  reg        [3:0]    dBus_cmd_m2sPipe_m2sPipe_rData_mask;
  reg        [2:0]    dBus_cmd_m2sPipe_m2sPipe_rData_length;
  reg                 dBus_cmd_m2sPipe_m2sPipe_rData_last;
  wire                dBus_cmd_m2sPipe_m2sPipe_s2mPipe_valid;
  wire                dBus_cmd_m2sPipe_m2sPipe_s2mPipe_ready;
  wire                dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_wr;
  wire                dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_uncached;
  wire       [31:0]   dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_address;
  wire       [31:0]   dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_data;
  wire       [3:0]    dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_mask;
  wire       [2:0]    dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_length;
  wire                dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_last;
  reg                 dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rValid;
  reg                 dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rData_wr;
  reg                 dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rData_uncached;
  reg        [31:0]   dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rData_address;
  reg        [31:0]   dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rData_data;
  reg        [3:0]    dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rData_mask;
  reg        [2:0]    dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rData_length;
  reg                 dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rData_last;
  reg                 _zz_163;
  reg                 _zz_164;
  reg        [2:0]    _zz_165;
  reg        [2:0]    _zz_166;
  wire                _zz_167;
  reg                 _zz_168;
  reg                 streamFork_1_io_outputs_0_thrown_valid;
  wire                streamFork_1_io_outputs_0_thrown_ready;
  wire                streamFork_1_io_outputs_0_thrown_payload_wr;
  wire                streamFork_1_io_outputs_0_thrown_payload_uncached;
  wire       [31:0]   streamFork_1_io_outputs_0_thrown_payload_address;
  wire       [31:0]   streamFork_1_io_outputs_0_thrown_payload_data;
  wire       [3:0]    streamFork_1_io_outputs_0_thrown_payload_mask;
  wire       [2:0]    streamFork_1_io_outputs_0_thrown_payload_length;
  wire                streamFork_1_io_outputs_0_thrown_payload_last;
  reg                 streamFork_1_io_outputs_1_thrown_valid;
  wire                streamFork_1_io_outputs_1_thrown_ready;
  wire                streamFork_1_io_outputs_1_thrown_payload_wr;
  wire                streamFork_1_io_outputs_1_thrown_payload_uncached;
  wire       [31:0]   streamFork_1_io_outputs_1_thrown_payload_address;
  wire       [31:0]   streamFork_1_io_outputs_1_thrown_payload_data;
  wire       [3:0]    streamFork_1_io_outputs_1_thrown_payload_mask;
  wire       [2:0]    streamFork_1_io_outputs_1_thrown_payload_length;
  wire                streamFork_1_io_outputs_1_thrown_payload_last;
  wire       [0:0]    _zz_169;
  wire       [3:0]    _zz_170;
  wire       [0:0]    _zz_171;
  wire       [3:0]    _zz_172;
  `ifndef SYNTHESIS
  reg [31:0] _zz_1_string;
  reg [31:0] _zz_2_string;
  reg [71:0] _zz_3_string;
  reg [71:0] _zz_4_string;
  reg [71:0] decode_SHIFT_CTRL_string;
  reg [71:0] _zz_5_string;
  reg [71:0] _zz_6_string;
  reg [71:0] _zz_7_string;
  reg [39:0] decode_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_8_string;
  reg [39:0] _zz_9_string;
  reg [39:0] _zz_10_string;
  reg [31:0] _zz_11_string;
  reg [31:0] _zz_12_string;
  reg [31:0] _zz_13_string;
  reg [31:0] _zz_14_string;
  reg [31:0] decode_ENV_CTRL_string;
  reg [31:0] _zz_15_string;
  reg [31:0] _zz_16_string;
  reg [31:0] _zz_17_string;
  reg [23:0] decode_SRC2_CTRL_string;
  reg [23:0] _zz_18_string;
  reg [23:0] _zz_19_string;
  reg [23:0] _zz_20_string;
  reg [63:0] decode_ALU_CTRL_string;
  reg [63:0] _zz_21_string;
  reg [63:0] _zz_22_string;
  reg [63:0] _zz_23_string;
  reg [95:0] decode_SRC1_CTRL_string;
  reg [95:0] _zz_24_string;
  reg [95:0] _zz_25_string;
  reg [95:0] _zz_26_string;
  reg [31:0] execute_BRANCH_CTRL_string;
  reg [31:0] _zz_27_string;
  reg [71:0] memory_SHIFT_CTRL_string;
  reg [71:0] _zz_29_string;
  reg [71:0] execute_SHIFT_CTRL_string;
  reg [71:0] _zz_30_string;
  reg [23:0] execute_SRC2_CTRL_string;
  reg [23:0] _zz_32_string;
  reg [95:0] execute_SRC1_CTRL_string;
  reg [95:0] _zz_33_string;
  reg [63:0] execute_ALU_CTRL_string;
  reg [63:0] _zz_34_string;
  reg [39:0] execute_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_35_string;
  reg [31:0] _zz_39_string;
  reg [71:0] _zz_40_string;
  reg [39:0] _zz_41_string;
  reg [31:0] _zz_42_string;
  reg [23:0] _zz_43_string;
  reg [63:0] _zz_44_string;
  reg [95:0] _zz_45_string;
  reg [31:0] memory_ENV_CTRL_string;
  reg [31:0] _zz_47_string;
  reg [31:0] execute_ENV_CTRL_string;
  reg [31:0] _zz_48_string;
  reg [31:0] writeBack_ENV_CTRL_string;
  reg [31:0] _zz_49_string;
  reg [31:0] decode_BRANCH_CTRL_string;
  reg [31:0] _zz_52_string;
  reg [95:0] _zz_106_string;
  reg [63:0] _zz_107_string;
  reg [23:0] _zz_108_string;
  reg [31:0] _zz_109_string;
  reg [39:0] _zz_110_string;
  reg [71:0] _zz_111_string;
  reg [31:0] _zz_112_string;
  reg [95:0] decode_to_execute_SRC1_CTRL_string;
  reg [63:0] decode_to_execute_ALU_CTRL_string;
  reg [23:0] decode_to_execute_SRC2_CTRL_string;
  reg [31:0] decode_to_execute_ENV_CTRL_string;
  reg [31:0] execute_to_memory_ENV_CTRL_string;
  reg [31:0] memory_to_writeBack_ENV_CTRL_string;
  reg [39:0] decode_to_execute_ALU_BITWISE_CTRL_string;
  reg [71:0] decode_to_execute_SHIFT_CTRL_string;
  reg [71:0] execute_to_memory_SHIFT_CTRL_string;
  reg [31:0] decode_to_execute_BRANCH_CTRL_string;
  `endif

  reg [31:0] RegFilePlugin_regFile [0:31] /* verilator public */ ;

  assign _zz_210 = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign _zz_211 = 1'b1;
  assign _zz_212 = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign _zz_213 = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign _zz_214 = (memory_arbitration_isValid && memory_IS_DIV);
  assign _zz_215 = (execute_arbitration_isValid && execute_IS_CSR);
  assign _zz_216 = ((_zz_178 && IBusCachedPlugin_cache_io_cpu_decode_error) && (! IBusCachedPlugin_rsp_issueDetected_3));
  assign _zz_217 = ((_zz_178 && IBusCachedPlugin_cache_io_cpu_decode_cacheMiss) && (! IBusCachedPlugin_rsp_issueDetected_2));
  assign _zz_218 = ((_zz_178 && IBusCachedPlugin_cache_io_cpu_decode_mmuException) && (! IBusCachedPlugin_rsp_issueDetected_1));
  assign _zz_219 = ((_zz_178 && IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling) && (! IBusCachedPlugin_rsp_issueDetected));
  assign _zz_220 = (CsrPlugin_hadException || CsrPlugin_interruptJump);
  assign _zz_221 = (writeBack_arbitration_isValid && (writeBack_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET));
  assign _zz_222 = writeBack_INSTRUCTION[29 : 28];
  assign _zz_223 = (writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE);
  assign _zz_224 = (CsrPlugin_privilege < execute_CsrPlugin_csrAddress[9 : 8]);
  assign _zz_225 = execute_INSTRUCTION[13 : 12];
  assign _zz_226 = (memory_MulDivIterativePlugin_frontendOk && (! memory_MulDivIterativePlugin_div_done));
  assign _zz_227 = (! memory_arbitration_isStuck);
  assign _zz_228 = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign _zz_229 = (1'b0 || (! 1'b1));
  assign _zz_230 = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign _zz_231 = (1'b0 || (! memory_BYPASSABLE_MEMORY_STAGE));
  assign _zz_232 = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign _zz_233 = (1'b0 || (! execute_BYPASSABLE_EXECUTE_STAGE));
  assign _zz_234 = (! streamFork_1_io_outputs_1_payload_wr);
  assign _zz_235 = (_zz_203 && (! dataCache_1_io_mem_cmd_s2mPipe_ready));
  assign _zz_236 = (CsrPlugin_mstatus_MIE || (CsrPlugin_privilege < 2'b11));
  assign _zz_237 = ((_zz_96 && 1'b1) && (! 1'b0));
  assign _zz_238 = ((_zz_97 && 1'b1) && (! 1'b0));
  assign _zz_239 = ((_zz_98 && 1'b1) && (! 1'b0));
  assign _zz_240 = (dBus_cmd_m2sPipe_m2sPipe_ready && (! dBus_cmd_m2sPipe_m2sPipe_s2mPipe_ready));
  assign _zz_241 = writeBack_INSTRUCTION[13 : 12];
  assign _zz_242 = execute_INSTRUCTION[13];
  assign _zz_243 = writeBack_INSTRUCTION[13 : 12];
  assign _zz_244 = ($signed(_zz_245) + $signed(_zz_250));
  assign _zz_245 = ($signed(_zz_246) + $signed(_zz_248));
  assign _zz_246 = 52'h0;
  assign _zz_247 = {1'b0,memory_MUL_LL};
  assign _zz_248 = {{19{_zz_247[32]}}, _zz_247};
  assign _zz_249 = ({16'd0,memory_MUL_LH} <<< 16);
  assign _zz_250 = {{2{_zz_249[49]}}, _zz_249};
  assign _zz_251 = ({16'd0,memory_MUL_HL} <<< 16);
  assign _zz_252 = {{2{_zz_251[49]}}, _zz_251};
  assign _zz_253 = ($signed(_zz_255) >>> execute_FullBarrelShifterPlugin_amplitude);
  assign _zz_254 = _zz_253[31 : 0];
  assign _zz_255 = {((execute_SHIFT_CTRL == `ShiftCtrlEnum_defaultEncoding_SRA_1) && execute_FullBarrelShifterPlugin_reversed[31]),execute_FullBarrelShifterPlugin_reversed};
  assign _zz_256 = _zz_99[30 : 30];
  assign _zz_257 = _zz_99[29 : 29];
  assign _zz_258 = _zz_99[28 : 28];
  assign _zz_259 = _zz_99[27 : 27];
  assign _zz_260 = _zz_99[22 : 22];
  assign _zz_261 = _zz_99[20 : 20];
  assign _zz_262 = _zz_99[19 : 19];
  assign _zz_263 = _zz_99[13 : 13];
  assign _zz_264 = _zz_99[12 : 12];
  assign _zz_265 = _zz_99[11 : 11];
  assign _zz_266 = _zz_99[17 : 17];
  assign _zz_267 = _zz_99[5 : 5];
  assign _zz_268 = _zz_99[3 : 3];
  assign _zz_269 = _zz_99[18 : 18];
  assign _zz_270 = _zz_99[10 : 10];
  assign _zz_271 = _zz_99[16 : 16];
  assign _zz_272 = _zz_99[15 : 15];
  assign _zz_273 = _zz_99[4 : 4];
  assign _zz_274 = _zz_99[0 : 0];
  assign _zz_275 = (_zz_55 - 4'b0001);
  assign _zz_276 = {IBusCachedPlugin_fetchPc_inc,2'b00};
  assign _zz_277 = {29'd0, _zz_276};
  assign _zz_278 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_279 = {{_zz_79,{{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0};
  assign _zz_280 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]};
  assign _zz_281 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_282 = {{_zz_81,{{{decode_INSTRUCTION[31],decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]}},1'b0};
  assign _zz_283 = {{_zz_83,{{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0};
  assign _zz_284 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]};
  assign _zz_285 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_286 = (writeBack_MEMORY_WR ? 3'b111 : 3'b101);
  assign _zz_287 = (writeBack_MEMORY_WR ? 3'b110 : 3'b100);
  assign _zz_288 = execute_SRC_LESS;
  assign _zz_289 = 3'b100;
  assign _zz_290 = execute_INSTRUCTION[19 : 15];
  assign _zz_291 = execute_INSTRUCTION[31 : 20];
  assign _zz_292 = {execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]};
  assign _zz_293 = ($signed(_zz_294) + $signed(_zz_297));
  assign _zz_294 = ($signed(_zz_295) + $signed(_zz_296));
  assign _zz_295 = execute_SRC1;
  assign _zz_296 = (execute_SRC_USE_SUB_LESS ? (~ execute_SRC2) : execute_SRC2);
  assign _zz_297 = (execute_SRC_USE_SUB_LESS ? _zz_298 : _zz_299);
  assign _zz_298 = 32'h00000001;
  assign _zz_299 = 32'h0;
  assign _zz_300 = {{14{writeBack_MUL_LOW[51]}}, writeBack_MUL_LOW};
  assign _zz_301 = ({32'd0,writeBack_MUL_HH} <<< 32);
  assign _zz_302 = writeBack_MUL_LOW[31 : 0];
  assign _zz_303 = writeBack_MulPlugin_result[63 : 32];
  assign _zz_304 = memory_MulDivIterativePlugin_div_counter_willIncrement;
  assign _zz_305 = {5'd0, _zz_304};
  assign _zz_306 = {1'd0, memory_MulDivIterativePlugin_rs2};
  assign _zz_307 = memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator[31:0];
  assign _zz_308 = memory_MulDivIterativePlugin_div_stage_0_remainderShifted[31:0];
  assign _zz_309 = {_zz_123,(! memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator[32])};
  assign _zz_310 = _zz_311;
  assign _zz_311 = _zz_312;
  assign _zz_312 = ({memory_MulDivIterativePlugin_div_needRevert,(memory_MulDivIterativePlugin_div_needRevert ? (~ _zz_124) : _zz_124)} + _zz_314);
  assign _zz_313 = memory_MulDivIterativePlugin_div_needRevert;
  assign _zz_314 = {32'd0, _zz_313};
  assign _zz_315 = _zz_126;
  assign _zz_316 = {32'd0, _zz_315};
  assign _zz_317 = _zz_125;
  assign _zz_318 = {31'd0, _zz_317};
  assign _zz_319 = execute_INSTRUCTION[31 : 20];
  assign _zz_320 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz_321 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_322 = {_zz_138,execute_INSTRUCTION[31 : 20]};
  assign _zz_323 = {{_zz_140,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0};
  assign _zz_324 = {{_zz_142,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0};
  assign _zz_325 = execute_INSTRUCTION[31 : 20];
  assign _zz_326 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz_327 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_328 = 3'b100;
  assign _zz_329 = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_330 = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_331 = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_332 = execute_CsrPlugin_writeData[11 : 11];
  assign _zz_333 = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_334 = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_335 = 1'b1;
  assign _zz_336 = 1'b1;
  assign _zz_337 = {_zz_59,_zz_58};
  assign _zz_338 = decode_INSTRUCTION[31];
  assign _zz_339 = decode_INSTRUCTION[31];
  assign _zz_340 = decode_INSTRUCTION[7];
  assign _zz_341 = (decode_INSTRUCTION & 32'h0000001c);
  assign _zz_342 = 32'h00000004;
  assign _zz_343 = (decode_INSTRUCTION & 32'h00000058);
  assign _zz_344 = 32'h00000040;
  assign _zz_345 = _zz_105;
  assign _zz_346 = 1'b0;
  assign _zz_347 = (((decode_INSTRUCTION & 32'h02004064) == 32'h02004020) != 1'b0);
  assign _zz_348 = (((decode_INSTRUCTION & _zz_350) == 32'h02000030) != 1'b0);
  assign _zz_349 = {({_zz_351,_zz_352} != 2'b00),{({_zz_353,_zz_354} != 3'b000),{(_zz_355 != _zz_356),{_zz_357,{_zz_358,_zz_359}}}}};
  assign _zz_350 = 32'h02004074;
  assign _zz_351 = ((decode_INSTRUCTION & 32'h00007034) == 32'h00005010);
  assign _zz_352 = ((decode_INSTRUCTION & 32'h02007064) == 32'h00005020);
  assign _zz_353 = ((decode_INSTRUCTION & _zz_360) == 32'h40001010);
  assign _zz_354 = {(_zz_361 == _zz_362),(_zz_363 == _zz_364)};
  assign _zz_355 = ((decode_INSTRUCTION & _zz_365) == 32'h00001000);
  assign _zz_356 = 1'b0;
  assign _zz_357 = ((_zz_366 == _zz_367) != 1'b0);
  assign _zz_358 = ({_zz_368,_zz_369} != 2'b00);
  assign _zz_359 = {(_zz_370 != _zz_371),{_zz_372,{_zz_373,_zz_374}}};
  assign _zz_360 = 32'h40003054;
  assign _zz_361 = (decode_INSTRUCTION & 32'h00007034);
  assign _zz_362 = 32'h00001010;
  assign _zz_363 = (decode_INSTRUCTION & 32'h02007054);
  assign _zz_364 = 32'h00001010;
  assign _zz_365 = 32'h00001000;
  assign _zz_366 = (decode_INSTRUCTION & 32'h00003000);
  assign _zz_367 = 32'h00002000;
  assign _zz_368 = ((decode_INSTRUCTION & _zz_375) == 32'h00002000);
  assign _zz_369 = ((decode_INSTRUCTION & _zz_376) == 32'h00001000);
  assign _zz_370 = ((decode_INSTRUCTION & _zz_377) == 32'h00000050);
  assign _zz_371 = 1'b0;
  assign _zz_372 = ({_zz_378,_zz_379} != 2'b00);
  assign _zz_373 = (_zz_380 != 1'b0);
  assign _zz_374 = {(_zz_381 != _zz_382),{_zz_383,{_zz_384,_zz_385}}};
  assign _zz_375 = 32'h00002010;
  assign _zz_376 = 32'h00005000;
  assign _zz_377 = 32'h00003050;
  assign _zz_378 = ((decode_INSTRUCTION & 32'h00001050) == 32'h00001050);
  assign _zz_379 = ((decode_INSTRUCTION & 32'h00002050) == 32'h00002050);
  assign _zz_380 = ((decode_INSTRUCTION & 32'h00004048) == 32'h00004008);
  assign _zz_381 = ((decode_INSTRUCTION & _zz_386) == 32'h00000024);
  assign _zz_382 = 1'b0;
  assign _zz_383 = ({_zz_387,{_zz_388,_zz_389}} != 4'b0000);
  assign _zz_384 = (_zz_390 != 1'b0);
  assign _zz_385 = {(_zz_391 != _zz_392),{_zz_393,{_zz_394,_zz_395}}};
  assign _zz_386 = 32'h00000064;
  assign _zz_387 = ((decode_INSTRUCTION & 32'h00000034) == 32'h00000020);
  assign _zz_388 = ((decode_INSTRUCTION & _zz_396) == 32'h00000020);
  assign _zz_389 = {(_zz_397 == _zz_398),(_zz_399 == _zz_400)};
  assign _zz_390 = ((decode_INSTRUCTION & 32'h10000008) == 32'h00000008);
  assign _zz_391 = ((decode_INSTRUCTION & _zz_401) == 32'h10000008);
  assign _zz_392 = 1'b0;
  assign _zz_393 = ({_zz_402,{_zz_403,_zz_404}} != 4'b0000);
  assign _zz_394 = ({_zz_405,_zz_406} != 3'b000);
  assign _zz_395 = {(_zz_407 != _zz_408),{_zz_409,{_zz_410,_zz_411}}};
  assign _zz_396 = 32'h00000064;
  assign _zz_397 = (decode_INSTRUCTION & 32'h08000070);
  assign _zz_398 = 32'h08000020;
  assign _zz_399 = (decode_INSTRUCTION & 32'h10000070);
  assign _zz_400 = 32'h00000020;
  assign _zz_401 = 32'h10000008;
  assign _zz_402 = ((decode_INSTRUCTION & _zz_412) == 32'h00000040);
  assign _zz_403 = (_zz_413 == _zz_414);
  assign _zz_404 = {_zz_415,_zz_416};
  assign _zz_405 = (_zz_417 == _zz_418);
  assign _zz_406 = {_zz_419,_zz_420};
  assign _zz_407 = {_zz_421,{_zz_422,_zz_423}};
  assign _zz_408 = 5'h0;
  assign _zz_409 = ({_zz_424,_zz_425} != 5'h0);
  assign _zz_410 = (_zz_426 != _zz_427);
  assign _zz_411 = {_zz_428,{_zz_429,_zz_430}};
  assign _zz_412 = 32'h00000050;
  assign _zz_413 = (decode_INSTRUCTION & 32'h00003040);
  assign _zz_414 = 32'h00000040;
  assign _zz_415 = ((decode_INSTRUCTION & _zz_431) == 32'h0);
  assign _zz_416 = ((decode_INSTRUCTION & _zz_432) == 32'h10002008);
  assign _zz_417 = (decode_INSTRUCTION & 32'h08000020);
  assign _zz_418 = 32'h08000020;
  assign _zz_419 = ((decode_INSTRUCTION & _zz_433) == 32'h00000020);
  assign _zz_420 = ((decode_INSTRUCTION & _zz_434) == 32'h00000020);
  assign _zz_421 = ((decode_INSTRUCTION & _zz_435) == 32'h00000040);
  assign _zz_422 = (_zz_436 == _zz_437);
  assign _zz_423 = {_zz_438,{_zz_439,_zz_440}};
  assign _zz_424 = _zz_104;
  assign _zz_425 = {_zz_441,{_zz_442,_zz_443}};
  assign _zz_426 = {_zz_101,{_zz_444,_zz_445}};
  assign _zz_427 = 7'h0;
  assign _zz_428 = ({_zz_446,_zz_447} != 2'b00);
  assign _zz_429 = (_zz_448 != _zz_449);
  assign _zz_430 = {_zz_450,{_zz_451,_zz_452}};
  assign _zz_431 = 32'h00000038;
  assign _zz_432 = 32'h18002008;
  assign _zz_433 = 32'h10000020;
  assign _zz_434 = 32'h00000028;
  assign _zz_435 = 32'h00000040;
  assign _zz_436 = (decode_INSTRUCTION & 32'h00004020);
  assign _zz_437 = 32'h00004020;
  assign _zz_438 = ((decode_INSTRUCTION & _zz_453) == 32'h00000010);
  assign _zz_439 = _zz_104;
  assign _zz_440 = (_zz_454 == _zz_455);
  assign _zz_441 = ((decode_INSTRUCTION & _zz_456) == 32'h00002010);
  assign _zz_442 = (_zz_457 == _zz_458);
  assign _zz_443 = {_zz_459,_zz_460};
  assign _zz_444 = (_zz_461 == _zz_462);
  assign _zz_445 = {_zz_463,{_zz_464,_zz_465}};
  assign _zz_446 = _zz_103;
  assign _zz_447 = (_zz_466 == _zz_467);
  assign _zz_448 = {_zz_103,_zz_468};
  assign _zz_449 = 2'b00;
  assign _zz_450 = (_zz_469 != 1'b0);
  assign _zz_451 = (_zz_470 != _zz_471);
  assign _zz_452 = {_zz_472,{_zz_473,_zz_474}};
  assign _zz_453 = 32'h00000030;
  assign _zz_454 = (decode_INSTRUCTION & 32'h02000028);
  assign _zz_455 = 32'h00000020;
  assign _zz_456 = 32'h00002030;
  assign _zz_457 = (decode_INSTRUCTION & 32'h00001030);
  assign _zz_458 = 32'h00000010;
  assign _zz_459 = ((decode_INSTRUCTION & _zz_475) == 32'h00000020);
  assign _zz_460 = ((decode_INSTRUCTION & _zz_476) == 32'h00002020);
  assign _zz_461 = (decode_INSTRUCTION & 32'h00001010);
  assign _zz_462 = 32'h00001010;
  assign _zz_463 = ((decode_INSTRUCTION & _zz_477) == 32'h00002010);
  assign _zz_464 = (_zz_478 == _zz_479);
  assign _zz_465 = {_zz_480,{_zz_481,_zz_482}};
  assign _zz_466 = (decode_INSTRUCTION & 32'h00000070);
  assign _zz_467 = 32'h00000020;
  assign _zz_468 = ((decode_INSTRUCTION & _zz_483) == 32'h0);
  assign _zz_469 = ((decode_INSTRUCTION & _zz_484) == 32'h00004010);
  assign _zz_470 = (_zz_485 == _zz_486);
  assign _zz_471 = 1'b0;
  assign _zz_472 = ({_zz_487,_zz_488} != 5'h0);
  assign _zz_473 = (_zz_489 != _zz_490);
  assign _zz_474 = {_zz_491,{_zz_492,_zz_493}};
  assign _zz_475 = 32'h02003020;
  assign _zz_476 = 32'h02002068;
  assign _zz_477 = 32'h00002010;
  assign _zz_478 = (decode_INSTRUCTION & 32'h00002008);
  assign _zz_479 = 32'h00002008;
  assign _zz_480 = ((decode_INSTRUCTION & _zz_494) == 32'h00000010);
  assign _zz_481 = _zz_104;
  assign _zz_482 = (_zz_495 == _zz_496);
  assign _zz_483 = 32'h00000020;
  assign _zz_484 = 32'h00004014;
  assign _zz_485 = (decode_INSTRUCTION & 32'h00006014);
  assign _zz_486 = 32'h00002010;
  assign _zz_487 = (_zz_497 == _zz_498);
  assign _zz_488 = {_zz_499,{_zz_500,_zz_501}};
  assign _zz_489 = {_zz_102,_zz_502};
  assign _zz_490 = 2'b00;
  assign _zz_491 = ({_zz_503,_zz_504} != 3'b000);
  assign _zz_492 = (_zz_505 != _zz_506);
  assign _zz_493 = {_zz_507,_zz_508};
  assign _zz_494 = 32'h00000050;
  assign _zz_495 = (decode_INSTRUCTION & 32'h00000028);
  assign _zz_496 = 32'h0;
  assign _zz_497 = (decode_INSTRUCTION & 32'h00000044);
  assign _zz_498 = 32'h0;
  assign _zz_499 = ((decode_INSTRUCTION & _zz_509) == 32'h0);
  assign _zz_500 = (_zz_510 == _zz_511);
  assign _zz_501 = {_zz_512,_zz_102};
  assign _zz_502 = ((decode_INSTRUCTION & _zz_513) == 32'h0);
  assign _zz_503 = (_zz_514 == _zz_515);
  assign _zz_504 = {_zz_516,_zz_517};
  assign _zz_505 = {_zz_101,{_zz_518,_zz_519}};
  assign _zz_506 = 3'b000;
  assign _zz_507 = ({_zz_520,_zz_521} != 2'b00);
  assign _zz_508 = (_zz_522 != 1'b0);
  assign _zz_509 = 32'h00000018;
  assign _zz_510 = (decode_INSTRUCTION & 32'h00006004);
  assign _zz_511 = 32'h00002000;
  assign _zz_512 = ((decode_INSTRUCTION & 32'h00005004) == 32'h00001000);
  assign _zz_513 = 32'h00000058;
  assign _zz_514 = (decode_INSTRUCTION & 32'h00000044);
  assign _zz_515 = 32'h00000040;
  assign _zz_516 = ((decode_INSTRUCTION & 32'h00002014) == 32'h00002010);
  assign _zz_517 = ((decode_INSTRUCTION & 32'h40000034) == 32'h40000030);
  assign _zz_518 = _zz_100;
  assign _zz_519 = ((decode_INSTRUCTION & 32'h00002014) == 32'h00000004);
  assign _zz_520 = _zz_100;
  assign _zz_521 = ((decode_INSTRUCTION & 32'h0000004c) == 32'h00000004);
  assign _zz_522 = ((decode_INSTRUCTION & 32'h00005048) == 32'h00001008);
  assign _zz_523 = execute_INSTRUCTION[31];
  assign _zz_524 = execute_INSTRUCTION[31];
  assign _zz_525 = execute_INSTRUCTION[7];
  always @ (posedge clk) begin
    if(_zz_335) begin
      _zz_207 <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress1];
    end
  end

  always @ (posedge clk) begin
    if(_zz_336) begin
      _zz_208 <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress2];
    end
  end

  always @ (posedge clk) begin
    if(_zz_38) begin
      RegFilePlugin_regFile[lastStageRegFileWrite_payload_address] <= lastStageRegFileWrite_payload_data;
    end
  end

  InstructionCache IBusCachedPlugin_cache (
    .io_flush                                 (_zz_173                                                     ), //i
    .io_cpu_prefetch_isValid                  (_zz_174                                                     ), //i
    .io_cpu_prefetch_haltIt                   (IBusCachedPlugin_cache_io_cpu_prefetch_haltIt               ), //o
    .io_cpu_prefetch_pc                       (IBusCachedPlugin_iBusRsp_stages_1_input_payload[31:0]       ), //i
    .io_cpu_fetch_isValid                     (_zz_175                                                     ), //i
    .io_cpu_fetch_isStuck                     (_zz_176                                                     ), //i
    .io_cpu_fetch_isRemoved                   (_zz_177                                                     ), //i
    .io_cpu_fetch_pc                          (IBusCachedPlugin_iBusRsp_stages_2_input_payload[31:0]       ), //i
    .io_cpu_fetch_data                        (IBusCachedPlugin_cache_io_cpu_fetch_data[31:0]              ), //o
    .io_cpu_fetch_mmuRsp_physicalAddress      (IBusCachedPlugin_mmuBus_rsp_physicalAddress[31:0]           ), //i
    .io_cpu_fetch_mmuRsp_isIoAccess           (IBusCachedPlugin_mmuBus_rsp_isIoAccess                      ), //i
    .io_cpu_fetch_mmuRsp_isPaging             (IBusCachedPlugin_mmuBus_rsp_isPaging                        ), //i
    .io_cpu_fetch_mmuRsp_allowRead            (IBusCachedPlugin_mmuBus_rsp_allowRead                       ), //i
    .io_cpu_fetch_mmuRsp_allowWrite           (IBusCachedPlugin_mmuBus_rsp_allowWrite                      ), //i
    .io_cpu_fetch_mmuRsp_allowExecute         (IBusCachedPlugin_mmuBus_rsp_allowExecute                    ), //i
    .io_cpu_fetch_mmuRsp_exception            (IBusCachedPlugin_mmuBus_rsp_exception                       ), //i
    .io_cpu_fetch_mmuRsp_refilling            (IBusCachedPlugin_mmuBus_rsp_refilling                       ), //i
    .io_cpu_fetch_mmuRsp_bypassTranslation    (IBusCachedPlugin_mmuBus_rsp_bypassTranslation               ), //i
    .io_cpu_fetch_physicalAddress             (IBusCachedPlugin_cache_io_cpu_fetch_physicalAddress[31:0]   ), //o
    .io_cpu_decode_isValid                    (_zz_178                                                     ), //i
    .io_cpu_decode_isStuck                    (_zz_179                                                     ), //i
    .io_cpu_decode_pc                         (IBusCachedPlugin_iBusRsp_stages_3_input_payload[31:0]       ), //i
    .io_cpu_decode_physicalAddress            (IBusCachedPlugin_cache_io_cpu_decode_physicalAddress[31:0]  ), //o
    .io_cpu_decode_data                       (IBusCachedPlugin_cache_io_cpu_decode_data[31:0]             ), //o
    .io_cpu_decode_cacheMiss                  (IBusCachedPlugin_cache_io_cpu_decode_cacheMiss              ), //o
    .io_cpu_decode_error                      (IBusCachedPlugin_cache_io_cpu_decode_error                  ), //o
    .io_cpu_decode_mmuRefilling               (IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling           ), //o
    .io_cpu_decode_mmuException               (IBusCachedPlugin_cache_io_cpu_decode_mmuException           ), //o
    .io_cpu_decode_isUser                     (_zz_180                                                     ), //i
    .io_cpu_fill_valid                        (_zz_181                                                     ), //i
    .io_cpu_fill_payload                      (IBusCachedPlugin_cache_io_cpu_decode_physicalAddress[31:0]  ), //i
    .io_mem_cmd_valid                         (IBusCachedPlugin_cache_io_mem_cmd_valid                     ), //o
    .io_mem_cmd_ready                         (iBus_cmd_ready                                              ), //i
    .io_mem_cmd_payload_address               (IBusCachedPlugin_cache_io_mem_cmd_payload_address[31:0]     ), //o
    .io_mem_cmd_payload_size                  (IBusCachedPlugin_cache_io_mem_cmd_payload_size[2:0]         ), //o
    .io_mem_rsp_valid                         (iBus_rsp_valid                                              ), //i
    .io_mem_rsp_payload_data                  (iBus_rsp_payload_data[31:0]                                 ), //i
    .io_mem_rsp_payload_error                 (iBus_rsp_payload_error                                      ), //i
    .clk                                      (clk                                                         ), //i
    .reset                                    (reset                                                       )  //i
  );
  DataCache dataCache_1 (
    .io_cpu_execute_isValid                    (_zz_182                                            ), //i
    .io_cpu_execute_address                    (_zz_183[31:0]                                      ), //i
    .io_cpu_execute_haltIt                     (dataCache_1_io_cpu_execute_haltIt                  ), //o
    .io_cpu_execute_args_wr                    (execute_MEMORY_WR                                  ), //i
    .io_cpu_execute_args_data                  (_zz_91[31:0]                                       ), //i
    .io_cpu_execute_args_size                  (execute_DBusCachedPlugin_size[1:0]                 ), //i
    .io_cpu_execute_args_isLrsc                (_zz_184                                            ), //i
    .io_cpu_execute_args_isAmo                 (execute_MEMORY_AMO                                 ), //i
    .io_cpu_execute_args_amoCtrl_swap          (_zz_185                                            ), //i
    .io_cpu_execute_args_amoCtrl_alu           (_zz_186[2:0]                                       ), //i
    .io_cpu_execute_args_totalyConsistent      (execute_MEMORY_FORCE_CONSTISTENCY                  ), //i
    .io_cpu_execute_refilling                  (dataCache_1_io_cpu_execute_refilling               ), //o
    .io_cpu_memory_isValid                     (_zz_187                                            ), //i
    .io_cpu_memory_isStuck                     (memory_arbitration_isStuck                         ), //i
    .io_cpu_memory_isWrite                     (dataCache_1_io_cpu_memory_isWrite                  ), //o
    .io_cpu_memory_address                     (_zz_188[31:0]                                      ), //i
    .io_cpu_memory_mmuRsp_physicalAddress      (DBusCachedPlugin_mmuBus_rsp_physicalAddress[31:0]  ), //i
    .io_cpu_memory_mmuRsp_isIoAccess           (_zz_189                                            ), //i
    .io_cpu_memory_mmuRsp_isPaging             (DBusCachedPlugin_mmuBus_rsp_isPaging               ), //i
    .io_cpu_memory_mmuRsp_allowRead            (DBusCachedPlugin_mmuBus_rsp_allowRead              ), //i
    .io_cpu_memory_mmuRsp_allowWrite           (DBusCachedPlugin_mmuBus_rsp_allowWrite             ), //i
    .io_cpu_memory_mmuRsp_allowExecute         (DBusCachedPlugin_mmuBus_rsp_allowExecute           ), //i
    .io_cpu_memory_mmuRsp_exception            (DBusCachedPlugin_mmuBus_rsp_exception              ), //i
    .io_cpu_memory_mmuRsp_refilling            (DBusCachedPlugin_mmuBus_rsp_refilling              ), //i
    .io_cpu_memory_mmuRsp_bypassTranslation    (DBusCachedPlugin_mmuBus_rsp_bypassTranslation      ), //i
    .io_cpu_writeBack_isValid                  (_zz_190                                            ), //i
    .io_cpu_writeBack_isStuck                  (writeBack_arbitration_isStuck                      ), //i
    .io_cpu_writeBack_isUser                   (_zz_191                                            ), //i
    .io_cpu_writeBack_haltIt                   (dataCache_1_io_cpu_writeBack_haltIt                ), //o
    .io_cpu_writeBack_isWrite                  (dataCache_1_io_cpu_writeBack_isWrite               ), //o
    .io_cpu_writeBack_data                     (dataCache_1_io_cpu_writeBack_data[31:0]            ), //o
    .io_cpu_writeBack_address                  (_zz_192[31:0]                                      ), //i
    .io_cpu_writeBack_mmuException             (dataCache_1_io_cpu_writeBack_mmuException          ), //o
    .io_cpu_writeBack_unalignedAccess          (dataCache_1_io_cpu_writeBack_unalignedAccess       ), //o
    .io_cpu_writeBack_accessError              (dataCache_1_io_cpu_writeBack_accessError           ), //o
    .io_cpu_writeBack_keepMemRspData           (dataCache_1_io_cpu_writeBack_keepMemRspData        ), //o
    .io_cpu_writeBack_fence_SW                 (_zz_193                                            ), //i
    .io_cpu_writeBack_fence_SR                 (_zz_194                                            ), //i
    .io_cpu_writeBack_fence_SO                 (_zz_195                                            ), //i
    .io_cpu_writeBack_fence_SI                 (_zz_196                                            ), //i
    .io_cpu_writeBack_fence_PW                 (_zz_197                                            ), //i
    .io_cpu_writeBack_fence_PR                 (_zz_198                                            ), //i
    .io_cpu_writeBack_fence_PO                 (_zz_199                                            ), //i
    .io_cpu_writeBack_fence_PI                 (_zz_200                                            ), //i
    .io_cpu_writeBack_fence_FM                 (_zz_201[3:0]                                       ), //i
    .io_cpu_redo                               (dataCache_1_io_cpu_redo                            ), //o
    .io_cpu_flush_valid                        (_zz_202                                            ), //i
    .io_cpu_flush_ready                        (dataCache_1_io_cpu_flush_ready                     ), //o
    .io_mem_cmd_valid                          (dataCache_1_io_mem_cmd_valid                       ), //o
    .io_mem_cmd_ready                          (_zz_203                                            ), //i
    .io_mem_cmd_payload_wr                     (dataCache_1_io_mem_cmd_payload_wr                  ), //o
    .io_mem_cmd_payload_uncached               (dataCache_1_io_mem_cmd_payload_uncached            ), //o
    .io_mem_cmd_payload_address                (dataCache_1_io_mem_cmd_payload_address[31:0]       ), //o
    .io_mem_cmd_payload_data                   (dataCache_1_io_mem_cmd_payload_data[31:0]          ), //o
    .io_mem_cmd_payload_mask                   (dataCache_1_io_mem_cmd_payload_mask[3:0]           ), //o
    .io_mem_cmd_payload_length                 (dataCache_1_io_mem_cmd_payload_length[2:0]         ), //o
    .io_mem_cmd_payload_last                   (dataCache_1_io_mem_cmd_payload_last                ), //o
    .io_mem_rsp_valid                          (dBus_rsp_regNext_valid                             ), //i
    .io_mem_rsp_payload_last                   (dBus_rsp_regNext_payload_last                      ), //i
    .io_mem_rsp_payload_data                   (dBus_rsp_regNext_payload_data[31:0]                ), //i
    .io_mem_rsp_payload_error                  (dBus_rsp_regNext_payload_error                     ), //i
    .clk                                       (clk                                                ), //i
    .reset                                     (reset                                              )  //i
  );
  StreamFork streamFork_1 (
    .io_input_valid                   (_zz_204                                                 ), //i
    .io_input_ready                   (streamFork_1_io_input_ready                             ), //o
    .io_input_payload_wr              (dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_wr             ), //i
    .io_input_payload_uncached        (dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_uncached       ), //i
    .io_input_payload_address         (dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_address[31:0]  ), //i
    .io_input_payload_data            (dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_data[31:0]     ), //i
    .io_input_payload_mask            (dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_mask[3:0]      ), //i
    .io_input_payload_length          (dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_length[2:0]    ), //i
    .io_input_payload_last            (dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_last           ), //i
    .io_outputs_0_valid               (streamFork_1_io_outputs_0_valid                         ), //o
    .io_outputs_0_ready               (_zz_205                                                 ), //i
    .io_outputs_0_payload_wr          (streamFork_1_io_outputs_0_payload_wr                    ), //o
    .io_outputs_0_payload_uncached    (streamFork_1_io_outputs_0_payload_uncached              ), //o
    .io_outputs_0_payload_address     (streamFork_1_io_outputs_0_payload_address[31:0]         ), //o
    .io_outputs_0_payload_data        (streamFork_1_io_outputs_0_payload_data[31:0]            ), //o
    .io_outputs_0_payload_mask        (streamFork_1_io_outputs_0_payload_mask[3:0]             ), //o
    .io_outputs_0_payload_length      (streamFork_1_io_outputs_0_payload_length[2:0]           ), //o
    .io_outputs_0_payload_last        (streamFork_1_io_outputs_0_payload_last                  ), //o
    .io_outputs_1_valid               (streamFork_1_io_outputs_1_valid                         ), //o
    .io_outputs_1_ready               (_zz_206                                                 ), //i
    .io_outputs_1_payload_wr          (streamFork_1_io_outputs_1_payload_wr                    ), //o
    .io_outputs_1_payload_uncached    (streamFork_1_io_outputs_1_payload_uncached              ), //o
    .io_outputs_1_payload_address     (streamFork_1_io_outputs_1_payload_address[31:0]         ), //o
    .io_outputs_1_payload_data        (streamFork_1_io_outputs_1_payload_data[31:0]            ), //o
    .io_outputs_1_payload_mask        (streamFork_1_io_outputs_1_payload_mask[3:0]             ), //o
    .io_outputs_1_payload_length      (streamFork_1_io_outputs_1_payload_length[2:0]           ), //o
    .io_outputs_1_payload_last        (streamFork_1_io_outputs_1_payload_last                  ), //o
    .clk                              (clk                                                     ), //i
    .reset                            (reset                                                   )  //i
  );
  always @(*) begin
    case(_zz_337)
      2'b00 : begin
        _zz_209 = DBusCachedPlugin_redoBranch_payload;
      end
      2'b01 : begin
        _zz_209 = CsrPlugin_jumpInterface_payload;
      end
      2'b10 : begin
        _zz_209 = BranchPlugin_jumpInterface_payload;
      end
      default : begin
        _zz_209 = IBusCachedPlugin_predictionJumpInterface_payload;
      end
    endcase
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(_zz_1)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_1_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_1_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_1_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_1_string = "JALR";
      default : _zz_1_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_2)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_2_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_2_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_2_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_2_string = "JALR";
      default : _zz_2_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_3)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_3_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_3_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_3_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_3_string = "SRA_1    ";
      default : _zz_3_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_4)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_4_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_4_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_4_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_4_string = "SRA_1    ";
      default : _zz_4_string = "?????????";
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
    case(_zz_5)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_5_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_5_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_5_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_5_string = "SRA_1    ";
      default : _zz_5_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_6)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_6_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_6_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_6_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_6_string = "SRA_1    ";
      default : _zz_6_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_7)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_7_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_7_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_7_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_7_string = "SRA_1    ";
      default : _zz_7_string = "?????????";
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
    case(_zz_8)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_8_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_8_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_8_string = "AND_1";
      default : _zz_8_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_9)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_9_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_9_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_9_string = "AND_1";
      default : _zz_9_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_10)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_10_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_10_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_10_string = "AND_1";
      default : _zz_10_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_11)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_11_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_11_string = "XRET";
      default : _zz_11_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_12)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_12_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_12_string = "XRET";
      default : _zz_12_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_13)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_13_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_13_string = "XRET";
      default : _zz_13_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_14)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_14_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_14_string = "XRET";
      default : _zz_14_string = "????";
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
    case(_zz_15)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_15_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_15_string = "XRET";
      default : _zz_15_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_16)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_16_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_16_string = "XRET";
      default : _zz_16_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_17)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_17_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_17_string = "XRET";
      default : _zz_17_string = "????";
    endcase
  end
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
    case(_zz_18)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_18_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_18_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_18_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_18_string = "PC ";
      default : _zz_18_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_19)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_19_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_19_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_19_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_19_string = "PC ";
      default : _zz_19_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_20)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_20_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_20_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_20_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_20_string = "PC ";
      default : _zz_20_string = "???";
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
    case(_zz_21)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_21_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_21_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_21_string = "BITWISE ";
      default : _zz_21_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_22)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_22_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_22_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_22_string = "BITWISE ";
      default : _zz_22_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_23)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_23_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_23_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_23_string = "BITWISE ";
      default : _zz_23_string = "????????";
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
    case(_zz_24)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_24_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_24_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_24_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_24_string = "URS1        ";
      default : _zz_24_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_25)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_25_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_25_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_25_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_25_string = "URS1        ";
      default : _zz_25_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_26)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_26_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_26_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_26_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_26_string = "URS1        ";
      default : _zz_26_string = "????????????";
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
    case(_zz_27)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_27_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_27_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_27_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_27_string = "JALR";
      default : _zz_27_string = "????";
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
    case(_zz_29)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_29_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_29_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_29_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_29_string = "SRA_1    ";
      default : _zz_29_string = "?????????";
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
    case(_zz_30)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_30_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_30_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_30_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_30_string = "SRA_1    ";
      default : _zz_30_string = "?????????";
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
    case(_zz_32)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_32_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_32_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_32_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_32_string = "PC ";
      default : _zz_32_string = "???";
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
    case(_zz_33)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_33_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_33_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_33_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_33_string = "URS1        ";
      default : _zz_33_string = "????????????";
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
    case(_zz_34)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_34_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_34_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_34_string = "BITWISE ";
      default : _zz_34_string = "????????";
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
    case(_zz_35)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_35_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_35_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_35_string = "AND_1";
      default : _zz_35_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_39)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_39_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_39_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_39_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_39_string = "JALR";
      default : _zz_39_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_40)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_40_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_40_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_40_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_40_string = "SRA_1    ";
      default : _zz_40_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_41)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_41_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_41_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_41_string = "AND_1";
      default : _zz_41_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_42)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_42_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_42_string = "XRET";
      default : _zz_42_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_43)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_43_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_43_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_43_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_43_string = "PC ";
      default : _zz_43_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_44)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_44_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_44_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_44_string = "BITWISE ";
      default : _zz_44_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_45)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_45_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_45_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_45_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_45_string = "URS1        ";
      default : _zz_45_string = "????????????";
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
    case(_zz_47)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_47_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_47_string = "XRET";
      default : _zz_47_string = "????";
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
    case(_zz_48)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_48_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_48_string = "XRET";
      default : _zz_48_string = "????";
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
    case(_zz_49)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_49_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_49_string = "XRET";
      default : _zz_49_string = "????";
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
    case(_zz_52)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_52_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_52_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_52_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_52_string = "JALR";
      default : _zz_52_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_106)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_106_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_106_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_106_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_106_string = "URS1        ";
      default : _zz_106_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_107)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_107_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_107_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_107_string = "BITWISE ";
      default : _zz_107_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_108)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_108_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_108_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_108_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_108_string = "PC ";
      default : _zz_108_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_109)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_109_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_109_string = "XRET";
      default : _zz_109_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_110)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_110_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_110_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_110_string = "AND_1";
      default : _zz_110_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_111)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_111_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_111_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_111_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_111_string = "SRA_1    ";
      default : _zz_111_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_112)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_112_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_112_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_112_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_112_string = "JALR";
      default : _zz_112_string = "????";
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
    case(decode_to_execute_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : decode_to_execute_SRC2_CTRL_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : decode_to_execute_SRC2_CTRL_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : decode_to_execute_SRC2_CTRL_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : decode_to_execute_SRC2_CTRL_string = "PC ";
      default : decode_to_execute_SRC2_CTRL_string = "???";
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
    case(decode_to_execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_to_execute_ALU_BITWISE_CTRL_string = "?????";
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
    case(decode_to_execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : decode_to_execute_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : decode_to_execute_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : decode_to_execute_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : decode_to_execute_BRANCH_CTRL_string = "JALR";
      default : decode_to_execute_BRANCH_CTRL_string = "????";
    endcase
  end
  `endif

  assign memory_MUL_LOW = ($signed(_zz_244) + $signed(_zz_252));
  assign execute_BRANCH_CALC = {execute_BranchPlugin_branchAdder[31 : 1],1'b0};
  assign execute_BRANCH_DO = ((execute_PREDICTION_HAD_BRANCHED2 != execute_BRANCH_COND_RESULT) || execute_BranchPlugin_missAlignedTarget);
  assign memory_MUL_HH = execute_to_memory_MUL_HH;
  assign execute_MUL_HH = ($signed(execute_MulPlugin_aHigh) * $signed(execute_MulPlugin_bHigh));
  assign execute_MUL_HL = ($signed(execute_MulPlugin_aHigh) * $signed(execute_MulPlugin_bSLow));
  assign execute_MUL_LH = ($signed(execute_MulPlugin_aSLow) * $signed(execute_MulPlugin_bHigh));
  assign execute_MUL_LL = (execute_MulPlugin_aULow * execute_MulPlugin_bULow);
  assign execute_SHIFT_RIGHT = _zz_254;
  assign execute_REGFILE_WRITE_DATA = _zz_114;
  assign memory_MEMORY_ADDRESS_LOW = execute_to_memory_MEMORY_ADDRESS_LOW;
  assign execute_MEMORY_ADDRESS_LOW = _zz_183[1 : 0];
  assign decode_PREDICTION_HAD_BRANCHED2 = IBusCachedPlugin_decodePrediction_cmd_hadBranch;
  assign decode_SRC2_FORCE_ZERO = (decode_SRC_ADD_ZERO && (! decode_SRC_USE_SUB_LESS));
  assign _zz_1 = _zz_2;
  assign decode_IS_RS2_SIGNED = _zz_256[0];
  assign decode_IS_RS1_SIGNED = _zz_257[0];
  assign decode_IS_DIV = _zz_258[0];
  assign memory_IS_MUL = execute_to_memory_IS_MUL;
  assign execute_IS_MUL = decode_to_execute_IS_MUL;
  assign decode_IS_MUL = _zz_259[0];
  assign _zz_3 = _zz_4;
  assign decode_SHIFT_CTRL = _zz_5;
  assign _zz_6 = _zz_7;
  assign decode_ALU_BITWISE_CTRL = _zz_8;
  assign _zz_9 = _zz_10;
  assign decode_SRC_LESS_UNSIGNED = _zz_260[0];
  assign _zz_11 = _zz_12;
  assign _zz_13 = _zz_14;
  assign decode_ENV_CTRL = _zz_15;
  assign _zz_16 = _zz_17;
  assign decode_IS_CSR = _zz_261[0];
  assign decode_MEMORY_MANAGMENT = _zz_262[0];
  assign memory_MEMORY_WR = execute_to_memory_MEMORY_WR;
  assign decode_MEMORY_WR = _zz_263[0];
  assign execute_BYPASSABLE_MEMORY_STAGE = decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  assign decode_BYPASSABLE_MEMORY_STAGE = _zz_264[0];
  assign decode_BYPASSABLE_EXECUTE_STAGE = _zz_265[0];
  assign decode_SRC2_CTRL = _zz_18;
  assign _zz_19 = _zz_20;
  assign decode_ALU_CTRL = _zz_21;
  assign _zz_22 = _zz_23;
  assign decode_SRC1_CTRL = _zz_24;
  assign _zz_25 = _zz_26;
  assign decode_CSR_READ_OPCODE = (decode_INSTRUCTION[13 : 7] != 7'h20);
  assign decode_CSR_WRITE_OPCODE = (! (((decode_INSTRUCTION[14 : 13] == 2'b01) && (decode_INSTRUCTION[19 : 15] == 5'h0)) || ((decode_INSTRUCTION[14 : 13] == 2'b11) && (decode_INSTRUCTION[19 : 15] == 5'h0))));
  assign decode_MEMORY_FORCE_CONSTISTENCY = _zz_51;
  assign writeBack_FORMAL_PC_NEXT = memory_to_writeBack_FORMAL_PC_NEXT;
  assign memory_FORMAL_PC_NEXT = execute_to_memory_FORMAL_PC_NEXT;
  assign execute_FORMAL_PC_NEXT = decode_to_execute_FORMAL_PC_NEXT;
  assign decode_FORMAL_PC_NEXT = (decode_PC + 32'h00000004);
  assign memory_PC = execute_to_memory_PC;
  assign memory_BRANCH_CALC = execute_to_memory_BRANCH_CALC;
  assign memory_BRANCH_DO = execute_to_memory_BRANCH_DO;
  assign execute_PC = decode_to_execute_PC;
  assign execute_PREDICTION_HAD_BRANCHED2 = decode_to_execute_PREDICTION_HAD_BRANCHED2;
  assign execute_BRANCH_COND_RESULT = _zz_136;
  assign execute_BRANCH_CTRL = _zz_27;
  assign decode_RS2_USE = _zz_266[0];
  assign decode_RS1_USE = _zz_267[0];
  assign execute_REGFILE_WRITE_VALID = decode_to_execute_REGFILE_WRITE_VALID;
  assign execute_BYPASSABLE_EXECUTE_STAGE = decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  assign memory_REGFILE_WRITE_VALID = execute_to_memory_REGFILE_WRITE_VALID;
  assign memory_BYPASSABLE_MEMORY_STAGE = execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  assign writeBack_REGFILE_WRITE_VALID = memory_to_writeBack_REGFILE_WRITE_VALID;
  always @ (*) begin
    decode_RS2 = decode_RegFilePlugin_rs2Data;
    if(HazardSimplePlugin_writeBackBuffer_valid)begin
      if(HazardSimplePlugin_addr1Match)begin
        decode_RS2 = HazardSimplePlugin_writeBackBuffer_payload_data;
      end
    end
    if(_zz_210)begin
      if(_zz_211)begin
        if(_zz_129)begin
          decode_RS2 = _zz_50;
        end
      end
    end
    if(_zz_212)begin
      if(memory_BYPASSABLE_MEMORY_STAGE)begin
        if(_zz_131)begin
          decode_RS2 = _zz_28;
        end
      end
    end
    if(_zz_213)begin
      if(execute_BYPASSABLE_EXECUTE_STAGE)begin
        if(_zz_133)begin
          decode_RS2 = _zz_46;
        end
      end
    end
  end

  always @ (*) begin
    decode_RS1 = decode_RegFilePlugin_rs1Data;
    if(HazardSimplePlugin_writeBackBuffer_valid)begin
      if(HazardSimplePlugin_addr0Match)begin
        decode_RS1 = HazardSimplePlugin_writeBackBuffer_payload_data;
      end
    end
    if(_zz_210)begin
      if(_zz_211)begin
        if(_zz_128)begin
          decode_RS1 = _zz_50;
        end
      end
    end
    if(_zz_212)begin
      if(memory_BYPASSABLE_MEMORY_STAGE)begin
        if(_zz_130)begin
          decode_RS1 = _zz_28;
        end
      end
    end
    if(_zz_213)begin
      if(execute_BYPASSABLE_EXECUTE_STAGE)begin
        if(_zz_132)begin
          decode_RS1 = _zz_46;
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
    _zz_28 = memory_REGFILE_WRITE_DATA;
    if(memory_arbitration_isValid)begin
      case(memory_SHIFT_CTRL)
        `ShiftCtrlEnum_defaultEncoding_SLL_1 : begin
          _zz_28 = _zz_122;
        end
        `ShiftCtrlEnum_defaultEncoding_SRL_1, `ShiftCtrlEnum_defaultEncoding_SRA_1 : begin
          _zz_28 = memory_SHIFT_RIGHT;
        end
        default : begin
        end
      endcase
    end
    if(_zz_214)begin
      _zz_28 = memory_MulDivIterativePlugin_div_result;
    end
  end

  assign memory_SHIFT_CTRL = _zz_29;
  assign execute_SHIFT_CTRL = _zz_30;
  assign execute_SRC_LESS_UNSIGNED = decode_to_execute_SRC_LESS_UNSIGNED;
  assign execute_SRC2_FORCE_ZERO = decode_to_execute_SRC2_FORCE_ZERO;
  assign execute_SRC_USE_SUB_LESS = decode_to_execute_SRC_USE_SUB_LESS;
  assign _zz_31 = execute_PC;
  assign execute_SRC2_CTRL = _zz_32;
  assign execute_SRC1_CTRL = _zz_33;
  assign decode_SRC_USE_SUB_LESS = _zz_268[0];
  assign decode_SRC_ADD_ZERO = _zz_269[0];
  assign execute_SRC_ADD_SUB = execute_SrcPlugin_addSub;
  assign execute_SRC_LESS = execute_SrcPlugin_less;
  assign execute_ALU_CTRL = _zz_34;
  assign execute_SRC2 = _zz_120;
  assign execute_ALU_BITWISE_CTRL = _zz_35;
  assign _zz_36 = writeBack_INSTRUCTION;
  assign _zz_37 = writeBack_REGFILE_WRITE_VALID;
  always @ (*) begin
    _zz_38 = 1'b0;
    if(lastStageRegFileWrite_valid)begin
      _zz_38 = 1'b1;
    end
  end

  assign decode_INSTRUCTION_ANTICIPATED = (decode_arbitration_isStuck ? decode_INSTRUCTION : IBusCachedPlugin_iBusRsp_output_payload_rsp_inst);
  always @ (*) begin
    decode_REGFILE_WRITE_VALID = _zz_270[0];
    if((decode_INSTRUCTION[11 : 7] == 5'h0))begin
      decode_REGFILE_WRITE_VALID = 1'b0;
    end
  end

  always @ (*) begin
    _zz_46 = execute_REGFILE_WRITE_DATA;
    if(_zz_215)begin
      _zz_46 = execute_CsrPlugin_readData;
    end
  end

  assign execute_SRC1 = _zz_115;
  assign execute_CSR_READ_OPCODE = decode_to_execute_CSR_READ_OPCODE;
  assign execute_CSR_WRITE_OPCODE = decode_to_execute_CSR_WRITE_OPCODE;
  assign execute_IS_CSR = decode_to_execute_IS_CSR;
  assign memory_ENV_CTRL = _zz_47;
  assign execute_ENV_CTRL = _zz_48;
  assign writeBack_ENV_CTRL = _zz_49;
  always @ (*) begin
    _zz_50 = writeBack_REGFILE_WRITE_DATA;
    if((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE))begin
      _zz_50 = writeBack_DBusCachedPlugin_rspFormated;
    end
    if((writeBack_arbitration_isValid && writeBack_IS_MUL))begin
      case(_zz_243)
        2'b00 : begin
          _zz_50 = _zz_302;
        end
        default : begin
          _zz_50 = _zz_303;
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
  assign execute_MEMORY_FORCE_CONSTISTENCY = decode_to_execute_MEMORY_FORCE_CONSTISTENCY;
  assign execute_MEMORY_MANAGMENT = decode_to_execute_MEMORY_MANAGMENT;
  assign execute_RS2 = decode_to_execute_RS2;
  assign execute_MEMORY_WR = decode_to_execute_MEMORY_WR;
  assign execute_SRC_ADD = execute_SrcPlugin_addSub;
  assign execute_MEMORY_ENABLE = decode_to_execute_MEMORY_ENABLE;
  assign execute_INSTRUCTION = decode_to_execute_INSTRUCTION;
  assign decode_MEMORY_AMO = _zz_271[0];
  assign decode_MEMORY_LRSC = _zz_272[0];
  assign decode_MEMORY_ENABLE = _zz_273[0];
  assign decode_FLUSH_ALL = _zz_274[0];
  always @ (*) begin
    IBusCachedPlugin_rsp_issueDetected_4 = IBusCachedPlugin_rsp_issueDetected_3;
    if(_zz_216)begin
      IBusCachedPlugin_rsp_issueDetected_4 = 1'b1;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_rsp_issueDetected_3 = IBusCachedPlugin_rsp_issueDetected_2;
    if(_zz_217)begin
      IBusCachedPlugin_rsp_issueDetected_3 = 1'b1;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_rsp_issueDetected_2 = IBusCachedPlugin_rsp_issueDetected_1;
    if(_zz_218)begin
      IBusCachedPlugin_rsp_issueDetected_2 = 1'b1;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_rsp_issueDetected_1 = IBusCachedPlugin_rsp_issueDetected;
    if(_zz_219)begin
      IBusCachedPlugin_rsp_issueDetected_1 = 1'b1;
    end
  end

  assign decode_BRANCH_CTRL = _zz_52;
  always @ (*) begin
    _zz_53 = memory_FORMAL_PC_NEXT;
    if(BranchPlugin_jumpInterface_valid)begin
      _zz_53 = BranchPlugin_jumpInterface_payload;
    end
  end

  always @ (*) begin
    _zz_54 = decode_FORMAL_PC_NEXT;
    if(IBusCachedPlugin_predictionJumpInterface_valid)begin
      _zz_54 = IBusCachedPlugin_predictionJumpInterface_payload;
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
    if(({(writeBack_arbitration_isValid && (writeBack_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)),{(memory_arbitration_isValid && (memory_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)),(execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET))}} != 3'b000))begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if((decode_arbitration_isValid && (HazardSimplePlugin_src0Hazard || HazardSimplePlugin_src1Hazard)))begin
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
    if(((_zz_202 && (! dataCache_1_io_cpu_flush_ready)) || dataCache_1_io_cpu_execute_haltIt))begin
      execute_arbitration_haltItself = 1'b1;
    end
    if(_zz_215)begin
      if(execute_CsrPlugin_blockedBySideEffects)begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
  end

  always @ (*) begin
    execute_arbitration_haltByOther = 1'b0;
    if((dataCache_1_io_cpu_execute_refilling && execute_arbitration_isValid))begin
      execute_arbitration_haltByOther = 1'b1;
    end
  end

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
    if(_zz_214)begin
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
    if(dataCache_1_io_cpu_writeBack_haltIt)begin
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
    if(_zz_220)begin
      writeBack_arbitration_flushNext = 1'b1;
    end
    if(_zz_221)begin
      writeBack_arbitration_flushNext = 1'b1;
    end
  end

  assign lastStageInstruction = writeBack_INSTRUCTION;
  assign lastStagePc = writeBack_PC;
  assign lastStageIsValid = writeBack_arbitration_isValid;
  assign lastStageIsFiring = writeBack_arbitration_isFiring;
  always @ (*) begin
    IBusCachedPlugin_fetcherHalt = 1'b0;
    if(({CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack,{CsrPlugin_exceptionPortCtrl_exceptionValids_memory,{CsrPlugin_exceptionPortCtrl_exceptionValids_execute,CsrPlugin_exceptionPortCtrl_exceptionValids_decode}}} != 4'b0000))begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(_zz_220)begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(_zz_221)begin
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
    if(_zz_220)begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
    if(_zz_221)begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_jumpInterface_payload = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    if(_zz_220)begin
      CsrPlugin_jumpInterface_payload = {CsrPlugin_xtvec_base,2'b00};
    end
    if(_zz_221)begin
      case(_zz_222)
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
  assign IBusCachedPlugin_externalFlush = ({writeBack_arbitration_flushNext,{memory_arbitration_flushNext,{execute_arbitration_flushNext,decode_arbitration_flushNext}}} != 4'b0000);
  assign IBusCachedPlugin_jump_pcLoad_valid = ({BranchPlugin_jumpInterface_valid,{CsrPlugin_jumpInterface_valid,{DBusCachedPlugin_redoBranch_valid,IBusCachedPlugin_predictionJumpInterface_valid}}} != 4'b0000);
  assign _zz_55 = {IBusCachedPlugin_predictionJumpInterface_valid,{BranchPlugin_jumpInterface_valid,{CsrPlugin_jumpInterface_valid,DBusCachedPlugin_redoBranch_valid}}};
  assign _zz_56 = (_zz_55 & (~ _zz_275));
  assign _zz_57 = _zz_56[3];
  assign _zz_58 = (_zz_56[1] || _zz_57);
  assign _zz_59 = (_zz_56[2] || _zz_57);
  assign IBusCachedPlugin_jump_pcLoad_payload = _zz_209;
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
    IBusCachedPlugin_fetchPc_pc = (IBusCachedPlugin_fetchPc_pcReg + _zz_277);
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
  assign _zz_60 = (! IBusCachedPlugin_iBusRsp_stages_0_halt);
  assign IBusCachedPlugin_iBusRsp_stages_0_input_ready = (IBusCachedPlugin_iBusRsp_stages_0_output_ready && _zz_60);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_valid = (IBusCachedPlugin_iBusRsp_stages_0_input_valid && _zz_60);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_payload = IBusCachedPlugin_iBusRsp_stages_0_input_payload;
  always @ (*) begin
    IBusCachedPlugin_iBusRsp_stages_1_halt = 1'b0;
    if(IBusCachedPlugin_cache_io_cpu_prefetch_haltIt)begin
      IBusCachedPlugin_iBusRsp_stages_1_halt = 1'b1;
    end
  end

  assign _zz_61 = (! IBusCachedPlugin_iBusRsp_stages_1_halt);
  assign IBusCachedPlugin_iBusRsp_stages_1_input_ready = (IBusCachedPlugin_iBusRsp_stages_1_output_ready && _zz_61);
  assign IBusCachedPlugin_iBusRsp_stages_1_output_valid = (IBusCachedPlugin_iBusRsp_stages_1_input_valid && _zz_61);
  assign IBusCachedPlugin_iBusRsp_stages_1_output_payload = IBusCachedPlugin_iBusRsp_stages_1_input_payload;
  always @ (*) begin
    IBusCachedPlugin_iBusRsp_stages_2_halt = 1'b0;
    if(IBusCachedPlugin_mmuBus_busy)begin
      IBusCachedPlugin_iBusRsp_stages_2_halt = 1'b1;
    end
  end

  assign _zz_62 = (! IBusCachedPlugin_iBusRsp_stages_2_halt);
  assign IBusCachedPlugin_iBusRsp_stages_2_input_ready = (IBusCachedPlugin_iBusRsp_stages_2_output_ready && _zz_62);
  assign IBusCachedPlugin_iBusRsp_stages_2_output_valid = (IBusCachedPlugin_iBusRsp_stages_2_input_valid && _zz_62);
  assign IBusCachedPlugin_iBusRsp_stages_2_output_payload = IBusCachedPlugin_iBusRsp_stages_2_input_payload;
  always @ (*) begin
    IBusCachedPlugin_iBusRsp_stages_3_halt = 1'b0;
    if((IBusCachedPlugin_rsp_issueDetected_4 || IBusCachedPlugin_rsp_iBusRspOutputHalt))begin
      IBusCachedPlugin_iBusRsp_stages_3_halt = 1'b1;
    end
  end

  assign _zz_63 = (! IBusCachedPlugin_iBusRsp_stages_3_halt);
  assign IBusCachedPlugin_iBusRsp_stages_3_input_ready = (IBusCachedPlugin_iBusRsp_stages_3_output_ready && _zz_63);
  assign IBusCachedPlugin_iBusRsp_stages_3_output_valid = (IBusCachedPlugin_iBusRsp_stages_3_input_valid && _zz_63);
  assign IBusCachedPlugin_iBusRsp_stages_3_output_payload = IBusCachedPlugin_iBusRsp_stages_3_input_payload;
  assign IBusCachedPlugin_fetchPc_redo_valid = IBusCachedPlugin_iBusRsp_redoFetch;
  assign IBusCachedPlugin_fetchPc_redo_payload = IBusCachedPlugin_iBusRsp_stages_3_input_payload;
  assign IBusCachedPlugin_iBusRsp_flush = (IBusCachedPlugin_externalFlush || IBusCachedPlugin_iBusRsp_redoFetch);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_ready = _zz_64;
  assign _zz_64 = ((1'b0 && (! _zz_65)) || IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign _zz_65 = _zz_66;
  assign IBusCachedPlugin_iBusRsp_stages_1_input_valid = _zz_65;
  assign IBusCachedPlugin_iBusRsp_stages_1_input_payload = IBusCachedPlugin_fetchPc_pcReg;
  assign IBusCachedPlugin_iBusRsp_stages_1_output_ready = ((1'b0 && (! _zz_67)) || IBusCachedPlugin_iBusRsp_stages_2_input_ready);
  assign _zz_67 = _zz_68;
  assign IBusCachedPlugin_iBusRsp_stages_2_input_valid = _zz_67;
  assign IBusCachedPlugin_iBusRsp_stages_2_input_payload = _zz_69;
  assign IBusCachedPlugin_iBusRsp_stages_2_output_ready = ((1'b0 && (! _zz_70)) || IBusCachedPlugin_iBusRsp_stages_3_input_ready);
  assign _zz_70 = _zz_71;
  assign IBusCachedPlugin_iBusRsp_stages_3_input_valid = _zz_70;
  assign IBusCachedPlugin_iBusRsp_stages_3_input_payload = _zz_72;
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
  assign IBusCachedPlugin_injector_decodeInput_valid = _zz_73;
  assign IBusCachedPlugin_injector_decodeInput_payload_pc = _zz_74;
  assign IBusCachedPlugin_injector_decodeInput_payload_rsp_error = _zz_75;
  assign IBusCachedPlugin_injector_decodeInput_payload_rsp_inst = _zz_76;
  assign IBusCachedPlugin_injector_decodeInput_payload_isRvc = _zz_77;
  assign IBusCachedPlugin_pcValids_0 = IBusCachedPlugin_injector_nextPcCalc_valids_3;
  assign IBusCachedPlugin_pcValids_1 = IBusCachedPlugin_injector_nextPcCalc_valids_4;
  assign IBusCachedPlugin_pcValids_2 = IBusCachedPlugin_injector_nextPcCalc_valids_5;
  assign IBusCachedPlugin_pcValids_3 = IBusCachedPlugin_injector_nextPcCalc_valids_6;
  assign IBusCachedPlugin_injector_decodeInput_ready = (! decode_arbitration_isStuck);
  assign decode_arbitration_isValid = IBusCachedPlugin_injector_decodeInput_valid;
  assign _zz_78 = _zz_278[11];
  always @ (*) begin
    _zz_79[18] = _zz_78;
    _zz_79[17] = _zz_78;
    _zz_79[16] = _zz_78;
    _zz_79[15] = _zz_78;
    _zz_79[14] = _zz_78;
    _zz_79[13] = _zz_78;
    _zz_79[12] = _zz_78;
    _zz_79[11] = _zz_78;
    _zz_79[10] = _zz_78;
    _zz_79[9] = _zz_78;
    _zz_79[8] = _zz_78;
    _zz_79[7] = _zz_78;
    _zz_79[6] = _zz_78;
    _zz_79[5] = _zz_78;
    _zz_79[4] = _zz_78;
    _zz_79[3] = _zz_78;
    _zz_79[2] = _zz_78;
    _zz_79[1] = _zz_78;
    _zz_79[0] = _zz_78;
  end

  always @ (*) begin
    IBusCachedPlugin_decodePrediction_cmd_hadBranch = ((decode_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JAL) || ((decode_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_B) && _zz_279[31]));
    if(_zz_84)begin
      IBusCachedPlugin_decodePrediction_cmd_hadBranch = 1'b0;
    end
  end

  assign _zz_80 = _zz_280[19];
  always @ (*) begin
    _zz_81[10] = _zz_80;
    _zz_81[9] = _zz_80;
    _zz_81[8] = _zz_80;
    _zz_81[7] = _zz_80;
    _zz_81[6] = _zz_80;
    _zz_81[5] = _zz_80;
    _zz_81[4] = _zz_80;
    _zz_81[3] = _zz_80;
    _zz_81[2] = _zz_80;
    _zz_81[1] = _zz_80;
    _zz_81[0] = _zz_80;
  end

  assign _zz_82 = _zz_281[11];
  always @ (*) begin
    _zz_83[18] = _zz_82;
    _zz_83[17] = _zz_82;
    _zz_83[16] = _zz_82;
    _zz_83[15] = _zz_82;
    _zz_83[14] = _zz_82;
    _zz_83[13] = _zz_82;
    _zz_83[12] = _zz_82;
    _zz_83[11] = _zz_82;
    _zz_83[10] = _zz_82;
    _zz_83[9] = _zz_82;
    _zz_83[8] = _zz_82;
    _zz_83[7] = _zz_82;
    _zz_83[6] = _zz_82;
    _zz_83[5] = _zz_82;
    _zz_83[4] = _zz_82;
    _zz_83[3] = _zz_82;
    _zz_83[2] = _zz_82;
    _zz_83[1] = _zz_82;
    _zz_83[0] = _zz_82;
  end

  always @ (*) begin
    case(decode_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_84 = _zz_282[1];
      end
      default : begin
        _zz_84 = _zz_283[1];
      end
    endcase
  end

  assign IBusCachedPlugin_predictionJumpInterface_valid = (decode_arbitration_isValid && IBusCachedPlugin_decodePrediction_cmd_hadBranch);
  assign _zz_85 = _zz_284[19];
  always @ (*) begin
    _zz_86[10] = _zz_85;
    _zz_86[9] = _zz_85;
    _zz_86[8] = _zz_85;
    _zz_86[7] = _zz_85;
    _zz_86[6] = _zz_85;
    _zz_86[5] = _zz_85;
    _zz_86[4] = _zz_85;
    _zz_86[3] = _zz_85;
    _zz_86[2] = _zz_85;
    _zz_86[1] = _zz_85;
    _zz_86[0] = _zz_85;
  end

  assign _zz_87 = _zz_285[11];
  always @ (*) begin
    _zz_88[18] = _zz_87;
    _zz_88[17] = _zz_87;
    _zz_88[16] = _zz_87;
    _zz_88[15] = _zz_87;
    _zz_88[14] = _zz_87;
    _zz_88[13] = _zz_87;
    _zz_88[12] = _zz_87;
    _zz_88[11] = _zz_87;
    _zz_88[10] = _zz_87;
    _zz_88[9] = _zz_87;
    _zz_88[8] = _zz_87;
    _zz_88[7] = _zz_87;
    _zz_88[6] = _zz_87;
    _zz_88[5] = _zz_87;
    _zz_88[4] = _zz_87;
    _zz_88[3] = _zz_87;
    _zz_88[2] = _zz_87;
    _zz_88[1] = _zz_87;
    _zz_88[0] = _zz_87;
  end

  assign IBusCachedPlugin_predictionJumpInterface_payload = (decode_PC + ((decode_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JAL) ? {{_zz_86,{{{_zz_338,decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]}},1'b0} : {{_zz_88,{{{_zz_339,_zz_340},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0}));
  assign iBus_cmd_valid = IBusCachedPlugin_cache_io_mem_cmd_valid;
  always @ (*) begin
    iBus_cmd_payload_address = IBusCachedPlugin_cache_io_mem_cmd_payload_address;
    iBus_cmd_payload_address = IBusCachedPlugin_cache_io_mem_cmd_payload_address;
  end

  assign iBus_cmd_payload_size = IBusCachedPlugin_cache_io_mem_cmd_payload_size;
  assign IBusCachedPlugin_s0_tightlyCoupledHit = 1'b0;
  assign _zz_174 = (IBusCachedPlugin_iBusRsp_stages_1_input_valid && (! IBusCachedPlugin_s0_tightlyCoupledHit));
  assign _zz_175 = (IBusCachedPlugin_iBusRsp_stages_2_input_valid && (! IBusCachedPlugin_s1_tightlyCoupledHit));
  assign _zz_176 = (! IBusCachedPlugin_iBusRsp_stages_2_input_ready);
  assign IBusCachedPlugin_mmuBus_cmd_0_isValid = _zz_175;
  assign IBusCachedPlugin_mmuBus_cmd_0_isStuck = (! IBusCachedPlugin_iBusRsp_stages_2_input_ready);
  assign IBusCachedPlugin_mmuBus_cmd_0_virtualAddress = IBusCachedPlugin_iBusRsp_stages_2_input_payload;
  assign IBusCachedPlugin_mmuBus_cmd_0_bypassTranslation = 1'b0;
  assign IBusCachedPlugin_mmuBus_end = (IBusCachedPlugin_iBusRsp_stages_2_input_ready || IBusCachedPlugin_externalFlush);
  assign _zz_178 = (IBusCachedPlugin_iBusRsp_stages_3_input_valid && (! IBusCachedPlugin_s2_tightlyCoupledHit));
  assign _zz_179 = (! IBusCachedPlugin_iBusRsp_stages_3_input_ready);
  assign _zz_180 = (CsrPlugin_privilege == 2'b00);
  assign IBusCachedPlugin_rsp_iBusRspOutputHalt = 1'b0;
  assign IBusCachedPlugin_rsp_issueDetected = 1'b0;
  always @ (*) begin
    IBusCachedPlugin_rsp_redoFetch = 1'b0;
    if(_zz_219)begin
      IBusCachedPlugin_rsp_redoFetch = 1'b1;
    end
    if(_zz_217)begin
      IBusCachedPlugin_rsp_redoFetch = 1'b1;
    end
  end

  always @ (*) begin
    _zz_181 = (IBusCachedPlugin_rsp_redoFetch && (! IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling));
    if(_zz_217)begin
      _zz_181 = 1'b1;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_decodeExceptionPort_valid = 1'b0;
    if(_zz_218)begin
      IBusCachedPlugin_decodeExceptionPort_valid = IBusCachedPlugin_iBusRsp_readyForError;
    end
    if(_zz_216)begin
      IBusCachedPlugin_decodeExceptionPort_valid = IBusCachedPlugin_iBusRsp_readyForError;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_decodeExceptionPort_payload_code = 4'bxxxx;
    if(_zz_218)begin
      IBusCachedPlugin_decodeExceptionPort_payload_code = 4'b1100;
    end
    if(_zz_216)begin
      IBusCachedPlugin_decodeExceptionPort_payload_code = 4'b0001;
    end
  end

  assign IBusCachedPlugin_decodeExceptionPort_payload_badAddr = {IBusCachedPlugin_iBusRsp_stages_3_input_payload[31 : 2],2'b00};
  assign IBusCachedPlugin_iBusRsp_output_valid = IBusCachedPlugin_iBusRsp_stages_3_output_valid;
  assign IBusCachedPlugin_iBusRsp_stages_3_output_ready = IBusCachedPlugin_iBusRsp_output_ready;
  assign IBusCachedPlugin_iBusRsp_output_payload_rsp_inst = IBusCachedPlugin_cache_io_cpu_decode_data;
  assign IBusCachedPlugin_iBusRsp_output_payload_pc = IBusCachedPlugin_iBusRsp_stages_3_output_payload;
  assign _zz_173 = (decode_arbitration_isValid && decode_FLUSH_ALL);
  assign dataCache_1_io_mem_cmd_s2mPipe_valid = (dataCache_1_io_mem_cmd_valid || dataCache_1_io_mem_cmd_s2mPipe_rValid);
  assign _zz_203 = (! dataCache_1_io_mem_cmd_s2mPipe_rValid);
  assign dataCache_1_io_mem_cmd_s2mPipe_payload_wr = (dataCache_1_io_mem_cmd_s2mPipe_rValid ? dataCache_1_io_mem_cmd_s2mPipe_rData_wr : dataCache_1_io_mem_cmd_payload_wr);
  assign dataCache_1_io_mem_cmd_s2mPipe_payload_uncached = (dataCache_1_io_mem_cmd_s2mPipe_rValid ? dataCache_1_io_mem_cmd_s2mPipe_rData_uncached : dataCache_1_io_mem_cmd_payload_uncached);
  assign dataCache_1_io_mem_cmd_s2mPipe_payload_address = (dataCache_1_io_mem_cmd_s2mPipe_rValid ? dataCache_1_io_mem_cmd_s2mPipe_rData_address : dataCache_1_io_mem_cmd_payload_address);
  assign dataCache_1_io_mem_cmd_s2mPipe_payload_data = (dataCache_1_io_mem_cmd_s2mPipe_rValid ? dataCache_1_io_mem_cmd_s2mPipe_rData_data : dataCache_1_io_mem_cmd_payload_data);
  assign dataCache_1_io_mem_cmd_s2mPipe_payload_mask = (dataCache_1_io_mem_cmd_s2mPipe_rValid ? dataCache_1_io_mem_cmd_s2mPipe_rData_mask : dataCache_1_io_mem_cmd_payload_mask);
  assign dataCache_1_io_mem_cmd_s2mPipe_payload_length = (dataCache_1_io_mem_cmd_s2mPipe_rValid ? dataCache_1_io_mem_cmd_s2mPipe_rData_length : dataCache_1_io_mem_cmd_payload_length);
  assign dataCache_1_io_mem_cmd_s2mPipe_payload_last = (dataCache_1_io_mem_cmd_s2mPipe_rValid ? dataCache_1_io_mem_cmd_s2mPipe_rData_last : dataCache_1_io_mem_cmd_payload_last);
  assign dataCache_1_io_mem_cmd_s2mPipe_ready = ((1'b1 && (! dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_valid)) || dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_ready);
  assign dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_valid = dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_rValid;
  assign dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_wr = dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_rData_wr;
  assign dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_uncached = dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_rData_uncached;
  assign dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_address = dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_rData_address;
  assign dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_data = dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_rData_data;
  assign dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_mask = dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_rData_mask;
  assign dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_length = dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_rData_length;
  assign dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_last = dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_rData_last;
  assign dBus_cmd_valid = dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_valid;
  assign dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_ready = dBus_cmd_ready;
  assign dBus_cmd_payload_wr = dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_wr;
  assign dBus_cmd_payload_uncached = dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_uncached;
  assign dBus_cmd_payload_address = dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_address;
  assign dBus_cmd_payload_data = dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_data;
  assign dBus_cmd_payload_mask = dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_mask;
  assign dBus_cmd_payload_length = dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_length;
  assign dBus_cmd_payload_last = dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_last;
  always @ (*) begin
    _zz_51 = 1'b0;
    if(decode_INSTRUCTION[25])begin
      if(decode_MEMORY_LRSC)begin
        _zz_51 = 1'b1;
      end
      if(decode_MEMORY_AMO)begin
        _zz_51 = 1'b1;
      end
    end
  end

  assign execute_DBusCachedPlugin_size = execute_INSTRUCTION[13 : 12];
  assign _zz_182 = (execute_arbitration_isValid && execute_MEMORY_ENABLE);
  assign _zz_183 = execute_SRC_ADD;
  always @ (*) begin
    case(execute_DBusCachedPlugin_size)
      2'b00 : begin
        _zz_91 = {{{execute_RS2[7 : 0],execute_RS2[7 : 0]},execute_RS2[7 : 0]},execute_RS2[7 : 0]};
      end
      2'b01 : begin
        _zz_91 = {execute_RS2[15 : 0],execute_RS2[15 : 0]};
      end
      default : begin
        _zz_91 = execute_RS2[31 : 0];
      end
    endcase
  end

  assign _zz_202 = (execute_arbitration_isValid && execute_MEMORY_MANAGMENT);
  always @ (*) begin
    _zz_184 = 1'b0;
    if(execute_MEMORY_LRSC)begin
      _zz_184 = 1'b1;
    end
  end

  assign _zz_186 = execute_INSTRUCTION[31 : 29];
  assign _zz_185 = execute_INSTRUCTION[27];
  assign _zz_187 = (memory_arbitration_isValid && memory_MEMORY_ENABLE);
  assign _zz_188 = memory_REGFILE_WRITE_DATA;
  assign DBusCachedPlugin_mmuBus_cmd_0_isValid = _zz_187;
  assign DBusCachedPlugin_mmuBus_cmd_0_isStuck = memory_arbitration_isStuck;
  assign DBusCachedPlugin_mmuBus_cmd_0_virtualAddress = _zz_188;
  assign DBusCachedPlugin_mmuBus_cmd_0_bypassTranslation = 1'b0;
  assign DBusCachedPlugin_mmuBus_end = ((! memory_arbitration_isStuck) || memory_arbitration_removeIt);
  always @ (*) begin
    _zz_189 = DBusCachedPlugin_mmuBus_rsp_isIoAccess;
    if((1'b0 && (! dataCache_1_io_cpu_memory_isWrite)))begin
      _zz_189 = 1'b1;
    end
  end

  assign _zz_190 = (writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE);
  assign _zz_191 = (CsrPlugin_privilege == 2'b00);
  assign _zz_192 = writeBack_REGFILE_WRITE_DATA;
  always @ (*) begin
    DBusCachedPlugin_redoBranch_valid = 1'b0;
    if(_zz_223)begin
      if(dataCache_1_io_cpu_redo)begin
        DBusCachedPlugin_redoBranch_valid = 1'b1;
      end
    end
  end

  assign DBusCachedPlugin_redoBranch_payload = writeBack_PC;
  always @ (*) begin
    DBusCachedPlugin_exceptionBus_valid = 1'b0;
    if(_zz_223)begin
      if(dataCache_1_io_cpu_writeBack_accessError)begin
        DBusCachedPlugin_exceptionBus_valid = 1'b1;
      end
      if(dataCache_1_io_cpu_writeBack_mmuException)begin
        DBusCachedPlugin_exceptionBus_valid = 1'b1;
      end
      if(dataCache_1_io_cpu_writeBack_unalignedAccess)begin
        DBusCachedPlugin_exceptionBus_valid = 1'b1;
      end
      if(dataCache_1_io_cpu_redo)begin
        DBusCachedPlugin_exceptionBus_valid = 1'b0;
      end
    end
  end

  assign DBusCachedPlugin_exceptionBus_payload_badAddr = writeBack_REGFILE_WRITE_DATA;
  always @ (*) begin
    DBusCachedPlugin_exceptionBus_payload_code = 4'bxxxx;
    if(_zz_223)begin
      if(dataCache_1_io_cpu_writeBack_accessError)begin
        DBusCachedPlugin_exceptionBus_payload_code = {1'd0, _zz_286};
      end
      if(dataCache_1_io_cpu_writeBack_mmuException)begin
        DBusCachedPlugin_exceptionBus_payload_code = (writeBack_MEMORY_WR ? 4'b1111 : 4'b1101);
      end
      if(dataCache_1_io_cpu_writeBack_unalignedAccess)begin
        DBusCachedPlugin_exceptionBus_payload_code = {1'd0, _zz_287};
      end
    end
  end

  always @ (*) begin
    writeBack_DBusCachedPlugin_rspShifted = dataCache_1_io_cpu_writeBack_data;
    case(writeBack_MEMORY_ADDRESS_LOW)
      2'b01 : begin
        writeBack_DBusCachedPlugin_rspShifted[7 : 0] = dataCache_1_io_cpu_writeBack_data[15 : 8];
      end
      2'b10 : begin
        writeBack_DBusCachedPlugin_rspShifted[15 : 0] = dataCache_1_io_cpu_writeBack_data[31 : 16];
      end
      2'b11 : begin
        writeBack_DBusCachedPlugin_rspShifted[7 : 0] = dataCache_1_io_cpu_writeBack_data[31 : 24];
      end
      default : begin
      end
    endcase
  end

  assign _zz_92 = (writeBack_DBusCachedPlugin_rspShifted[7] && (! writeBack_INSTRUCTION[14]));
  always @ (*) begin
    _zz_93[31] = _zz_92;
    _zz_93[30] = _zz_92;
    _zz_93[29] = _zz_92;
    _zz_93[28] = _zz_92;
    _zz_93[27] = _zz_92;
    _zz_93[26] = _zz_92;
    _zz_93[25] = _zz_92;
    _zz_93[24] = _zz_92;
    _zz_93[23] = _zz_92;
    _zz_93[22] = _zz_92;
    _zz_93[21] = _zz_92;
    _zz_93[20] = _zz_92;
    _zz_93[19] = _zz_92;
    _zz_93[18] = _zz_92;
    _zz_93[17] = _zz_92;
    _zz_93[16] = _zz_92;
    _zz_93[15] = _zz_92;
    _zz_93[14] = _zz_92;
    _zz_93[13] = _zz_92;
    _zz_93[12] = _zz_92;
    _zz_93[11] = _zz_92;
    _zz_93[10] = _zz_92;
    _zz_93[9] = _zz_92;
    _zz_93[8] = _zz_92;
    _zz_93[7 : 0] = writeBack_DBusCachedPlugin_rspShifted[7 : 0];
  end

  assign _zz_94 = (writeBack_DBusCachedPlugin_rspShifted[15] && (! writeBack_INSTRUCTION[14]));
  always @ (*) begin
    _zz_95[31] = _zz_94;
    _zz_95[30] = _zz_94;
    _zz_95[29] = _zz_94;
    _zz_95[28] = _zz_94;
    _zz_95[27] = _zz_94;
    _zz_95[26] = _zz_94;
    _zz_95[25] = _zz_94;
    _zz_95[24] = _zz_94;
    _zz_95[23] = _zz_94;
    _zz_95[22] = _zz_94;
    _zz_95[21] = _zz_94;
    _zz_95[20] = _zz_94;
    _zz_95[19] = _zz_94;
    _zz_95[18] = _zz_94;
    _zz_95[17] = _zz_94;
    _zz_95[16] = _zz_94;
    _zz_95[15 : 0] = writeBack_DBusCachedPlugin_rspShifted[15 : 0];
  end

  always @ (*) begin
    case(_zz_241)
      2'b00 : begin
        writeBack_DBusCachedPlugin_rspFormated = _zz_93;
      end
      2'b01 : begin
        writeBack_DBusCachedPlugin_rspFormated = _zz_95;
      end
      default : begin
        writeBack_DBusCachedPlugin_rspFormated = writeBack_DBusCachedPlugin_rspShifted;
      end
    endcase
  end

  assign IBusCachedPlugin_mmuBus_rsp_physicalAddress = IBusCachedPlugin_mmuBus_cmd_0_virtualAddress;
  assign IBusCachedPlugin_mmuBus_rsp_allowRead = 1'b1;
  assign IBusCachedPlugin_mmuBus_rsp_allowWrite = 1'b1;
  assign IBusCachedPlugin_mmuBus_rsp_allowExecute = 1'b1;
  assign IBusCachedPlugin_mmuBus_rsp_isIoAccess = (IBusCachedPlugin_mmuBus_rsp_physicalAddress[31 : 31] == 1'b1);
  assign IBusCachedPlugin_mmuBus_rsp_isPaging = 1'b0;
  assign IBusCachedPlugin_mmuBus_rsp_exception = 1'b0;
  assign IBusCachedPlugin_mmuBus_rsp_refilling = 1'b0;
  assign IBusCachedPlugin_mmuBus_busy = 1'b0;
  assign DBusCachedPlugin_mmuBus_rsp_physicalAddress = DBusCachedPlugin_mmuBus_cmd_0_virtualAddress;
  assign DBusCachedPlugin_mmuBus_rsp_allowRead = 1'b1;
  assign DBusCachedPlugin_mmuBus_rsp_allowWrite = 1'b1;
  assign DBusCachedPlugin_mmuBus_rsp_allowExecute = 1'b1;
  assign DBusCachedPlugin_mmuBus_rsp_isIoAccess = (DBusCachedPlugin_mmuBus_rsp_physicalAddress[31 : 31] == 1'b1);
  assign DBusCachedPlugin_mmuBus_rsp_isPaging = 1'b0;
  assign DBusCachedPlugin_mmuBus_rsp_exception = 1'b0;
  assign DBusCachedPlugin_mmuBus_rsp_refilling = 1'b0;
  assign DBusCachedPlugin_mmuBus_busy = 1'b0;
  always @ (*) begin
    CsrPlugin_privilege = 2'b11;
    if(CsrPlugin_forceMachineWire)begin
      CsrPlugin_privilege = 2'b11;
    end
  end

  assign CsrPlugin_misa_base = 2'b01;
  assign CsrPlugin_misa_extensions = 26'h0000042;
  assign _zz_96 = (CsrPlugin_mip_MTIP && CsrPlugin_mie_MTIE);
  assign _zz_97 = (CsrPlugin_mip_MSIP && CsrPlugin_mie_MSIE);
  assign _zz_98 = (CsrPlugin_mip_MEIP && CsrPlugin_mie_MEIE);
  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b11;
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
    if(({CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack,{CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory,CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute}} != 3'b000))begin
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
    CsrPlugin_xtvec_mode = 2'bxx;
    case(CsrPlugin_targetPrivilege)
      2'b11 : begin
        CsrPlugin_xtvec_mode = CsrPlugin_mtvec_mode;
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    CsrPlugin_xtvec_base = 30'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    case(CsrPlugin_targetPrivilege)
      2'b11 : begin
        CsrPlugin_xtvec_base = CsrPlugin_mtvec_base;
      end
      default : begin
      end
    endcase
  end

  assign contextSwitching = CsrPlugin_jumpInterface_valid;
  assign execute_CsrPlugin_blockedBySideEffects = (({writeBack_arbitration_isValid,memory_arbitration_isValid} != 2'b00) || 1'b0);
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
    if(_zz_224)begin
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
    if(_zz_224)begin
      execute_CsrPlugin_writeInstruction = 1'b0;
    end
  end

  always @ (*) begin
    execute_CsrPlugin_readInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_READ_OPCODE);
    if(_zz_224)begin
      execute_CsrPlugin_readInstruction = 1'b0;
    end
  end

  assign execute_CsrPlugin_writeEnable = (execute_CsrPlugin_writeInstruction && (! execute_arbitration_isStuck));
  assign execute_CsrPlugin_readEnable = (execute_CsrPlugin_readInstruction && (! execute_arbitration_isStuck));
  assign execute_CsrPlugin_readToWriteData = execute_CsrPlugin_readData;
  always @ (*) begin
    case(_zz_242)
      1'b0 : begin
        execute_CsrPlugin_writeData = execute_SRC1;
      end
      default : begin
        execute_CsrPlugin_writeData = (execute_INSTRUCTION[12] ? (execute_CsrPlugin_readToWriteData & (~ execute_SRC1)) : (execute_CsrPlugin_readToWriteData | execute_SRC1));
      end
    endcase
  end

  assign execute_CsrPlugin_csrAddress = execute_INSTRUCTION[31 : 20];
  assign _zz_100 = ((decode_INSTRUCTION & 32'h00004050) == 32'h00004050);
  assign _zz_101 = ((decode_INSTRUCTION & 32'h00000048) == 32'h00000048);
  assign _zz_102 = ((decode_INSTRUCTION & 32'h00002050) == 32'h00002000);
  assign _zz_103 = ((decode_INSTRUCTION & 32'h00000004) == 32'h00000004);
  assign _zz_104 = ((decode_INSTRUCTION & 32'h0000000c) == 32'h00000004);
  assign _zz_105 = ((decode_INSTRUCTION & 32'h00001000) == 32'h0);
  assign _zz_99 = {({_zz_101,(_zz_341 == _zz_342)} != 2'b00),{((_zz_343 == _zz_344) != 1'b0),{(_zz_105 != 1'b0),{(_zz_345 != _zz_346),{_zz_347,{_zz_348,_zz_349}}}}}};
  assign _zz_106 = _zz_99[2 : 1];
  assign _zz_45 = _zz_106;
  assign _zz_107 = _zz_99[7 : 6];
  assign _zz_44 = _zz_107;
  assign _zz_108 = _zz_99[9 : 8];
  assign _zz_43 = _zz_108;
  assign _zz_109 = _zz_99[21 : 21];
  assign _zz_42 = _zz_109;
  assign _zz_110 = _zz_99[24 : 23];
  assign _zz_41 = _zz_110;
  assign _zz_111 = _zz_99[26 : 25];
  assign _zz_40 = _zz_111;
  assign _zz_112 = _zz_99[32 : 31];
  assign _zz_39 = _zz_112;
  assign decode_RegFilePlugin_regFileReadAddress1 = decode_INSTRUCTION_ANTICIPATED[19 : 15];
  assign decode_RegFilePlugin_regFileReadAddress2 = decode_INSTRUCTION_ANTICIPATED[24 : 20];
  assign decode_RegFilePlugin_rs1Data = _zz_207;
  assign decode_RegFilePlugin_rs2Data = _zz_208;
  always @ (*) begin
    lastStageRegFileWrite_valid = (_zz_37 && writeBack_arbitration_isFiring);
    if(_zz_113)begin
      lastStageRegFileWrite_valid = 1'b1;
    end
  end

  always @ (*) begin
    lastStageRegFileWrite_payload_address = _zz_36[11 : 7];
    if(_zz_113)begin
      lastStageRegFileWrite_payload_address = 5'h0;
    end
  end

  always @ (*) begin
    lastStageRegFileWrite_payload_data = _zz_50;
    if(_zz_113)begin
      lastStageRegFileWrite_payload_data = 32'h0;
    end
  end

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
        _zz_114 = execute_IntAluPlugin_bitwise;
      end
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : begin
        _zz_114 = {31'd0, _zz_288};
      end
      default : begin
        _zz_114 = execute_SRC_ADD_SUB;
      end
    endcase
  end

  always @ (*) begin
    case(execute_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : begin
        _zz_115 = execute_RS1;
      end
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : begin
        _zz_115 = {29'd0, _zz_289};
      end
      `Src1CtrlEnum_defaultEncoding_IMU : begin
        _zz_115 = {execute_INSTRUCTION[31 : 12],12'h0};
      end
      default : begin
        _zz_115 = {27'd0, _zz_290};
      end
    endcase
  end

  assign _zz_116 = _zz_291[11];
  always @ (*) begin
    _zz_117[19] = _zz_116;
    _zz_117[18] = _zz_116;
    _zz_117[17] = _zz_116;
    _zz_117[16] = _zz_116;
    _zz_117[15] = _zz_116;
    _zz_117[14] = _zz_116;
    _zz_117[13] = _zz_116;
    _zz_117[12] = _zz_116;
    _zz_117[11] = _zz_116;
    _zz_117[10] = _zz_116;
    _zz_117[9] = _zz_116;
    _zz_117[8] = _zz_116;
    _zz_117[7] = _zz_116;
    _zz_117[6] = _zz_116;
    _zz_117[5] = _zz_116;
    _zz_117[4] = _zz_116;
    _zz_117[3] = _zz_116;
    _zz_117[2] = _zz_116;
    _zz_117[1] = _zz_116;
    _zz_117[0] = _zz_116;
  end

  assign _zz_118 = _zz_292[11];
  always @ (*) begin
    _zz_119[19] = _zz_118;
    _zz_119[18] = _zz_118;
    _zz_119[17] = _zz_118;
    _zz_119[16] = _zz_118;
    _zz_119[15] = _zz_118;
    _zz_119[14] = _zz_118;
    _zz_119[13] = _zz_118;
    _zz_119[12] = _zz_118;
    _zz_119[11] = _zz_118;
    _zz_119[10] = _zz_118;
    _zz_119[9] = _zz_118;
    _zz_119[8] = _zz_118;
    _zz_119[7] = _zz_118;
    _zz_119[6] = _zz_118;
    _zz_119[5] = _zz_118;
    _zz_119[4] = _zz_118;
    _zz_119[3] = _zz_118;
    _zz_119[2] = _zz_118;
    _zz_119[1] = _zz_118;
    _zz_119[0] = _zz_118;
  end

  always @ (*) begin
    case(execute_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : begin
        _zz_120 = execute_RS2;
      end
      `Src2CtrlEnum_defaultEncoding_IMI : begin
        _zz_120 = {_zz_117,execute_INSTRUCTION[31 : 20]};
      end
      `Src2CtrlEnum_defaultEncoding_IMS : begin
        _zz_120 = {_zz_119,{execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]}};
      end
      default : begin
        _zz_120 = _zz_31;
      end
    endcase
  end

  always @ (*) begin
    execute_SrcPlugin_addSub = _zz_293;
    if(execute_SRC2_FORCE_ZERO)begin
      execute_SrcPlugin_addSub = execute_SRC1;
    end
  end

  assign execute_SrcPlugin_less = ((execute_SRC1[31] == execute_SRC2[31]) ? execute_SrcPlugin_addSub[31] : (execute_SRC_LESS_UNSIGNED ? execute_SRC2[31] : execute_SRC1[31]));
  assign execute_FullBarrelShifterPlugin_amplitude = execute_SRC2[4 : 0];
  always @ (*) begin
    _zz_121[0] = execute_SRC1[31];
    _zz_121[1] = execute_SRC1[30];
    _zz_121[2] = execute_SRC1[29];
    _zz_121[3] = execute_SRC1[28];
    _zz_121[4] = execute_SRC1[27];
    _zz_121[5] = execute_SRC1[26];
    _zz_121[6] = execute_SRC1[25];
    _zz_121[7] = execute_SRC1[24];
    _zz_121[8] = execute_SRC1[23];
    _zz_121[9] = execute_SRC1[22];
    _zz_121[10] = execute_SRC1[21];
    _zz_121[11] = execute_SRC1[20];
    _zz_121[12] = execute_SRC1[19];
    _zz_121[13] = execute_SRC1[18];
    _zz_121[14] = execute_SRC1[17];
    _zz_121[15] = execute_SRC1[16];
    _zz_121[16] = execute_SRC1[15];
    _zz_121[17] = execute_SRC1[14];
    _zz_121[18] = execute_SRC1[13];
    _zz_121[19] = execute_SRC1[12];
    _zz_121[20] = execute_SRC1[11];
    _zz_121[21] = execute_SRC1[10];
    _zz_121[22] = execute_SRC1[9];
    _zz_121[23] = execute_SRC1[8];
    _zz_121[24] = execute_SRC1[7];
    _zz_121[25] = execute_SRC1[6];
    _zz_121[26] = execute_SRC1[5];
    _zz_121[27] = execute_SRC1[4];
    _zz_121[28] = execute_SRC1[3];
    _zz_121[29] = execute_SRC1[2];
    _zz_121[30] = execute_SRC1[1];
    _zz_121[31] = execute_SRC1[0];
  end

  assign execute_FullBarrelShifterPlugin_reversed = ((execute_SHIFT_CTRL == `ShiftCtrlEnum_defaultEncoding_SLL_1) ? _zz_121 : execute_SRC1);
  always @ (*) begin
    _zz_122[0] = memory_SHIFT_RIGHT[31];
    _zz_122[1] = memory_SHIFT_RIGHT[30];
    _zz_122[2] = memory_SHIFT_RIGHT[29];
    _zz_122[3] = memory_SHIFT_RIGHT[28];
    _zz_122[4] = memory_SHIFT_RIGHT[27];
    _zz_122[5] = memory_SHIFT_RIGHT[26];
    _zz_122[6] = memory_SHIFT_RIGHT[25];
    _zz_122[7] = memory_SHIFT_RIGHT[24];
    _zz_122[8] = memory_SHIFT_RIGHT[23];
    _zz_122[9] = memory_SHIFT_RIGHT[22];
    _zz_122[10] = memory_SHIFT_RIGHT[21];
    _zz_122[11] = memory_SHIFT_RIGHT[20];
    _zz_122[12] = memory_SHIFT_RIGHT[19];
    _zz_122[13] = memory_SHIFT_RIGHT[18];
    _zz_122[14] = memory_SHIFT_RIGHT[17];
    _zz_122[15] = memory_SHIFT_RIGHT[16];
    _zz_122[16] = memory_SHIFT_RIGHT[15];
    _zz_122[17] = memory_SHIFT_RIGHT[14];
    _zz_122[18] = memory_SHIFT_RIGHT[13];
    _zz_122[19] = memory_SHIFT_RIGHT[12];
    _zz_122[20] = memory_SHIFT_RIGHT[11];
    _zz_122[21] = memory_SHIFT_RIGHT[10];
    _zz_122[22] = memory_SHIFT_RIGHT[9];
    _zz_122[23] = memory_SHIFT_RIGHT[8];
    _zz_122[24] = memory_SHIFT_RIGHT[7];
    _zz_122[25] = memory_SHIFT_RIGHT[6];
    _zz_122[26] = memory_SHIFT_RIGHT[5];
    _zz_122[27] = memory_SHIFT_RIGHT[4];
    _zz_122[28] = memory_SHIFT_RIGHT[3];
    _zz_122[29] = memory_SHIFT_RIGHT[2];
    _zz_122[30] = memory_SHIFT_RIGHT[1];
    _zz_122[31] = memory_SHIFT_RIGHT[0];
  end

  assign execute_MulPlugin_a = execute_RS1;
  assign execute_MulPlugin_b = execute_RS2;
  always @ (*) begin
    case(_zz_225)
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
    case(_zz_225)
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
  assign writeBack_MulPlugin_result = ($signed(_zz_300) + $signed(_zz_301));
  assign memory_MulDivIterativePlugin_frontendOk = 1'b1;
  always @ (*) begin
    memory_MulDivIterativePlugin_div_counter_willIncrement = 1'b0;
    if(_zz_214)begin
      if(_zz_226)begin
        memory_MulDivIterativePlugin_div_counter_willIncrement = 1'b1;
      end
    end
  end

  always @ (*) begin
    memory_MulDivIterativePlugin_div_counter_willClear = 1'b0;
    if(_zz_227)begin
      memory_MulDivIterativePlugin_div_counter_willClear = 1'b1;
    end
  end

  assign memory_MulDivIterativePlugin_div_counter_willOverflowIfInc = (memory_MulDivIterativePlugin_div_counter_value == 6'h21);
  assign memory_MulDivIterativePlugin_div_counter_willOverflow = (memory_MulDivIterativePlugin_div_counter_willOverflowIfInc && memory_MulDivIterativePlugin_div_counter_willIncrement);
  always @ (*) begin
    if(memory_MulDivIterativePlugin_div_counter_willOverflow)begin
      memory_MulDivIterativePlugin_div_counter_valueNext = 6'h0;
    end else begin
      memory_MulDivIterativePlugin_div_counter_valueNext = (memory_MulDivIterativePlugin_div_counter_value + _zz_305);
    end
    if(memory_MulDivIterativePlugin_div_counter_willClear)begin
      memory_MulDivIterativePlugin_div_counter_valueNext = 6'h0;
    end
  end

  assign _zz_123 = memory_MulDivIterativePlugin_rs1[31 : 0];
  assign memory_MulDivIterativePlugin_div_stage_0_remainderShifted = {memory_MulDivIterativePlugin_accumulator[31 : 0],_zz_123[31]};
  assign memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator = (memory_MulDivIterativePlugin_div_stage_0_remainderShifted - _zz_306);
  assign memory_MulDivIterativePlugin_div_stage_0_outRemainder = ((! memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator[32]) ? _zz_307 : _zz_308);
  assign memory_MulDivIterativePlugin_div_stage_0_outNumerator = _zz_309[31:0];
  assign _zz_124 = (memory_INSTRUCTION[13] ? memory_MulDivIterativePlugin_accumulator[31 : 0] : memory_MulDivIterativePlugin_rs1[31 : 0]);
  assign _zz_125 = (execute_RS2[31] && execute_IS_RS2_SIGNED);
  assign _zz_126 = (1'b0 || ((execute_IS_DIV && execute_RS1[31]) && execute_IS_RS1_SIGNED));
  always @ (*) begin
    _zz_127[32] = (execute_IS_RS1_SIGNED && execute_RS1[31]);
    _zz_127[31 : 0] = execute_RS1;
  end

  always @ (*) begin
    HazardSimplePlugin_src0Hazard = 1'b0;
    if(_zz_228)begin
      if(_zz_229)begin
        if(_zz_128)begin
          HazardSimplePlugin_src0Hazard = 1'b1;
        end
      end
    end
    if(_zz_230)begin
      if(_zz_231)begin
        if(_zz_130)begin
          HazardSimplePlugin_src0Hazard = 1'b1;
        end
      end
    end
    if(_zz_232)begin
      if(_zz_233)begin
        if(_zz_132)begin
          HazardSimplePlugin_src0Hazard = 1'b1;
        end
      end
    end
    if((! decode_RS1_USE))begin
      HazardSimplePlugin_src0Hazard = 1'b0;
    end
  end

  always @ (*) begin
    HazardSimplePlugin_src1Hazard = 1'b0;
    if(_zz_228)begin
      if(_zz_229)begin
        if(_zz_129)begin
          HazardSimplePlugin_src1Hazard = 1'b1;
        end
      end
    end
    if(_zz_230)begin
      if(_zz_231)begin
        if(_zz_131)begin
          HazardSimplePlugin_src1Hazard = 1'b1;
        end
      end
    end
    if(_zz_232)begin
      if(_zz_233)begin
        if(_zz_133)begin
          HazardSimplePlugin_src1Hazard = 1'b1;
        end
      end
    end
    if((! decode_RS2_USE))begin
      HazardSimplePlugin_src1Hazard = 1'b0;
    end
  end

  assign HazardSimplePlugin_writeBackWrites_valid = (_zz_37 && writeBack_arbitration_isFiring);
  assign HazardSimplePlugin_writeBackWrites_payload_address = _zz_36[11 : 7];
  assign HazardSimplePlugin_writeBackWrites_payload_data = _zz_50;
  assign HazardSimplePlugin_addr0Match = (HazardSimplePlugin_writeBackBuffer_payload_address == decode_INSTRUCTION[19 : 15]);
  assign HazardSimplePlugin_addr1Match = (HazardSimplePlugin_writeBackBuffer_payload_address == decode_INSTRUCTION[24 : 20]);
  assign _zz_128 = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_129 = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign _zz_130 = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_131 = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign _zz_132 = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_133 = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign execute_BranchPlugin_eq = (execute_SRC1 == execute_SRC2);
  assign _zz_134 = execute_INSTRUCTION[14 : 12];
  always @ (*) begin
    if((_zz_134 == 3'b000)) begin
        _zz_135 = execute_BranchPlugin_eq;
    end else if((_zz_134 == 3'b001)) begin
        _zz_135 = (! execute_BranchPlugin_eq);
    end else if((((_zz_134 & 3'b101) == 3'b101))) begin
        _zz_135 = (! execute_SRC_LESS);
    end else begin
        _zz_135 = execute_SRC_LESS;
    end
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : begin
        _zz_136 = 1'b0;
      end
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_136 = 1'b1;
      end
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_136 = 1'b1;
      end
      default : begin
        _zz_136 = _zz_135;
      end
    endcase
  end

  assign _zz_137 = _zz_319[11];
  always @ (*) begin
    _zz_138[19] = _zz_137;
    _zz_138[18] = _zz_137;
    _zz_138[17] = _zz_137;
    _zz_138[16] = _zz_137;
    _zz_138[15] = _zz_137;
    _zz_138[14] = _zz_137;
    _zz_138[13] = _zz_137;
    _zz_138[12] = _zz_137;
    _zz_138[11] = _zz_137;
    _zz_138[10] = _zz_137;
    _zz_138[9] = _zz_137;
    _zz_138[8] = _zz_137;
    _zz_138[7] = _zz_137;
    _zz_138[6] = _zz_137;
    _zz_138[5] = _zz_137;
    _zz_138[4] = _zz_137;
    _zz_138[3] = _zz_137;
    _zz_138[2] = _zz_137;
    _zz_138[1] = _zz_137;
    _zz_138[0] = _zz_137;
  end

  assign _zz_139 = _zz_320[19];
  always @ (*) begin
    _zz_140[10] = _zz_139;
    _zz_140[9] = _zz_139;
    _zz_140[8] = _zz_139;
    _zz_140[7] = _zz_139;
    _zz_140[6] = _zz_139;
    _zz_140[5] = _zz_139;
    _zz_140[4] = _zz_139;
    _zz_140[3] = _zz_139;
    _zz_140[2] = _zz_139;
    _zz_140[1] = _zz_139;
    _zz_140[0] = _zz_139;
  end

  assign _zz_141 = _zz_321[11];
  always @ (*) begin
    _zz_142[18] = _zz_141;
    _zz_142[17] = _zz_141;
    _zz_142[16] = _zz_141;
    _zz_142[15] = _zz_141;
    _zz_142[14] = _zz_141;
    _zz_142[13] = _zz_141;
    _zz_142[12] = _zz_141;
    _zz_142[11] = _zz_141;
    _zz_142[10] = _zz_141;
    _zz_142[9] = _zz_141;
    _zz_142[8] = _zz_141;
    _zz_142[7] = _zz_141;
    _zz_142[6] = _zz_141;
    _zz_142[5] = _zz_141;
    _zz_142[4] = _zz_141;
    _zz_142[3] = _zz_141;
    _zz_142[2] = _zz_141;
    _zz_142[1] = _zz_141;
    _zz_142[0] = _zz_141;
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_143 = (_zz_322[1] ^ execute_RS1[1]);
      end
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_143 = _zz_323[1];
      end
      default : begin
        _zz_143 = _zz_324[1];
      end
    endcase
  end

  assign execute_BranchPlugin_missAlignedTarget = (execute_BRANCH_COND_RESULT && _zz_143);
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

  assign _zz_144 = _zz_325[11];
  always @ (*) begin
    _zz_145[19] = _zz_144;
    _zz_145[18] = _zz_144;
    _zz_145[17] = _zz_144;
    _zz_145[16] = _zz_144;
    _zz_145[15] = _zz_144;
    _zz_145[14] = _zz_144;
    _zz_145[13] = _zz_144;
    _zz_145[12] = _zz_144;
    _zz_145[11] = _zz_144;
    _zz_145[10] = _zz_144;
    _zz_145[9] = _zz_144;
    _zz_145[8] = _zz_144;
    _zz_145[7] = _zz_144;
    _zz_145[6] = _zz_144;
    _zz_145[5] = _zz_144;
    _zz_145[4] = _zz_144;
    _zz_145[3] = _zz_144;
    _zz_145[2] = _zz_144;
    _zz_145[1] = _zz_144;
    _zz_145[0] = _zz_144;
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        execute_BranchPlugin_branch_src2 = {_zz_145,execute_INSTRUCTION[31 : 20]};
      end
      default : begin
        execute_BranchPlugin_branch_src2 = ((execute_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JAL) ? {{_zz_147,{{{_zz_523,execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0} : {{_zz_149,{{{_zz_524,_zz_525},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0});
        if(execute_PREDICTION_HAD_BRANCHED2)begin
          execute_BranchPlugin_branch_src2 = {29'd0, _zz_328};
        end
      end
    endcase
  end

  assign _zz_146 = _zz_326[19];
  always @ (*) begin
    _zz_147[10] = _zz_146;
    _zz_147[9] = _zz_146;
    _zz_147[8] = _zz_146;
    _zz_147[7] = _zz_146;
    _zz_147[6] = _zz_146;
    _zz_147[5] = _zz_146;
    _zz_147[4] = _zz_146;
    _zz_147[3] = _zz_146;
    _zz_147[2] = _zz_146;
    _zz_147[1] = _zz_146;
    _zz_147[0] = _zz_146;
  end

  assign _zz_148 = _zz_327[11];
  always @ (*) begin
    _zz_149[18] = _zz_148;
    _zz_149[17] = _zz_148;
    _zz_149[16] = _zz_148;
    _zz_149[15] = _zz_148;
    _zz_149[14] = _zz_148;
    _zz_149[13] = _zz_148;
    _zz_149[12] = _zz_148;
    _zz_149[11] = _zz_148;
    _zz_149[10] = _zz_148;
    _zz_149[9] = _zz_148;
    _zz_149[8] = _zz_148;
    _zz_149[7] = _zz_148;
    _zz_149[6] = _zz_148;
    _zz_149[5] = _zz_148;
    _zz_149[4] = _zz_148;
    _zz_149[3] = _zz_148;
    _zz_149[2] = _zz_148;
    _zz_149[1] = _zz_148;
    _zz_149[0] = _zz_148;
  end

  assign execute_BranchPlugin_branchAdder = (execute_BranchPlugin_branch_src1 + execute_BranchPlugin_branch_src2);
  assign BranchPlugin_jumpInterface_valid = ((memory_arbitration_isValid && memory_BRANCH_DO) && (! 1'b0));
  assign BranchPlugin_jumpInterface_payload = memory_BRANCH_CALC;
  assign IBusCachedPlugin_decodePrediction_rsp_wasWrong = BranchPlugin_jumpInterface_valid;
  assign _zz_26 = decode_SRC1_CTRL;
  assign _zz_24 = _zz_45;
  assign _zz_33 = decode_to_execute_SRC1_CTRL;
  assign _zz_23 = decode_ALU_CTRL;
  assign _zz_21 = _zz_44;
  assign _zz_34 = decode_to_execute_ALU_CTRL;
  assign _zz_20 = decode_SRC2_CTRL;
  assign _zz_18 = _zz_43;
  assign _zz_32 = decode_to_execute_SRC2_CTRL;
  assign _zz_17 = decode_ENV_CTRL;
  assign _zz_14 = execute_ENV_CTRL;
  assign _zz_12 = memory_ENV_CTRL;
  assign _zz_15 = _zz_42;
  assign _zz_48 = decode_to_execute_ENV_CTRL;
  assign _zz_47 = execute_to_memory_ENV_CTRL;
  assign _zz_49 = memory_to_writeBack_ENV_CTRL;
  assign _zz_10 = decode_ALU_BITWISE_CTRL;
  assign _zz_8 = _zz_41;
  assign _zz_35 = decode_to_execute_ALU_BITWISE_CTRL;
  assign _zz_7 = decode_SHIFT_CTRL;
  assign _zz_4 = execute_SHIFT_CTRL;
  assign _zz_5 = _zz_40;
  assign _zz_30 = decode_to_execute_SHIFT_CTRL;
  assign _zz_29 = execute_to_memory_SHIFT_CTRL;
  assign _zz_2 = decode_BRANCH_CTRL;
  assign _zz_52 = _zz_39;
  assign _zz_27 = decode_to_execute_BRANCH_CTRL;
  assign decode_arbitration_isFlushed = (({writeBack_arbitration_flushNext,{memory_arbitration_flushNext,execute_arbitration_flushNext}} != 3'b000) || ({writeBack_arbitration_flushIt,{memory_arbitration_flushIt,{execute_arbitration_flushIt,decode_arbitration_flushIt}}} != 4'b0000));
  assign execute_arbitration_isFlushed = (({writeBack_arbitration_flushNext,memory_arbitration_flushNext} != 2'b00) || ({writeBack_arbitration_flushIt,{memory_arbitration_flushIt,execute_arbitration_flushIt}} != 3'b000));
  assign memory_arbitration_isFlushed = ((writeBack_arbitration_flushNext != 1'b0) || ({writeBack_arbitration_flushIt,memory_arbitration_flushIt} != 2'b00));
  assign writeBack_arbitration_isFlushed = (1'b0 || (writeBack_arbitration_flushIt != 1'b0));
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
    _zz_150 = 32'h0;
    if(execute_CsrPlugin_csr_768)begin
      _zz_150[12 : 11] = CsrPlugin_mstatus_MPP;
      _zz_150[7 : 7] = CsrPlugin_mstatus_MPIE;
      _zz_150[3 : 3] = CsrPlugin_mstatus_MIE;
    end
  end

  always @ (*) begin
    _zz_151 = 32'h0;
    if(execute_CsrPlugin_csr_836)begin
      _zz_151[11 : 11] = CsrPlugin_mip_MEIP;
      _zz_151[7 : 7] = CsrPlugin_mip_MTIP;
      _zz_151[3 : 3] = CsrPlugin_mip_MSIP;
    end
  end

  always @ (*) begin
    _zz_152 = 32'h0;
    if(execute_CsrPlugin_csr_772)begin
      _zz_152[11 : 11] = CsrPlugin_mie_MEIE;
      _zz_152[7 : 7] = CsrPlugin_mie_MTIE;
      _zz_152[3 : 3] = CsrPlugin_mie_MSIE;
    end
  end

  always @ (*) begin
    _zz_153 = 32'h0;
    if(execute_CsrPlugin_csr_773)begin
      _zz_153[31 : 2] = CsrPlugin_mtvec_base;
      _zz_153[1 : 0] = CsrPlugin_mtvec_mode;
    end
  end

  always @ (*) begin
    _zz_154 = 32'h0;
    if(execute_CsrPlugin_csr_834)begin
      _zz_154[31 : 31] = CsrPlugin_mcause_interrupt;
      _zz_154[3 : 0] = CsrPlugin_mcause_exceptionCode;
    end
  end

  always @ (*) begin
    _zz_155 = 32'h0;
    if(execute_CsrPlugin_csr_2816)begin
      _zz_155[31 : 0] = CsrPlugin_mcycle[31 : 0];
    end
  end

  always @ (*) begin
    _zz_156 = 32'h0;
    if(execute_CsrPlugin_csr_2944)begin
      _zz_156[31 : 0] = CsrPlugin_mcycle[63 : 32];
    end
  end

  always @ (*) begin
    _zz_157 = 32'h0;
    if(execute_CsrPlugin_csr_3072)begin
      _zz_157[31 : 0] = CsrPlugin_mcycle[31 : 0];
    end
  end

  always @ (*) begin
    _zz_158 = 32'h0;
    if(execute_CsrPlugin_csr_3200)begin
      _zz_158[31 : 0] = CsrPlugin_mcycle[63 : 32];
    end
  end

  assign execute_CsrPlugin_readData = ((((_zz_150 | _zz_151) | (_zz_152 | _zz_153)) | ((_zz_154 | _zz_155) | (_zz_156 | _zz_157))) | _zz_158);
  assign iBusAxi_ar_valid = iBus_cmd_valid;
  assign iBusAxi_ar_payload_len = 8'h07;
  assign iBusAxi_ar_payload_addr = iBus_cmd_payload_address;
  assign iBusAxi_ar_payload_prot = 3'b110;
  assign iBusAxi_ar_payload_cache = 4'b1111;
  assign iBusAxi_ar_payload_burst = 2'b01;
  assign iBus_cmd_ready = iBusAxi_ar_ready;
  assign iBus_rsp_valid = iBusAxi_r_valid;
  assign iBus_rsp_payload_data = iBusAxi_r_payload_data;
  assign iBus_rsp_payload_error = (! (iBusAxi_r_payload_resp == 2'b00));
  assign iBusAxi_r_ready = 1'b1;
  assign dBus_cmd_ready = ((1'b1 && (! dBus_cmd_m2sPipe_valid)) || dBus_cmd_m2sPipe_ready);
  assign dBus_cmd_m2sPipe_valid = dBus_cmd_m2sPipe_rValid;
  assign dBus_cmd_m2sPipe_payload_wr = dBus_cmd_m2sPipe_rData_wr;
  assign dBus_cmd_m2sPipe_payload_uncached = dBus_cmd_m2sPipe_rData_uncached;
  assign dBus_cmd_m2sPipe_payload_address = dBus_cmd_m2sPipe_rData_address;
  assign dBus_cmd_m2sPipe_payload_data = dBus_cmd_m2sPipe_rData_data;
  assign dBus_cmd_m2sPipe_payload_mask = dBus_cmd_m2sPipe_rData_mask;
  assign dBus_cmd_m2sPipe_payload_length = dBus_cmd_m2sPipe_rData_length;
  assign dBus_cmd_m2sPipe_payload_last = dBus_cmd_m2sPipe_rData_last;
  assign dBus_cmd_m2sPipe_ready = ((1'b1 && (! dBus_cmd_m2sPipe_m2sPipe_valid)) || dBus_cmd_m2sPipe_m2sPipe_ready);
  assign dBus_cmd_m2sPipe_m2sPipe_valid = dBus_cmd_m2sPipe_m2sPipe_rValid;
  assign dBus_cmd_m2sPipe_m2sPipe_payload_wr = dBus_cmd_m2sPipe_m2sPipe_rData_wr;
  assign dBus_cmd_m2sPipe_m2sPipe_payload_uncached = dBus_cmd_m2sPipe_m2sPipe_rData_uncached;
  assign dBus_cmd_m2sPipe_m2sPipe_payload_address = dBus_cmd_m2sPipe_m2sPipe_rData_address;
  assign dBus_cmd_m2sPipe_m2sPipe_payload_data = dBus_cmd_m2sPipe_m2sPipe_rData_data;
  assign dBus_cmd_m2sPipe_m2sPipe_payload_mask = dBus_cmd_m2sPipe_m2sPipe_rData_mask;
  assign dBus_cmd_m2sPipe_m2sPipe_payload_length = dBus_cmd_m2sPipe_m2sPipe_rData_length;
  assign dBus_cmd_m2sPipe_m2sPipe_payload_last = dBus_cmd_m2sPipe_m2sPipe_rData_last;
  assign dBus_cmd_m2sPipe_m2sPipe_s2mPipe_valid = (dBus_cmd_m2sPipe_m2sPipe_valid || dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rValid);
  assign dBus_cmd_m2sPipe_m2sPipe_ready = (! dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rValid);
  assign dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_wr = (dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rValid ? dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rData_wr : dBus_cmd_m2sPipe_m2sPipe_payload_wr);
  assign dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_uncached = (dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rValid ? dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rData_uncached : dBus_cmd_m2sPipe_m2sPipe_payload_uncached);
  assign dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_address = (dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rValid ? dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rData_address : dBus_cmd_m2sPipe_m2sPipe_payload_address);
  assign dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_data = (dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rValid ? dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rData_data : dBus_cmd_m2sPipe_m2sPipe_payload_data);
  assign dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_mask = (dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rValid ? dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rData_mask : dBus_cmd_m2sPipe_m2sPipe_payload_mask);
  assign dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_length = (dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rValid ? dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rData_length : dBus_cmd_m2sPipe_m2sPipe_payload_length);
  assign dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_last = (dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rValid ? dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rData_last : dBus_cmd_m2sPipe_m2sPipe_payload_last);
  always @ (*) begin
    _zz_163 = 1'b0;
    if(((dBus_cmd_m2sPipe_m2sPipe_s2mPipe_valid && dBus_cmd_m2sPipe_m2sPipe_s2mPipe_ready) && dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_wr))begin
      _zz_163 = 1'b1;
    end
  end

  always @ (*) begin
    _zz_164 = 1'b0;
    if((dBusAxi_b_valid && 1'b1))begin
      _zz_164 = 1'b1;
    end
  end

  always @ (*) begin
    if((_zz_163 && (! _zz_164)))begin
      _zz_166 = 3'b001;
    end else begin
      if(((! _zz_163) && _zz_164))begin
        _zz_166 = 3'b111;
      end else begin
        _zz_166 = 3'b000;
      end
    end
  end

  assign _zz_167 = (! (((_zz_165 != 3'b000) && (! dBus_cmd_m2sPipe_m2sPipe_s2mPipe_payload_wr)) || (_zz_165 == 3'b111)));
  assign dBus_cmd_m2sPipe_m2sPipe_s2mPipe_ready = (streamFork_1_io_input_ready && _zz_167);
  assign _zz_204 = (dBus_cmd_m2sPipe_m2sPipe_s2mPipe_valid && _zz_167);
  always @ (*) begin
    streamFork_1_io_outputs_0_thrown_valid = streamFork_1_io_outputs_0_valid;
    if(_zz_168)begin
      streamFork_1_io_outputs_0_thrown_valid = 1'b0;
    end
  end

  always @ (*) begin
    _zz_205 = streamFork_1_io_outputs_0_thrown_ready;
    if(_zz_168)begin
      _zz_205 = 1'b1;
    end
  end

  assign streamFork_1_io_outputs_0_thrown_payload_wr = streamFork_1_io_outputs_0_payload_wr;
  assign streamFork_1_io_outputs_0_thrown_payload_uncached = streamFork_1_io_outputs_0_payload_uncached;
  assign streamFork_1_io_outputs_0_thrown_payload_address = streamFork_1_io_outputs_0_payload_address;
  assign streamFork_1_io_outputs_0_thrown_payload_data = streamFork_1_io_outputs_0_payload_data;
  assign streamFork_1_io_outputs_0_thrown_payload_mask = streamFork_1_io_outputs_0_payload_mask;
  assign streamFork_1_io_outputs_0_thrown_payload_length = streamFork_1_io_outputs_0_payload_length;
  assign streamFork_1_io_outputs_0_thrown_payload_last = streamFork_1_io_outputs_0_payload_last;
  always @ (*) begin
    streamFork_1_io_outputs_1_thrown_valid = streamFork_1_io_outputs_1_valid;
    if(_zz_234)begin
      streamFork_1_io_outputs_1_thrown_valid = 1'b0;
    end
  end

  always @ (*) begin
    _zz_206 = streamFork_1_io_outputs_1_thrown_ready;
    if(_zz_234)begin
      _zz_206 = 1'b1;
    end
  end

  assign streamFork_1_io_outputs_1_thrown_payload_wr = streamFork_1_io_outputs_1_payload_wr;
  assign streamFork_1_io_outputs_1_thrown_payload_uncached = streamFork_1_io_outputs_1_payload_uncached;
  assign streamFork_1_io_outputs_1_thrown_payload_address = streamFork_1_io_outputs_1_payload_address;
  assign streamFork_1_io_outputs_1_thrown_payload_data = streamFork_1_io_outputs_1_payload_data;
  assign streamFork_1_io_outputs_1_thrown_payload_mask = streamFork_1_io_outputs_1_payload_mask;
  assign streamFork_1_io_outputs_1_thrown_payload_length = streamFork_1_io_outputs_1_payload_length;
  assign streamFork_1_io_outputs_1_thrown_payload_last = streamFork_1_io_outputs_1_payload_last;
  assign _zz_159 = streamFork_1_io_outputs_0_thrown_valid;
  assign streamFork_1_io_outputs_0_thrown_ready = (_zz_162 ? dBusAxi_aw_ready : dBusAxi_ar_ready);
  assign _zz_162 = streamFork_1_io_outputs_0_thrown_payload_wr;
  assign _zz_160 = streamFork_1_io_outputs_0_thrown_payload_address;
  assign _zz_161 = {5'd0, streamFork_1_io_outputs_0_thrown_payload_length};
  assign streamFork_1_io_outputs_1_thrown_ready = dBusAxi_w_ready;
  assign dBus_rsp_valid = dBusAxi_r_valid;
  assign dBus_rsp_payload_error = (! (dBusAxi_r_payload_resp == 2'b00));
  assign dBus_rsp_payload_data = dBusAxi_r_payload_data;
  assign dBusAxi_ar_valid = (_zz_159 && (! _zz_162));
  assign dBusAxi_ar_payload_addr = _zz_160;
  assign _zz_169[0 : 0] = 1'b0;
  assign dBusAxi_ar_payload_id = _zz_169;
  assign _zz_170[3 : 0] = 4'b0000;
  assign dBusAxi_ar_payload_region = _zz_170;
  assign dBusAxi_ar_payload_len = _zz_161;
  assign dBusAxi_ar_payload_size = 3'b010;
  assign dBusAxi_ar_payload_burst = 2'b01;
  assign dBusAxi_ar_payload_lock = 1'b0;
  assign dBusAxi_ar_payload_cache = 4'b1111;
  assign dBusAxi_ar_payload_qos = 4'b0000;
  assign dBusAxi_ar_payload_prot = 3'b010;
  assign dBusAxi_aw_valid = (_zz_159 && _zz_162);
  assign dBusAxi_aw_payload_addr = _zz_160;
  assign _zz_171[0 : 0] = 1'b0;
  assign dBusAxi_aw_payload_id = _zz_171;
  assign _zz_172[3 : 0] = 4'b0000;
  assign dBusAxi_aw_payload_region = _zz_172;
  assign dBusAxi_aw_payload_len = _zz_161;
  assign dBusAxi_aw_payload_size = 3'b010;
  assign dBusAxi_aw_payload_burst = 2'b01;
  assign dBusAxi_aw_payload_lock = 1'b0;
  assign dBusAxi_aw_payload_cache = 4'b1111;
  assign dBusAxi_aw_payload_qos = 4'b0000;
  assign dBusAxi_aw_payload_prot = 3'b010;
  assign dBusAxi_w_valid = streamFork_1_io_outputs_1_thrown_valid;
  assign dBusAxi_w_payload_data = streamFork_1_io_outputs_1_thrown_payload_data;
  assign dBusAxi_w_payload_strb = streamFork_1_io_outputs_1_thrown_payload_mask;
  assign dBusAxi_w_payload_last = streamFork_1_io_outputs_1_thrown_payload_last;
  assign dBusAxi_r_ready = 1'b1;
  assign dBusAxi_b_ready = 1'b1;
  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      IBusCachedPlugin_fetchPc_pcReg <= externalResetVector;
      IBusCachedPlugin_fetchPc_correctionReg <= 1'b0;
      IBusCachedPlugin_fetchPc_booted <= 1'b0;
      IBusCachedPlugin_fetchPc_inc <= 1'b0;
      _zz_66 <= 1'b0;
      _zz_68 <= 1'b0;
      _zz_71 <= 1'b0;
      _zz_73 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_5 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_6 <= 1'b0;
      IBusCachedPlugin_rspCounter <= _zz_89;
      IBusCachedPlugin_rspCounter <= 32'h0;
      dataCache_1_io_mem_cmd_s2mPipe_rValid <= 1'b0;
      dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_rValid <= 1'b0;
      dBus_rsp_regNext_valid <= 1'b0;
      DBusCachedPlugin_rspCounter <= _zz_90;
      DBusCachedPlugin_rspCounter <= 32'h0;
      CsrPlugin_mstatus_MIE <= 1'b0;
      CsrPlugin_mstatus_MPIE <= 1'b0;
      CsrPlugin_mstatus_MPP <= 2'b11;
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
      _zz_113 <= 1'b1;
      memory_MulDivIterativePlugin_div_counter_value <= 6'h0;
      HazardSimplePlugin_writeBackBuffer_valid <= 1'b0;
      execute_arbitration_isValid <= 1'b0;
      memory_arbitration_isValid <= 1'b0;
      writeBack_arbitration_isValid <= 1'b0;
      dBus_cmd_m2sPipe_rValid <= 1'b0;
      dBus_cmd_m2sPipe_m2sPipe_rValid <= 1'b0;
      dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rValid <= 1'b0;
      _zz_165 <= 3'b000;
      _zz_168 <= 1'b0;
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
        _zz_66 <= 1'b0;
      end
      if(_zz_64)begin
        _zz_66 <= (IBusCachedPlugin_iBusRsp_stages_0_output_valid && (! 1'b0));
      end
      if(IBusCachedPlugin_iBusRsp_flush)begin
        _zz_68 <= 1'b0;
      end
      if(IBusCachedPlugin_iBusRsp_stages_1_output_ready)begin
        _zz_68 <= (IBusCachedPlugin_iBusRsp_stages_1_output_valid && (! IBusCachedPlugin_iBusRsp_flush));
      end
      if(IBusCachedPlugin_iBusRsp_flush)begin
        _zz_71 <= 1'b0;
      end
      if(IBusCachedPlugin_iBusRsp_stages_2_output_ready)begin
        _zz_71 <= (IBusCachedPlugin_iBusRsp_stages_2_output_valid && (! IBusCachedPlugin_iBusRsp_flush));
      end
      if(decode_arbitration_removeIt)begin
        _zz_73 <= 1'b0;
      end
      if(IBusCachedPlugin_iBusRsp_output_ready)begin
        _zz_73 <= (IBusCachedPlugin_iBusRsp_output_valid && (! IBusCachedPlugin_externalFlush));
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
      if(dataCache_1_io_mem_cmd_s2mPipe_ready)begin
        dataCache_1_io_mem_cmd_s2mPipe_rValid <= 1'b0;
      end
      if(_zz_235)begin
        dataCache_1_io_mem_cmd_s2mPipe_rValid <= dataCache_1_io_mem_cmd_valid;
      end
      if(dataCache_1_io_mem_cmd_s2mPipe_ready)begin
        dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_rValid <= dataCache_1_io_mem_cmd_s2mPipe_valid;
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
      if(_zz_236)begin
        if(_zz_237)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(_zz_238)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(_zz_239)begin
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
      if(_zz_220)begin
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
      if(_zz_221)begin
        case(_zz_222)
          2'b11 : begin
            CsrPlugin_mstatus_MPP <= 2'b00;
            CsrPlugin_mstatus_MIE <= CsrPlugin_mstatus_MPIE;
            CsrPlugin_mstatus_MPIE <= 1'b1;
          end
          default : begin
          end
        endcase
      end
      execute_CsrPlugin_wfiWake <= (({_zz_98,{_zz_97,_zz_96}} != 3'b000) || CsrPlugin_thirdPartyWake);
      _zz_113 <= 1'b0;
      memory_MulDivIterativePlugin_div_counter_value <= memory_MulDivIterativePlugin_div_counter_valueNext;
      HazardSimplePlugin_writeBackBuffer_valid <= HazardSimplePlugin_writeBackWrites_valid;
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
          CsrPlugin_mstatus_MPIE <= _zz_329[0];
          CsrPlugin_mstatus_MIE <= _zz_330[0];
        end
      end
      if(execute_CsrPlugin_csr_772)begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mie_MEIE <= _zz_332[0];
          CsrPlugin_mie_MTIE <= _zz_333[0];
          CsrPlugin_mie_MSIE <= _zz_334[0];
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
      if(_zz_240)begin
        dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rValid <= dBus_cmd_m2sPipe_m2sPipe_valid;
      end
      _zz_165 <= (_zz_165 + _zz_166);
      if((streamFork_1_io_outputs_0_valid && _zz_205))begin
        _zz_168 <= (! streamFork_1_io_outputs_0_payload_last);
      end
    end
  end

  always @ (posedge clk) begin
    if(IBusCachedPlugin_iBusRsp_stages_1_output_ready)begin
      _zz_69 <= IBusCachedPlugin_iBusRsp_stages_1_output_payload;
    end
    if(IBusCachedPlugin_iBusRsp_stages_2_output_ready)begin
      _zz_72 <= IBusCachedPlugin_iBusRsp_stages_2_output_payload;
    end
    if(IBusCachedPlugin_iBusRsp_output_ready)begin
      _zz_74 <= IBusCachedPlugin_iBusRsp_output_payload_pc;
      _zz_75 <= IBusCachedPlugin_iBusRsp_output_payload_rsp_error;
      _zz_76 <= IBusCachedPlugin_iBusRsp_output_payload_rsp_inst;
      _zz_77 <= IBusCachedPlugin_iBusRsp_output_payload_isRvc;
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
    if(_zz_235)begin
      dataCache_1_io_mem_cmd_s2mPipe_rData_wr <= dataCache_1_io_mem_cmd_payload_wr;
      dataCache_1_io_mem_cmd_s2mPipe_rData_uncached <= dataCache_1_io_mem_cmd_payload_uncached;
      dataCache_1_io_mem_cmd_s2mPipe_rData_address <= dataCache_1_io_mem_cmd_payload_address;
      dataCache_1_io_mem_cmd_s2mPipe_rData_data <= dataCache_1_io_mem_cmd_payload_data;
      dataCache_1_io_mem_cmd_s2mPipe_rData_mask <= dataCache_1_io_mem_cmd_payload_mask;
      dataCache_1_io_mem_cmd_s2mPipe_rData_length <= dataCache_1_io_mem_cmd_payload_length;
      dataCache_1_io_mem_cmd_s2mPipe_rData_last <= dataCache_1_io_mem_cmd_payload_last;
    end
    if(dataCache_1_io_mem_cmd_s2mPipe_ready)begin
      dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_rData_wr <= dataCache_1_io_mem_cmd_s2mPipe_payload_wr;
      dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_rData_uncached <= dataCache_1_io_mem_cmd_s2mPipe_payload_uncached;
      dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_rData_address <= dataCache_1_io_mem_cmd_s2mPipe_payload_address;
      dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_rData_data <= dataCache_1_io_mem_cmd_s2mPipe_payload_data;
      dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_rData_mask <= dataCache_1_io_mem_cmd_s2mPipe_payload_mask;
      dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_rData_length <= dataCache_1_io_mem_cmd_s2mPipe_payload_length;
      dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_rData_last <= dataCache_1_io_mem_cmd_s2mPipe_payload_last;
    end
    dBus_rsp_regNext_payload_last <= dBus_rsp_payload_last;
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
    if(_zz_236)begin
      if(_zz_237)begin
        CsrPlugin_interrupt_code <= 4'b0111;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(_zz_238)begin
        CsrPlugin_interrupt_code <= 4'b0011;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(_zz_239)begin
        CsrPlugin_interrupt_code <= 4'b1011;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
    end
    if(_zz_220)begin
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
    if(_zz_214)begin
      if(_zz_226)begin
        memory_MulDivIterativePlugin_rs1[31 : 0] <= memory_MulDivIterativePlugin_div_stage_0_outNumerator;
        memory_MulDivIterativePlugin_accumulator[31 : 0] <= memory_MulDivIterativePlugin_div_stage_0_outRemainder;
        if((memory_MulDivIterativePlugin_div_counter_value == 6'h20))begin
          memory_MulDivIterativePlugin_div_result <= _zz_310[31:0];
        end
      end
    end
    if(_zz_227)begin
      memory_MulDivIterativePlugin_accumulator <= 65'h0;
      memory_MulDivIterativePlugin_rs1 <= ((_zz_126 ? (~ _zz_127) : _zz_127) + _zz_316);
      memory_MulDivIterativePlugin_rs2 <= ((_zz_125 ? (~ execute_RS2) : execute_RS2) + _zz_318);
      memory_MulDivIterativePlugin_div_needRevert <= ((_zz_126 ^ (_zz_125 && (! execute_INSTRUCTION[13]))) && (! (((execute_RS2 == 32'h0) && execute_IS_RS2_SIGNED) && (! execute_INSTRUCTION[13]))));
    end
    HazardSimplePlugin_writeBackBuffer_payload_address <= HazardSimplePlugin_writeBackWrites_payload_address;
    HazardSimplePlugin_writeBackBuffer_payload_data <= HazardSimplePlugin_writeBackWrites_payload_data;
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_PC <= decode_PC;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_PC <= _zz_31;
    end
    if(((! writeBack_arbitration_isStuck) && (! CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack)))begin
      memory_to_writeBack_PC <= memory_PC;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_INSTRUCTION <= decode_INSTRUCTION;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_INSTRUCTION <= execute_INSTRUCTION;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_INSTRUCTION <= memory_INSTRUCTION;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_FORMAL_PC_NEXT <= _zz_54;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_FORMAL_PC_NEXT <= execute_FORMAL_PC_NEXT;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_FORMAL_PC_NEXT <= _zz_53;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_FORCE_CONSTISTENCY <= decode_MEMORY_FORCE_CONSTISTENCY;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_WRITE_OPCODE <= decode_CSR_WRITE_OPCODE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_READ_OPCODE <= decode_CSR_READ_OPCODE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC1_CTRL <= _zz_25;
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
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_CTRL <= _zz_22;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2_CTRL <= _zz_19;
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
      decode_to_execute_BYPASSABLE_EXECUTE_STAGE <= decode_BYPASSABLE_EXECUTE_STAGE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BYPASSABLE_MEMORY_STAGE <= decode_BYPASSABLE_MEMORY_STAGE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BYPASSABLE_MEMORY_STAGE <= execute_BYPASSABLE_MEMORY_STAGE;
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
      decode_to_execute_MEMORY_LRSC <= decode_MEMORY_LRSC;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_AMO <= decode_MEMORY_AMO;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_MANAGMENT <= decode_MEMORY_MANAGMENT;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_CSR <= decode_IS_CSR;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ENV_CTRL <= _zz_16;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_ENV_CTRL <= _zz_13;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_ENV_CTRL <= _zz_11;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_LESS_UNSIGNED <= decode_SRC_LESS_UNSIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_BITWISE_CTRL <= _zz_9;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SHIFT_CTRL <= _zz_6;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_SHIFT_CTRL <= _zz_3;
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
      decode_to_execute_IS_DIV <= decode_IS_DIV;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_IS_DIV <= execute_IS_DIV;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_RS1_SIGNED <= decode_IS_RS1_SIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_RS2_SIGNED <= decode_IS_RS2_SIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BRANCH_CTRL <= _zz_1;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_RS1 <= decode_RS1;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_RS2 <= decode_RS2;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2_FORCE_ZERO <= decode_SRC2_FORCE_ZERO;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_PREDICTION_HAD_BRANCHED2 <= decode_PREDICTION_HAD_BRANCHED2;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_ADDRESS_LOW <= execute_MEMORY_ADDRESS_LOW;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_ADDRESS_LOW <= memory_MEMORY_ADDRESS_LOW;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_REGFILE_WRITE_DATA <= _zz_46;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_REGFILE_WRITE_DATA <= _zz_28;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_SHIFT_RIGHT <= execute_SHIFT_RIGHT;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_LL <= execute_MUL_LL;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_LH <= execute_MUL_LH;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_HL <= execute_MUL_HL;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_HH <= execute_MUL_HH;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MUL_HH <= memory_MUL_HH;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BRANCH_DO <= execute_BRANCH_DO;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BRANCH_CALC <= execute_BRANCH_CALC;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MUL_LOW <= memory_MUL_LOW;
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
        CsrPlugin_mip_MSIP <= _zz_331[0];
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
      dBus_cmd_m2sPipe_rData_uncached <= dBus_cmd_payload_uncached;
      dBus_cmd_m2sPipe_rData_address <= dBus_cmd_payload_address;
      dBus_cmd_m2sPipe_rData_data <= dBus_cmd_payload_data;
      dBus_cmd_m2sPipe_rData_mask <= dBus_cmd_payload_mask;
      dBus_cmd_m2sPipe_rData_length <= dBus_cmd_payload_length;
      dBus_cmd_m2sPipe_rData_last <= dBus_cmd_payload_last;
    end
    if(dBus_cmd_m2sPipe_ready)begin
      dBus_cmd_m2sPipe_m2sPipe_rData_wr <= dBus_cmd_m2sPipe_payload_wr;
      dBus_cmd_m2sPipe_m2sPipe_rData_uncached <= dBus_cmd_m2sPipe_payload_uncached;
      dBus_cmd_m2sPipe_m2sPipe_rData_address <= dBus_cmd_m2sPipe_payload_address;
      dBus_cmd_m2sPipe_m2sPipe_rData_data <= dBus_cmd_m2sPipe_payload_data;
      dBus_cmd_m2sPipe_m2sPipe_rData_mask <= dBus_cmd_m2sPipe_payload_mask;
      dBus_cmd_m2sPipe_m2sPipe_rData_length <= dBus_cmd_m2sPipe_payload_length;
      dBus_cmd_m2sPipe_m2sPipe_rData_last <= dBus_cmd_m2sPipe_payload_last;
    end
    if(_zz_240)begin
      dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rData_wr <= dBus_cmd_m2sPipe_m2sPipe_payload_wr;
      dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rData_uncached <= dBus_cmd_m2sPipe_m2sPipe_payload_uncached;
      dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rData_address <= dBus_cmd_m2sPipe_m2sPipe_payload_address;
      dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rData_data <= dBus_cmd_m2sPipe_m2sPipe_payload_data;
      dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rData_mask <= dBus_cmd_m2sPipe_m2sPipe_payload_mask;
      dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rData_length <= dBus_cmd_m2sPipe_m2sPipe_payload_length;
      dBus_cmd_m2sPipe_m2sPipe_s2mPipe_rData_last <= dBus_cmd_m2sPipe_m2sPipe_payload_last;
    end
  end


endmodule

module StreamFork (
  input               io_input_valid,
  output reg          io_input_ready,
  input               io_input_payload_wr,
  input               io_input_payload_uncached,
  input      [31:0]   io_input_payload_address,
  input      [31:0]   io_input_payload_data,
  input      [3:0]    io_input_payload_mask,
  input      [2:0]    io_input_payload_length,
  input               io_input_payload_last,
  output              io_outputs_0_valid,
  input               io_outputs_0_ready,
  output              io_outputs_0_payload_wr,
  output              io_outputs_0_payload_uncached,
  output     [31:0]   io_outputs_0_payload_address,
  output     [31:0]   io_outputs_0_payload_data,
  output     [3:0]    io_outputs_0_payload_mask,
  output     [2:0]    io_outputs_0_payload_length,
  output              io_outputs_0_payload_last,
  output              io_outputs_1_valid,
  input               io_outputs_1_ready,
  output              io_outputs_1_payload_wr,
  output              io_outputs_1_payload_uncached,
  output     [31:0]   io_outputs_1_payload_address,
  output     [31:0]   io_outputs_1_payload_data,
  output     [3:0]    io_outputs_1_payload_mask,
  output     [2:0]    io_outputs_1_payload_length,
  output              io_outputs_1_payload_last,
  input               clk,
  input               reset
);
  reg                 _zz_1;
  reg                 _zz_2;

  always @ (*) begin
    io_input_ready = 1'b1;
    if(((! io_outputs_0_ready) && _zz_1))begin
      io_input_ready = 1'b0;
    end
    if(((! io_outputs_1_ready) && _zz_2))begin
      io_input_ready = 1'b0;
    end
  end

  assign io_outputs_0_valid = (io_input_valid && _zz_1);
  assign io_outputs_0_payload_wr = io_input_payload_wr;
  assign io_outputs_0_payload_uncached = io_input_payload_uncached;
  assign io_outputs_0_payload_address = io_input_payload_address;
  assign io_outputs_0_payload_data = io_input_payload_data;
  assign io_outputs_0_payload_mask = io_input_payload_mask;
  assign io_outputs_0_payload_length = io_input_payload_length;
  assign io_outputs_0_payload_last = io_input_payload_last;
  assign io_outputs_1_valid = (io_input_valid && _zz_2);
  assign io_outputs_1_payload_wr = io_input_payload_wr;
  assign io_outputs_1_payload_uncached = io_input_payload_uncached;
  assign io_outputs_1_payload_address = io_input_payload_address;
  assign io_outputs_1_payload_data = io_input_payload_data;
  assign io_outputs_1_payload_mask = io_input_payload_mask;
  assign io_outputs_1_payload_length = io_input_payload_length;
  assign io_outputs_1_payload_last = io_input_payload_last;
  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      _zz_1 <= 1'b1;
      _zz_2 <= 1'b1;
    end else begin
      if((io_outputs_0_valid && io_outputs_0_ready))begin
        _zz_1 <= 1'b0;
      end
      if((io_outputs_1_valid && io_outputs_1_ready))begin
        _zz_2 <= 1'b0;
      end
      if(io_input_ready)begin
        _zz_1 <= 1'b1;
        _zz_2 <= 1'b1;
      end
    end
  end


endmodule

module DataCache (
  input               io_cpu_execute_isValid,
  input      [31:0]   io_cpu_execute_address,
  output              io_cpu_execute_haltIt,
  input               io_cpu_execute_args_wr,
  input      [31:0]   io_cpu_execute_args_data,
  input      [1:0]    io_cpu_execute_args_size,
  input               io_cpu_execute_args_isLrsc,
  input               io_cpu_execute_args_isAmo,
  input               io_cpu_execute_args_amoCtrl_swap,
  input      [2:0]    io_cpu_execute_args_amoCtrl_alu,
  input               io_cpu_execute_args_totalyConsistent,
  output              io_cpu_execute_refilling,
  input               io_cpu_memory_isValid,
  input               io_cpu_memory_isStuck,
  output              io_cpu_memory_isWrite,
  input      [31:0]   io_cpu_memory_address,
  input      [31:0]   io_cpu_memory_mmuRsp_physicalAddress,
  input               io_cpu_memory_mmuRsp_isIoAccess,
  input               io_cpu_memory_mmuRsp_isPaging,
  input               io_cpu_memory_mmuRsp_allowRead,
  input               io_cpu_memory_mmuRsp_allowWrite,
  input               io_cpu_memory_mmuRsp_allowExecute,
  input               io_cpu_memory_mmuRsp_exception,
  input               io_cpu_memory_mmuRsp_refilling,
  input               io_cpu_memory_mmuRsp_bypassTranslation,
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
  output              io_cpu_writeBack_keepMemRspData,
  input               io_cpu_writeBack_fence_SW,
  input               io_cpu_writeBack_fence_SR,
  input               io_cpu_writeBack_fence_SO,
  input               io_cpu_writeBack_fence_SI,
  input               io_cpu_writeBack_fence_PW,
  input               io_cpu_writeBack_fence_PR,
  input               io_cpu_writeBack_fence_PO,
  input               io_cpu_writeBack_fence_PI,
  input      [3:0]    io_cpu_writeBack_fence_FM,
  output reg          io_cpu_redo,
  input               io_cpu_flush_valid,
  output reg          io_cpu_flush_ready,
  output reg          io_mem_cmd_valid,
  input               io_mem_cmd_ready,
  output reg          io_mem_cmd_payload_wr,
  output              io_mem_cmd_payload_uncached,
  output reg [31:0]   io_mem_cmd_payload_address,
  output     [31:0]   io_mem_cmd_payload_data,
  output     [3:0]    io_mem_cmd_payload_mask,
  output reg [2:0]    io_mem_cmd_payload_length,
  output              io_mem_cmd_payload_last,
  input               io_mem_rsp_valid,
  input               io_mem_rsp_payload_last,
  input      [31:0]   io_mem_rsp_payload_data,
  input               io_mem_rsp_payload_error,
  input               clk,
  input               reset
);
  reg        [21:0]   _zz_10;
  reg        [31:0]   _zz_11;
  wire                _zz_12;
  wire                _zz_13;
  wire                _zz_14;
  wire                _zz_15;
  wire                _zz_16;
  wire                _zz_17;
  wire                _zz_18;
  wire                _zz_19;
  wire                _zz_20;
  wire                _zz_21;
  wire                _zz_22;
  wire       [2:0]    _zz_23;
  wire       [0:0]    _zz_24;
  wire       [0:0]    _zz_25;
  wire       [9:0]    _zz_26;
  wire       [9:0]    _zz_27;
  wire       [31:0]   _zz_28;
  wire       [31:0]   _zz_29;
  wire       [31:0]   _zz_30;
  wire       [31:0]   _zz_31;
  wire       [1:0]    _zz_32;
  wire       [31:0]   _zz_33;
  wire       [1:0]    _zz_34;
  wire       [1:0]    _zz_35;
  wire       [0:0]    _zz_36;
  wire       [0:0]    _zz_37;
  wire       [0:0]    _zz_38;
  wire       [2:0]    _zz_39;
  wire       [1:0]    _zz_40;
  wire       [21:0]   _zz_41;
  reg                 _zz_1;
  reg                 _zz_2;
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
  wire                _zz_3;
  wire                ways_0_tagsReadRsp_valid;
  wire                ways_0_tagsReadRsp_error;
  wire       [19:0]   ways_0_tagsReadRsp_address;
  wire       [21:0]   _zz_4;
  wire                _zz_5;
  wire       [31:0]   ways_0_dataReadRspMem;
  wire       [31:0]   ways_0_dataReadRsp;
  wire                rspSync;
  wire                rspLast;
  reg                 memCmdSent;
  reg        [3:0]    _zz_6;
  wire       [3:0]    stage0_mask;
  wire       [0:0]    stage0_dataColisions;
  wire       [0:0]    stage0_wayInvalidate;
  reg                 stageA_request_wr;
  reg        [31:0]   stageA_request_data;
  reg        [1:0]    stageA_request_size;
  reg                 stageA_request_isLrsc;
  reg                 stageA_request_isAmo;
  reg                 stageA_request_amoCtrl_swap;
  reg        [2:0]    stageA_request_amoCtrl_alu;
  reg                 stageA_request_totalyConsistent;
  reg        [3:0]    stageA_mask;
  wire       [0:0]    stageA_wayHits;
  wire       [0:0]    _zz_7;
  reg        [0:0]    stageA_wayInvalidate;
  reg        [0:0]    stage0_dataColisions_regNextWhen;
  wire       [0:0]    _zz_8;
  wire       [0:0]    stageA_dataColisions;
  reg                 stageB_request_wr;
  reg        [31:0]   stageB_request_data;
  reg        [1:0]    stageB_request_size;
  reg                 stageB_request_isLrsc;
  reg                 stageB_request_isAmo;
  reg                 stageB_request_amoCtrl_swap;
  reg        [2:0]    stageB_request_amoCtrl_alu;
  reg                 stageB_request_totalyConsistent;
  reg                 stageB_mmuRspFreeze;
  reg        [31:0]   stageB_mmuRsp_physicalAddress;
  reg                 stageB_mmuRsp_isIoAccess;
  reg                 stageB_mmuRsp_isPaging;
  reg                 stageB_mmuRsp_allowRead;
  reg                 stageB_mmuRsp_allowWrite;
  reg                 stageB_mmuRsp_allowExecute;
  reg                 stageB_mmuRsp_exception;
  reg                 stageB_mmuRsp_refilling;
  reg                 stageB_mmuRsp_bypassTranslation;
  reg                 stageB_tagsReadRsp_0_valid;
  reg                 stageB_tagsReadRsp_0_error;
  reg        [19:0]   stageB_tagsReadRsp_0_address;
  reg        [31:0]   stageB_dataReadRsp_0;
  reg        [0:0]    stageB_wayInvalidate;
  wire                stageB_consistancyHazard;
  reg        [0:0]    stageB_dataColisions;
  reg                 stageB_unaligned;
  reg        [0:0]    stageB_waysHitsBeforeInvalidate;
  wire       [0:0]    stageB_waysHits;
  wire                stageB_waysHit;
  wire       [31:0]   stageB_dataMux;
  reg        [3:0]    stageB_mask;
  reg                 stageB_loaderValid;
  wire       [31:0]   stageB_ioMemRspMuxed;
  reg                 stageB_flusher_valid;
  wire                stageB_flusher_hold;
  reg                 stageB_flusher_start;
  reg                 stageB_lrSc_reserved;
  wire                stageB_isExternalLsrc;
  wire                stageB_isExternalAmo;
  reg        [31:0]   stageB_requestDataBypass;
  wire                stageB_amo_compare;
  wire                stageB_amo_unsigned;
  wire       [31:0]   stageB_amo_addSub;
  wire                stageB_amo_less;
  wire                stageB_amo_selectRf;
  reg        [31:0]   stageB_amo_result;
  reg        [31:0]   stageB_amo_resultReg;
  reg                 stageB_amo_internal_resultRegValid;
  reg                 stageB_cpuWriteToCache;
  wire                stageB_badPermissions;
  wire                stageB_loadStoreFault;
  wire                stageB_bypassCache;
  wire       [0:0]    _zz_9;
  reg                 loader_valid;
  reg                 loader_counter_willIncrement;
  wire                loader_counter_willClear;
  reg        [2:0]    loader_counter_valueNext;
  reg        [2:0]    loader_counter_value;
  wire                loader_counter_willOverflowIfInc;
  wire                loader_counter_willOverflow;
  reg        [0:0]    loader_waysAllocator;
  reg                 loader_error;
  wire                loader_kill;
  reg                 loader_killReg;
  wire                loader_done;
  reg                 loader_valid_regNext;
  reg [21:0] ways_0_tags [0:127];
  reg [7:0] ways_0_data_symbol0 [0:1023];
  reg [7:0] ways_0_data_symbol1 [0:1023];
  reg [7:0] ways_0_data_symbol2 [0:1023];
  reg [7:0] ways_0_data_symbol3 [0:1023];
  reg [7:0] _zz_42;
  reg [7:0] _zz_43;
  reg [7:0] _zz_44;
  reg [7:0] _zz_45;

  assign _zz_12 = (io_cpu_execute_isValid && (! io_cpu_memory_isStuck));
  assign _zz_13 = ((((stageB_consistancyHazard || stageB_mmuRsp_refilling) || io_cpu_writeBack_accessError) || io_cpu_writeBack_mmuException) || io_cpu_writeBack_unalignedAccess);
  assign _zz_14 = (stageB_mmuRsp_isIoAccess || stageB_isExternalLsrc);
  assign _zz_15 = (stageB_waysHit || (stageB_request_wr && (! stageB_request_isAmo)));
  assign _zz_16 = (! stageB_amo_internal_resultRegValid);
  assign _zz_17 = (stageB_request_isLrsc && (! stageB_lrSc_reserved));
  assign _zz_18 = ((loader_valid && io_mem_rsp_valid) && rspLast);
  assign _zz_19 = (stageB_request_isLrsc && (! stageB_lrSc_reserved));
  assign _zz_20 = (((! stageB_request_wr) || stageB_request_isAmo) && ((stageB_dataColisions & stageB_waysHits) != 1'b0));
  assign _zz_21 = (! stageB_flusher_hold);
  assign _zz_22 = (stageB_mmuRsp_physicalAddress[11 : 5] != 7'h7f);
  assign _zz_23 = (stageB_request_amoCtrl_alu | {stageB_request_amoCtrl_swap,2'b00});
  assign _zz_24 = _zz_4[0 : 0];
  assign _zz_25 = _zz_4[1 : 1];
  assign _zz_26 = (io_cpu_execute_address[11 : 2] >>> 0);
  assign _zz_27 = (io_cpu_memory_address[11 : 2] >>> 0);
  assign _zz_28 = ($signed(_zz_29) + $signed(_zz_33));
  assign _zz_29 = ($signed(_zz_30) + $signed(_zz_31));
  assign _zz_30 = stageB_request_data;
  assign _zz_31 = (stageB_amo_compare ? (~ stageB_dataMux) : stageB_dataMux);
  assign _zz_32 = (stageB_amo_compare ? _zz_34 : _zz_35);
  assign _zz_33 = {{30{_zz_32[1]}}, _zz_32};
  assign _zz_34 = 2'b01;
  assign _zz_35 = 2'b00;
  assign _zz_36 = 1'b1;
  assign _zz_37 = (! stageB_lrSc_reserved);
  assign _zz_38 = loader_counter_willIncrement;
  assign _zz_39 = {2'd0, _zz_38};
  assign _zz_40 = {loader_waysAllocator,loader_waysAllocator[0]};
  assign _zz_41 = {tagsWriteCmd_payload_data_address,{tagsWriteCmd_payload_data_error,tagsWriteCmd_payload_data_valid}};
  always @ (posedge clk) begin
    if(_zz_3) begin
      _zz_10 <= ways_0_tags[tagsReadCmd_payload];
    end
  end

  always @ (posedge clk) begin
    if(_zz_2) begin
      ways_0_tags[tagsWriteCmd_payload_address] <= _zz_41;
    end
  end

  always @ (*) begin
    _zz_11 = {_zz_45, _zz_44, _zz_43, _zz_42};
  end
  always @ (posedge clk) begin
    if(_zz_5) begin
      _zz_42 <= ways_0_data_symbol0[dataReadCmd_payload];
      _zz_43 <= ways_0_data_symbol1[dataReadCmd_payload];
      _zz_44 <= ways_0_data_symbol2[dataReadCmd_payload];
      _zz_45 <= ways_0_data_symbol3[dataReadCmd_payload];
    end
  end

  always @ (posedge clk) begin
    if(dataWriteCmd_payload_mask[0] && _zz_1) begin
      ways_0_data_symbol0[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[7 : 0];
    end
    if(dataWriteCmd_payload_mask[1] && _zz_1) begin
      ways_0_data_symbol1[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[15 : 8];
    end
    if(dataWriteCmd_payload_mask[2] && _zz_1) begin
      ways_0_data_symbol2[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[23 : 16];
    end
    if(dataWriteCmd_payload_mask[3] && _zz_1) begin
      ways_0_data_symbol3[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[31 : 24];
    end
  end

  always @ (*) begin
    _zz_1 = 1'b0;
    if((dataWriteCmd_valid && dataWriteCmd_payload_way[0]))begin
      _zz_1 = 1'b1;
    end
  end

  always @ (*) begin
    _zz_2 = 1'b0;
    if((tagsWriteCmd_valid && tagsWriteCmd_payload_way[0]))begin
      _zz_2 = 1'b1;
    end
  end

  assign haltCpu = 1'b0;
  assign _zz_3 = (tagsReadCmd_valid && (! io_cpu_memory_isStuck));
  assign _zz_4 = _zz_10;
  assign ways_0_tagsReadRsp_valid = _zz_24[0];
  assign ways_0_tagsReadRsp_error = _zz_25[0];
  assign ways_0_tagsReadRsp_address = _zz_4[21 : 2];
  assign _zz_5 = (dataReadCmd_valid && (! io_cpu_memory_isStuck));
  assign ways_0_dataReadRspMem = _zz_11;
  assign ways_0_dataReadRsp = ways_0_dataReadRspMem[31 : 0];
  always @ (*) begin
    tagsReadCmd_valid = 1'b0;
    if(_zz_12)begin
      tagsReadCmd_valid = 1'b1;
    end
  end

  always @ (*) begin
    tagsReadCmd_payload = 7'bxxxxxxx;
    if(_zz_12)begin
      tagsReadCmd_payload = io_cpu_execute_address[11 : 5];
    end
  end

  always @ (*) begin
    dataReadCmd_valid = 1'b0;
    if(_zz_12)begin
      dataReadCmd_valid = 1'b1;
    end
  end

  always @ (*) begin
    dataReadCmd_payload = 10'bxxxxxxxxxx;
    if(_zz_12)begin
      dataReadCmd_payload = io_cpu_execute_address[11 : 2];
    end
  end

  always @ (*) begin
    tagsWriteCmd_valid = 1'b0;
    if(stageB_flusher_valid)begin
      tagsWriteCmd_valid = stageB_flusher_valid;
    end
    if(_zz_13)begin
      tagsWriteCmd_valid = 1'b0;
    end
    if(loader_done)begin
      tagsWriteCmd_valid = 1'b1;
    end
  end

  always @ (*) begin
    tagsWriteCmd_payload_way = 1'bx;
    if(stageB_flusher_valid)begin
      tagsWriteCmd_payload_way = 1'b1;
    end
    if(loader_done)begin
      tagsWriteCmd_payload_way = loader_waysAllocator;
    end
  end

  always @ (*) begin
    tagsWriteCmd_payload_address = 7'bxxxxxxx;
    if(stageB_flusher_valid)begin
      tagsWriteCmd_payload_address = stageB_mmuRsp_physicalAddress[11 : 5];
    end
    if(loader_done)begin
      tagsWriteCmd_payload_address = stageB_mmuRsp_physicalAddress[11 : 5];
    end
  end

  always @ (*) begin
    tagsWriteCmd_payload_data_valid = 1'bx;
    if(stageB_flusher_valid)begin
      tagsWriteCmd_payload_data_valid = 1'b0;
    end
    if(loader_done)begin
      tagsWriteCmd_payload_data_valid = (! (loader_kill || loader_killReg));
    end
  end

  always @ (*) begin
    tagsWriteCmd_payload_data_error = 1'bx;
    if(loader_done)begin
      tagsWriteCmd_payload_data_error = (loader_error || (io_mem_rsp_valid && io_mem_rsp_payload_error));
    end
  end

  always @ (*) begin
    tagsWriteCmd_payload_data_address = 20'bxxxxxxxxxxxxxxxxxxxx;
    if(loader_done)begin
      tagsWriteCmd_payload_data_address = stageB_mmuRsp_physicalAddress[31 : 12];
    end
  end

  always @ (*) begin
    dataWriteCmd_valid = 1'b0;
    if(stageB_cpuWriteToCache)begin
      if((stageB_request_wr && stageB_waysHit))begin
        dataWriteCmd_valid = 1'b1;
      end
    end
    if(io_cpu_writeBack_isValid)begin
      if(! stageB_isExternalAmo) begin
        if(! _zz_14) begin
          if(_zz_15)begin
            if(stageB_request_isAmo)begin
              if(_zz_16)begin
                dataWriteCmd_valid = 1'b0;
              end
            end
            if(_zz_17)begin
              dataWriteCmd_valid = 1'b0;
            end
          end
        end
      end
    end
    if(_zz_13)begin
      dataWriteCmd_valid = 1'b0;
    end
    if(_zz_18)begin
      dataWriteCmd_valid = 1'b1;
    end
  end

  always @ (*) begin
    dataWriteCmd_payload_way = 1'bx;
    if(stageB_cpuWriteToCache)begin
      dataWriteCmd_payload_way = stageB_waysHits;
    end
    if(_zz_18)begin
      dataWriteCmd_payload_way = loader_waysAllocator;
    end
  end

  always @ (*) begin
    dataWriteCmd_payload_address = 10'bxxxxxxxxxx;
    if(stageB_cpuWriteToCache)begin
      dataWriteCmd_payload_address = stageB_mmuRsp_physicalAddress[11 : 2];
    end
    if(_zz_18)begin
      dataWriteCmd_payload_address = {stageB_mmuRsp_physicalAddress[11 : 5],loader_counter_value};
    end
  end

  always @ (*) begin
    dataWriteCmd_payload_data = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    if(stageB_cpuWriteToCache)begin
      dataWriteCmd_payload_data[31 : 0] = stageB_requestDataBypass;
    end
    if(_zz_18)begin
      dataWriteCmd_payload_data = io_mem_rsp_payload_data;
    end
  end

  always @ (*) begin
    dataWriteCmd_payload_mask = 4'bxxxx;
    if(stageB_cpuWriteToCache)begin
      dataWriteCmd_payload_mask = 4'b0000;
      if(_zz_36[0])begin
        dataWriteCmd_payload_mask[3 : 0] = stageB_mask;
      end
    end
    if(_zz_18)begin
      dataWriteCmd_payload_mask = 4'b1111;
    end
  end

  assign io_cpu_execute_haltIt = 1'b0;
  assign rspSync = 1'b1;
  assign rspLast = 1'b1;
  always @ (*) begin
    case(io_cpu_execute_args_size)
      2'b00 : begin
        _zz_6 = 4'b0001;
      end
      2'b01 : begin
        _zz_6 = 4'b0011;
      end
      default : begin
        _zz_6 = 4'b1111;
      end
    endcase
  end

  assign stage0_mask = (_zz_6 <<< io_cpu_execute_address[1 : 0]);
  assign stage0_dataColisions[0] = (((dataWriteCmd_valid && dataWriteCmd_payload_way[0]) && (dataWriteCmd_payload_address == _zz_26)) && ((stage0_mask & dataWriteCmd_payload_mask[3 : 0]) != 4'b0000));
  assign stage0_wayInvalidate = 1'b0;
  assign io_cpu_memory_isWrite = stageA_request_wr;
  assign _zz_7[0] = ((io_cpu_memory_mmuRsp_physicalAddress[31 : 12] == ways_0_tagsReadRsp_address) && ways_0_tagsReadRsp_valid);
  assign stageA_wayHits = _zz_7;
  assign _zz_8[0] = (((dataWriteCmd_valid && dataWriteCmd_payload_way[0]) && (dataWriteCmd_payload_address == _zz_27)) && ((stageA_mask & dataWriteCmd_payload_mask[3 : 0]) != 4'b0000));
  assign stageA_dataColisions = (stage0_dataColisions_regNextWhen | _zz_8);
  always @ (*) begin
    stageB_mmuRspFreeze = 1'b0;
    if((stageB_loaderValid || loader_valid))begin
      stageB_mmuRspFreeze = 1'b1;
    end
  end

  assign stageB_consistancyHazard = 1'b0;
  assign stageB_waysHits = (stageB_waysHitsBeforeInvalidate & (~ stageB_wayInvalidate));
  assign stageB_waysHit = (stageB_waysHits != 1'b0);
  assign stageB_dataMux = stageB_dataReadRsp_0;
  always @ (*) begin
    stageB_loaderValid = 1'b0;
    if(io_cpu_writeBack_isValid)begin
      if(! stageB_isExternalAmo) begin
        if(! _zz_14) begin
          if(! _zz_15) begin
            if(io_mem_cmd_ready)begin
              stageB_loaderValid = 1'b1;
            end
          end
        end
      end
    end
    if(_zz_13)begin
      stageB_loaderValid = 1'b0;
    end
  end

  assign stageB_ioMemRspMuxed = io_mem_rsp_payload_data[31 : 0];
  always @ (*) begin
    io_cpu_writeBack_haltIt = io_cpu_writeBack_isValid;
    if(stageB_flusher_valid)begin
      io_cpu_writeBack_haltIt = 1'b1;
    end
    if(io_cpu_writeBack_isValid)begin
      if(! stageB_isExternalAmo) begin
        if(_zz_14)begin
          if(((! stageB_request_wr) ? (io_mem_rsp_valid && rspSync) : io_mem_cmd_ready))begin
            io_cpu_writeBack_haltIt = 1'b0;
          end
          if(_zz_19)begin
            io_cpu_writeBack_haltIt = 1'b0;
          end
        end else begin
          if(_zz_15)begin
            if(((! stageB_request_wr) || io_mem_cmd_ready))begin
              io_cpu_writeBack_haltIt = 1'b0;
            end
            if(stageB_request_isAmo)begin
              if(_zz_16)begin
                io_cpu_writeBack_haltIt = 1'b1;
              end
            end
            if(_zz_17)begin
              io_cpu_writeBack_haltIt = 1'b0;
            end
          end
        end
      end
    end
    if(_zz_13)begin
      io_cpu_writeBack_haltIt = 1'b0;
    end
  end

  assign stageB_flusher_hold = 1'b0;
  always @ (*) begin
    io_cpu_flush_ready = 1'b0;
    if(stageB_flusher_start)begin
      io_cpu_flush_ready = 1'b1;
    end
  end

  assign stageB_isExternalLsrc = 1'b0;
  assign stageB_isExternalAmo = 1'b0;
  always @ (*) begin
    stageB_requestDataBypass = stageB_request_data;
    if(stageB_request_isAmo)begin
      stageB_requestDataBypass = stageB_amo_resultReg;
    end
  end

  assign stageB_amo_compare = stageB_request_amoCtrl_alu[2];
  assign stageB_amo_unsigned = (stageB_request_amoCtrl_alu[2 : 1] == 2'b11);
  assign stageB_amo_addSub = _zz_28;
  assign stageB_amo_less = ((stageB_request_data[31] == stageB_dataMux[31]) ? stageB_amo_addSub[31] : (stageB_amo_unsigned ? stageB_dataMux[31] : stageB_request_data[31]));
  assign stageB_amo_selectRf = (stageB_request_amoCtrl_swap ? 1'b1 : (stageB_request_amoCtrl_alu[0] ^ stageB_amo_less));
  always @ (*) begin
    case(_zz_23)
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
    stageB_cpuWriteToCache = 1'b0;
    if(io_cpu_writeBack_isValid)begin
      if(! stageB_isExternalAmo) begin
        if(! _zz_14) begin
          if(_zz_15)begin
            stageB_cpuWriteToCache = 1'b1;
          end
        end
      end
    end
  end

  assign stageB_badPermissions = (((! stageB_mmuRsp_allowWrite) && stageB_request_wr) || ((! stageB_mmuRsp_allowRead) && ((! stageB_request_wr) || stageB_request_isAmo)));
  assign stageB_loadStoreFault = (io_cpu_writeBack_isValid && (stageB_mmuRsp_exception || stageB_badPermissions));
  always @ (*) begin
    io_cpu_redo = 1'b0;
    if(io_cpu_writeBack_isValid)begin
      if(! stageB_isExternalAmo) begin
        if(! _zz_14) begin
          if(_zz_15)begin
            if(_zz_20)begin
              io_cpu_redo = 1'b1;
            end
          end
        end
      end
    end
    if((io_cpu_writeBack_isValid && (stageB_mmuRsp_refilling || stageB_consistancyHazard)))begin
      io_cpu_redo = 1'b1;
    end
    if((loader_valid && (! loader_valid_regNext)))begin
      io_cpu_redo = 1'b1;
    end
  end

  always @ (*) begin
    io_cpu_writeBack_accessError = 1'b0;
    if(stageB_bypassCache)begin
      io_cpu_writeBack_accessError = ((((! stageB_request_wr) && 1'b1) && io_mem_rsp_valid) && io_mem_rsp_payload_error);
    end else begin
      io_cpu_writeBack_accessError = (((stageB_waysHits & _zz_9) != 1'b0) || (stageB_loadStoreFault && (! stageB_mmuRsp_isPaging)));
    end
  end

  assign io_cpu_writeBack_mmuException = (stageB_loadStoreFault && stageB_mmuRsp_isPaging);
  assign io_cpu_writeBack_unalignedAccess = (io_cpu_writeBack_isValid && stageB_unaligned);
  assign io_cpu_writeBack_isWrite = stageB_request_wr;
  always @ (*) begin
    io_mem_cmd_valid = 1'b0;
    if(io_cpu_writeBack_isValid)begin
      if(! stageB_isExternalAmo) begin
        if(_zz_14)begin
          io_mem_cmd_valid = (! memCmdSent);
          if(_zz_19)begin
            io_mem_cmd_valid = 1'b0;
          end
        end else begin
          if(_zz_15)begin
            if(stageB_request_wr)begin
              io_mem_cmd_valid = 1'b1;
            end
            if(stageB_request_isAmo)begin
              if(_zz_16)begin
                io_mem_cmd_valid = 1'b0;
              end
            end
            if(_zz_20)begin
              io_mem_cmd_valid = 1'b0;
            end
            if(_zz_17)begin
              io_mem_cmd_valid = 1'b0;
            end
          end else begin
            if((! memCmdSent))begin
              io_mem_cmd_valid = 1'b1;
            end
          end
        end
      end
    end
    if(_zz_13)begin
      io_mem_cmd_valid = 1'b0;
    end
  end

  always @ (*) begin
    io_mem_cmd_payload_address = {stageB_mmuRsp_physicalAddress[31 : 2],2'b00};
    if(io_cpu_writeBack_isValid)begin
      if(! stageB_isExternalAmo) begin
        if(! _zz_14) begin
          if(_zz_15)begin
            io_mem_cmd_payload_address = {stageB_mmuRsp_physicalAddress[31 : 2],2'b00};
          end else begin
            io_mem_cmd_payload_address = {stageB_mmuRsp_physicalAddress[31 : 5],5'h0};
          end
        end
      end
    end
  end

  always @ (*) begin
    io_mem_cmd_payload_length = 3'b000;
    if(io_cpu_writeBack_isValid)begin
      if(! stageB_isExternalAmo) begin
        if(! _zz_14) begin
          if(_zz_15)begin
            io_mem_cmd_payload_length = 3'b000;
          end else begin
            io_mem_cmd_payload_length = 3'b111;
          end
        end
      end
    end
  end

  assign io_mem_cmd_payload_last = 1'b1;
  always @ (*) begin
    io_mem_cmd_payload_wr = stageB_request_wr;
    if(io_cpu_writeBack_isValid)begin
      if(! stageB_isExternalAmo) begin
        if(! _zz_14) begin
          if(! _zz_15) begin
            io_mem_cmd_payload_wr = 1'b0;
          end
        end
      end
    end
  end

  assign io_mem_cmd_payload_mask = stageB_mask;
  assign io_mem_cmd_payload_data = stageB_requestDataBypass;
  assign io_mem_cmd_payload_uncached = stageB_mmuRsp_isIoAccess;
  assign stageB_bypassCache = ((stageB_mmuRsp_isIoAccess || stageB_isExternalLsrc) || stageB_isExternalAmo);
  assign io_cpu_writeBack_keepMemRspData = 1'b0;
  always @ (*) begin
    if(stageB_bypassCache)begin
      io_cpu_writeBack_data = stageB_ioMemRspMuxed;
    end else begin
      io_cpu_writeBack_data = stageB_dataMux;
    end
    if((stageB_request_isLrsc && stageB_request_wr))begin
      io_cpu_writeBack_data = {31'd0, _zz_37};
    end
  end

  assign _zz_9[0] = stageB_tagsReadRsp_0_error;
  always @ (*) begin
    loader_counter_willIncrement = 1'b0;
    if(_zz_18)begin
      loader_counter_willIncrement = 1'b1;
    end
  end

  assign loader_counter_willClear = 1'b0;
  assign loader_counter_willOverflowIfInc = (loader_counter_value == 3'b111);
  assign loader_counter_willOverflow = (loader_counter_willOverflowIfInc && loader_counter_willIncrement);
  always @ (*) begin
    loader_counter_valueNext = (loader_counter_value + _zz_39);
    if(loader_counter_willClear)begin
      loader_counter_valueNext = 3'b000;
    end
  end

  assign loader_kill = 1'b0;
  assign loader_done = loader_counter_willOverflow;
  assign io_cpu_execute_refilling = loader_valid;
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
      stageA_request_totalyConsistent <= io_cpu_execute_args_totalyConsistent;
    end
    if((! io_cpu_memory_isStuck))begin
      stageA_mask <= stage0_mask;
    end
    if((! io_cpu_memory_isStuck))begin
      stageA_wayInvalidate <= stage0_wayInvalidate;
    end
    if((! io_cpu_memory_isStuck))begin
      stage0_dataColisions_regNextWhen <= stage0_dataColisions;
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_request_wr <= stageA_request_wr;
      stageB_request_data <= stageA_request_data;
      stageB_request_size <= stageA_request_size;
      stageB_request_isLrsc <= stageA_request_isLrsc;
      stageB_request_isAmo <= stageA_request_isAmo;
      stageB_request_amoCtrl_swap <= stageA_request_amoCtrl_swap;
      stageB_request_amoCtrl_alu <= stageA_request_amoCtrl_alu;
      stageB_request_totalyConsistent <= stageA_request_totalyConsistent;
    end
    if(((! io_cpu_writeBack_isStuck) && (! stageB_mmuRspFreeze)))begin
      stageB_mmuRsp_physicalAddress <= io_cpu_memory_mmuRsp_physicalAddress;
      stageB_mmuRsp_isIoAccess <= io_cpu_memory_mmuRsp_isIoAccess;
      stageB_mmuRsp_isPaging <= io_cpu_memory_mmuRsp_isPaging;
      stageB_mmuRsp_allowRead <= io_cpu_memory_mmuRsp_allowRead;
      stageB_mmuRsp_allowWrite <= io_cpu_memory_mmuRsp_allowWrite;
      stageB_mmuRsp_allowExecute <= io_cpu_memory_mmuRsp_allowExecute;
      stageB_mmuRsp_exception <= io_cpu_memory_mmuRsp_exception;
      stageB_mmuRsp_refilling <= io_cpu_memory_mmuRsp_refilling;
      stageB_mmuRsp_bypassTranslation <= io_cpu_memory_mmuRsp_bypassTranslation;
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
      stageB_wayInvalidate <= stageA_wayInvalidate;
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_dataColisions <= stageA_dataColisions;
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_unaligned <= (((stageA_request_size == 2'b10) && (io_cpu_memory_address[1 : 0] != 2'b00)) || ((stageA_request_size == 2'b01) && (io_cpu_memory_address[0 : 0] != 1'b0)));
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_waysHitsBeforeInvalidate <= stageA_wayHits;
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_mask <= stageA_mask;
    end
    if(stageB_flusher_valid)begin
      if(_zz_21)begin
        if(_zz_22)begin
          stageB_mmuRsp_physicalAddress[11 : 5] <= (stageB_mmuRsp_physicalAddress[11 : 5] + 7'h01);
        end
      end
    end
    if(stageB_flusher_start)begin
      stageB_mmuRsp_physicalAddress[11 : 5] <= 7'h0;
    end
    stageB_amo_internal_resultRegValid <= io_cpu_writeBack_isStuck;
    stageB_amo_resultReg <= stageB_amo_result;
    loader_valid_regNext <= loader_valid;
  end

  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      memCmdSent <= 1'b0;
      stageB_flusher_valid <= 1'b0;
      stageB_flusher_start <= 1'b1;
      stageB_lrSc_reserved <= 1'b0;
      loader_valid <= 1'b0;
      loader_counter_value <= 3'b000;
      loader_waysAllocator <= 1'b1;
      loader_error <= 1'b0;
      loader_killReg <= 1'b0;
    end else begin
      if(io_mem_cmd_ready)begin
        memCmdSent <= 1'b1;
      end
      if((! io_cpu_writeBack_isStuck))begin
        memCmdSent <= 1'b0;
      end
      if(stageB_flusher_valid)begin
        if(_zz_21)begin
          if(! _zz_22) begin
            stageB_flusher_valid <= 1'b0;
          end
        end
      end
      stageB_flusher_start <= ((((((! stageB_flusher_start) && io_cpu_flush_valid) && (! io_cpu_execute_isValid)) && (! io_cpu_memory_isValid)) && (! io_cpu_writeBack_isValid)) && (! io_cpu_redo));
      if(stageB_flusher_start)begin
        stageB_flusher_valid <= 1'b1;
      end
      if(((io_cpu_writeBack_isValid && (! io_cpu_writeBack_isStuck)) && stageB_request_isLrsc))begin
        stageB_lrSc_reserved <= (! stageB_request_wr);
      end
      if(_zz_13)begin
        stageB_lrSc_reserved <= stageB_lrSc_reserved;
      end
      `ifndef SYNTHESIS
        `ifdef FORMAL
          assert((! ((io_cpu_writeBack_isValid && (! io_cpu_writeBack_haltIt)) && io_cpu_writeBack_isStuck)));
        `else
          if(!(! ((io_cpu_writeBack_isValid && (! io_cpu_writeBack_haltIt)) && io_cpu_writeBack_isStuck))) begin
            $display("FAILURE writeBack stuck by another plugin is not allowed");
            $finish;
          end
        `endif
      `endif
      if(stageB_loaderValid)begin
        loader_valid <= 1'b1;
      end
      loader_counter_value <= loader_counter_valueNext;
      if(loader_kill)begin
        loader_killReg <= 1'b1;
      end
      if(_zz_18)begin
        loader_error <= (loader_error || io_mem_rsp_payload_error);
      end
      if(loader_done)begin
        loader_valid <= 1'b0;
        loader_error <= 1'b0;
        loader_killReg <= 1'b0;
      end
      if((! loader_valid))begin
        loader_waysAllocator <= _zz_40[0:0];
      end
    end
  end


endmodule

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
  input      [31:0]   io_cpu_fetch_mmuRsp_physicalAddress,
  input               io_cpu_fetch_mmuRsp_isIoAccess,
  input               io_cpu_fetch_mmuRsp_isPaging,
  input               io_cpu_fetch_mmuRsp_allowRead,
  input               io_cpu_fetch_mmuRsp_allowWrite,
  input               io_cpu_fetch_mmuRsp_allowExecute,
  input               io_cpu_fetch_mmuRsp_exception,
  input               io_cpu_fetch_mmuRsp_refilling,
  input               io_cpu_fetch_mmuRsp_bypassTranslation,
  output     [31:0]   io_cpu_fetch_physicalAddress,
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
  reg        [31:0]   _zz_10;
  reg        [19:0]   _zz_11;
  wire                _zz_12;
  wire                _zz_13;
  wire       [0:0]    _zz_14;
  wire       [0:0]    _zz_15;
  wire       [19:0]   _zz_16;
  reg                 _zz_1;
  reg                 _zz_2;
  reg                 lineLoader_fire;
  reg                 lineLoader_valid;
  (* keep , syn_keep *) reg        [31:0]   lineLoader_address /* synthesis syn_keep = 1 */ ;
  reg                 lineLoader_hadError;
  reg                 lineLoader_flushPending;
  reg        [9:0]    lineLoader_flushCounter;
  reg                 _zz_3;
  reg                 lineLoader_cmdSent;
  reg                 lineLoader_wayToAllocate_willIncrement;
  wire                lineLoader_wayToAllocate_willClear;
  wire                lineLoader_wayToAllocate_willOverflowIfInc;
  wire                lineLoader_wayToAllocate_willOverflow;
  (* keep , syn_keep *) reg        [2:0]    lineLoader_wordIndex /* synthesis syn_keep = 1 */ ;
  wire                lineLoader_write_tag_0_valid;
  wire       [8:0]    lineLoader_write_tag_0_payload_address;
  wire                lineLoader_write_tag_0_payload_data_valid;
  wire                lineLoader_write_tag_0_payload_data_error;
  wire       [17:0]   lineLoader_write_tag_0_payload_data_address;
  wire                lineLoader_write_data_0_valid;
  wire       [11:0]   lineLoader_write_data_0_payload_address;
  wire       [31:0]   lineLoader_write_data_0_payload_data;
  wire       [11:0]   _zz_4;
  wire                _zz_5;
  wire       [31:0]   fetchStage_read_banksValue_0_dataMem;
  wire       [31:0]   fetchStage_read_banksValue_0_data;
  wire       [8:0]    _zz_6;
  wire                _zz_7;
  wire                fetchStage_read_waysValues_0_tag_valid;
  wire                fetchStage_read_waysValues_0_tag_error;
  wire       [17:0]   fetchStage_read_waysValues_0_tag_address;
  wire       [19:0]   _zz_8;
  reg        [31:0]   decodeStage_mmuRsp_physicalAddress;
  reg                 decodeStage_mmuRsp_isIoAccess;
  reg                 decodeStage_mmuRsp_isPaging;
  reg                 decodeStage_mmuRsp_allowRead;
  reg                 decodeStage_mmuRsp_allowWrite;
  reg                 decodeStage_mmuRsp_allowExecute;
  reg                 decodeStage_mmuRsp_exception;
  reg                 decodeStage_mmuRsp_refilling;
  reg                 decodeStage_mmuRsp_bypassTranslation;
  reg                 decodeStage_hit_tags_0_valid;
  reg                 decodeStage_hit_tags_0_error;
  reg        [17:0]   decodeStage_hit_tags_0_address;
  wire                decodeStage_hit_hits_0;
  wire                decodeStage_hit_valid;
  reg        [31:0]   _zz_9;
  wire       [31:0]   decodeStage_hit_data;
  reg [31:0] banks_0 [0:4095];
  reg [19:0] ways_0_tags [0:511];

  assign _zz_12 = (! lineLoader_flushCounter[9]);
  assign _zz_13 = (lineLoader_flushPending && (! (lineLoader_valid || io_cpu_fetch_isValid)));
  assign _zz_14 = _zz_8[0 : 0];
  assign _zz_15 = _zz_8[1 : 1];
  assign _zz_16 = {lineLoader_write_tag_0_payload_data_address,{lineLoader_write_tag_0_payload_data_error,lineLoader_write_tag_0_payload_data_valid}};
  always @ (posedge clk) begin
    if(_zz_1) begin
      banks_0[lineLoader_write_data_0_payload_address] <= lineLoader_write_data_0_payload_data;
    end
  end

  always @ (posedge clk) begin
    if(_zz_5) begin
      _zz_10 <= banks_0[_zz_4];
    end
  end

  always @ (posedge clk) begin
    if(_zz_2) begin
      ways_0_tags[lineLoader_write_tag_0_payload_address] <= _zz_16;
    end
  end

  always @ (posedge clk) begin
    if(_zz_7) begin
      _zz_11 <= ways_0_tags[_zz_6];
    end
  end

  always @ (*) begin
    _zz_1 = 1'b0;
    if(lineLoader_write_data_0_valid)begin
      _zz_1 = 1'b1;
    end
  end

  always @ (*) begin
    _zz_2 = 1'b0;
    if(lineLoader_write_tag_0_valid)begin
      _zz_2 = 1'b1;
    end
  end

  always @ (*) begin
    lineLoader_fire = 1'b0;
    if(io_mem_rsp_valid)begin
      if((lineLoader_wordIndex == 3'b111))begin
        lineLoader_fire = 1'b1;
      end
    end
  end

  always @ (*) begin
    io_cpu_prefetch_haltIt = (lineLoader_valid || lineLoader_flushPending);
    if(_zz_12)begin
      io_cpu_prefetch_haltIt = 1'b1;
    end
    if((! _zz_3))begin
      io_cpu_prefetch_haltIt = 1'b1;
    end
    if(io_flush)begin
      io_cpu_prefetch_haltIt = 1'b1;
    end
  end

  assign io_mem_cmd_valid = (lineLoader_valid && (! lineLoader_cmdSent));
  assign io_mem_cmd_payload_address = {lineLoader_address[31 : 5],5'h0};
  assign io_mem_cmd_payload_size = 3'b101;
  always @ (*) begin
    lineLoader_wayToAllocate_willIncrement = 1'b0;
    if((! lineLoader_valid))begin
      lineLoader_wayToAllocate_willIncrement = 1'b1;
    end
  end

  assign lineLoader_wayToAllocate_willClear = 1'b0;
  assign lineLoader_wayToAllocate_willOverflowIfInc = 1'b1;
  assign lineLoader_wayToAllocate_willOverflow = (lineLoader_wayToAllocate_willOverflowIfInc && lineLoader_wayToAllocate_willIncrement);
  assign lineLoader_write_tag_0_valid = ((1'b1 && lineLoader_fire) || (! lineLoader_flushCounter[9]));
  assign lineLoader_write_tag_0_payload_address = (lineLoader_flushCounter[9] ? lineLoader_address[13 : 5] : lineLoader_flushCounter[8 : 0]);
  assign lineLoader_write_tag_0_payload_data_valid = lineLoader_flushCounter[9];
  assign lineLoader_write_tag_0_payload_data_error = (lineLoader_hadError || io_mem_rsp_payload_error);
  assign lineLoader_write_tag_0_payload_data_address = lineLoader_address[31 : 14];
  assign lineLoader_write_data_0_valid = (io_mem_rsp_valid && 1'b1);
  assign lineLoader_write_data_0_payload_address = {lineLoader_address[13 : 5],lineLoader_wordIndex};
  assign lineLoader_write_data_0_payload_data = io_mem_rsp_payload_data;
  assign _zz_4 = io_cpu_prefetch_pc[13 : 2];
  assign _zz_5 = (! io_cpu_fetch_isStuck);
  assign fetchStage_read_banksValue_0_dataMem = _zz_10;
  assign fetchStage_read_banksValue_0_data = fetchStage_read_banksValue_0_dataMem[31 : 0];
  assign _zz_6 = io_cpu_prefetch_pc[13 : 5];
  assign _zz_7 = (! io_cpu_fetch_isStuck);
  assign _zz_8 = _zz_11;
  assign fetchStage_read_waysValues_0_tag_valid = _zz_14[0];
  assign fetchStage_read_waysValues_0_tag_error = _zz_15[0];
  assign fetchStage_read_waysValues_0_tag_address = _zz_8[19 : 2];
  assign io_cpu_fetch_data = fetchStage_read_banksValue_0_data;
  assign io_cpu_fetch_physicalAddress = io_cpu_fetch_mmuRsp_physicalAddress;
  assign decodeStage_hit_hits_0 = (decodeStage_hit_tags_0_valid && (decodeStage_hit_tags_0_address == decodeStage_mmuRsp_physicalAddress[31 : 14]));
  assign decodeStage_hit_valid = (decodeStage_hit_hits_0 != 1'b0);
  assign decodeStage_hit_data = _zz_9;
  assign io_cpu_decode_data = decodeStage_hit_data;
  assign io_cpu_decode_cacheMiss = (! decodeStage_hit_valid);
  assign io_cpu_decode_error = (decodeStage_hit_tags_0_error || ((! decodeStage_mmuRsp_isPaging) && (decodeStage_mmuRsp_exception || (! decodeStage_mmuRsp_allowExecute))));
  assign io_cpu_decode_mmuRefilling = decodeStage_mmuRsp_refilling;
  assign io_cpu_decode_mmuException = (((! decodeStage_mmuRsp_refilling) && decodeStage_mmuRsp_isPaging) && (decodeStage_mmuRsp_exception || (! decodeStage_mmuRsp_allowExecute)));
  assign io_cpu_decode_physicalAddress = decodeStage_mmuRsp_physicalAddress;
  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      lineLoader_valid <= 1'b0;
      lineLoader_hadError <= 1'b0;
      lineLoader_flushPending <= 1'b1;
      lineLoader_cmdSent <= 1'b0;
      lineLoader_wordIndex <= 3'b000;
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
      if(_zz_13)begin
        lineLoader_flushPending <= 1'b0;
      end
      if((io_mem_cmd_valid && io_mem_cmd_ready))begin
        lineLoader_cmdSent <= 1'b1;
      end
      if(lineLoader_fire)begin
        lineLoader_cmdSent <= 1'b0;
      end
      if(io_mem_rsp_valid)begin
        lineLoader_wordIndex <= (lineLoader_wordIndex + 3'b001);
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
    if(_zz_12)begin
      lineLoader_flushCounter <= (lineLoader_flushCounter + 10'h001);
    end
    _zz_3 <= lineLoader_flushCounter[9];
    if(_zz_13)begin
      lineLoader_flushCounter <= 10'h0;
    end
    if((! io_cpu_decode_isStuck))begin
      decodeStage_mmuRsp_physicalAddress <= io_cpu_fetch_mmuRsp_physicalAddress;
      decodeStage_mmuRsp_isIoAccess <= io_cpu_fetch_mmuRsp_isIoAccess;
      decodeStage_mmuRsp_isPaging <= io_cpu_fetch_mmuRsp_isPaging;
      decodeStage_mmuRsp_allowRead <= io_cpu_fetch_mmuRsp_allowRead;
      decodeStage_mmuRsp_allowWrite <= io_cpu_fetch_mmuRsp_allowWrite;
      decodeStage_mmuRsp_allowExecute <= io_cpu_fetch_mmuRsp_allowExecute;
      decodeStage_mmuRsp_exception <= io_cpu_fetch_mmuRsp_exception;
      decodeStage_mmuRsp_refilling <= io_cpu_fetch_mmuRsp_refilling;
      decodeStage_mmuRsp_bypassTranslation <= io_cpu_fetch_mmuRsp_bypassTranslation;
    end
    if((! io_cpu_decode_isStuck))begin
      decodeStage_hit_tags_0_valid <= fetchStage_read_waysValues_0_tag_valid;
      decodeStage_hit_tags_0_error <= fetchStage_read_waysValues_0_tag_error;
      decodeStage_hit_tags_0_address <= fetchStage_read_waysValues_0_tag_address;
    end
    if((! io_cpu_decode_isStuck))begin
      _zz_9 <= fetchStage_read_banksValue_0_data;
    end
  end


endmodule
