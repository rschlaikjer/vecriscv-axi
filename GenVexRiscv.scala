package vexriscv.demo

import spinal.core._
import spinal.lib._
import spinal.lib.eda.altera.{InterruptReceiverTag, QSysify, ResetEmitterTag}
import vexriscv.ip.{DataCacheConfig, InstructionCacheConfig}
import vexriscv.plugin._
import vexriscv.{VexRiscv, VexRiscvConfig, plugin}

object GenVexRiscv {
  def main(args: Array[String]) {
    val report = SpinalVerilog{

      // CPU configuration
      val cpuConfig = VexRiscvConfig(
        plugins = List(
          new IBusCachedPlugin(
            resetVector = null,
            prediction = STATIC,
            withoutInjectorStage = false,
            injectorStage = true,
            relaxedPcCalculation = true,
            compressedGen = false,
            config = InstructionCacheConfig(
              cacheSize = 4096 * 4,
              bytePerLine = 32,
              wayCount = 1,
              addressWidth = 32,
              cpuDataWidth = 32,
              memDataWidth = 32,
              catchIllegalAccess = true,
              catchAccessFault = true,
              asyncTagMemory = false,
              twoCycleRam = true,
              twoCycleCache = true,
              preResetFlush = false
            ),
            memoryTranslatorPortConfig = null
          ),

          new DBusCachedPlugin(
            dBusCmdMasterPipe = true,
            dBusCmdSlavePipe = true,
            dBusRspSlavePipe = true,
            config = new DataCacheConfig(
              cacheSize         = 4096 * 1,
              bytePerLine       = 32,
              wayCount          = 1,
              addressWidth      = 32,
              cpuDataWidth      = 32,
              memDataWidth      = 32,
              catchAccessError  = true,
              catchIllegal      = true,
              catchUnaligned    = true,
              withLrSc = true,
              withAmo = true
            ),
            memoryTranslatorPortConfig = null
          ),

          /*
          new DAxiCachedPlugin(
            config = new DataCacheConfig(
              cacheSize         = 4096 * 1,
              bytePerLine       = 32,
              wayCount          = 1,
              addressWidth      = 32,
              cpuDataWidth      = 32,
              memDataWidth      = 32,
              catchAccessError  = true,
              catchIllegal      = true,
              catchUnaligned    = true,
              withLrSc = true,
              withAmo = true
            ),
            memoryTranslatorPortConfig = null
          ),
        */

          new StaticMemoryTranslatorPlugin(
            ioRange      = _(31 downto 31) === 0x1
          ),

        /*
          new DBusSimplePlugin(
            earlyInjection = false,
            catchAddressMisaligned = false,
            catchAccessFault = false
          ),
        */

          new CsrPlugin(CsrPluginConfig(
            catchIllegalAccess = false,
            mvendorid      = null,
            marchid        = null,
            mimpid         = null,
            mhartid        = null,
            misaExtensionsInit = 66,
            misaAccess     = CsrAccess.NONE,
            mtvecAccess    = CsrAccess.READ_WRITE,
            mtvecInit      = null,
            mepcAccess     = CsrAccess.NONE,
            mscratchGen    = false,
            mcauseAccess   = CsrAccess.READ_ONLY,
            mbadaddrAccess = CsrAccess.NONE,
            mcycleAccess   = CsrAccess.READ_ONLY,
            minstretAccess = CsrAccess.NONE,
            ecallGen       = false,
            wfiGenAsWait   = false,
            ucycleAccess   = CsrAccess.READ_ONLY,
            uinstretAccess = CsrAccess.NONE
          )),

          new DecoderSimplePlugin(
            catchIllegalInstruction = false
          ),

          new RegFilePlugin(
            regFileReadyKind = plugin.SYNC,
            zeroBoot = false
          ),

          new IntAluPlugin,

          new SrcPlugin(
            separatedAddSub = false,
            executeInsertion = true
          ),

          // new LightShifterPlugin,
          new FullBarrelShifterPlugin(earlyInjection = false),

          new MulPlugin,
          new MulDivIterativePlugin(
            genMul = false,
            genDiv = true,
            mulUnrollFactor = 32,
            divUnrollFactor = 1
          ),

          new HazardSimplePlugin(
            bypassExecute           = true,
            bypassMemory            = true,
            bypassWriteBack         = true,
            bypassWriteBackBuffer   = true,
            pessimisticUseSrc       = false,
            pessimisticWriteRegFile = false,
            pessimisticAddressMatch = false
          ),

          new BranchPlugin(
            earlyBranch = false,
            catchAddressMisaligned = false
          ),

          new YamlPlugin("cpu0.yaml")
        )
      )

      //CPU instantiation
      val cpu = new VexRiscv(cpuConfig)

      // CPU modifications to use a wishbone interface
      /*
      cpu.rework {
        for (plugin <- cpuConfig.plugins) plugin match {
          case plugin: IBusSimplePlugin => {
            plugin.iBus.setAsDirectionLess() //Unset IO properties of iBus
            master(plugin.iBus.toWishbone()).setName("iBusWishbone")
          }
          case plugin: IBusCachedPlugin => {
            plugin.iBus.setAsDirectionLess()
            master(plugin.iBus.toWishbone()).setName("iBusWishbone")
          }
          case plugin: DBusSimplePlugin => {
            plugin.dBus.setAsDirectionLess()
            master(plugin.dBus.toWishbone()).setName("dBusWishbone")
          }
          case plugin: DBusCachedPlugin => {
            plugin.dBus.setAsDirectionLess()
            master(plugin.dBus.toWishbone()).setName("dBusWishbone")
          }
          case _ =>
        }
      }
      */

      cpu.rework {
        for (plugin <- cpuConfig.plugins) plugin match {
          case plugin: IBusSimplePlugin => {
            plugin.iBus.setAsDirectionLess() //Unset IO properties of iBus
            master(plugin.iBus.toAxi4ReadOnly()).setName("iBusAxi")
          }
          case plugin: IBusCachedPlugin => {
            plugin.iBus.setAsDirectionLess()
            master(plugin.iBus.toAxi4ReadOnly()).setName("iBusAxi")
          }
          case plugin: DBusSimplePlugin => {
            plugin.dBus.setAsDirectionLess()
            master(plugin.dBus.toAxi4Shared().toAxi4().toFullConfig()).setName("dBusAxi")
          }
          case plugin: DAxiCachedPlugin =>
          case plugin: DBusCachedPlugin => {
            plugin.dBus.setAsDirectionLess()
            master(plugin.dBus.toAxi4Shared(true).toAxi4().toFullConfig()).setName("dBusAxi")
          }
          case _ =>
        }
      }

      cpu
    }
  }
}
