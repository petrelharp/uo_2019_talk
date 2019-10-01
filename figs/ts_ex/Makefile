.PHONY : all run_sim

all : tree_sequence_genotypes.png tree_sequence_genotype_and_tree.png tree_sequence_next_genotype_and_tree.png tree_sequence_site_and_branch.png sim_ts.anim.gif

tree_sequence_genotypes.pdf : tree_sequence.ink.svg
	../export-layers-svg.sh $< genotypes > $@

tree_sequence_genotype_and_tree.pdf : tree_sequence.ink.svg
	../export-layers-svg.sh $< genotypes sites mutations > $@

tree_sequence_next_genotype_and_tree.pdf : tree_sequence.ink.svg
	../export-layers-svg.sh $< genotypes next_genotypes next_sites next_mutations > $@

tree_sequence_site_and_branch.pdf : tree_sequence.ink.svg
	../export-layers-svg.sh $< sites mutations times time_labels branches > $@

include ../../rules.mk

run_sim : sim_ts/done

sim_ts/done : make_figs.py
	python3 make_figs.py

sim_ts_svgs = $(wildcard sim_ts/*.svg)
sim_ts_gifs = $(patsubst %.svg,%.gif,$(sim_ts_svgs))

sim_ts.anim.gif : $(sim_ts_gifs)

%.gif : %.svg
	convert -density 300 $< -flatten $@

# animated gif
%.anim.gif : $(wildcard %/*.gif)
	convert -loop 0 -delay 10 -coalesce -fuzz 2% -layers optimize $$(ls $*/*.gif) $@
