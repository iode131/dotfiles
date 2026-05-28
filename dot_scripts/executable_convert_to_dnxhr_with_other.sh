#!/usr/bin/env bash
set -euo pipefail

# ---------------------------------------------------------------------------
# convert_to_dnxhr.sh
# Batch-converts video files in a directory to DNxHR SQ with
# PCM audio using ffmpeg.
#
# Usage:
#   ./convert_to_dnxhr.sh [INPUT_DIR] [OUTPUT_DIR]
#
# Defaults:
#   INPUT_DIR  — current directory
#   OUTPUT_DIR — ./dnxhr_out
# ---------------------------------------------------------------------------

VIDEO_EXTENSIONS=("mp4" "mov" "mkv" "avi" "mxf" "m4v" "wmv" "flv" "webm" "ts")

INPUT_DIR="${1:-.}"
OUTPUT_DIR="${2:-./dnxhr_out}"

# Resolve to absolute paths
INPUT_DIR="$(realpath "$INPUT_DIR")"
OUTPUT_DIR="$(realpath -m "$OUTPUT_DIR")"

if [[ ! -d "$INPUT_DIR" ]]; then
  echo "Error: input directory '$INPUT_DIR' does not exist." >&2
  exit 1
fi

mkdir -p "$OUTPUT_DIR"

# Build a find expression matching all supported extensions
find_args=("$INPUT_DIR" -type f)
ext_args=()
for ext in "${VIDEO_EXTENSIONS[@]}"; do
  ext_args+=(-o -iname "*.${ext}")
done
# Combine: first element has no leading -o
find_args+=(\( "${ext_args[@]:1}" \))   # strip the leading -o

mapfile -t files < <(find "${find_args[@]}" 2>/dev/null | sort)

total="${#files[@]}"

if [[ "$total" -eq 0 ]]; then
  echo "No video files found in '$INPUT_DIR'."
  exit 0
fi

echo "Found $total file(s) to convert."
echo "Input  : $INPUT_DIR"
echo "Output : $OUTPUT_DIR"
echo "----------------------------------------"

JOBS=8

convert_one() {
  input_file="$1"
  output_dir="$2"
  filename="$(basename "$input_file")"
  name_no_ext="${filename%.*}"
  output_file="${output_dir}/${name_no_ext}.mov"

  echo "  → $filename"
  if ffmpeg -hide_banner -loglevel error \
      -threads 1 \
      -i "$input_file" \
      -c:v dnxhd -profile:v dnxhr_sq \
      -pix_fmt yuv422p \
      -c:a pcm_s16le \
      "$output_file" 2>&1; then
    echo "  ✓ $filename"
  else
    echo "  ✗ $filename (ffmpeg error)" >&2
    return 1
  fi
}
export -f convert_one

# Copy non-video files, preserving relative directory structure
echo "Copying non-video files..."
while IFS= read -r -d '' f; do
  rel="${f#"$INPUT_DIR"/}"
  dest="$OUTPUT_DIR/$rel"
  mkdir -p "$(dirname "$dest")"
  cp "$f" "$dest"
  echo "  copied: $rel"
done < <(find "$INPUT_DIR" -type f \( "${ext_args[@]:1}" \) -prune -o -type f -print0)
echo "----------------------------------------"

echo "Running $JOBS parallel jobs..."
echo "----------------------------------------"

printf '%s\n' "${files[@]}" \
  | xargs -P "$JOBS" -I {} bash -c 'convert_one "$@"' _ {} "$OUTPUT_DIR"

echo "----------------------------------------"
echo "Done. Check above for any ✗ failures."
