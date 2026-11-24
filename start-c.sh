#!/bin/sh
set -eu
BASE=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
fail=0
need_cmd() {
  if ! command -v "$1" >/dev/null 2>&1; then
    echo "Fehlt: $1"
    fail=1
  fi
}
need_pkg() {
  if ! pkg-config --exists "$1"; then
    echo "Fehlt: Entwicklungsbibliothek $1"
    fail=1
  fi
}

need_cmd gcc
need_cmd cmake
need_cmd pkg-config
need_cmd lp
need_cmd lpstat
need_pkg gtk+-3.0
need_pkg cairo
need_pkg pangocairo
if [ ! -f /usr/share/fonts/truetype/dejavu/DejaVuSans.ttf ]; then
  echo "Fehlt: DejaVu Sans (fonts-dejavu)"
  fail=1
fi
if [ "$fail" -ne 0 ]; then
  echo "Systemprüfung fehlgeschlagen. Installiere fehlende Mint-Pakete laut README."
  exit 1
fi
if [ ! -x "$BASE/c-version/dk1lo-umschlagdrucker" ]; then
  echo "C-Programm fehlt. Baue zuerst mit: cmake -S c-version -B c-version/build && cmake --build c-version/build"
  exit 1
fi
exec "$BASE/c-version/dk1lo-umschlagdrucker"
