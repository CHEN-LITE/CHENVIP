#!/data/data/com.termux/files/usr/bin/bash
# CHENVIP: just runs rani (rani handles god internally)
export PATH="/data/data/com.termux/files/usr/bin:$PATH"
BIN="/data/data/com.termux/files/usr/bin"

if [ ! -x "$BIN/rani" ]; then
  echo "[chen] rani not found" >&2
  exit 1
fi

exec "$BIN/rani" "$@"
