sim:
	iverilog -o vex_axi.vvp -s sim_top -g2005-sv sim_top.v top.v axi_ram.v docker_VexRiscv.v
	vvp vex_axi.vvp -fst

docker_gen:
	docker build -t vex-axi .
	docker run --rm -it -v $(shell pwd):/out/ vex-axi /bin/bash -c "cd /vex/VexRiscv/ && sbt 'runMain vexriscv.demo.GenVexRiscv' && cp VexRiscv.v /out/docker_VexRiscv.v"
