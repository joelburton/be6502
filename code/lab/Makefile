index.html: index.lit
	srcweave \
		--tangle dist \
		--weave docs \
		--styler srcweave-html-styler \
		index.lit \
		gamepad.lit

init: FORCE
	srcweave-html-styler-init docs \
	mkdir -p dist

deploy: FORCE
	echo "Nope"

FORCE:
