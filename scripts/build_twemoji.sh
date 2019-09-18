#/bin/bash

SRC_EMOJI_DIR="third_party/twitter/twemoji"
TRG_DIR="dist"

cd "$(dirname $(dirname $0))"

function normalize {
	str="$1"
	str="${str//-200d/}"
	str="${str//-fe0f/}"
	if [ "${str:2:1}" == '-' ] || [ "${str:2:1}" == '.' ]
	then
		str="00$str";
	fi

	echo "$str"
}

echo "[0/4] Cleaning dirs..."
rm -rf "${TRG_DIR}/svg" "${TRG_DIR}/svgz"
mkdir "${TRG_DIR}/svg" "${TRG_DIR}/svgz"

echo "[1/4] Copying text files..."
cp "$SRC_EMOJI_DIR/AUTHORS" "$SRC_EMOJI_DIR/LICENSE-GRAPHICS" "$TRG_DIR"

echo "[2/4] Copying emoji..."
for src_file in "$SRC_EMOJI_DIR/assets/svg/"*.svg;
do
	trg_file="$TRG_DIR/svg/$(normalize $(basename $src_file))"

	cp -f "$src_file" "$trg_file"
done

echo "[3/4] Running SVGO..."
third_party/node_modules/.bin/svgo -f "$TRG_DIR/svg" --multipass -q

echo "[4/4] Creating SVGZ..."
zopfli -i100 "$TRG_DIR/svg/"*.svg
for src_file in "$TRG_DIR/svg/"*.gz;
do
	trg_file="$(basename $src_file)"
	trg_file="${TRG_DIR}/svgz/${trg_file%.gz}z"

	mv "$src_file" "$trg_file"
done

echo "Done."
