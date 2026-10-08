<!--
=================================================================
 Template LaTeX Tesis Program Magister
 Fakultas Matematika dan Ilmu Pengetahuan Alam (FMIPA)
 Universitas Syiah Kuala (USK)

 Penulis     : Muhammad Ichsan
 NPM         : 260820701100007
 Hak cipta   : (c) 2026 Muhammad Ichsan

 Dasar       : Mengikuti Panduan Penulisan Tugas Akhir dan Tesis
               FMIPA Universitas Syiah Kuala tahun 2024.

 Terakhir diperbarui : 8 Oktober 2026
=================================================================
-->

# Template LaTeX Tesis Program Magister

> Penulis: **Muhammad Ichsan** (NPM 260820701100007)
> (c) 2026 Muhammad Ichsan — hak cipta dilindungi undang-undang.
> Struktur naskah mengikuti Panduan Penulisan Tugas Akhir dan Tesis
> FMIPA USK tahun 2024.
> Terakhir diperbarui: 8 Oktober 2026.

Template penulisan naskah tesis untuk Program Studi Magister
Fakultas Matematika dan Ilmu Pengetahuan Alam (FMIPA)
Universitas Syiah Kuala (USK). Template ini merupakan penyesuaian dari
template Laporan Tugas Akhir FMIPA USK ke format Tesis (S2), dengan seluruh
data identitas dibuat dinamis sehingga dapat dipakai oleh semua mahasiswa
tanpa perlu mengubah class file.

## Kebutuhan Sistem

