%%% File `skripsi.cls' ditujukan untuk menulis skripi
%%% menggunakan LaTeX untuk program Sarjana
%%% di Institut Teknologi Bandung,
%%% berdasarkan pedoman penulisan disertasi ITB
%%%
%%% File ini berisi makro-makro LaTeX untuk memudahkan
%%% penulisan skripsi dengan format sesuai ketentuan SPS ITB.
%%%
%%% Any comments, suggestions, additions, corrections, modifications
%%% to this file are welcome.
%%% We rely on your feedback for improving this tool.
%%% <ikha.magdalena@math.itb.ac.id>
\ProvidesClass{skripsi}[08/08/08 v1.01]
\NeedsTeXFormat{LaTeX2e}
\LoadClass[a4paper,12pt,oneside,final]{book}
\RequirePackage{calc}
\RequirePackage[hang]{caption}
\RequirePackage{minitoc}
%\RequirePackage[tight,french]{fancynum}
%\RequirePackage{nomencl}

%----------------------------------------------------------
\DeclareRobustCommand{\Judul}[1]{%
    \newcommand{\@judul}{#1}%
    \title{\@judul}}%
\DeclareRobustCommand{\Nama}[1]{%
   \newcommand{\@nama}{#1}%
   \author{\@nama}}%
\DeclareRobustCommand{\Nim}[1]{%
   \DeclareRobustCommand{\@nim}{#1}}%
\newcommand\@progstudi{Program Studi Matematika}
\DeclareRobustCommand\ProgStudi[1]{%
   \renewcommand\@progstudi{#1}}%
\newcommand\@tahun{2008}
\DeclareRobustCommand\Tahun[1]{%
   \renewcommand\@tahun{#1}}%
\newcommand\@pbbsatu{}
\newcommand\@pbbdua{}
\newcommand\@pbbtiga{}
\newcommand\@pbbempat{}
\DeclareRobustCommand\Pembimbing[4]{%
   \renewcommand{\@pbbsatu}{#1}%
   \renewcommand{\@pbbdua}{#2}%
   \renewcommand{\@pbbtiga}{#3}%
   \renewcommand{\@pbbempat}{#4}}%
\newcommand\@tanggalsetuju{\today}
\DeclareRobustCommand\TanggalDisetujui[1]{%
   \renewcommand\@tanggalsetuju{#1}}%
\DeclareRobustCommand{\JudulEng}[1]{%
    \newcommand{\@judulEng}{#1}}%

%%%----atur spasi -----------------------------------------------------
\newcommand{\displayskipstretch}{\baselinestretch}

\newcommand{\setstretch}[1]{%
  \def\baselinestretch{#1}%
  \@currsize
}

\newcommand{\SetSinglespace}[1]{%
  \def\setspace@singlespace{#1}%
}
\SetSinglespace{1}
\newcommand{\singlespacing}{%
  \setstretch {\setspace@singlespace}%
  \vskip \baselineskip  %
}
\newcommand{\onehalfspacing}{%
  \setstretch{1.25}%  default
  \ifcase \@ptsize \relax % 10pt
    %\setstretch {1.44}%
    \setstretch {1.3}%
  \or % 11pt
    %\setstretch {1.423}%
    \setstretch {1.275}%
  \or % 12pt
    %\setstretch {1.441}%
    \setstretch {1.31}%
  \fi
}
\newcommand{\doublespacing}{%
  \setstretch {1.667}%  default
  \ifcase \@ptsize \relax % 10pt
    \setstretch {1.667}%
  \or % 11pt
    \setstretch {1.618}%
  \or % 12pt
    \setstretch {1.655}%
  \fi
}

\def\@setsize#1#2#3#4{%
  \@nomath#1%
  \let\@currsize#1%
  \baselineskip #2%
  \baselineskip \baselinestretch\baselineskip
  \parskip \baselinestretch\parskip
  \setbox\strutbox \hbox{%
    \vrule height.7\baselineskip
           depth.3\baselineskip
           width\z@}%
  \skip\footins \baselinestretch\skip\footins
  \normalbaselineskip\baselineskip#3#4}

\let\latex@xfloat=\@xfloat
\def\@xfloat #1[#2]{%
  \latex@xfloat #1[#2]%
  \def\baselinestretch{\setspace@singlespace}%
  \normalsize
}

\long\def\@footnotetext#1{%
  \insert\footins{%
    \def\baselinestretch {\setspace@singlespace}%
    \reset@font\footnotesize
    \interlinepenalty\interfootnotelinepenalty
    \splittopskip\footnotesep
    \splitmaxdepth \dp\strutbox \floatingpenalty \@MM
    \hsize\columnwidth
    \@parboxrestore
    \protected@edef\@currentlabel{%
      \csname p@footnote\endcsname\@thefnmark
    }%
    \color@begingroup
      \@makefntext{%
        \rule\z@\footnotesep\ignorespaces#1\@finalstrut\strutbox}%
    \color@endgroup}}
\everydisplay\expandafter{%
  \the\everydisplay
  \abovedisplayskip \displayskipstretch\abovedisplayskip
  \belowdisplayskip \displayskipstretch\belowdisplayskip
  \abovedisplayshortskip \displayskipstretch\abovedisplayshortskip
  \belowdisplayshortskip \displayskipstretch\belowdisplayshortskip
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%  Halaman Judul                                                                   %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{times}
\newcommand\HalamanJudul{%---------------------------
   \null
  \pagenumbering{roman}
  \thispagestyle{empty}
 %\enlargethispage{1.75\baselineskip}               -==============JARAK BAGIAN BAWAH SAMPUL SETELAH TAHUN   
  \vskip 7.5\p@
  \singlespacing
  \begin{center}%
    {\large\bfseries{\MakeUppercase{\@judul}}\par}%
    \vfill
    {\large\bfseries TUGAS AKHIR} \par
    {%\lineskip .5em%
    \normalsize\bfseries
    Karya tulis sebagai salah satu syarat \\
    untuk memperoleh gelar Sarjana dari \\
    Institut Teknologi Bandung} \par
    \vskip 3.5em%
    {\normalsize\bfseries Oleh}\par
    {\large\bfseries\MakeUppercase{\@nama} \par
     NIM: \@nim \par
     (\@progstudi)}\par
    \vskip 3.5em%
    \includegraphics[height=3.5cm]{LogoITB}\par
    \vskip 3.5em%
    {\large\bfseries
     INSTITUT TEKNOLOGI BANDUNG\par
     \@tahun}
  \end{center}
}
\newcommand{\garis}{\rule{6cm}{0.4pt}}
\RequirePackage{tabularx}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%  Halaman Persetujuan                                                             %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand\HalamanPersetujuan{%-------------------------
  \newpage
  \thispagestyle{plain}
  \phantomsection
  \singlespacing
  \addcontentsline{toc}{chapter}{HALAMAN PENGESAHAN}
  \begin{center}%
    {\large\bfseries{\MakeUppercase{\@judul}}\par}%
    %\vskip2cm
    \vfill
    {\normalsize\normalfont Oleh} \par
    {\bfseries %
     \@nama \\[1ex]
     NIM:\ \@nim \
     \vskip2ex
     \@progstudi\\[1ex]
    Institut Teknologi Bandung} \par
    %\vskip2cm
    \vfill
    Menyetujui \par
    \vskip.5cm
    Pembimbing \par
    \vskip.5cm
    Tanggal \@tanggalsetuju \par
    \ifthenelse{\equal{\@pbbempat}{}\OR\equal{\@pbbempat}{ }}%
    {\ifthenelse{\equal{\@pbbtiga}{}\OR\equal{\@pbbtiga}{ }}%
{\ifthenelse{\equal{\@pbbdua}{}\OR\equal{\@pbbdua}{ }}%
       {\ifthenelse{\equal{\@pbbsatu}{}\OR\equal{\@pbbsatu}{ }}{}%
{\SetujuSatu}%
}%
          {\SetujuDua}%
       }%
       {\SetujuTiga}%
    }
    {\SetujuEmpat}
    \vfill
  \end{center}
}
\newcommand\SetujuSatu{%
    \vskip1.5cm
    \par
    \vskip2.5cm
    \garis\\[.5ex]
    (\@pbbsatu) \par
    \vskip .5cm}
\newcommand\SetujuTiga{%
    \vskip1.5cm
    Pembimbing Pertama \par
    \vskip2.5cm
    \garis\\[.5ex]
    (\@pbbsatu) \par
    \vskip .5cm
    \begin{tabularx}{\textwidth}{cXc}
    Pembimbing Kedua  && Pembimbing Ketiga \\
    \rule{0pt}{2.5cm}
    \garis && \garis\\[.5ex]
    (\@pbbdua)&&(\@pbbtiga)
    \end{tabularx}}
\newcommand\SetujuDua{%
    \vskip1.5cm
    \vskip .5cm
    \begin{tabularx}{\textwidth}{cXc}
    Pembimbing Pertama && Pembimbing Kedua \\
    \rule{0pt}{2.5cm}\\
    \garis && \garis\\[.5ex]
    (\@pbbsatu)&&(\@pbbdua)
    \end{tabularx}}
\newcommand\SetujuEmpat{%
    \vskip1cm
    \begin{tabularx}{\textwidth}{cXc}
    Pembimbing Pertama && Pembimbing Kedua \\
    \rule{0pt}{2.5cm}\\
    \garis && \garis\\[.5ex]
    (\@pbbsatu)&&(\@pbbdua)\\[7ex]
    Pembimbing Ketiga && Pembimbing Keempat \\
    \rule{0pt}{2.5cm}\\
    \garis && \garis\\[.5ex]
    (\@pbbtiga)&&(\@pbbempat)
    \end{tabularx}}


\renewcommand\thechapter {\@Roman\c@chapter}
\renewcommand\thesection {\thechapter.\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection .\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
\renewcommand\theequation{\@arabic\c@chapter.\@arabic\c@equation}

\RequirePackage{tabu}
\newcommand{\katakunci}[1]{%
\begin{tabu} to \textwidth{@{}lX@{}}
Kata kunci: & #1
\end{tabu}}

\newcommand{\keywords}[1]{%
\begin{tabularx}{\textwidth}{@{}lX@{}}
Keywords: & \textit{#1}
\end{tabularx}}

\newenvironment{Abstrak}{%-------------------------------
  \clearpage
  \phantomsection
  \singlespacing
  \setlength{\parskip}{1em}
  \pagenumbering{roman}
  \setcounter{page}{2}
  \date{\today}
  \addcontentsline{toc}{chapter}{ABSTRAK}
  \null
  \vskip 2em%
  \begin{center}%
    \normalsize\bfseries ABSTRAK \par
    \vskip 2ex%
    {\large\bfseries{\MakeUppercase{\@judul}} \par}%
    \vskip 2ex%
    {\normalfont\normalsize Oleh} \par%
    \@nama%
    \par
    NIM: \@nim
    \par
    \vskip1em
  \end{center}%
  \par
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%  Halaman Abstrak                                                                 %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newenvironment{Abstract}{%------------------------------
  \clearpage
  \singlespacing
  \phantomsection
  \setlength{\parskip}{1em}
  \addcontentsline{toc}{chapter}{\emph{ABSTRACT}}
  \null
  \vskip 2em%
  \begin{center}%
    \normalsize\bfseries ABSTRACT \par
    \vskip 2ex%
    {\large\bfseries{\MakeUppercase{\@judulEng}} \par}%
    \vskip 2ex%
    {\normalfont\normalsize by} \par%
    \@nama%
    \par
    NIM: \@nim
    \par
    \vskip1em
  \end{center}%
  \begin{em}
  \par
}
{\end{em}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%  Halaman Persembahan                                                             %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newenvironment{persembahan}{%-----------------------------
 \newpage
 \onehalfspacing
 \addcontentsline{toc}{chapter}{HALAMAN PERUNTUKAN}
 \null
 \vfill
 %\phantomsection
 \begin{center}
    \itshape}{%
 \end{center}
 \vfill
 \null
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%  Halaman Kata Pengantar                                                          %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\trmkasih}{KATA PENGANTAR}
\newenvironment{terimakasih}{%-----------------------------
  \newpage\addcontentsline{toc}{chapter}{\trmkasih}
  \onehalfspacing
  %\phantomsection
  \begin{center}
    {\large\bfseries \trmkasih}
  \end{center}
\vskip1em
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%  Pedoman Penggunaan Tugas Akhir                                               %%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% My citation
\newcommand{\sitasisaya}{%
    \begin{itemize}[label={},itemindent=-4em,leftmargin=4em]
    \singlespacing
    \item Rofi, S. (\@tahun): \emph{\@judul}, Tugas Akhir Program Sarjana, Institut Teknologi Bandung.
    \end{itemize}
}
\newcommand{\mycitation}{%
    \begin{itemize}[label={},itemindent=-4em,leftmargin=4em]
    \singlespacing
    \item Rofi, S. (\@tahun): \emph{\@judulEng},  Final Project of Bachelor's Program, Institut Teknologi Bandung.
    \end{itemize}
}
\newenvironment{pedoman}{%-----------------------------
  \newpage\addcontentsline{toc}{chapter}{PEDOMAN PENGGUNAAN TUGAS AKHIR}
  \onehalfspacing
  \begin{center}
    {\large\bfseries PEDOMAN PENGGUNAAN TUGAS AKHIR}
  \end{center}
\vskip2em
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%  Halaman Riwayat Hidup                                                           %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newenvironment{riwayathidup}{%----------------------------
 \newpage
 \addcontentsline{toc}{chapter}{RIWAYAT HIDUP}
 \onehalfspacing
 \phantomsection
 \begin{center}
    \large\bfseries RIWAYAT HIDUP \end{center}
\vskip2em
}

\RequirePackage[hmargin={4cm,3cm},vmargin={3cm,1.5cm},includefoot]{geometry}
\RequirePackage{graphicx}
\RequirePackage{parskip}
\RequirePackage{amssymb}
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amsfonts}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Pengaturan Jenis Font -----------------------------------------------------------%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%---menentukan jenis font yang digunakan--------
\RequirePackage{times}
\RequirePackage{mathrsfs}
\RequirePackage[scaled=.90]{helvet}
%%---mengatur jarak dalam list -----------
\RequirePackage{enumitem}
\setlist{labelindent=\parindent,itemsep=-2ex,%
         leftmargin=*,topsep=-1ex}
%
\setcounter{tocdepth}{1}
\newcommand{\DaftarIsi}{%---------------------
    \clearpage
    \pagestyle{plain}
    \addcontentsline{toc}{chapter}{DAFTAR ISI}
    \singlespacing
    \phantomsection
    \tableofcontents}
%%%================================TAMBAHAN UNTUK GENERATE LIST OF APPENDICES=====================%%%%
\RequirePackage[titles]{tocloft}
\newcommand{\listappendicesname}{\vskip -1.2cm{DAFTAR LAMPIRAN}}
\newlistof{appendices}{lam}{\listappendicesname}
\setcounter{lamdepth}{2}

\renewcommand{\theappendices}{\Alph{appendices}}
\renewcommand{\cftappendicespresnum}{Lampiran\space}
\setlength{\cftbeforeappendicesskip}{\baselineskip}
\setlength{\cftappendicesnumwidth}{1in}

\newlistentry[appendices]{subappendix}{lam}{1}
\renewcommand{\thesubappendix}{\theappendices.\arabic{subappendix}}
\setlength{\cftsubappendixnumwidth}{1cm}
\setlength{\cftsubappendixindent}{1in}

\RequirePackage{array}
\newcommand{\myappendix}[1]{%
    \newpage
  \refstepcounter{appendices}%
  %\chapter*{Lampiran \space \theappendices\space #1}%
  \begin{tabular}{l p{10cm}}
   \large\bfseries Lampiran \space \theappendices   & \large\bfseries #1%
  \end{tabular}
  \addcontentsline{lam}{appendices}{\protect\numberline{\theappendices}#1}%
  \par
}

\newcommand{\subappendix}[1]{%
  \refstepcounter{subappendix}%
  %\section*{\thesubappendix\space #1}%
  \begin{tabular}{l p{8cm}}
   \normalsize \bfseries \thesubappendix    & \normalsize \bfseries #1
  \end{tabular}
  \addcontentsline{lam}{subappendix}{\protect\numberline{\thesubappendix}#1}%
  \par
}

\newcommand{\DaftarLampiran}{%--------------------
    \clearpage
    \pagestyle{plain}
    \singlespacing
    \phantomsection
    \addcontentsline{toc}{chapter}{DAFTAR LAMPIRAN}
    %\vspace*{2.5em}
    \phantomsection
    %\centerline{\Large\bfseries DAFTAR LAMPIRAN}
    \vspace{1.5cm}
    \listofappendices}
%\renewcommand*\l@chapter{\@dottedtocline{1}{0.4em}{7.35em}}
%%%======================================================================================%%%%
\newcommand{\DaftarGambar}{%----------------------
    \clearpage
    \singlespacing
    \phantomsection
    \addcontentsline{toc}{chapter}{DAFTAR GAMBAR}
    \listoffigures}
\renewcommand*\l@figure{\@dottedtocline{1}{1.5em}{7.35em}}
\newcommand{\DaftarTabel}{%----------------------
    \clearpage
    \singlespacing
    \phantomsection
    \addcontentsline{toc}{chapter}{DAFTAR TABEL}
    \listoftables}
\renewcommand*\l@table{\@dottedtocline{1}{1.5em}{6em}}
\RequirePackage{ifthen}

\newcommand\MulaiIsiSkripsi{%
    \label{halakhirR}
    \addtocontents{toc}{\protect{\vspace*{1ex}}}
    \clearpage
    \onehalfspacing
    \pagenumbering{arabic}
    \setcounter{page}{1}
}
\RequirePackage[toc]{appendix}
\newenvironment{Lampiran}{%-----------------------------------
    \begin{appendices}
    \part{\appendixtocname}
    }{%
    \end{appendices}
    }
    
\renewcommand\part{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \thispagestyle{empty}%------
  \if@twocolumn
    \onecolumn
    \@tempswatrue
  \else
    \@tempswafalse
  \fi
  \null\vspace*{\fill} 
  \secdef\@part\@spart}

\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}%
    \fi
    \markboth{}{}%
    {
    \centering
     \interlinepenalty \@M
     \normalfont
     \Huge \bfseries \MakeUppercase{#2}\par
     \vspace*{\fill}
     %\addcontentsline{toc}{chapter}{\MakeUppercase{#2}}
    }%
    \@endpart}

\renewcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{plain}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}
\gdef\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                       \if@mainmatter
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}%
                                   {\protect\numberline{\@chapapp\space\thechapter}#1}%
                       \else
                         \addcontentsline{lam}{chapter}{\protect\numberline{\@chapapp\space\thechapter}#1}\par%
                       \fi
                    \else
                      \addcontentsline{toc}{chapter}{\protect\addvspace{1\p@}#1}%
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
                    \fi}
\gdef\@makechapterhead#1{%
  \vspace*{5\p@}%
  {\parindent \z@ \centering\normalfont
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
        \Large\bfseries \@chapapp\space \thechapter\hskip 1em
      \fi
    \fi
    \Large\bfseries #1\par\nobreak
    \vskip 40\p@
  }}
\gdef\@schapter#1{\@makeschapterhead{#1}%
                 \@afterheading
                 }
\gdef\@makeschapterhead#1{%
  \vspace*{5\p@}%
  {\parindent \z@ \centering
    \normalfont
    \interlinepenalty\@M
    \Large\bfseries  #1\par\nobreak
    \vskip 40\p@
}}
\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-1.5ex \@plus -1ex \@minus -.2ex}%
                                   {.01ex \@plus.2ex}%
                                   {\normalfont\large\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-1.5ex\@plus -1ex \@minus -.2ex}%
                                     {.01ex \@plus .2ex}%
                                     {\normalfont\normalsize\bfseries}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-.25ex\@plus -1ex \@minus -.2ex}%
                                     {.01ex \@plus.2ex}%
                                     {\normalfont\normalsize\bfseries}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {.25ex \@plus1ex \@minus.2ex}%
                                    {-1.5em}%
                                    {\normalfont\normalsize\bfseries}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                    {.25ex \@plus1ex \@minus .2ex}%
                                    {0.1ex \@plus 0ex \@minus 1ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\bfseries}}
\renewcommand \thefigure
     {\ifnum \c@chapter>\z@ \figurename\ \thechapter.\fi \@arabic\c@figure}
\def\fnum@figure{\nobreakspace\thefigure}
\renewcommand \thetable
     {\ifnum \c@chapter>\z@ \tablename\ \thechapter.\else \tablename\ \theappendices.\fi \@arabic\c@table}
\def\fnum@table{\nobreakspace\thetable}

\renewcommand\@dotsep{3}
\renewcommand\tableofcontents{%
      \@restonecolfalse
    \chapter*{\contentsname
        \@mkboth{}{}}%
    \@starttoc{toc}%
    }
\renewcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 0.5em \@plus\p@
    \setlength\@tempdima{4em}%
    \begingroup
                                                                        %\@dottedtocline{1}{4em}{2.75em}%TAMBAH TITIK BANYAK
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode %\bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\dotfill \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      %#1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}
\renewcommand*\l@section{\@dottedtocline{1}{4em}{2.75em}}
\renewcommand*\l@subsection{\@dottedtocline{2}{6.85em}{3.2em}}
\renewcommand*\l@subsubsection{\@dottedtocline{3}{8.0em}{4.1em}}
\renewcommand*\l@paragraph{\@dottedtocline{4}{10em}{5em}}
\renewcommand*\l@subparagraph{\@dottedtocline{5}{12em}{6em}}
\RequirePackage{makeidx}
\makeindex
\newcommand{\TulisIndeks}{%
    \newpage
    %\small
    \singlespacing
    \addtocontents{toc}{\protect{\vspace*{1ex}}}
    \addcontentsline{toc}{chapter}{Index}
    \printindex
}

%%%------------- PENYESUAIAN ISTILAH ---------------------------
\renewcommand\contentsname{\vskip -1.2cm{DAFTAR ISI}}
\renewcommand\listfigurename{\vskip -1.2cm{DAFTAR GAMBAR}}
\renewcommand\listtablename{\vskip -1.2cm{DAFTAR TABEL}}
\renewcommand\bibname{\vskip -1.2cm{DAFTAR PUSTAKA}}
\renewcommand\indexname{INDEKS}
\renewcommand\figurename{Gambar}
\renewcommand\tablename{Tabel}
\renewcommand\chaptername{Bab}
\renewcommand\appendixname{Lampiran}
\renewcommand\appendixtocname{LAMPIRAN}
%\renewcommand{\seename}{\textit{lihat:}}%-------untuk indeks
%\renewcommand{\proofname}{\textit{\textbf{Bukti.}}}%---bukti teorema dlsb


%\def\contentsname{Daftar Isi}
%%\def\abstractname{Abstrak}
%\def\figurename{Gambar}
%\def\tablename{Tabel}
%\def\indexname{Indeks}
%\def\refname{Daftar Pustaka}
%\def\chaptername{Bab}
%\def\listoftablesname{Daftar Tabel}
%\def\listoffiguresname{Daftar Gambar}

%%%-----------setting perujukan dan daftar pustaka----------------
\RequirePackage[abbr]{itbbib}
\citationstyle{itbbib}
\renewcommand{\harvardand}{dan}
\newcommand\DaftarPustaka[1]{%
    \clearpage
    \singlespacing
    \setlength{\parskip}{1ex}
    \addcontentsline{toc}{chapter}{DAFTAR PUSTAKA}
    \bibliographystyle{itbbib}
    \bibliography{#1}
}%%%--------------------------------------------------------------
\RequirePackage{totpages}%------hanya untuk rekap; bisa dihilangkan
\RequirePackage{datetime}
\newcommand\rekap{%
    \newpage
    \setcounter{page}{\value{page}-1}\label{halakhirA}
    \thispagestyle{empty}
    \null
    \par
    \dotfill\par
    \textbf{Info cetak .....}\par
    Revisi/cetak terakhir: \today, pukul \currenttime \par
    Nomor halaman: i--\pageref{halakhirR},\quad%
                   1--\pageref{halakhirA} \qquad
    Total: \theTotPages\ halaman\par
   \dotfill\par
}
\AtEndDocument{\rekap}%------akhir rekap-----------

\def\today{\number\day\space\ifcase\month\or
 Januari\or Februari\or Maret\or April\or Mei\or Juni\or
 Juli\or Agustus\or September\or Oktober\or November\or Desember\fi
 \space \number\year}

    \setlength\columnsep{10\p@}
    \setlength\columnseprule{0\p@}
    \lefthyphenmin=5
    \righthyphenmin=5
    \pagestyle{plain}
    \pagenumbering{arabic}
    \belowcaptionskip=1ex
    \sloppy
    \onehalfspacing
    %\setlength{\parskip}{1em}
%
%-------menyesuaikan paragraf-----------------------------
\parskip=0.65\baselineskip \advance\parskip by 0pt plus 2pt
\parindent=\z@
   \parsep = \parskip
   %\itemsep = \z@ % add nothing to \parskip between items
   %\topsep = \z@ % add nothing to \parskip before first item

\def\@listI{\leftmargin\leftmargini
   \topsep\z@ \parsep\parskip \itemsep\z@}
\let\@listi\@listI
\@listi

\def\@listii{\leftmargin\leftmarginii
   \labelwidth\leftmarginii\advance\labelwidth-\labelsep
   \topsep\z@ \parsep\parskip \itemsep\z@}
\def\@listiii{\leftmargin\leftmarginiii
    \labelwidth\leftmarginiii\advance\labelwidth-\labelsep
    \topsep\z@ \parsep\parskip \itemsep\z@}
\partopsep=\z@

\@ifundefined{CheckCommand}{}{%
  \CheckCommand*{\@starttoc}[1]{%
    \begingroup
      \makeatletter
      \@input{\jobname.#1}%
      \if@filesw
        \expandafter\newwrite\csname tf@#1\endcsname
        \immediate\openout \csname tf@#1\endcsname \jobname.#1\relax
      \fi
      \@nobreakfalse
    \endgroup}}

\renewcommand*{\@starttoc}[1]{%
  \begingroup
    \makeatletter
    \parskip\z@
    \@input{\jobname.#1}%
    \if@filesw
      \expandafter\newwrite\csname tf@#1\endcsname
      \immediate\openout \csname tf@#1\endcsname \jobname.#1\relax
    \fi
    \@nobreakfalse
  \endgroup
}
\endinput
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%  End of 'skripsi.cls'.                                                         %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


