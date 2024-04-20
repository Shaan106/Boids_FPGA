# 
# Synthesis run script generated by Vivado
# 

namespace eval rt {
    variable rc
}
set rt::rc [catch {
  uplevel #0 {
    set ::env(BUILTIN_SYNTH) true
    source $::env(HRT_TCL_PATH)/rtSynthPrep.tcl
    rt::HARTNDb_startJobStats
    set rt::cmdEcho 0
    rt::set_parameter writeXmsg true
    rt::set_parameter enableParallelHelperSpawn true
    set ::env(RT_TMP) "C:/Users/ay140/Desktop/Boids_FPGA/project_1.runs/synth_1/.Xil/Vivado-8820-P1-07/realtime/tmp"
    if { [ info exists ::env(RT_TMP) ] } {
      file mkdir $::env(RT_TMP)
    }

    rt::delete_design

    rt::set_parameter datapathDensePacking false
    set rt::partid xc7a100tcsg324-1
     file delete -force synth_hints.os

    set rt::multiChipSynthesisFlow false
    source $::env(SYNTH_COMMON)/common.tcl
    set rt::defaultWorkLibName xil_defaultlib

    # Skipping read_* RTL commands because this is post-elab optimize flow
    set rt::useElabCache true
    if {$rt::useElabCache == false} {
      rt::read_verilog {
      C:/Users/ay140/Desktop/Boids_FPGA/BPU/BPU.v
      C:/Users/ay140/Desktop/Boids_FPGA/HelperModules/CLA_L1_block.v
      C:/Users/ay140/Desktop/Boids_FPGA/HelperModules/CLA_L2_block.v
      C:/Users/ay140/Desktop/Boids_FPGA/RAM.v
      C:/Users/ay140/Desktop/Boids_FPGA/RAM_resettable.v
      C:/Users/ay140/Desktop/Boids_FPGA/ROM.v
      C:/Users/ay140/Desktop/Boids_FPGA/HelperModules/T_flip_flop.v
      C:/Users/ay140/Desktop/Boids_FPGA/VGA_files/VGAController.v
      C:/Users/ay140/Desktop/Boids_FPGA/VGA_files/VGATimingGenerator.v
      C:/Users/ay140/Desktop/Boids_FPGA/HelperModules/adder.v
      C:/Users/ay140/Desktop/Boids_FPGA/HelperModules/alu.v
      C:/Users/ay140/Desktop/Boids_FPGA/HelperModules/bit_flipper.v
      C:/Users/ay140/Desktop/Boids_FPGA/HelperModules/bitwise_and.v
      C:/Users/ay140/Desktop/Boids_FPGA/HelperModules/bitwise_or.v
      C:/Users/ay140/Desktop/Boids_FPGA/bypass_controller.v
      C:/Users/ay140/Desktop/Boids_FPGA/controller.v
      C:/Users/ay140/Desktop/Boids_FPGA/HelperModules/counter.v
      C:/Users/ay140/Desktop/Boids_FPGA/HelperModules/decoder32.v
      C:/Users/ay140/Desktop/Boids_FPGA/HelperModules/dffe_ref.v
      C:/Users/ay140/Desktop/Boids_FPGA/HelperModules/divider_called_bob.v
      C:/Users/ay140/Desktop/Boids_FPGA/HelperModules/full_adder.v
      C:/Users/ay140/Desktop/Boids_FPGA/HelperModules/isLessThan.v
      C:/Users/ay140/Desktop/Boids_FPGA/HelperModules/isNotEqual.v
      C:/Users/ay140/Desktop/Boids_FPGA/HelperModules/isThereOverflow.v
      C:/Users/ay140/Desktop/Boids_FPGA/HelperModules/multdiv.v
      C:/Users/ay140/Desktop/Boids_FPGA/HelperModules/mux_2.v
      C:/Users/ay140/Desktop/Boids_FPGA/HelperModules/mux_2_64.v
      C:/Users/ay140/Desktop/Boids_FPGA/HelperModules/mux_4.v
      C:/Users/ay140/Desktop/Boids_FPGA/HelperModules/mux_8.v
      C:/Users/ay140/Desktop/Boids_FPGA/processor.v
      C:/Users/ay140/Desktop/Boids_FPGA/HelperModules/pulse_generator.v
      C:/Users/ay140/Desktop/Boids_FPGA/HelperModules/regfile.v
      C:/Users/ay140/Desktop/Boids_FPGA/HelperModules/single_reg.v
      C:/Users/ay140/Desktop/Boids_FPGA/HelperModules/single_reg_64.v
      C:/Users/ay140/Desktop/Boids_FPGA/HelperModules/sll.v
      C:/Users/ay140/Desktop/Boids_FPGA/splitInstruction.v
      C:/Users/ay140/Desktop/Boids_FPGA/HelperModules/sra.v
      C:/Users/ay140/Desktop/Boids_FPGA/HelperModules/tristate.v
      C:/Users/ay140/Desktop/Boids_FPGA/HelperModules/wallaceTreeMultiplier.v
      C:/Users/ay140/Desktop/Boids_FPGA/Wrapper.v
    }
      rt::filesetChecksum
    }
    rt::set_parameter usePostFindUniquification true
    set rt::SDCFileList C:/Users/ay140/Desktop/Boids_FPGA/project_1.runs/synth_1/.Xil/Vivado-8820-P1-07/realtime/Wrapper_synth.xdc
    rt::sdcChecksum
    set rt::top Wrapper
    rt::set_parameter enableIncremental true
    rt::set_parameter markDebugPreservationLevel "enable"
    set rt::reportTiming false
    rt::set_parameter elaborateOnly false
    rt::set_parameter elaborateRtl false
    rt::set_parameter eliminateRedundantBitOperator true
    rt::set_parameter elaborateRtlOnlyFlow false
    rt::set_parameter writeBlackboxInterface true
    rt::set_parameter ramStyle auto
    rt::set_parameter merge_flipflops true
# MODE: 
    rt::set_parameter webTalkPath {C:/Users/ay140/Desktop/Boids_FPGA/project_1.cache/wt}
    rt::set_parameter synthDebugLog false
    rt::set_parameter printModuleName false
    rt::set_parameter enableSplitFlowPath "C:/Users/ay140/Desktop/Boids_FPGA/project_1.runs/synth_1/.Xil/Vivado-8820-P1-07/"
    set ok_to_delete_rt_tmp true 
    if { [rt::get_parameter parallelDebug] } { 
       set ok_to_delete_rt_tmp false 
    } 
    if {$rt::useElabCache == false} {
        set oldMIITMVal [rt::get_parameter maxInputIncreaseToMerge]; rt::set_parameter maxInputIncreaseToMerge 1000
        set oldCDPCRL [rt::get_parameter createDfgPartConstrRecurLimit]; rt::set_parameter createDfgPartConstrRecurLimit 1
        $rt::db readXRFFile
      rt::run_synthesis -module $rt::top
        rt::set_parameter maxInputIncreaseToMerge $oldMIITMVal
        rt::set_parameter createDfgPartConstrRecurLimit $oldCDPCRL
    }

    set rt::flowresult [ source $::env(SYNTH_COMMON)/flow.tcl ]
    rt::HARTNDb_stopJobStats
    rt::HARTNDb_reportJobStats "Synthesis Optimization Runtime"
    rt::HARTNDb_stopSystemStats
    if { $rt::flowresult == 1 } { return -code error }


  set hsKey [rt::get_parameter helper_shm_key] 
  if { $hsKey != "" && [info exists ::env(BUILTIN_SYNTH)] && [rt::get_parameter enableParallelHelperSpawn] } { 
     $rt::db killSynthHelper $hsKey
  } 
  rt::set_parameter helper_shm_key "" 
    if { [ info exists ::env(RT_TMP) ] } {
      if { [info exists ok_to_delete_rt_tmp] && $ok_to_delete_rt_tmp } { 
        file delete -force $::env(RT_TMP)
      }
    }

    source $::env(HRT_TCL_PATH)/rtSynthCleanup.tcl
  } ; #end uplevel
} rt::result]

if { $rt::rc } {
  $rt::db resetHdlParse
  set hsKey [rt::get_parameter helper_shm_key] 
  if { $hsKey != "" && [info exists ::env(BUILTIN_SYNTH)] && [rt::get_parameter enableParallelHelperSpawn] } { 
     $rt::db killSynthHelper $hsKey
  } 
  source $::env(HRT_TCL_PATH)/rtSynthCleanup.tcl
  return -code "error" $rt::result
}
