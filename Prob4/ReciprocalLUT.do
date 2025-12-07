# FSM.do 
# 

# compile, optimize, and start the simulation
vlog ReciprocalLUT_tb.sv ReciprocalLUT.sv
vopt +acc work.testbench -o workopt 
vsim workopt

# Add waveforms and run the simulation
add wave *
run -all
view wave