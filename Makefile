sim:
	iverilog -o vex_axi.vvp -s sim_top -g2005-sv sim_top.v top.v axi_ram.v VexRiscv.v
	vvp vex_axi.vvp -fst
