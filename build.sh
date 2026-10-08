#!/usr/bin/env bash
# ==================================================================
#  Kompilasi naskah tesis FMIPA USK (Program Magister)
#  Penulis: Muhammad Ichsan (NPM 260820701100007)
#  (c) 2026 Muhammad Ichsan - hak cipta dilindungi undang-undang
#  Mengikuti Panduan TA/Tesis FMIPA USK tahun 2024
#  Terakhir diperbarui: 8 Oktober 2026
# ==================================================================
#
# Pemakaian:
#   ./build.sh                 -> tesis.pdf              (naskah finals)
#   ./build.sh sempro          -> seminar-proposal.pdf
#   ./build.sh semhas          -> seminar-hasil.pdf
#   ./build.sh finals          -> tesis.pdf              (sama dengan tanpa argumen)
#   ./build.sh all             -> ketiganya
#   ./build.sh clean           -> hapus seluruh berkas hasil kompilasi
#
# Windows: .\build.bat sempro   (atau .\build.bat all, .\build.bat clean)
# ------------------------------------------------------------------
set -e

# Nama berkas .tex untuk setiap tahap
NAMA_SEMPRO="seminar-proposal"
NAMA_SEMHAS="seminar-hasil"
NAMA_SIDANG="tesis"

bersih() {
  rm -f *.aux *.bbl *.blg *.log *.toc *.lot *.lof *.lol *.out *.fdb_latexmk *.fls
  rm -f include/*.aux
}

# kompil() <nama-berkas-tanpa-ekstensi> <nama-pdf>
kompil() {
  echo ""
  echo "=============================================="
  echo " Kompilasi: $1.tex  ->  $2.pdf"
  echo "=============================================="
  bersih
  pdflatex -interaction=nonstopmode --shell-escape -jobname="$2" "$1".tex >/dev/null
  bibtex "$2" >/dev/null 2>&1 || true
  pdflatex -interaction=nonstopmode --shell-escape -jobname="$2" "$1".tex >/dev/null
  pdflatex -interaction=nonstopmode --shell-escape -jobname="$2" "$1".tex
  echo ""
  echo "Selesai: $2.pdf"
}

TAHAP="${1:-sidang}"

case "$TAHAP" in
  sempro)
    kompil "$NAMA_SEMPRO" "$NAMA_SEMPRO"
    ;;
  semhas)
    kompil "$NAMA_SEMHAS" "$NAMA_SEMHAS"
    ;;
  finals|skripsi|sidang|thesis|"")
    kompil "$NAMA_SIDANG" "$NAMA_SIDANG"
    ;;
  all)
    kompil "$NAMA_SEMPRO" "$NAMA_SEMPRO"
    kompil "$NAMA_SEMHAS" "$NAMA_SEMHAS"
    kompil "$NAMA_SIDANG" "$NAMA_SIDANG"
    ;;
  clean)
    bersih
    rm -f "$NAMA_SIDANG".pdf "$NAMA_SEMPRO".pdf "$NAMA_SEMHAS".pdf
    echo "Berkas hasil kompilasi dihapus."
    ;;
  *)
    echo "Tahap tidak dikenal: $TAHAP"
    echo "Pilihan: sempro | semhas | finals | all | clean"
    exit 1
    ;;
esac