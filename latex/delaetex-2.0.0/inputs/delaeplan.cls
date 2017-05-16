% delaeplan.cls - Class  for DELAE/EE/UFRGS teaching plan
% Copyright (C) 2007..2016 Walter Fetter Lages <fetter@ece.ufrgs.br>
%
% This is free software, distributed under the GNU GPL; please take
% a look in `delaetex.cls' to see complete information on using, copying
% and redistributing these files
%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{delaeplan}[2016/03/16 v2.0.0 DelaeTeX package - delaetplan.cls - Teaching plans for DELAE/EE/UFRGS]
\DeclareOption{english}{\@englishtrue\OptionNotUsed}\newif\if@english
\DeclareOption{ppgee}{\@ppgeetrue\OptionNotUsed}\newif\if@ppgee
\DeclareOption*{
	\PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass[a4paper,11pt]{article}
\RequirePackage{a4wide}
\RequirePackage[english,brazilian]{babel}
\input{delae_pt_BR.ldf}
\input{delae_en.ldf}
\selectlanguage{brazilian}
\if@english
	\selectlanguage{english}
        \AtBeginDocument{\selectlanguage{english}}
\fi
\RequirePackage{delaedefs}
%
\newcommand{\department}[1]{\gdef\@department{#1}}
\newcommand{\course}[1]{\gdef\@course{#1}}
\newcommand{\credits}[1]{\gdef\@credits{#1}}
\newcommand{\type}[1]{\gdef\@type{#1}}
\newcommand{\regent}[1]{\gdef\@regent{#1}}
\newcommand{\theory}[1]{\gdef\@theory{#1}}
\newcommand{\lab}[1]{\gdef\@lab{#1}}
\newcommand{\exercise}[1]{\gdef\@exercise{#1}}
\newcommand{\prereq}[1]{\gdef\@prereq{#1}}

\newcounter{deletplan@schedulecount}
\newcommand{\schedule}[2]{
        \addtocounter{deletplan@schedulecount}{1}
        \expandafter\gdef\csname @schedule\alph{deletplan@schedulecount}group\endcsname{#1}
        \expandafter\gdef\csname @schedule\alph{deletplan@schedulecount}time\endcsname{#2}
        \expandafter\gdef\csname @schedule\alph{deletplan@schedulecount}\endcsname{#1 #2}
}

%
\renewcommand\maketitle{
		\noindent\parbox[b]{0.23\textwidth}{\ufrgsshield[0.3]}\hfill
		\parbox[b]{0.8\textwidth}{\center\bf\MakeUppercase{\large\ufrgs}\\
			\MakeUppercase{\large\ee}\\
			\@ifundefined{@department}{\MakeUppercase{\large\delae}}{\MakeUppercase{\large\@department}}\\
			\if@ppgee
				\MakeUppercase{\large\ppgee}\\
			\fi
			\MakeUppercase{\large\plantitlename}\\
			\MakeUppercase{\large\plandatename\ \@date}\\}\\

		\noindent \MakeUppercase{\underline{\plancoursename:}} {\bf\@course}\\

		\noindent \plancreditsname: \@credits\\

		\noindent \plantypename: \@type\\

		\noindent \planregentname: \@regent\\

		\noindent \planweekhoursname: \begin{tabular}[t]{l}
			\@ifundefined{@theory}{}{\@theory\\}
			\@ifundefined{@lab}{}{\@lab\\}
			\@ifundefined{@exercise}{}{\@exercise\\}
			\end{tabular}\\

		\noindent \planprereqname: \@prereq\\

		\noindent \planschedulename: \begin{tabular}[t]{l}
			\@ifundefined{@schedulea}{}{\@schedulea\\}
			\@ifundefined{@scheduleb}{}{\@scheduleb\\}
			\@ifundefined{@schedulec}{}{\@schedulec\\}
			\@ifundefined{@scheduled}{}{\@scheduled\\}
			\@ifundefined{@schedulee}{}{\@schedulee\\}
			\@ifundefined{@schedulef}{}{\@schedulef\\}
			\@ifundefined{@scheduleg}{}{\@scheduleg\\}
			\@ifundefined{@scheduleh}{}{\@scheduleh\\}
			\@ifundefined{@schedulei}{}{\@schedulei\\}
			\@ifundefined{@schedulej}{}{\@schedulej\\}
			\@ifundefined{@schedulek}{}{\@schedulek\\}
			\@ifundefined{@schedulel}{}{\@schedulel\\}
			\@ifundefined{@schedulem}{}{\@schedulem\\}
			\@ifundefined{@schedulen}{}{\@schedulen\\}
			\@ifundefined{@scheduleo}{}{\@scheduleo\\}
			\@ifundefined{@schedulep}{}{\@schedulep\\}
			\@ifundefined{@scheduleq}{}{\@scheduleq\\}
			\@ifundefined{@scheduler}{}{\@scheduler\\}
			\@ifundefined{@schedules}{}{\@schedules\\}
			\@ifundefined{@schedulet}{}{\@schedulet\\}
			\@ifundefined{@scheduleu}{}{\@scheduleu\\}
			\@ifundefined{@schedulev}{}{\@schedulev\\}
			\@ifundefined{@schedulew}{}{\@schedulew\\}
			\@ifundefined{@schedulex}{}{\@schedulex\\}
			\@ifundefined{@scheduley}{}{\@scheduley\\}
			\@ifundefined{@schedulez}{}{\@schedulez\\}
			\end{tabular}
}

\renewcommand\section[1]{\@startsection{section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\normalfont\normalsize\MakeUppercase}*{\underline{#1:}}}

\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\normalsize}*}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\normalsize}*}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize}*}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\normalfont\normalsize}*}

\renewenvironment{thebibliography}[1]
     {\section{\MakeUppercase\planbibname
        \@mkboth{\MakeUppercase\planbibname}{\MakeUppercase\planbibname}}%
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
      \endlist}

\renewcommand\emph[1]{\textbf{#1}}
