%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% MWHW: LaTeX Class
% A simple homework template based on
% http://www.latextemplates.com/template/short-sectioned-assignment
%
% Converted to a cls patterned on Philip Hirschhorn's
% exam.cls by Michael Weylandt
%
% License:
% CC BY-NC-SA 3.0 (http://creativecommons.org/licenses/by-nc-sa/3.0/)
% (inheriting from upstream)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\fileversion{0.0}
\def\filedate{2015/08/29}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mwhw}[\filedate\space Version \fileversion\space by Michael Weylandt]

% This class is based on the scrartcl class
\LoadClass[fontsize=10pt,paper=letter]{scrartcl}

\RequirePackage{enumerate}
\RequirePackage{palatino}
\RequirePackage[english]{babel}
\RequirePackage{sectsty}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amsthm}
\RequirePackage{fancyhdr}
\RequirePackage{tcolorbox}
\RequirePackage{mathrsfs}
\RequirePackage{geometry}
\RequirePackage{xcolor}
\RequirePackage{hyperref}
\RequirePackage[all]{hypcap}
%%%%%%%%
% Required variables
% - Class ID: e.g., STAT 100
% - Class Name: e.g., Introduction to Statistics
% - Instructor: e.g., R.A. Fisher
% - Institution: e.g., Princeton University
% - Term: e.g., 2015-2016, Fall
% - Assignment: e.g., Homework \#1
%
% Additionally, we use the
% - author (student name)
% - date (due date)
% from standard classes
%%%%%%%

\def\courseid#1{\def\@courseid{#1}}
\newcommand{\printcourseid}{\@courseid}

\def\coursename#1{\def\@coursename{#1}}
\newcommand{\printcoursename}{\@coursename}

\newcommand{\printcourse}{\printcourseid:\space\printcoursename}

\def\instructor#1{\def\@instructor{#1}}
\newcommand{\printinstructor}{\@instructor}

\def\institution#1{\def\@institution{#1}}
\newcommand{\printinstitution}{\@institution}

\def\term#1{\def\@term{#1}}
\newcommand{\printterm}{\@term}

\def\assignment#1{\def\@assignment{#1}}
\newcommand{\printassignment}{\@assignment}

%%%%%%%% Configuration

\geometry{margin=1in}
\definecolor{navyblue}{HTML}{006EB8}
\definecolor{royalblue}{HTML}{0071BC}
\definecolor{forestgreen}{HTML}{0095BB}
\hypersetup{
  colorlinks=false,
  linkcolor=navyblue,
  urlcolor=royalblue,
  citecolor=forestgreen
}

%Add \scshape for small caps section titles
\allsectionsfont{\centering \normalfont}

\pagestyle{fancy}
\fancyhead[L]{\textsc{\small\printcourse\\\printinstructor\normalsize}}
\fancyhead[R]{\textsc{\small\printterm\\\printinstitution\normalsize}}
\fancyfoot[L]{\textsc{\printassignment\\\makeatletter\@author\makeatother}}
\fancyfoot[R]{\textsc{Page \thepage\ of \pageref{LastPage}}}
\fancyfoot[C]{}

\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\footrulewidth}{0.5pt}
\setlength{\headheight}{13.6pt}

\numberwithin{equation}{section}
\numberwithin{figure}{section}
\numberwithin{table}{section}

\setlength\parindent{0pt}

\title{%
\normalfont%
\textsc{\huge\printassignment}\\[15pt]%
\textsc{\large\printcourse\\\printterm\\\printinstructor\\\printinstitution}\\[15pt]%
\normalfont%
}

\newenvironment{problem}{\begin{tcolorbox}}{\end{tcolorbox}}

\newcommand{\nextproblem}[1][Problem \arabic{section}]{\stepcounter{section}\section*{#1}}

\newcommand{\E}{\mathbb{E}}
\newcommand{\R}{\mathbb{R}}
\newcommand{\N}{\mathbb{N}}
\renewcommand{\P}{\mathbb{P}}
\newcommand{\Power}{\mathscr{P}}
\renewcommand{\S}{\mathcal{S}}
\newcommand{\F}{\mathscr{F}}
\DeclareMathOperator{\Cov}{Cov}
\DeclareMathOperator{\Var}{Var}

\renewcommand{\tableofcontents}{}
