%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% MWBook: LaTeX Class
% A simple book template based on
% 1) The memoir class
% 2) The daleif1 chapter style in the memoir manual
% 3) Ramon van Handel's lecture notes at
%    https://www.princeton.edu/~rvan/acm217/ACM217.pdf
% 4) Various tex.stackexchange postings
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\fileversion{0.0}
\def\filedate{2015/11/07}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mwbook}[\filedate\space Version \fileversion\space by Michael Weylandt]

\LoadClass[oneside,openany]{memoir}

%% Default packages
\RequirePackage[utf8]{inputenc}
\RequirePackage[english]{isodate}
\isodate

\RequirePackage{geometry}
\geometry{margin=1.5in}

\RequirePackage{algorithmic}
\RequirePackage{amsfonts}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{calc}
\RequirePackage{caption}
\RequirePackage{datetime}
\RequirePackage{enumerate}
\RequirePackage{epstopdf}
\RequirePackage{etoolbox}
\RequirePackage{float}
\RequirePackage{graphicx}
\RequirePackage{hyperref}
\RequirePackage[all]{hypcap} %% Must follow hyperref
\RequirePackage{lettrine}
\RequirePackage{lipsum}
\RequirePackage[bitstream-charter]{mathdesign}
\RequirePackage{multicol}
\RequirePackage{mathrsfs}
\RequirePackage{soul}
\RequirePackage{xcolor}
\RequirePackage{footnotebackref}

