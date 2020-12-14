.DEFAULT_GOAL := check
%.lexd.hfst: %.lexd
	lexd $< | hfst-txt2fst -o $@
%.ana.hfst: %.gen.hfst
	hfst-invert $< -o $@
%.twol.hfst: %.twol
	hfst-twolc $< -o $@
%.pregen.hfst: %.lexd.hfst %.twol.hfst
	hfst-compose-intersect $^ -o $@
%.gen.hfst: %.pregen.hfst %.postgen.hfst
	hfst-compose $^ -o $@
%.postgen.hfst: drop-accent.twol.hfst
	cp $< $@
check-gen: numerals_isolated.gen.hfst pairtest2.txt
	bash compare.sh $^
check: check-gen

