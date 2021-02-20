sources = $(wildcard *-test)
targets = $(foreach source,$(sources),$(source).hfst.diag $(source).missing-stem)

GENERATOR = example/eng-verb.gen.hfst

.DEFAULT_GOAL = all

all:: $(targets)
	./summarise $^
%-test.tags: %-test
	grep -o '<[a-z0-9]*>' $< | sort -u > $@
%-test.tags.hfst: %-test.tags
	hfst-strings2fst -j -m $< -i $< -o $@
%-test.hfst: %-test.tags %-test
	hfst-strings2fst -j -m $*-test.tags $*-test -o $@
%-test.accepted-analysis.hfst: %-test.hfst $(GENERATOR)
	hfst-project -p upper $< | hfst-compose -F - $(GENERATOR) > $@
%-test.missing-stem: %-test $(GENERATOR)
	./missing-stems $(GENERATOR) <$< >$@
%-test.hfst.diag: %-test.hfst %-test.tags %-test.accepted-analysis.hfst $(GENERATOR)
	hfst-fst2strings -X obey-flags $*-test.accepted-analysis.hfst | hfst-strings2fst -j -m $*-test.tags  | hfst-subtract -F $< - | hfst-fst2strings -X obey-flags | ./match $(GENERATOR) | (read l; echo "$$l"; sort -n -k1 -t: -r) >$@
	
