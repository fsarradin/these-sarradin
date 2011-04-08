% fs-thesis.cls -
%
% Copyright (C) 2002, 2003 - François Sarradin
%

\ProvidesClass{fs-thesis}

\LoadClass[a4paper,12pt]{book}
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

\def\contentsname{\textbf{\rmfamily Table des mati\`eres}}
\def\listfigurename{\textbf{\rmfamily Table des figures}}
\def\fnum@figure{\small\textbf{Figure\nobreakspace\thefigure}}
\def\fnum@table{\textbf{Tableau\nobreakspace\thetable}}
\parskip6pt

\sloppy

%%

\def\subtitle#1{\gdef\@subtitle{#1}}
\def\@subtitle{}
\def\jury#1{\gdef\@jury{#1}}
\def\@jury{}
\def\university#1{\gdef\@university{#1}}
\def\@university{}
\def\doctschool#1{\gdef\@doctschool{#1}}
\def\@doctschool{}
\def\speciality#1{\gdef\@speciality{#1}}
\def\@speciality{}
%\def\year#1{\gdef\@year{#1}}
%\def\@year{}
\def\laboratory#1{\gdef\@laboratory{#1}}
\def\@laboratory{}
\def\supervisor#1{\gdef\@supervisor{#1}}
\def\@supervisor{}
\def\coordinator#1{\gdef\@coordinator{--- {Co-encadrant:}\ #1}}
\def\@coordinator{}

\renewcommand\maketitle{
  \thispagestyle{empty}
  \begin{center}
    \parskip0pt
    \textbf{\MakeUppercase{Universit\'e de Nantes}\hfill \'Ecole
    polytechnique de l'Universit\'e de Nantes}\par\vskip24pt
%
    \MakeUppercase{\'Ecole doctorale}\par\vskip6pt
    {M\'ecanique, Thermique et G\'enie Civil}\par\vskip6pt
    \MakeUppercase{de Nantes}\par\vskip12pt
%
    {Ann\'ee 2004}\par\vskip12pt
%
    {Th\`ese de \textbf{\MakeUppercase{DOCTORAT}}}\par\vskip12pt
%
    {Discipline: Sciences pour l'ingénieur}\par\vskip6pt
    {Sp\'ecialit\'e: Ambiances architecturales et urbaines}\par\vskip12pt
%
    {pr\'esent\'ee et soutenue publiquement par}\vskip12pt
    \textbf{\large \@author}\par\vskip12pt
    %{Le \@date \@year}\par
    {le \@date}\par
    {\`a Nantes}\par\vskip12pt
%
    {\large \MakeUppercase{\@title}}\par\vskip3pt
    {\MakeUppercase{\@subtitle}}\par
    \vspace*{\stretch{1}}
    {Jury:}\par
    {\@jury}\par
  \end{center}
  \vspace*{\stretch{1}}
  \bgroup\parindent0pt\parskip0pt
    {Directeur de th\`ese:}\  \@supervisor{} \par
    \vspace*{3pt}
%    {Co-encadrant: } \par
%    \@coordinator{} \par
    \parbox{.67\linewidth}{\small {Laboratoire:}\ {\@laboratory}}%\par
    \hfill
    {N°~ED~0367-\hspace*{2em}}\par
  \egroup
  \newpage
  \thispagestyle{empty}
%}
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    \vspace*{\stretch{2}}
    \textbf{\fontsize{28}{0}\selectfont\@title} \par
    \vspace*{12pt}
    \emph{\LARGE\fontfamily{ppl}\selectfont\@subtitle}\par
    \vspace*{\stretch{2}}
    \textbf{\large\@author}\par
    \vspace*{\stretch{3}}
    {\large\@university}\par
  \end{center}
  \newpage
  \vspace*{\stretch{1}}
  \begin{minipage}{.33\linewidth}\tiny\tt
    \parindent=0pt
      Copyright \copyright{} \number\year{} -- \@author \par
      Ce document a \'et\'e pr\'epar\'e avec \LaTeX2$_{\varepsilon}$. \par
      \textit{Impression~: \jobname.tex~--~\number\day/\number\month/%
      \number\year}
  \end{minipage}}

\newcommand{\makeheader}{\chapter{\@title}}

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

% chapter, appendix
\def\@chapapp{Chapitre}
\def\Chaptername{C H A P I T R E}
\renewcommand\appendix{\par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\@chapapp{Annexe}
  \gdef\Chaptername{A N N E X E}
  \gdef\thechapter{\@Alph\c@chapter}
}
\renewcommand\chaptermark[1]{
  \markboth{\textsl{\footnotesize\rmfamily\@chapapp\ \thechapter~--~#1}}{}
}
\renewcommand\@makechapterhead[1]{
  \vspace*{96pt}%
  \bgroup
    \raggedleft%
    {\parindent0pt\parskip0pt%
      {\spaceskip=1em%
        \large\Chaptername}%
%      \qquad{\Huge\@arabic\c@chapter}\par
      \qquad{\Huge\thechapter}\par\vskip6pt
%    \special{ps:currenthsbcolor 0.5 1.0 0.5 sethsbcolor}
      \hrule height 1pt\par\vskip12pt
%    \special{ps:sethsbcolor}
      {\fontsize{29.86}{0pt}\bfseries #1}\par}
  \egroup
  \vskip96pt
}
\renewcommand\@makeschapterhead[1]{
  \vspace*{96pt}%
    \markboth{\textsl{\footnotesize\rmfamily #1}}%
             {\textsl{\footnotesize\rmfamily #1}}
   \bgroup
    \raggedleft%
    {\parindent0pt\parskip0pt%
      {\fontsize{29.86}{0pt}\bfseries #1}\par\vskip6pt
%    \special{ps:currenthsbcolor 0.5 1.0 0.5 sethsbcolor}
      \hrule height 1pt\par
%    \special{ps:sethsbcolor}
    }
  \egroup
  \vskip96pt
}

% section
\renewcommand\sectionmark[1]{
  \markright{\textsl{\footnotesize\rmfamily\thesection. \ #1}}}

\renewcommand{\section}{\@startsection{section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\raggedright\normalfont\Large\bfseries\em}}
\renewcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\raggedright\normalfont\large\bfseries\em}}
\renewcommand{\subsubsection}{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\raggedright\normalfont\normalsize\bfseries}}
\renewcommand{\paragraph}{\@startsection{paragraph}{4}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\bfseries}}
\renewcommand{\subparagraph}{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\normalfont\normalsize\bfseries}}


% list of...
\renewcommand\tableofcontents{
  \chapter*{\contentsname}%
%    \markboth{\textsl{\footnotesize\rmfamily\contentsname}}%
%             {\textsl{\footnotesize\rmfamily\contentsname}}
  \@starttoc{toc}}
\renewcommand\listoffigures{%
  \@restonecolfalse
    \chapter*{\listfigurename}%
%      \@mkboth{\textsl{\footnotesize\rmfamily\listfigurename}}%
%              {\textsl{\footnotesize\rmfamily\listfigurename}}%
    \@starttoc{lof}}
\renewcommand\listoftables{%
  \@restonecolfalse
  \chapter*{\listtablename}%
  \@starttoc{lot}}

%%

\newenvironment{intropar}[1]%
  {\begin{window}[0,l,{\fontsize{48}{0pt}\bfseries #1\kern-.1em},{}]
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

\renewcommand{\float@listhead}[1]{\chapter*{#1}}

\floatstyle{ruled}
\newfloat{algorithm}{hp}{aoc}[chapter]
\floatname{algorithm}{Algorithme}

\newtheorem{definition}{D\'efinition}[chapter]
\newtheorem{theorem}{Th\'eor\`eme}
\newtheorem{lemme}{Lemme}[chapter]

\newcommand{\pgcd}{\operatorname{pgcd}}
\newcommand{\doubt}{(\string?)}
\newcommand{\ident}[1]{\textbf{#1}}

\renewenvironment{thebibliography}[1]%
  {\chapter*{\bibname}%
   \@mkboth{\bibname}{\bibname}%
   \list{\@biblabel{\@arabic\c@enumiv}}%
        {\settowidth\labelwidth{\@biblabel{#1}}%
     \leftmargin\labelwidth
     \advance\leftmargin\labelsep
     \@openbib@code
     \usecounter{enumiv}%
     \let\p@enumiv\@empty
     \renewcommand\theenumiv{\@arabic\c@enumiv}}%
   \sloppy
   \clubpenalty4000
   \@clubpenalty \clubpenalty
   \widowpenalty4000%
   \sfcode`\.\@m}
  {\def\@noitemerr
    {\@latex@warning{Empty `thebibliography' environment}}%
   \endlist
}

\endinput

% End
