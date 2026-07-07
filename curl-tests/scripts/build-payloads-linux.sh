#!/usr/bin/env sh
set -eu

if [ "$#" -ne 2 ]; then
	echo "Usage: sh curl-tests/scripts/build-payloads-linux.sh <username> <password>"
	exit 1
fi

USER_VALUE=$1
PWD_VALUE=$2
SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
ROOT_DIR=$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd)
TEMPLATE_DIR="$ROOT_DIR/templates"
GENERATED_DIR="$ROOT_DIR/generated"

escape_sed() {
	printf '%s' "$1" | sed 's/[\/&|]/\\&/g'
}

USER_ESCAPED=$(escape_sed "$USER_VALUE")
PWD_ESCAPED=$(escape_sed "$PWD_VALUE")

mkdir -p "$GENERATED_DIR"

for template in "$TEMPLATE_DIR"/*; do
	[ -f "$template" ] || continue
	name=$(basename "$template")
	output="$GENERATED_DIR/${name%.tpl}"
	sed \
		-e "s|#TIMM-API-USERNAME#|$USER_ESCAPED|g" \
		-e "s|#TIMM-API-PASSWORD#|$PWD_ESCAPED|g" \
		"$template" > "$output"
	echo "Generated $output"
done
