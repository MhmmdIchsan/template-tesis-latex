%
% =================================================================
%  Template Penulisan Tesis Program Magister
%  Fakultas Matematika dan Ilmu Pengetahuan Alam (FMIPA)
%  Universitas Syiah Kuala (USK)
% =================================================================
%
%  Penulis     : Muhammad Ichsan
%  NPM         : 260820701100007
%  Hak cipta   : (c) 2026 Muhammad Ichsan
%                Blok ini hanya penanda kepemilikan dan tidak
%                muncul pada halaman hasil cetak.
%
%  Dasar       : Mengikuti Panduan Penulisan Tugas Akhir dan Tesis
%                FMIPA Universitas Syiah Kuala tahun 2024.
%
%  Terakhir diperbarui : 8 Oktober 2026
%
%  @author   Abdul Hafidh (versi 1.1 - Tugas Akhir)
%  @version  2.0 (versi Tesis / Program Pascasarjana)
%  @since    02.10.2026
%
% Template ini merupakan penyesuaian dari Template Laporan Tugas Akhir FMIPA
% Unsyiah/USK menjadi Template Tesis (S2). Semua data identitas mahasiswa,
% judul, dan nama dosen diambil dari file include/identitas.tex sehingga
% template ini dapat dipakai oleh seluruh mahasiswa tanpa mengubah class file.
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jiftesistheme}

\RequirePackage[english,bahasa]{babel}
\RequirePackage{indentfirst}
\RequirePackage{setspace}
\RequirePackage[T1]{fontenc}
\RequirePackage{times}
\RequirePackage{graphicx,latexsym}

\setlength{\paperwidth}{210mm}
\setlength{\paperheight}{297mm}
\usepackage[a4paper,left=3.5cm,right=3cm,top=3cm,bottom=3cm]{geometry}
\usepackage{verbatim,enumerate}
% tabularx untuk membuat tabel yang ukurannya bisa disesuaikan dengan lebar halaman
\usepackage{tabularx}

% Membantu penulisan notasi matematika terutama untuk dokumen dengan banyak rumus
\usepackage{amsmath}

\usepackage{booktabs}
\usepackage[table]{xcolor}
\usepackage{multirow}
\usepackage{float}
\usepackage{indentfirst}

% Agar bisa menggunakan compactitem
\usepackage{paralist}

%------------------------------------------------------------
% Opsi class
%------------------------------------------------------------
\newif\if@thesis
\newif\if@thesisproposal
\DeclareOption{tesis}{\@thesistrue\@thesisproposalfalse}
\DeclareOption{proposal}{\@thesisfalse\@thesisproposaltrue}

\newif\if@singlesp
\newif\if@doublesp
\DeclareOption{satuspasi}{\@singlesptrue\@doublespfalse}
\DeclareOption{duaspasi}{\@singlespfalse\@doublesptrue}
\newif\if@onehalfsp
\@onehalfspfalse
\DeclareOption{satusetengahspasi}{\@onehalfsptrue}

