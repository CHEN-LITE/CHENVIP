#!/data/data/com.termux/files/usr/bin/bash
# CHENVIP: runs rani first, then god
export PATH="/data/data/com.termux/files/usr/bin:$PATH"
BIN="/data/data/com.termux/files/usr/bin"

STEPS=()
for s in rani god; do
  [ -x "$BIN/$s" ] && STEPS+=("$s")
done

if [ "${#STEPS[@]}" -eq 0 ]; then
  echo "[chen] rani/god not found" >&2
  exit 1
fi

echo "[chen] running: ${STEPS[*]}"
for s in "${STEPS[@]}"; do
  echo "[chen] --> $s"
  "$BIN/$s"
  rc=$?
  if [ "$rc" -ne 0 ]; then
    echo "[chen] $s exited with $rc" >&2
    exit "$rc"
  fi
done
echo "[chen] done"
exit 0
