% rapport.cls -
%
% Copyright (C) 2004 - François Sarradin
%

\ProvidesClass{rapport-thesis}

\LoadClass[12pt,a4paper]{article}
\ProcessOptions

\RequirePackage[latin1]{inputenc}
\RequirePackage[T1]{fontenc}
%\RequirePackage[french]{babel}
%\RequirePackage{times}
\RequirePackage{picinpar}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{bbm}
\RequirePackage{epsfig}
\RequirePackage{color}
\RequirePackage{float}
%\RequirePackage{doublespace}

\parskip6pt

\sloppy

%%

\def\subtitle#1{\gdef\@subtitle{#1}}
\def\@subtitle{}
\def\laboratory#1{\gdef\@laboratory{#1}}
\def\@laboratory{}

\renewcommand{\maketitle}{
  \begin{center}
  {\fontsize{26}{0}\selectfont \@title} \par
  \vspace*{12pt}
  \textsc{\large \@author} \par
  \vspace*{6pt}
  \emph{Rapport de recherche du \@date} \par
  \vspace*{6pt}
  \textsc{\footnotesize \@laboratory}
  \end{center}
  \vspace*{24pt}}

\newcommand{\makeheader}{\maketitle}

%%

% part
\def\part{%
  \clearpage
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \thispagestyle{empty}
  \secdef\@part\@spart}
\def\@part[#1]#2{%
  \ifnum \c@secnumdepth >-2\relax
    \refstepcounter{part}%
    \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
  \else
    \addcontentsline{toc}{part}{#1}%
  \fi
  \markboth{}{}%
  {\parindent=0pt%
    {\LARGE\textsc{\partname}}\par%
    \vskip0pt plus 1fill%
    {\fontsize{29.86}{0pt}\bfseries #2}\par}
  \vskip0pt plus 1fill%
  \@endpart}
\def\@spart#1{%
  \vfil%
  {\fontsize{29.86}{0pt}\bfseries #1}\par
  \vfil%
  \@endpart}
\def\@endpart{%
  \newpage}

% section
\renewcommand\sectionmark[1]{
  \markright{\textsl{\footnotesize\rmfamily\thesection. \ #1}}}

\renewcommand{\section}{\@startsection{section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\normalfont\Large\bfseries\em}}
\renewcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\large\bfseries\em}}
\renewcommand{\subsubsection}{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\normalsize\bfseries\em}}
\renewcommand{\paragraph}{\@startsection{paragraph}{4}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\bfseries}}
\renewcommand{\subparagraph}{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\normalfont\normalsize\bfseries}}


%%

\newenvironment{intropar}[1]%
  {\begin{window}[0,l,{\fontsize{36}{0pt}\bfseries #1\kern-.2em},{}]
    \noindent}%
  {\end{window}}

\newenvironment{nota}%
  {\par\noindent\hrulefill\par\nobreak%
   \noindent\bgroup%
   \small%
   \parbox{.15\linewidth}{NOTE}\quad
   \begin{minipage}{.75\linewidth}}%
  {\end{minipage}\egroup%
   \par\nobreak\noindent\hrulefill\par}

\newenvironment{preuve}%
  {\noindent\bgroup%
   \footnotesize%
   \textsc{Preuve.}\quad}%
  {\egroup\hfill{$\square$}\par}

\newenvironment{reflexion}%
  {\begin{flushright}%
   \begin{minipage}{.5\linewidth}%
   \footnotesize}%
  {\end{minipage}%
   \end{flushright}%
   \vskip12pt}

\definecolor{commentcolor}{rgb}{0.0,0.5,0.0}
\newenvironment{comment}%
  {\par\vskip12pt%
   \noindent\bgroup\em%
   \color{commentcolor}
   \textsc{[Commentaire]}\par%
  }%
  {\egroup%
   \par\vskip12pt}

\itemsep6pt

\floatstyle{ruled}
\newfloat{algorithm}{hp}{aoc}
\floatname{algorithm}{Algorithme}

\newtheorem{definition}{D\'efinition}
\newtheorem{theorem}{Th\'eor\`eme}
\newtheorem{lemme}{Lemme}

\newcommand{\pgcd}{\operatorname{pgcd}}
\newcommand{\doubt}{(\string?)}
\newcommand{\ident}[1]{\textbf{#1}}

\endinput

% End
