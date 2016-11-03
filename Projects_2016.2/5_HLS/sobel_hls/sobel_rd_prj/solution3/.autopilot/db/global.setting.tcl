
set TopModule "sobel_filter"
set ClockPeriod "40.000000"
set ClockList {ap_clk}
set multiClockList {}
set PortClockMap {}
set CombLogicFlag 0
set PipelineFlag 0
set DataflowTaskPipelineFlag  1
set TrivialPipelineFlag 0
set noPortSwitchingFlag 0
set FloatingPointFlag 0
set FftOrFirFlag 0
set NbRWValue 0
set intNbAccess 0
set NewDSPMapping 1
set HasDSPModule 0
set ResetLevelFlag 1
set ResetStyle "control"
set ResetSyncFlag 1
set ResetRegisterFlag 0
set ResetVariableFlag 0
set fsmEncStyle "onehot"
set maxFanout "0"
set RtlPrefix ""
set ExtraCCFlags ""
set ExtraCLdFlags ""
set SynCheckOptions ""
set PresynOptions ""
set PreprocOptions ""
set SchedOptions ""
set BindOptions ""
set RtlGenOptions ""
set RtlWriterOptions ""
set CbcGenFlag ""
set CasGenFlag ""
set CasMonitorFlag ""
set AutoSimOptions {}
set ExportMCPathFlag "0"
set SCTraceFileName "mytrace"
set SCTraceFileFormat "vcd"
set SCTraceOption "all"
set TargetInfo "xc7a35t:cpg236:-1"
set SourceFiles {sc {} c ../../sobel.cpp}
set SourceFlags {sc {} c {{}}}
set DirectiveFile {C:/Users/hongyuc/Desktop/sobel_new-old/xapp890/sobel_rd_prj/solution3/solution3.directive}
set TBFiles {verilog {../../test_1080p.bmp ../../sobel_test.cpp ../../result_1080p_golden.bmp ../../ap_bmp.cpp} bc {../../test_1080p.bmp ../../sobel_test.cpp ../../result_1080p_golden.bmp ../../ap_bmp.cpp} sc {../../test_1080p.bmp ../../sobel_test.cpp ../../result_1080p_golden.bmp ../../ap_bmp.cpp} vhdl {../../test_1080p.bmp ../../sobel_test.cpp ../../result_1080p_golden.bmp ../../ap_bmp.cpp} c {} cas {../../test_1080p.bmp ../../sobel_test.cpp ../../result_1080p_golden.bmp ../../ap_bmp.cpp}}
set SpecLanguage "C"
set TVInFiles {bc {} c {} sc {} cas {} vhdl {} verilog {}}
set TVOutFiles {bc {} c {} sc {} cas {} vhdl {} verilog {}}
set TBTops {verilog {} bc {} sc {} vhdl {} c {} cas {}}
set TBInstNames {verilog {} bc {} sc {} vhdl {} c {} cas {}}
set ExtraGlobalOptions {"area_timing" 1 "clock_gate" 1 "impl_flow" map "power_gate" 0}
set PlatformFiles {{DefaultPlatform {xilinx/artix7/artix7 xilinx/artix7/artix7_fpv6}}}
set DefaultPlatform "DefaultPlatform"
set TBTVFileNotFound ""
set AppFile "../vivado_hls.app"
set ApsFile "solution3.aps"
set AvePath "../.."
set HPFPO "0"