% Make footnotebackref work with Memoir
% http://tex.stackexchange.com/a/116398
\makeatletter
    \renewcommand\@makefntext[1]{%
        \let\BHFN@thefnmark\@thefnmark
        \renewcommand\@thefnmark{\hyperref[\BackrefFootnoteTag]{\BHFN@thefnmark}}%
        \BHFN@OldMakefntext{#1}}%
\makeatother


%% Useful color definitions
\definecolor{navyblue}{HTML}{006EB8}
\definecolor{royalblue}{HTML}{0071BC}
\definecolor{forestgreen}{HTML}{0095BB}
\definecolor{darkred}{rgb}{.647,.129,.149}
\definecolor{riceblue}{RGB}{0,36,106}
\definecolor{ricegrey}{RGB}{94,96,98}

\colorlet{themecolor}{darkred}

%% Default link set-ups
\hypersetup{colorlinks=false,
            linkcolor=navyblue,
            urlcolor=royalblue,
            citecolor=forestgreen}

%% Exercises, problems, theorems, etc (numbered chapter-wise)
\theoremstyle{definition}
\newtheorem{exercise}{Exercise}[chapter]
\newtheorem{problem}{Problem}[chapter]

%% Page layout options
\nonzeroparskip
\setlength{\parindent}{0pt}

\nouppercaseheads
\makepagestyle{mwstyle}

\makeevenhead{mwstyle}{\bfseries\leftmark}{}{\bfseries\thepage}
\makeoddhead{mwstyle}{\bfseries\leftmark}{}{\bfseries\thepage}
\makeevenfoot{mwstyle}{}{}{}
\makeoddfoot{mwstyle}{}{}{}
\makeatletter
\makepsmarks{mwstyle}{%
  \createmark{section}{left}{shownumber}{Section\ }{.\ }}
\makeatother
\makeheadrule{mwstyle}{\textwidth}{\normalrulethickness}
\makepagestyle{plain}
\makerunningwidth{plain}{\headwidth}
\makeevenfoot{plain}{}{}{}
\makeoddfoot{plain}{}{}{}

\pagestyle{mwstyle}

\makeatletter
\setlength{\evensidemargin}{\oddsidemargin}
\newsavebox{\feline@chapter}
\newcommand\feline@chapter@marker[1][4cm]{%
  \sbox\feline@chapter{%
    \resizebox{!}{#1}{\fboxsep=1pt%
      \colorbox{themecolor}{\color{white}\bfseries\thechapter}%
    }}%
  \rotatebox{90}{%
    \resizebox{%
      \heightof{\usebox{\feline@chapter}}+\depthof{\usebox{\feline@chapter}}}%
    {!}{\scshape\@chapapp}}\quad%
  \raisebox{\depthof{\usebox{\feline@chapter}}}{\usebox{\feline@chapter}}%
}
\newcommand\feline@chm[1][4cm]{%
  \sbox\feline@chapter{\feline@chapter@marker[#1]}%
  \makebox[0pt][l]{% aka \rlap
    \makebox[18cm][r]{\usebox\feline@chapter}%
  }}

\makechapterstyle{daleif1}{
  \renewcommand\chapnamefont{\normalfont\Large\scshape\raggedleft}
  \renewcommand\chaptitlefont{\normalfont\huge\scshape\color{themecolor}}
  \renewcommand\chapternamenum{}
  \renewcommand\printchaptername{\color{black}}
  \renewcommand\printchapternum{\feline@chm[2.5cm]} % taille de la box
  \setlength\beforechapskip{-1cm}
  \renewcommand\afterchapternum{\par\vskip\midchapskip}
  \renewcommand\printchaptertitle[1]{%
    \chaptitlefont\raggedleft
    {\normalfont\itshape\currentparttitle}##1\par}
}

\renewcommand{\printparttitle}[1]{%
  \gdef\currentparttitle{#1\\}%
  \parttitlefont{#1}%
}

\newcommand{\resetparttitle}{\gdef\currentparttitle{\strut}}
\resetparttitle

\makeatother
\chapterstyle{daleif1}

%% Useful default commands
\newcommand{\E}{\mathbb{E}}
\newcommand{\F}{\mathscr{F}}
\newcommand{\C}{\mathbb{C}}
\newcommand{\R}{\mathbb{R}}
\newcommand{\N}{\mathbb{N}}
\renewcommand{\P}{\mathbb{P}}
\newcommand{\Q}{\mathbb{Q}}
\renewcommand{\S}{\mathcal{S}}
\newcommand{\Power}{\mathscr{P}}

\DeclareMathOperator{\Cov}{Cov}
\DeclareMathOperator{\Var}{Var}
\DeclareMathOperator{\maximize}{maximize}
\DeclareMathOperator{\minimize}{minimize}
\DeclareMathOperator{\argmin}{arg\,min}
\DeclareMathOperator{\argmax}{arg\,max}
\DeclareMathOperator{\subto}{subject\,to}
\DeclareMathOperator{\Tr}{Tr}
\DeclareMathOperator{\rank}{rank}

\newcommand{\deq}{\buildrel{\text{d}}\over{=}}
\newcommand{\toAS}{\buildrel{\text{a.s.}}\over{\to}}
\newcommand{\toP}{\buildrel{\text{P}}\over{\to}}
\newcommand{\toD}{\buildrel{\text{D}}\over{\to}}

\newcommand{\dif}[1]{\,\mathrm{d}#1}
\newcommand{\indep}{\perp\!\!\!\perp}
\newcommand{\notindep}{\cancel{\perp\!\!\!\perp}}

\newcommand{\iid}{\text{i.i.d.}}
\newcommand{\simiid}{\buildrel{\iid}\over{\sim}}
\newcommand{\simP}{\buildrel{\P}\over{\sim}}
\newcommand{\simQ}{\buildrel{\Q}\over{\sim}}
\newcommand\numberthis{\stepcounter{equation}\tag{\theequation}}

%%%%%%%%%% Required Variables %%%%%%%%%%%%%%%%%%
%% Also required: author, date
\makeatletter

\def\authoremail#1{\def\@authoremail{#1}}
\newcommand{\printauthoremail}{\@authoremail}

\def\license#1{\def\@license{#1}}
\newcommand{\printlicense}{\@license}

\def\licenseurl#1{\def\@licenseurl{#1}}
\newcommand{\printlicenseurl}{\@licenseurl}

\def\prefmore#1{\def\@prefmore{#1}}
\newcommand{\printprefmore}{\@prefmore}

\makeatother

%% default value
\prefmore{}

%% Title page setup
\pretitle{\begin{center}\color{themecolor}\Huge\scshape}
\posttitle{\color{black}\Large\end{center}}
\preauthor{\begin{center}\LARGE\href{mailto:\printauthoremail}}
\postauthor{\end{center}}
\predate{\normalfont\vfill\begin{center}\large}
\postdate{\\License: \href{\printlicenseurl}{\printlicense}\end{center}}

\chapterstyle{daleif1}

\newcommand{\unnumberedchapter}[1]{\chapter*{#1}\addcontentsline{toc}{chapter}{#1}}
\makeatletter
\newcommand{\signpreface}{\vfill\@author\\%
  \href{mailto:\printauthoremail}{\printauthoremail}\\%
  \printprefmore\\%
  These notes are made available under the terms of the %
  \href{\printlicenseurl}{\printlicense} License \vfill}
\makeatother
