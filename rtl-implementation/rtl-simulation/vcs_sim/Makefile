default: clean compile sim

compile:
	mkdir sim; \
	cd sim; \
    vcs +v2k -debug_all -f ../filelist -sverilog -full64; \
	cd ..

sim:
	pwd; \
	cd sim; \
	./simv

clean:
	rm -rf sim
