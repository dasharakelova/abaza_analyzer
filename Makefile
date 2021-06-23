SHELL = /bin/bash
.DEFAULT_GOAL := check

tests = tests.csv
test_sources = $(shell sed -s 1d $(tests) | cut -d, -f5 | sort -u)

abaza.lexd.hfst: $(wildcard *.lexd)
	set -o pipefail; cat $^ | lexd | hfst-txt2fst -o $@
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
%.pass.txt: $(tests)
	awk -F, '$$5 == "$*" && $$4 == "pass" {print $$1 ":" $$3}' $^  | sort -u > $@
%.ignore.txt: $(tests)
	awk -F, '$$5 == "$*" && $$4 == "ignore" {print $$1 ":" $$3}' $^  | sort -u > $@
check-gen: abaza.gen.hfst $(foreach t,$(test_sources),$(t).pass.txt $(t).ignore.txt)
	fail=; for t in $(test_sources); do echo $$t ignorable; bash compare.sh $< $$t.ignore.txt; echo $$t must-pass; bash compare.sh $< $$t.pass.txt || fail=1; done; exit $$fail
check: check-gen