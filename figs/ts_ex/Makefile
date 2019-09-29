.PHONY : all

all : tree_sequence_genotypes.png tree_sequence_genotype_and_tree.png tree_sequence_next_genotype_and_tree.png tree_sequence_site_and_branch.png

tree_sequence_genotypes.pdf : tree_sequence.ink.svg
	../export-layers-svg.sh $< genotypes > $@

tree_sequence_genotype_and_tree.pdf : tree_sequence.ink.svg
	../export-layers-svg.sh $< genotypes sites mutations > $@

tree_sequence_next_genotype_and_tree.pdf : tree_sequence.ink.svg
	../export-layers-svg.sh $< genotypes next_genotypes next_sites next_mutations > $@

tree_sequence_site_and_branch.pdf : tree_sequence.ink.svg
	../export-layers-svg.sh $< sites mutations times time_labels branches > $@

include ../../rules.mk
