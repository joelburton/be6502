##
# CSI
#
# @file
# @version 0.1

index.html: microforth.lit
	srcweave \
		--tangle dist \
		--weave docs/ \
		--styler srcweave-html-styler \
		microforth.lit

init: FORCE
	srcweave-html-styler-init docs/
	mkdir -p dist

deploy: FORCE
	echo "Nope"

FORCE:
# end