- [TeX Live](https://www.tug.org/texlive/) (disarankan versi terbaru)
- MikTeX juga dapat digunakan

## Struktur Folder

```
tesis-utama.tex      isi utama naskah (preambel, halaman depan, bab)
tesis.tex            pemanggil tahap finals   -> tesis.pdf
seminar-proposal.tex pemanggil tahap sempro   -> seminar-proposal.pdf
seminar-hasil.tex    pemanggil tahap semhas   -> seminar-hasil.pdf
daftar-pustaka.bib   seluruh rujukan
build.sh / build.bat skrip kompilasi
lib/                 class file jiftesistheme.cls
style/               gaya daftar pustaka jifbibstyle.bst
language/            daftar pemenggalan suku kata bahasa Indonesia
image/               berkas gambar (logo universitas dan gambar contoh)
include/             isi naskah per berkas
```

## Tiga Tahap Naskah

Berkas `tesis-utama.tex` berisi seluruh isi naskah. Yang membedakan antar
tahap hanya tiga berkas pemanggil yang menentukan `\Tahap` sebelum memanggil
isi utama, sehingga preambel dan halaman depan cukup diubah di satu tempat.

| | Seminar Proposal | Seminar Hasil | Finals / Sidang |
| --- | --- | --- | --- |
| Berkas pemanggil | `seminar-proposal.tex` | `seminar-hasil.tex` | `tesis.tex` |
| PDF dihasilkan | `seminar-proposal.pdf` | `seminar-hasil.pdf` | `tesis.pdf` |
| Halaman pengesahan | kolom Dekan tidak ada | lengkap | lengkap |
| Pernyataan Bebas Plagiasi | tidak | tidak | ya |
| Daftar Lampiran | tidak | tidak | ya |
| Bab I-III | ya | ya | ya |
| Bab IV Hasil dan Pembahasan | tidak | ya | ya |
| Bab V Kesimpulan | tidak | ya | ya |
| Lampiran | tidak | tidak | ya |

Pada tahap Seminar Proposal blok "Mengetahui" di halaman pengesahan hanya memuat
Ketua Program Studi (tanpa kolom Dekan). Karena hanya satu kolom, blok tersebut
diletakkan di tengah halaman sementara isi kolomnya tetap rata kiri.

Kondisi yang tersedia di dalam `tesis-utama.tex`: `\ifsempro`, `\ifsemhas`,
`\ifnotsempro` (semhas atau finals), dan `\iffinals`.

Isi folder `include/`:

| Berkas | Isi |
| --- | --- |
| `identitas.tex` | **satu-satunya file yang diisi setiap mahasiswa** |
| `sampul-depan` tidak ada | judul dan identitas sudah berada di `identitas.tex` |
| `bebas-plagiasi.tex` | halaman pernyataan bebas plagiasi ( finals saja ) |
| `surat-pernyataan.tex` | halaman surat pernyataan, **saat ini tidak dipakai** |
| `abstrak-indonesia.tex` | abstrak bahasa Indonesia |
| `abstrak-english.tex` | abstract bahasa Inggris |
| `kata-pengantar.tex` | kata pengantar |
| `bab1.tex` sampai `bab5.tex` | isi lima bab |
| `lampiran.tex` | lampiran |

## Cara Pemakaian

1. Salin folder template ke folder kerja Anda.
2. Isi data pribadi pada `include/identitas.tex`. **Tidak perlu** menyentuh
   berkas lain.
3. Tulis naskah pada `include/bab1.tex` sampai `include/bab5.tex`, lalu
   `include/lampiran.tex`.
4. Bangun naskah sesuai tahap yang dibutuhkan, misalnya `./build.sh sempro`
   untuk proposal atau `./build.sh finals` untuk naskah finals.

### Mengaktifkan Surat Pernyataan

Halaman Surat Pernyataan ada di `include/surat-pernyataan.tex` tetapi
**sengaja dinonaktifkan** pada naskah ini (tidak dihapus). Untuk
mengaktifkan kembali, buka `tesis-utama.tex` lalu hapus tanda `%` pada baris
berikut:

```latex
\include{surat-pernyataan}
```

### Linux / macOS

```bash
chmod +x build.sh
./build.sh            # naskah finals  -> tesis.pdf
./build.sh sempro     # seminar proposal -> seminar-proposal.pdf
./build.sh semhas     # seminar hasil    -> seminar-hasil.pdf
./build.sh finals     # sama dengan tanpa argumen
./build.sh all        # ketiganya
./build.sh clean      # hapus berkas hasil kompilasi
```

### Windows (Command Prompt)

```bat
.\build.bat
.\build.bat sempro
.\build.bat semhas
.\build.bat all
.\build.bat clean
```

Kompilasi minimal dilakukan tiga kali agar daftar isi dan nomor halaman stabil.

### Manual

```bash
pdflatex -interaction=nonstopmode --shell-escape -jobname=tesis tesis.tex
bibtex tesis
pdflatex -interaction=nonstopmode --shell-escape -jobname=tesis tesis.tex
pdflatex -interaction=nonstopmode --shell-escape -jobname=tesis tesis.tex
```

Alternatif: `latexmk -pdf tesis.tex` (TeX Live sudah menyediakan `latexmk`).
Untuk tahap lain, ganti nama berkasnya, misalnya
`seminar-proposal.tex` dengan `-jobname=seminar-proposal`.

## Data pada `include/identitas.tex`

Setiap data memiliki dua macro: `\setnamadata{...}` diisi di `include/identitas.tex`,
sedangkan `\namadata` dipakai di dalam naskah. Jangan menulis `\namadata{...}` di
file naskah karena macro itu tidak menerima argumen.

| Perintah pada identitas.tex | Isi |
| --- | --- |
| `\setjudulcover` | judul pada halaman sampul |
| `\setjudul` | judul pada halaman pengesahan |
| `\setjudulinggris` | judul dalam bahasa Inggris |
| `\setfullname` | nama lengkap mahasiswa |
| `\setidnum` | NIM |
| `\settempatlahir, \settanggallahir` | tempat dan tanggal lahir |
| `\setstatusmahasiswa` | status akademik, biasanya `Mahasiswa` |
| `\setprogramstudi` | nama program studi, contoh `Magister Kecerdasan Buatan` |
| `\setdept` | departemen tempat program studi berada |
| `\setfaculty`, `\setfakultassingkat`, `\setuniversity`, `\setcity` | fakultas, nama singkat fakultas, universitas, kota pencetakan |
| `\setjenjang`, `\setgelar` | jenjang dan gelar yang diperoleh, contoh `Magister` dan `Magister Komputer` |
| `\setdokumen` | jenis dokumen, yaitu `TESIS` |
| `\setsyarattext` | kalimat syarat pada sampul; tanda `\\` di dalam teks menjadi pemenggalan baris |
| `\setyearsubmit` | tahun penulisan naskah |
| `\setfirstsupervisor, \setfirstnip` | Pembimbing I dan NIP |
| `\setsecondsupervisor, \setsecondnip` | Pembimbing II dan NIP |
| `\setkajur, \setkajurnip` | Ketua Departemen dan NIP |
| `\setkaprodi`, `\setkaprodinip` | Ketua Program Studi dan NIP |
| `\setkoordinatortesis`, `\setkoordinatortesisnip` | Koordinator Tesis dan NIP |
| `\setdekan, \setdekannip` | Dekan Fakultas dan NIP |
| `\setapprovaldate` | tanggal ujian tesis, contoh `Senin, 17 Februari 2025` |
| `\setdisahkantanggal` | tanggal tanda tangan, contoh `14 Februari 2025` |
| `\setdisahkantanggalhari` | nama hari pada kalimat "Tesis disahkan pada hari ...", contoh `Senin` |
| `\setkeywordindo, \setkeywordeng` | kata kunci abstrak |

Nama gelar, kapitalisasi judul, dan nama pejabat sebaiknya disesuaikan dengan
ketentuan program studi masing-masing.

## Menambahkan Referensi

Simpan entri di `daftar-pustaka.bib`, lalu rujuk dari naskah dengan
`\cite{namakunci}`. Karakter `&` harus ditulis `\&` dan `%` harus ditulis `\%`.

## Menampilkan Daftar Program

Bila naskah memuat cuplikan kode, aktifkan Daftar Program di `tesis-utama.tex`
dengan menghapus tanda `%` pada baris:

```latex
\lstlistoflistings
\addcontentsline{toc}{chapter}{Daftar Program}
```

## Catatan

- Naskah template hanya memuat struktur: kerangka lima bab, abstrak, dan kata
  pengantar. Ganti seluruh teks contoh dengan naskah Anda sendiri.
- `image/contoh-kerangka-berpikir.png` dan `image/contoh-hasil.png` hanya
  placeholder. Ganti dengan gambar Anda, atau hapus blok `\IfFileExists` yang
  memuatnya bila tidak diperlukan.
- Ukuran kertas A4, margin kiri 3,5 cm, kanan 3 cm, atas dan bawah 3 cm,
  spasi 1,5 untuk isi bab dan spasi tunggal untuk halaman depan.
- Halaman pengesahan memakai `\setfakultassingkat` untuk kolom "Dekan" agar
  tidak melebar; isi dengan singkatan fakultas, contoh `FMIPA`.
- Contoh kompilasi diuji dengan TeX Live 2026.