\newif\if@langindo
\newif\if@langeng
\DeclareOption{indonesia}{\@langindotrue\@langengfalse}
\DeclareOption{inggris}{\@langindofalse\@langengtrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ExecuteOptions{tesis,satusetengahspasi,indonesia}
\ProcessOptions
\LoadClass[a4paper,12pt]{report}
\RequirePackage{natbib}
\bibliographystyle{style/jifbibstyle}

%------------------------------------------------------------
% Layout
%------------------------------------------------------------
\setlength{\topmargin}{-0.9cm}
\setlength{\headheight}{12pt}
\setlength{\headsep}{2.3cm}
\setlength{\topskip}{1ex}
\setlength{\oddsidemargin}{1.46cm}
\setlength{\evensidemargin}{1.46cm}
\setlength{\textwidth}{14.3cm}
\setlength{\textheight}{22cm}
\setlength{\footskip}{1.5cm}
\setlength{\marginparsep}{0pt}
\setlength{\marginparwidth}{0pt}

\setlength{\parindent}{3em} % Indent approx 6 character

%------------------------------------------------------------
% Bentuk penomoran halaman
%------------------------------------------------------------
\def\ps@chapterheading{%
  }

\usepackage{fancyhdr}

\setlength{\footskip}{20pt}
\setlength{\headsep}{20pt}
\renewcommand{\headrulewidth}{0.0pt}
\fancyhf{}
\fancyhead[L]{}
\fancyhead[C]{}
\fancyhead[R]{\thepage}
\renewcommand{\headrulewidth}{0.0pt}
\renewcommand{\footrulewidth}{0.0pt}
\pagestyle{fancy}

%------------------------------------------------------------
% Redefine chapter dan section
%------------------------------------------------------------
\setcounter{secnumdepth}{2}
\renewcommand \thepart {\@Roman\c@part}
\renewcommand \thechapter {\@Roman\c@chapter}
\renewcommand \thesection {\@arabic\c@chapter.\@arabic\c@section}
\renewcommand \thesubsection {\@arabic\c@chapter.\@arabic\c@section.\@arabic\c@subsection}
\renewcommand\appendix{\par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\@chapapp{\appendixname}%
  \gdef\thechapter{\@Alph\c@chapter}}
\renewcommand{\chapter}{\clearpage\thispagestyle{chapterheading}%
  \global\@topnum\z@ % Prevents figures from going at top of page
  \@afterindenttrue % Indent the 1st paragraph
  \secdef\@chapter\@schapter}
\renewcommand{\@makechapterhead}[1]{%
  {\parindent \z@ \centering \normalfont
    \ifnum \c@secnumdepth >\m@ne
        \large\bfseries \@chapapp\space \thechapter
        \par\nobreak
        \vskip -0.2cm
    \fi
    \interlinepenalty\@M
    \large \bfseries #1\par\nobreak
    \vskip 20\p@
    }}
\renewcommand{\@makeschapterhead}[1]{%
  {\parindent \z@ \centering \normalfont
    \interlinepenalty\@M \large \bfseries #1\par\nobreak \vskip 20\p@ }}
\renewcommand{\section}{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {0.5ex \@plus.2ex}%
                                   {\normalfont\normalsize\bfseries}}
\renewcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex\@minus -.2ex}%
                                     {0.5ex\@plus .2ex}%
                                     {\normalfont\normalsize\bfseries}}
\renewcommand{\subsubsection}{\@startsection{subsubsection}{3}{\z@}%
                                    {3.25ex\@plus1ex\@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\bfseries}}
\renewcommand{\paragraph}{\subparagraph}

\@addtoreset {equation}{chapter}
\renewcommand\theequation
  {\ifnum \c@chapter>\z@ \@arabic\c@chapter.\fi \@arabic\c@equation}
\renewcommand \thefigure
     {\ifnum \c@chapter>\z@ \@arabic\c@chapter.\fi \@arabic\c@figure}
\renewcommand \thetable
     {\ifnum \c@chapter>\z@ \@arabic\c@chapter.\fi \@arabic\c@table}

%------------------------------------------------------------
% Redefine caption names (Indonesia)
%------------------------------------------------------------
\def\captionsbahasa{%
\def\prefacename{KATA PENGANTAR}%
\def\contentsname{DAFTAR ISI}%
\def\listfigurename{DAFTAR GAMBAR}%
\def\listtablename{DAFTAR TABEL}%
\def\listappendixname{DAFTAR LAMPIRAN}%
\def\nomenclaturename{DAFTAR SINGKATAN}%
\def\abstractname{ABSTRAK}%
\def\acknowledgmentname{HALAMAN PERSEMBAHAN}%
\def\approvalname{PENGESAHAN}%
\def\partname{BAGIAN}%
\def\chaptername{BAB}%
\def\appendixname{LAMPIRAN}%
\def\refname{DAFTAR PUSTAKA}%
\def\bibname{DAFTAR PUSTAKA}%
\def\indexname{Indeks}%
\def\figurename{Gambar}%
\def\tablename{Tabel}%
\def\pagename{Halaman}%
\def\bplagiasiname{PERNYATAAN BEBAS PLAGIASI}%
\def\spernyataanname{SURAT PERNYATAAN}%
}

% English
\def\captionsenglish{%
\def\prefacename{PREFACE}%
\def\contentsname{CONTENTS}%
\def\listfigurename{LIST OF FIGURES}%
\def\listtablename{LIST OF TABLES}%
\def\listappendixname{LIST OF APPENDICES}%
\def\nomenclaturename{NOMENCLATURE}%
\def\abstractname{\textit{ABSTRACT}}%
\def\partname{PART}%
\def\chaptername{CHAPTER}%
\def\appendixname{APPENDIX}%
\def\refname{REFERENCES}%
\def\bibname{REFERENCES}%
\def\indexname{Index}%
\def\figurename{Figure}%
\def\tablename{Table}%
\def\pagename{Page}%
}

%------------------------------------------------------------
% Tahap naskah
%------------------------------------------------------------
% Tahap ditentukan oleh berkas pemanggil sebelum \documentclass:
%   \def\Tahap{finals}  -> tesis finals / sidang
%   \def\Tahap{sempro}  -> seminar proposal
%   \def\Tahap{semhas}  -> seminar hasil
%
% Catatan: nilai di luar tiga nama di atas dianggap finals.
\ifdefined\Tahap\else\def\Tahap{finals}\fi
\def\Tahap@sempro{sempro}
\def\Tahap@semhas{semhas}
\def\Tahap@finals{finals}
\newif\ifsempro
\newif\ifsemhas
\newif\iffinals
\ifx\Tahap\Tahap@sempro
  \semprotrue  \semhasfalse \finalsfalse
\else
  \ifx\Tahap\Tahap@semhas
    \semprofalse \semhastrue  \finalsfalse
  \else
    \semprofalse \semhasfalse \finalstrue
  \fi
\fi
% Pintasan: \ifnotsempro berarti "semhas atau finals"
\newif\ifnotsempro
\ifx\Tahap\Tahap@sempro
  \notsemprofalse
\else
  \notsemprotrue
\fi

%------------------------------------------------------------
% Data input tesis
%
% Semua nilai bawaan di bawah ini hanya contoh. Nilai sebenarnya diisi di
% file include/identitas.tex
%------------------------------------------------------------
% Nama universitas, fakultas, departemen, dan kota
\gdef\@university{Universitas Syiah Kuala}
\gdef\@faculty{Fakultas Matematika dan Ilmu Pengetahuan Alam}
\gdef\@departemen{Departemen Informatika}
\gdef\@city{Banda Aceh}
\gdef\@fakultassingkat{FMIPA}

% Jenis dokumen dan kalimat syarat gelarnya
\gdef\@dokumen{TESIS}
\gdef\@syarattext{Diajukan untuk melengkapi tugas-tugas dan\\ memenuhi syarat-syarat guna memperoleh gelar}
\gdef\@gelar{Magister Komputer}
\gdef\@jenjang{Magister}

% Nama program studi (contoh: Magister Kecerdasan Buatan)
\gdef\@programstudi{Magister Kecerdasan Buatan}

%------------------------------------------------------------
% Macro identitas
%
% Setiap data memiliki dua macro:
%   \setnamavariabel{...}  setter, hanya dipakai di include/identitas.tex
%   \namavariabel          getter, dipakai di seluruh naskah
%------------------------------------------------------------
\newcommand{\setjudulcover}[1]{\gdef\@judulcover{#1}}
\newcommand{\judulcover}{\@judulcover}
\newcommand{\setjudul}[1]{\gdef\@judul{#1}}
\newcommand{\judul}{\@judul}
\newcommand{\setjudulinggris}[1]{\gdef\@judull{#1}}
\newcommand{\judulinggris}{\@judull}

\newcommand{\setfullname}[1]{\gdef\@fullname{#1}}
\newcommand{\fullname}{\@fullname}
\newcommand{\setidnum}[1]{\gdef\@idnum{#1}}
\newcommand{\idnum}{\@idnum}
\newcommand{\settempatlahir}[1]{\gdef\@tempatlahir{#1}}
\newcommand{\tempatlahir}{\@tempatlahir}
\newcommand{\settanggallahir}[1]{\gdef\@tanggallahir{#1}}
\newcommand{\tanggallahir}{\@tanggallahir}
\newcommand{\setstatusmahasiswa}[1]{\gdef\@statusmahasiswa{#1}}
\newcommand{\statusmahasiswa}{\@statusmahasiswa}

\newcommand{\setprogramstudi}[1]{\gdef\@programstudi{#1}}
\newcommand{\programstudi}{\@programstudi}
\newcommand{\setdept}[1]{\gdef\@dept{#1}}
\newcommand{\dept}{\@dept}
\newcommand{\setfaculty}[1]{\gdef\@faculty{#1}}
\newcommand{\faculty}{\@faculty}
\newcommand{\setfakultassingkat}[1]{\gdef\@fakultassingkat{#1}}
\newcommand{\fakultassingkat}{\@fakultassingkat}
\newcommand{\setuniversity}[1]{\gdef\@university{#1}}
\newcommand{\university}{\@university}
\newcommand{\setcity}[1]{\gdef\@city{#1}}
\newcommand{\city}{\@city}
\newcommand{\setgelar}[1]{\gdef\@gelar{#1}}
\newcommand{\gelar}{\@gelar}
\newcommand{\setjenjang}[1]{\gdef\@jenjang{#1}}
\newcommand{\jenjang}{\@jenjang}
\newcommand{\setdokumen}[1]{\gdef\@dokumen{#1}}
\newcommand{\dokumen}{\@dokumen}
\newcommand{\setsyarattext}[1]{\gdef\@syarattext{#1}}
\newcommand{\syarattext}{\@syarattext}

% Dosen pembimbing
\newcommand{\setfirstsupervisor}[1]{\gdef\@firstsupervisor{#1}}
\newcommand{\firstsupervisor}{\@firstsupervisor}
\newcommand{\setfirstnip}[1]{\gdef\@firstnip{#1}}
\newcommand{\firstnip}{\@firstnip}
\newcommand{\setsecondsupervisor}[1]{\gdef\@secondsupervisor{#1}}
\newcommand{\secondsupervisor}{\@secondsupervisor}
\newcommand{\setsecondnip}[1]{\gdef\@secondnip{#1}}
\newcommand{\secondnip}{\@secondnip}

% Ketua departemen, koordinator program studi, dan dekan
\newcommand{\setkajur}[1]{\gdef\@kajur{#1}}
\newcommand{\kajur}{\@kajur}
\newcommand{\setkajurnip}[1]{\gdef\@kajurnip{#1}}
\newcommand{\kajurnip}{\@kajurnip}
\newcommand{\setkaprodi}[1]{\gdef\@kaprodi{#1}}
\newcommand{\kaprodi}{\@kaprodi}
\newcommand{\setkaprodinip}[1]{\gdef\@kaprodinip{#1}}
\newcommand{\kaprodinip}{\@kaprodinip}

%------------------------------------------------------------
% Blok tanda tangan: kolom lebarnya mengikuti isi, font tetap
%------------------------------------------------------------
% Aturan main:
%   * Font TIDAK PERNAH dikecilkan. Nama dan NIP tetap 12pt.
%   * Lebar kolom = isi terpanjangnya.
%   * DUA kolom: kalau melebihi lebar teks, blok digeser ke kiri
%     secukupnya (dibatasi 25pt agar tetap di dalam kertas).
%   * TIGA kolom: lebar kolom dibagi proporsional terhadap
%     kebutuhan nama, sehingga label dan NIP tetap utuh; nama
%     yang tidak muat dibungkus ke beberapa baris.
%
% Pemakaian dua kolom:
%   \ttdkolomA=0pt \ttdkolomB=0pt
%   \ttdukurA{Pembimbing I,}\ttdukurA{\@firstsupervisor}%
%   \ttdukurB{Pembimbing II,}\ttdukurB{\@secondsupervisor}%
%   \ttdfit
%   \noindent\hspace*{\dimexpr-\ttdgeser\relax}%
%   \parbox[t]{\ttdkolomA}{...}\hspace*{\ttdgutter}%
%   \parbox[t]{\ttdkolomB}{...}
%
% Pemakaian tiga kolom:
%   \ttdcolA=0pt \ttdcolB=0pt \ttdcolC=0pt
%   \ttdasarA{Pembimbing I,}\ttdasarA{NIP. \firstnip}\ttdnamaA{\firstsupervisor}
%   ...
%   \ttdfitTiga
\newdimen\ttddima

% Nama satu baris, font tetap. Dipakai pada blok dua kolom yang
% lebarnya sudah cukup untuk memuatnya.
\newcommand{\ttdnama}[2][\linewidth]{%
  \underline{#2}}

% Nama yang boleh dibungkus: muat satu baris -> garis bawah nama;
% tidak muat -> dibungkus dengan jarak antarbaris MEKAT (tanpa spasi
% tambahan), garis bawah selebar kolom.
\newcommand{\ttdnamaW}[2][\linewidth]{%
  \settowidth{\ttddima}{#2}%
  \ifdim\ttddima>#1\relax
    \parbox[t]{#1}{\raggedright\setlength{\baselineskip}{12.4pt}%
      \strut #2\par\nobreak\vspace{0.6pt}\hrule height 0.4pt\relax}%
  \else
    \underline{#2}%
  \fi}

\newcommand{\ttdteks}[2][\linewidth]{%
  #2}

\newlength\ttdgutter   \setlength\ttdgutter{0.6cm}
\newlength\ttdgeser    \setlength{\ttdgeser}{0pt}
\newlength\ttdkolomA
\newlength\ttdkolomB
\newlength\ttdjumlah
\newlength\ttdcolA
\newlength\ttdcolB
\newlength\ttdcolC
\newlength\ttdnatA
\newlength\ttdnatB
\newlength\ttdnatC

\newcommand{\ttdukurA}[1]{%
  \settowidth{\ttddima}{#1}%
  \ifdim\ttddima>\ttdkolomA \setlength{\ttdkolomA}{\ttddima}\fi}
\newcommand{\ttdukurB}[1]{%
  \settowidth{\ttddima}{#1}%
  \ifdim\ttddima>\ttdkolomB \setlength{\ttdkolomB}{\ttddima}\fi}

% isi yang tidak boleh dibungkus (label jabatan, NIP, NIM)
\newcommand{\ttdasarA}[1]{%
  \settowidth{\ttddima}{#1}%
  \ifdim\ttddima>\ttdcolA \setlength{\ttdcolA}{\ttddima}\fi}
\newcommand{\ttdasarB}[1]{%
  \settowidth{\ttddima}{#1}%
  \ifdim\ttddima>\ttdcolB \setlength{\ttdcolB}{\ttddima}\fi}
\newcommand{\ttdasarC}[1]{%
  \settowidth{\ttddima}{#1}%
  \ifdim\ttddima>\ttdcolC \setlength{\ttdcolC}{\ttddima}\fi}
% nama (boleh dibungkus kalau kolom tidak cukup)
\newcommand{\ttdnamaA}[1]{%
  \settowidth{\ttddima}{#1}%
  \ifdim\ttddima>\ttdnatA \setlength{\ttdnatA}{\ttddima}\fi}
\newcommand{\ttdnamaB}[1]{%
  \settowidth{\ttddima}{#1}%
  \ifdim\ttddima>\ttdnatB \setlength{\ttdnatB}{\ttddima}\fi}
\newcommand{\ttdnamaC}[1]{%
  \settowidth{\ttddima}{#1}%
  \ifdim\ttddima>\ttdnatC \setlength{\ttdnatC}{\ttddima}\fi}

% dua kolom: lebar mengikuti isi, blok digeser ke kiri bila perlu
\newcommand{\ttdfit}{%
  \setlength{\ttdjumlah}{\dimexpr\ttdkolomA+\ttdkolomB+\ttdgutter\relax}%
  \setlength{\ttdgeser}{0pt}%
  \ifdim\ttdjumlah>\textwidth\relax
    \setlength{\ttdgeser}{\dimexpr(\ttdjumlah-\textwidth)/2\relax}%
    \ifdim\ttdgeser>25pt \setlength{\ttdgeser}{25pt}\fi
  \fi}

% tiga kolom: sisa ruang dibagi proporsional terhadap nama yang
% butuh tempat paling lebar. Label dan NIP dijaga tetap utuh, dan
% kolom yang isinya sudah cukup (mis. kolom mahasiswa yang nama
% nya tanpa gelar) TIDAK ikut lebarkan.
\newcommand{\ttdfitTiga}{%
  \ttdfitTigaPada{\textwidth}}

% \ttdfitTigaPada{lebar}: sama seperti \ttdfitTiga, tapi lebar
% tersedia ditentukan pemanggil. Dipakai agar blok tiga kolom
% bisa mengikuti lebar blok dua kolom yang ada di bawahnya.
% Catatan: semua perhitungan memakai satuan pt bulat, karena
% perkalian dalam satuan sp melampaui batas integer eTeX (2^31).
% Penting: penulisan \ttdcolA/B/C harus DI LUAR group, karena
% register dari \newlength bersifat lokal pada kelas ini.
\newcommand{\ttdfitTigaPada}[1]{%
    \edef\ttans{\number\dimexpr\ttdnatA-\ttdcolA\relax}%
    \edef\ttbns{\number\dimexpr\ttdnatB-\ttdcolB\relax}%
    \edef\ttcns{\number\dimexpr\ttdnatC-\ttdcolC\relax}%
    \edef\ttan{\number\numexpr\ttans/65536\relax}%
    \edef\ttbn{\number\numexpr\ttbns/65536\relax}%
    \edef\ttcn{\number\numexpr\ttcns/65536\relax}%
    \ifnum\ttan<0 \edef\ttan{0}\fi
    \ifnum\ttbn<0 \edef\ttbn{0}\fi
    \ifnum\ttcn<0 \edef\ttcn{0}\fi
    \edef\tttn{\number\numexpr\ttan+\ttbn+\ttcn\relax}%
    \edef\ttcols{\number\dimexpr\ttdcolA+\ttdcolB+\ttdcolC\relax}%
    \edef\ttbebasA{\number\dimexpr#1-2\ttdgutter\relax}%
    \edef\ttbebasB{\number\numexpr\ttbebasA-\ttcols\relax}%
    \edef\ttsl{\number\numexpr\ttbebasB/65536\relax}%
    \ifnum\ttsl<0 \edef\ttsl{0}\fi
    \edef\ttas{0}\edef\ttbs{0}\edef\ttcs{0}%
    \ifnum\tttn>0
      \edef\ttas{\number\numexpr\ttan*\ttsl/\tttn\relax}%
      \edef\ttbs{\number\numexpr\ttbn*\ttsl/\tttn\relax}%
      \edef\ttcs{\number\numexpr\ttsl-\ttas-\ttbs\relax}%
    \fi
  \setlength{\ttdcolA}{\dimexpr\ttdcolA+\ttas pt\relax}%
  \setlength{\ttdcolB}{\dimexpr\ttdcolB+\ttbs pt\relax}%
  \setlength{\ttdcolC}{\dimexpr\ttdcolC+\ttcs pt\relax}}

\newcommand{\setkoordinatortesis}[1]{\gdef\@koordinatortesis{#1}}
\newcommand{\koordinatortesis}{\@koordinatortesis}
\newcommand{\setkoordinatortesisnip}[1]{\gdef\@koordinatortesisnip{#1}}
\newcommand{\koordinatortesisnip}{\@koordinatortesisnip}
\newcommand{\setdekan}[1]{\gdef\@dekan{#1}}
\newcommand{\dekan}{\@dekan}
\newcommand{\setdekannip}[1]{\gdef\@dekannip{#1}}
\newcommand{\dekannip}{\@dekannip}

% Tanggal penting
\newcommand{\setyearsubmit}[1]{\gdef\@yearsubmit{#1}}
\newcommand{\yearsubmit}{\@yearsubmit}
% Tanggal dalam kalimat "Ujian Tesis pada hari ..." (contoh: Senin, 17 Februari 2025)
\newcommand{\setapprovaldate}[1]{\gdef\@approvaldate{#1}}
\newcommand{\approvaldate}{\@approvaldate}
% Tanggal tanda tangan pada kata pengantar dan surat pernyataan (contoh: 14 Februari 2025)
\newcommand{\setdisahkantanggal}[1]{\gdef\@disahkantanggal{#1}}
\newcommand{\disahkantanggal}{\@disahkantanggal}

% Nama hari untuk kalimat "Tesis disahkan pada hari ..."
\newcommand{\setdisahkantanggalhari}[1]{\gdef\@disahkantanggalhari{#1}}
\newcommand{\disahkantanggalhari}{\@disahkantanggalhari}

% Kata kunci abstrak
\newcommand{\setkeywordindo}[1]{\gdef\@keywordindo{#1}}
\newcommand{\keywordindo}{\@keywordindo}
\newcommand{\setkeywordeng}[1]{\gdef\@keywordeng{#1}}
\newcommand{\keywordeng}{\@keywordeng}

%------------------------------------------------------------
% Cover / Halaman Judul
%------------------------------------------------------------
\def\cover{%
  \newgeometry{left=3.5cm,right=3cm,top=3cm,bottom=3cm}
  \disableboldchapterintoc
  \addcontentsline{toc}{chapter}{Halaman Judul}
  \thispagestyle{empty}%
  \pagenumbering{roman}
  \setcounter{page}{1}
  \begin{center}
    \begin{singlespace}
      \fontsize{18pt}{20pt}\selectfont\MakeUppercase{\Large{\bfseries\@judulcover}}\par\nobreak
      \vspace{2.5cm}
      \MakeUppercase{\large{\bfseries{\@dokumen}}}\\
      \vspace{1.0cm}
      \normalsize{\@syarattext{} \@gelar\\}
      \vspace{1.0cm}
      {\normalfont
        Oleh:\\
        \vspace{1.0cm}
        \MakeUppercase{\normalfont\bfseries \underline{\@fullname}}\\
        \MakeUppercase{\normalfont\bfseries \@idnum}}\\
      \vspace{2cm}
      \vfill
      \includegraphics[width=0.3\textwidth]{image/logo_unsyiah.png}
      \vfill
      \vspace{2cm}
      {\normalfont
        \MakeUppercase{\normalfont\bfseries Program Studi \@programstudi}\\
        \MakeUppercase{\normalfont\bfseries\@departemen}\\
        \MakeUppercase{\normalfont\bfseries\@faculty}\\
        \MakeUppercase{\normalfont\bfseries\@university ,  \@city}\\
        \MakeUppercase{\normalfont\bfseries\@yearsubmit}}\\
    \end{singlespace}
  \end{center}
}

%------------------------------------------------------------
% Halaman Pengesahan
%------------------------------------------------------------
\def\approvalpage{%
  \clearpage\addcontentsline{toc}{chapter}{Halaman Pengesahan}
  \chapter*{\approvalname}%
  \begin{center}
    \begin{doublespace}
      \vspace{0.5cm}
      \fontsize{12pt}{10pt}\selectfont\MakeUppercase{\large{\bfseries\@judul}}\par\nobreak

      \vspace{1cm}
      \fontsize{12pt}{10pt}\selectfont\MakeUppercase{\large{\textit{\bfseries\@judull}}}\par\nobreak

      \vspace{0.9cm}
      Oleh:
      \begin{singlespace}
        \begin{compactitem}
          \addtolength{\itemindent}{3cm}
          \setlength{\parsep}{0pt}
          \item[]{\makebox[3cm]{Nama\hfill} : \@fullname}
          \item[]{\makebox[3cm]{NIM\hfill} : \@idnum}
          \item[]{\makebox[3cm]{Program Studi\hfill} : \@programstudi}
        \end{compactitem}
      \end{singlespace}

      \vspace{0.9cm}

      %------------------------------------------------------------
      % Ukuran kolom diambil dari kebutuhan TERBESAR di kedua blok
      % tanda tangan, lalu dipakai bersama oleh keduanya. Jadi kalau
      % salah satu nama diperlebar, kolom sebelah ikut menyesuaikan
      % dan garis kolom kedua blok tetap lurus.
      %
      % Pada tahap seminar proposal blok "Mengetahui" hanya memuat
      % Ketua Program Studi (tanpa kolom Dekan), sehingga kolom A
      % tidak perlu accommodate nama Dekan.
      %------------------------------------------------------------
      \ttdkolomA=0pt \ttdkolomB=0pt
      \ttdukurA{Pembimbing I,}\ttdukurA{\@firstsupervisor}\ttdukurA{NIP. \@firstnip}%
      \ttdukurB{Pembimbing II,}\ttdukurB{\@secondsupervisor}\ttdukurB{NIP. \@secondnip}%
      \ifsempro
        \ttdukurA{Ketua Program Studi}\ttdukurA{\@programstudi{} \@fakultassingkat}%
        \ttdukurA{\@university,}\ttdukurA{\@kaprodi}\ttdukurA{NIP. \@kaprodinip}%
      \else
        \ttdukurA{Dekan \@fakultassingkat}\ttdukurA{\@university,}%
        \ttdukurA{\@dekan}\ttdukurA{NIP. \@dekannip}%
        \ttdukurB{Ketua Program Studi}\ttdukurB{\@programstudi{} \@fakultassingkat}%
        \ttdukurB{\@university,}\ttdukurB{\@kaprodi}\ttdukurB{NIP. \@kaprodinip}%
      \fi
      \ttdfit

      %------------------------------------------------------------
      % "Menysetujui:" dan "Mengetahui:" memakai \makebox sehingga
      % keduanya tepat berada di tengah area teks yang sama dengan
      % blok tanda tangan di bawahnya.
      %------------------------------------------------------------
      % Lebar area yang dipakai blok tanda tangan: kolom A + gutter +
% kolom B. Judul "Menyetujui:" dan "Mengetahui:" dipusatkan tepat di
% dalam area selebar ini, sehingga keduanya sejajar satu sama lain
% dan juga sejajar dengan blok tanda tangannya.
\newlength{\ttdareattd}%
\setlength{\ttdareattd}{\dimexpr\ttdkolomA+\ttdgutter+\ttdkolomB\relax}%
\noindent\hspace*{\dimexpr-\ttdgeser\relax}%
\makebox[\ttdareattd][c]{Menyetujui:}\par
      \noindent\hspace*{\dimexpr-\ttdgeser\relax}%
      \parbox[t]{\ttdkolomA}{\raggedright
        Pembimbing I,\par
        \vspace{1.7cm}%
        \ttdnama[\ttdkolomA]{\@firstsupervisor}\par
        \vspace{0.15cm}%
        NIP. \@firstnip}%
      \hspace*{\ttdgutter}%
      \parbox[t]{\ttdkolomB}{\raggedright
        Pembimbing II,\par
        \vspace{1.7cm}%
        \ttdnama[\ttdkolomB]{\@secondsupervisor}\par
        \vspace{0.15cm}%
        NIP. \@secondnip}\par
      \vspace{0.55cm}

      \noindent\hspace*{\dimexpr-\ttdgeser\relax}%
\makebox[\ttdareattd][c]{Mengetahui:}\par
      \ifsempro
      % Seminar proposal: satu kolom (Ketua Program Studi) diletakkan di
      % tengah area yang sama dengan blok tanda tangan, sehingga
      % sejajar dengan "Menyetujui:" dan "Mengetahui:". Lebar kolom
      % diukur otomatis dari isi terpanjang; isi kolom tetap rata kiri.
      \noindent\hspace*{\dimexpr-\ttdgeser\relax}%
      \hskip\dimexpr(\ttdareattd-\ttdkolomA)/2\relax%
      \parbox[t]{\ttdkolomA}{\raggedright\setlength{\baselineskip}{14pt}%
        Ketua Program Studi\par
        \@programstudi{} \@fakultassingkat\par
        \@university,\par
        \vspace{1.7cm}%
        \ttdnama[\ttdkolomA]{\@kaprodi}\par
        \vspace{0.15cm}%
        NIP. \@kaprodinip}\par
      \else
      \noindent\hspace*{\dimexpr-\ttdgeser\relax}%
      \parbox[t]{\ttdkolomA}{\raggedright\setlength{\baselineskip}{14pt}%
        Dekan \@fakultassingkat\par
        \@university,}%
      \hspace*{\ttdgutter}%
      \parbox[t]{\ttdkolomB}{\raggedright\setlength{\baselineskip}{14pt}%
        Ketua Program Studi\par
        \@programstudi{} \@fakultassingkat\par
        \@university,}\par
      \vspace{1.7cm}
      \noindent\hspace*{\dimexpr-\ttdgeser\relax}%
      \parbox[t]{\ttdkolomA}{\raggedright\setlength{\baselineskip}{14pt}%
        \ttdnama[\ttdkolomA]{\@dekan}\par
        \vspace{0.15cm}%
        NIP. \@dekannip}%
      \hspace*{\ttdgutter}%
      \parbox[t]{\ttdkolomB}{\raggedright\setlength{\baselineskip}{14pt}%
        \ttdnama[\ttdkolomB]{\@kaprodi}\par
        \vspace{0.15cm}%
        NIP. \@kaprodinip}\par
      \fi
    \end{doublespace}

    \vfill
    \ifsempro
      % Seminar proposal belum melalui ujian, sehingga kalimat pada
      % halaman pengesahan berbeda dari naskah finals.
      Lulus Proposal Penelitian pada hari \@approvaldate
    \else
      Lulus Sidang \@jenjang{} pada hari \@approvaldate \\
      Tesis disahkan pada hari \@disahkantanggalhari, \@disahkantanggal
    \fi
  \end{center}
}

%------------------------------------------------------------
% Acknowledgment
%------------------------------------------------------------
\def\acknowledgment{%
  \chapter*{\acknowledgmentname}%
\null\vfill% Force the content of acknowledment to bottom page
\addcontentsline{toc}{chapter}{\acknowledgmentname}
}

%------------------------------------------------------------
% Pernyataan bebas plagiasi dan surat pernyataan
%------------------------------------------------------------
\def\bplagiasi{%
  \chapter*{\bplagiasiname}%
  \vspace{0.2cm}
\addcontentsline{toc}{chapter}{Pernyataan Bebas Plagiasi}
}

\def\spernyataan{%
  \chapter*{\spernyataanname}%
  \vspace{0.2cm}
\addcontentsline{toc}{chapter}{Surat Pernyataan}
}

%------------------------------------------------------------
% Kata Pengantar
%------------------------------------------------------------
\def\preface{%
  \chapter*{\prefacename}%
  \vspace{0.2cm}
\addcontentsline{toc}{chapter}{Kata Pengantar}
}

%------------------------------------------------------------
% Daftar Singkatan
%------------------------------------------------------------
\def\singkatan{%
  \chapter*{\nomenclaturename}%
  \thispagestyle{plain}
\addcontentsline{toc}{chapter}{\nomenclaturename}
}

%------------------------------------------------------------
% Lampiran
%------------------------------------------------------------
\def\lampiran{%
  \clearpage\thispagestyle{chapterheading}%
\addcontentsline{toc}{chapter}{LAMPIRAN}
}

%------------------------------------------------------------
% Abstrak Indonesia
%------------------------------------------------------------
\def\abstractind{%
  \clearpage\thispagestyle{chapterheading}%
  \chapter*{\abstractname}%
  {\parindent \z@ \centering \normalfont
    }
  \begin{singlespacing}%
  \addcontentsline{toc}{chapter}{Abstrak}
}
\def\endabstractind{\par\vfil\null\end{singlespacing}}

%------------------------------------------------------------
% Abstrak English
%------------------------------------------------------------
\def\abstracteng{%
  \clearpage\thispagestyle{chapterheading}\selectlanguage{english}
  \chapter*{\abstractname}%
  {\parindent \z@ \centering \normalfont
    }
  \begin{singlespacing}%
  \addcontentsline{toc}{chapter}{\textit{Abstract}}
}
\def\endabstracteng{\par\vfil\null\end{singlespacing}%
\selectlanguage{bahasa}}

% Tabularization
\newcommand{\itab}[1]{\hspace{0em}\rlap{#1}}
\newcommand{\tab}[1]{\hspace{.2\textwidth}\rlap{#1}}

\AtBeginDocument{%
\if@doublesp%
\doublespacing%
\else\if@singlesp%
\singlespacing%
\else
\onehalfspacing%
\fi%
\fi
}

\AtBeginDocument{%
\if@langindo%
\selectlanguage{bahasa}%
\else
\selectlanguage{english}%
\fi
}

\endinput