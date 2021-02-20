.DEFAULT_GOAL := eng-verb.gen.hfst

%.lexd.att: %.lexd
	lexd $< > $@
%.hfst: %.att
	hfst-txt2fst $< -o $@
%.twol.hfst: %.twol
	hfst-twolc $< -o $@
%.gen.hfst: %.lexd.hfst %.twol.hfst
	hfst-compose-intersect $^ | hfst-remove-epsilons -o $@
