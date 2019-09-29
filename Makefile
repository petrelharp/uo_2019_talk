SHELL := /bin/bash
# use bash for <( ) syntax

.PHONY : setup

uo-oct-2019-talk.local.slides.html : setup

setup :
	$(MAKE) -C figs

include rules.mk
