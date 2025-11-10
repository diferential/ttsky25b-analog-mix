set layout [readnet spice $project.lvs.spice]
set source [readnet spice /dev/null]
readnet spice $::env(PDK_ROOT)/$::env(PDK)/libs.ref/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice $source
# top level GL verilog
readnet verilog ../src/project.v $source
# add an GL verilog of your digital blocks:
readnet verilog ../verilog/gl/r2r_dac_control.v $source
# add any spice files of your analog blocks:
# readnet spice ../xschem/simulation/r2r.spice $source
# readnet spice ../xschem/simulation/dac_drive.spice $source
readnet spice ../xschem/simulation/opamp3hvs.spice $source
readnet spice ../xschem/simulation/dram3t_charlie.spice $source
# readnet spice ../xschem/simulation/opamp3hv.spice $source
readnet spice ../xschem/simulation/root_currents1_3outs.spice $source

lvs "$layout $project" "$source $project" $::env(PDK_ROOT)/sky130A/libs.tech/netgen/sky130A_setup.tcl lvs.report -blackbox
