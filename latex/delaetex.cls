%==============================================================================
% delaetex - Documents for DELAE/EE/UFRGS
% Copyright (C) 2004..2016 Walter Fetter Lages <fetter@ece.ufrgs.br>
%
% This class was adapted from:
% deletex - Documents for DELET/EE/UFRGS
% Copyright (C) 2004..2009 Walter Fetter Lages <w.fetter@ieee.org>
%
% $Id: iiufrgs.cls,v 4.14 2003/11/21 22:36:13 avila Exp $
% Copyright (C) 2001-2003 UFRGS TeX Users Group
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation; either version 2 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program; if not, write to the Free Software
% Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
%
%==============================================================================

%==============================================================================
% Identifica��o
%==============================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{delaetex}[2016/03/16 v2.0.0 DelaeTeX class - Documents for DELAE/EE/UFRGS]

%==============================================================================
% Declara��o de op��es
%==============================================================================
\newcommand{\deletexu@novodoc}[1]{\DeclareOption{#1}{\AtEndOfClass{\input{delae#1.def}}}}
\deletexu@novodoc{rp}
\deletexu@novodoc{prop-tese}
\deletexu@novodoc{plano-doutorado}
\deletexu@novodoc{dipl-ecp}
\deletexu@novodoc{dipl-ele}
\deletexu@novodoc{dipl-cca}
\deletexu@novodoc{dipl-ene}
\deletexu@novodoc{estagio}
\deletexu@novodoc{ti}
\deletexu@novodoc{pep}
\deletexu@novodoc{diss}
\deletexu@novodoc{tese}
\deletexu@novodoc{tc}
\deletexu@novodoc{espec}
\DeclareOption{english}{\@englishtrue\OptionNotUsed}\newif\if@english
\DeclareOption{relnum}{\@relnumtrue\OptionNotUsed}\newif\if@relnum
\DeclareOption{oneside}{\AtEndOfClass{\@twosidefalse}\OptionNotUsed}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax

%==============================================================================
% Heran�a da classe `report' e inclus�o de pacotes e arquivos necess�rios
%==============================================================================
\LoadClass[12pt,a4paper,twoside]{report}
\RequirePackage[english,brazilian]{babel}
\input{delae_pt_BR.ldf}
\input{delae_en.ldf}
\if@english
        \selectlanguage{english}
        \AtBeginDocument{\selectlanguage{english}}
\fi
\RequirePackage{lastpage}
\RequirePackage{indentfirst}
\RequirePackage[T1]{fontenc}
\RequirePackage{times}
\RequirePackage{delaedefs}
\RequirePackage{natbib}
%==============================================================================
% Margens do texto
%==============================================================================
\newlength{\deletex@topmargin}\setlength{\deletex@topmargin}{30mm}
\newlength{\deletex@pagenummargin}\setlength{\deletex@pagenummargin}{20mm}
\newlength{\deletex@bottommargin}\setlength{\deletex@bottommargin}{20mm}
\newlength{\deletex@sidemargin}\setlength{\deletex@sidemargin}{30mm}
\setlength{\marginparwidth}{25mm}

% ajuste das medidas verticais
\setlength{\topmargin}{\deletex@pagenummargin}
        \addtolength{\topmargin}{-1em} % isto � +- a altura do n�m. da p�gina
        \addtolength{\topmargin}{-1in}
\setlength{\headheight}{1em}
\setlength{\headsep}{\deletex@topmargin}
        \addtolength{\headsep}{-\deletex@pagenummargin}
\setlength{\textheight}{\paperheight}
        \addtolength{\textheight}{-\deletex@topmargin}
        \addtolength{\textheight}{-\deletex@bottommargin}
\setlength{\footskip}{\deletex@bottommargin}

% ajuste das medidas horizontais
\setlength{\oddsidemargin}{\deletex@sidemargin}
        \addtolength{\oddsidemargin}{-1in}
\setlength{\evensidemargin}{\oddsidemargin}
\setlength{\textwidth}{\paperwidth}
        \addtolength{\textwidth}{-2\deletex@sidemargin}
\setlength{\marginparsep}{\deletex@sidemargin}
        \addtolength{\marginparsep}{-\marginparwidth}
        \setlength{\marginparsep}{.5\marginparsep}

%==============================================================================
% Numera��o das p�ginas
%==============================================================================
\def\ps@deletex{
        \let\@oddfoot\@empty
        \let\@evenfoot\@empty
        \def\@evenhead{{\small\thepage}}
        \def\@oddhead{\hspace*{\fill}{\small\thepage}}
}
\pagestyle{empty}
\let\ps@plain\ps@empty

% Nao numera versos de paginas em branco
\def\cleardoublepage{
        \clearpage
        \if@twoside
		\ifodd\c@page
			% do nothing
		\else
			\hbox{}
			\thispagestyle{empty}
			\newpage
		\fi
	\fi
}

%==============================================================================
% Defini��o de autor(es), orientador, co-orientador e banca
%==============================================================================
\newcounter{deletex@authorcount}
\renewcommand{\author}[2]{
        \addtocounter{deletex@authorcount}{1}
        \expandafter\gdef\csname @author\alph{deletex@authorcount}last\endcsname{#1}
        \expandafter\gdef\csname @author\alph{deletex@authorcount}first\endcsname{#2}
        \expandafter\gdef\csname @author\alph{deletex@authorcount}\endcsname{#2 #1}
}
\DeclareRobustCommand{\advisor}[3][]{
        \gdef\@advisorlast{#2}
        \gdef\@advisorfirst{#3}
        \gdef\@advisor{#1~#3 #2}
}
\newcommand{\advisorinfo}[2]{%
	\gdef\@advisorinstitution{#1}
	\gdef\@advisortitleinfo{#2}
}

\newcommand{\advisorwidth}[1]{\gdef\@advisorwidth{#1}}
\advisorwidth{0.55\textwidth}

\DeclareRobustCommand{\coadvisor}[3][]{
        \gdef\@coadvisorlast{#2}
        \gdef\@coadvisorfirst{#3}
        \gdef\@coadvisor{#1~#3 #2}
}
\newcommand{\coadvisorinfo}[2]{
	\gdef\@coadvisorinstitution{#1}
	\gdef\@coadvisortitleinfo{#2}
}

\newcounter{deletex@examinercount}
\DeclareRobustCommand{\examiner}[3][]{
        \addtocounter{deletex@examinercount}{1}
        \expandafter\gdef\csname @examiner\alph{deletex@examinercount}last\endcsname{#2}
        \expandafter\gdef\csname @examiner\alph{deletex@examinercount}first\endcsname{#3}
        \expandafter\gdef\csname @examiner\alph{deletex@examinercount}\endcsname{#1~#3 #2}
}
\newcounter{deletex@examinerinfocount}
\newcommand{\examinerinfo}[2]{
        \addtocounter{deletex@examinerinfocount}{1}
        \expandafter\gdef\csname @examiner\alph{deletex@examinerinfocount}institution\endcsname{#1}
        \expandafter\gdef\csname @examiner\alph{deletex@examinerinfocount}titleinfo\endcsname{#2}
}

%==============================================================================
% Defini��o do Departamento relacionado ao documento
%==============================================================================
\newcommand{\department}[1]{\gdef\@department{#1}}

%==============================================================================
% Defini��o das palavras-chave (m�x. 10)
%==============================================================================
\newcounter{kwcounter}
\newcommand{\keyword}[1]{
        \addtocounter{kwcounter}{1}
        \expandafter\gdef\csname keyw\alph{kwcounter}\endcsname{#1}
}
\newcommand{\@cipkw}{%
        \@ifundefined{keywa}{}{1.~\expandafter\MakeUppercase\keywa\@. }%
        \@ifundefined{keywb}{}{2.~\expandafter\MakeUppercase\keywb\@. }%
        \@ifundefined{keywc}{}{3.~\expandafter\MakeUppercase\keywc\@. }%
        \@ifundefined{keywd}{}{4.~\expandafter\MakeUppercase\keywd\@. }%
        \@ifundefined{keywe}{}{5.~\expandafter\MakeUppercase\keywe\@. }%
        \@ifundefined{keywf}{}{6.~\expandafter\MakeUppercase\keywf\@. }%
        \@ifundefined{keywg}{}{7.~\expandafter\MakeUppercase\keywg\@. }%
        \@ifundefined{keywh}{}{8.~\expandafter\MakeUppercase\keywh\@. }%
        \@ifundefined{keywi}{}{9.~\expandafter\MakeUppercase\keywi\@. }%
        \@ifundefined{keywj}{}{10.~\expandafter\MakeUppercase\keywj\@. }%
}
\newcommand{\@abstractkw}{%
        \@ifundefined{keywa}{}{\expandafter\MakeUppercase\keywa}%
        \@ifundefined{keywb}{}{, \keywb}%
        \@ifundefined{keywc}{}{, \keywc}%
        \@ifundefined{keywd}{}{, \keywd}%
        \@ifundefined{keywe}{}{, \keywe}%
        \@ifundefined{keywf}{}{, \keywf}%
        \@ifundefined{keywg}{}{, \keywg}%
        \@ifundefined{keywh}{}{, \keywh}%
        \@ifundefined{keywi}{}{, \keywi}%
        \@ifundefined{keywj}{}{, \keywj}%
}

%==============================================================================
% Redefini��o da data (para ter m�s e ano separados)
%==============================================================================
\renewcommand{\date}[2]{
        \gdef\@publmonth{#1}
        \gdef\@publyear{#2}
}
\date{\monthname}{\number\year}


%==============================================================================
% Defini��o da capa, folha de rosto e folha de aprova��o.
% Os dados espec�ficos do tipo de trabalho (disserta��o, tese, etc.) s�o
% informados definindo-se o comando \titlepagespecificinfo. Veja os
% arquivos .def inclu�dos com a classe.
%==============================================================================
\newlength{\titlepagewinwidth}\setlength{\titlepagewinwidth}{95mm}
\newlength{\titlepagewinheight}\setlength{\titlepagewinheight}{64mm}
\newlength{\titlepagewinvoffset}\setlength{\titlepagewinvoffset}{112mm}
\newcommand{\location}[2]{
        \gdef\@city{#1}
        \gdef\@state{#2}
}
\location{Porto~Alegre}{RS}
\renewcommand{\maketitle}{%
	\@makecover
	\@ifundefined{@deletexest}{%
		\begin{titlepage}
                	\thetitlepage
        	\end{titlepage}
	}{}
	\if@openright\cleardoublepage\setcounter{page}{3}\else\clearpage\setcounter{page}{2}\fi%
%	\clearpage
%        \setcounter{page}{2}%
%        \@ifundefined{@cipspecificinfo}{}{\@makecippage}

        \@ifundefined{@approvalspecificinfo}{}{\@makeapprovalpage}

}
\newcommand{\thetitlepage}{%
        \noindent\@titlepagetopbox
        \vfill
        \@ifundefined{titlepagespecificinfo}{}{
                \hspace*{\fill}\makebox[.55\textwidth][l]{%
                        \parbox[b]{8.5cm}{\titlepagespecificinfo}%
                }
                \vfill
        }
        \@ifundefined{@advisor}{}{
                \hspace*{\fill}\parbox[b]{\@advisorwidth}{%
                        \titlepageadvisorinfo
                }
                \vfill
        }
        \centerline{\@city}
	\centerline{\@publyear}
}
\def\@titlepagetopbox{%
        \parbox[t]{\textwidth}{%
                \centering%
%                \vbox to \titlepagewinvoffset{%
			\@winbox
%                }
        }
}
\def\@winbox{%
%       \fbox{
        \parbox[b]{\titlepagewinwidth}{%
        \centering\vbox to \titlepagewinheight{%
                \vspace*{\fill}
                \MakeUppercase{\textbf{\@authora}}\\
                \@ifundefined{@authorb}{}{\MakeUppercase{\textbf{\@authorb}}\\}%
                \@ifundefined{@authorc}{}{\MakeUppercase{\textbf{\@authorc}}\\}%
                \@ifundefined{@authord}{}{\MakeUppercase{\textbf{\@authord}}\\}%
                \vspace{\stretch{4}}
                {\large\MakeUppercase{\textbf{\@title}}\par}
                \vfill
        }}%
%       }%
}
\newcommand{\course}[1]{\gdef\@course{#1}}
\newcommand{\subject}[1]{\gdef\@subject{#1}}
\newcommand{\topic}[1]{\gdef\delet@topic{#1}}

\newcommand{\titlepagetopinfo}{%
        \MakeUppercase{\ufrgs}\\
	\MakeUppercase{\ee}\\
        \@ifundefined{@department}{}{\MakeUppercase{\@department}\\}%
        \@ifundefined{@course}{}{\MakeUppercase{\@course}\\}
        \@ifundefined{@subject}{}{\MakeUppercase{\@subject}}
}
\newcommand{\titlepageadvisorinfo}{%
        \@ifundefined{@advisor}{}{\vfill\MakeUppercase{\advisorname}: \@advisor}
        \@ifundefined{@coadvisor}{}{\\[6ex]\MakeUppercase{\coadvisorname}: \@coadvisor}
}

\newcommand{\@makecover}{%
        \begin{titlepage}
                \@thecover
        \end{titlepage}%
	\if@openright\cleardoublepage\else\clearpage\fi%
}
\newcommand{\@thecover}{%
        \noindent\@covertopbox
        \vfill
	\@ifundefined{@deletexest}{}{%
		\@ifundefined{@advisor}{}{
                	\hspace*{\fill}\parbox[b]{\@advisorwidth}{%
                        	\titlepageadvisorinfo
                	}
			\vfill	
        	}%
	}%
        \centerline{\@city}
	\centerline{\@publyear}
}
\def\@covertopbox{%
        \parbox[t]{\textwidth}{%
                \centering%
                \vbox to \titlepagewinvoffset{%
                        \titlepagetopinfo\vfill\@winbox
                }
        }
}

\newcommand{\@makeapprovalpage}{%
	\@ifundefined{@deletexest}{\@theapprovalpage}{\@approvalspecificinfo}
	\if@openright\cleardoublepage\else\clearpage\fi%
}
\newcommand{\@theapprovalpage}{%
	\begin{center}
        \noindent\@titlepagetopbox
        \vfill
        \@ifundefined{@approvalspecificinfo}{}{
                \hspace*{\fill}\makebox[.55\textwidth][l]{%
                        \parbox[b]{8.5cm}{\@approvalspecificinfo}%
                }
                \vfill
        }
        \@ifundefined{@advisor}{}{
                \hspace*{\fill}\parbox[b]{.70\textwidth}{%
                        \@approvalpageadvisorinfo
                }
                \vfill
        }
	\@ifundefined{@examinera}{}{
		\hspace*{\fill}\parbox[b]{1.0\textwidth}{\examinername:}
		\vfill
                \hspace*{\fill}\parbox[b]{.90\textwidth}{%
                        \@approvalpageexaminerinfo
                }
                \vfill
        }
        \@ifundefined{coord}{}{
                \hspace*{\fill}\parbox[b]{.70\textwidth}{%
                        \@approvalpagecoordinfo
                }
                \vfill
        }
        \vfill
        \hfill\@city, \delet@date.
	\end{center}
}
\newcommand{\@approvalpageadvisorinfo}{%
        \@ifundefined{@advisor}{}{%
		\vfill
		\advisorname: \hrulefill\\
		\@advisor, \@advisorinstitution\\
		\@advisortitleinfo 
	}
}
\newcommand{\@approvalpageexaminerinfo}{%
		\vfill
		\@examinera, \@examinerainstitution\\
		\@examineratitleinfo\\

                \@ifundefined{@examinerb}{}{%
			\@examinerb, \@examinerbinstitution\\
			\@examinerbtitleinfo\\

		}%
                \@ifundefined{@examinerc}{}{%
			\@examinerc, \@examinercinstitution\\
			\@examinerctitleinfo\\

		}%
                \@ifundefined{@examinerd}{}{%
			\@examinerd, \@examinerdinstitution\\
			\@examinerdtitleinfo\\

		}%
                \@ifundefined{@examinere}{}{%
			\@examinere, \@examinereinstitution\\
			\@examineretitleinfo\\
		}%
}
\newcommand{\@approvalpagecoordinfo}{%
        \@ifundefined{coord}{}{%
		\vfill
		\coordname: \hrulefill\\
		\coord 
	}
}

%==============================================================================
% Cataloga��o na fonte (CIP) e nominata
%==============================================================================
\newcommand{\@makecippage}{%
        \clearpage%
        \begin{center}
                \textbf{\cipcaption}\\[2ex]
                \deletexu@cipwindow
        \end{center}
        \vfill
        \nominata
}
% defini��o do quadro
\def\deletexu@cipwindow{%
        \framebox[120mm]{%
        \begin{minipage}{110mm}%
                \vspace*{0.2ex}
                \setlength{\parindent}{1.5em}%
                \setlength{\parskip}{1.3ex}%
                \noindent\@authoralast, \@authorafirst\par
                \@title\ / \@authora.\ -- \@city: PPGEE da~UFRGS, \@publyear.\par
                \pageref{LastPage}~f.: il.\par
                \@cipspecificinfo\ -- \ufrgs. \@course, \@city, BR--\@state, \@publyear. \advisorname: \@advisorfirst\ \@advisorlast\@ifundefined{@coadvisor}{}{; \coadvisorname: \@coadvisorfirst\ \@coadvisorlast}.\par
                \@cipkw I.~\@advisorlast, \@advisorfirst. \@ifundefined{@coadvisorfirst}{II.~T\'{\i}tulo.}{II.~\@coadvisorlast, \@coadvisorfirst. III.~T\'{\i}tulo.}\\
                \vspace{0.2ex}
        \end{minipage}%
        }%
}
\newcommand{\nominataReit}{Prof\textsuperscript{a}.~Dr.~Carlos Alexandre Netto}
\newcommand{\nominataReitname}{Reitor}
\newcommand{\nominataPRE}{Prof.~Dr\textsuperscript{a}.~Vladimir Pinheiro do Nacimento}
\newcommand{\nominataPREname}{Pr{\'o}-Reitora de Gradua{\c{c}}{\~a}o}
\newcommand{\nominataPRAPG}{Prof~Dr.~Vladimir Pinheiro do Nascimento}
\newcommand{\nominataPRAPGname}{Pr{\'o}-Reitor de P{\'o}s-Gradua{\c{c}}{\~a}o}
\newcommand{\nominataDir}{Prof.~Dr\textsuperscript{a}.~Luis Carlos Pinto da Silva Filho}
\newcommand{\nominataDirname}{Diretor da Escola de Engenharia}
\newcommand{\nominataCoord}{Prof.~Dr.~Luis Fernando Alves Pereira}
\newcommand{\nominataCoordname}{Coordenador do PPGEE}
\newcommand{\nominataBibchefe}{June Magda Rosa Schamberg}
\newcommand{\nominataBibchefename}{Bibliotec{\'a}ria-chefe da Escola de Engenharia}
\newcommand{\nominataChefeDELET}{Prof.~Dr.{\'A}ly Vieira Flores Filho}
\newcommand{\nominataChefeDELETname}{Chefe do \@department}
\newcommand{\nominataChefeDELAE}{Prof.~Dr.~Jo{\~a}o Manoel Gomes da Silva Jr.}
\newcommand{\nominataChefeDELAEname}{Chefe do \@department}
\newcommand{\nominata}{
        \MakeUppercase{\ufrgs}\\
        \nominataReitname: \nominataReit\\
        \nominataPREname: \nominataPRE\\
        \nominataPRAPGname: \nominataPRAPG\\
        \nominataDirname: \nominataDir\\
        \nominataCoordname: \nominataCoord\\
        \nominataBibchefename: \nominataBibchefe
}

%==============================================================================
% Ajuste do sum�rio (nada indentado) 
%==============================================================================
\newlength{\deletex@chapnumindent}\setlength{\deletex@chapnumindent}{1.8em}
\renewcommand*{\l@chapter}[2]{
        \addpenalty{-\@highpenalty}
        \vskip -1ex \@plus\p@
        \setlength\@tempdima{1.5em}
        \begingroup
        \parindent \z@ \rightskip \@pnumwidth
        \parfillskip -\@pnumwidth
        \leavevmode\bfseries\sffamily
        \advance\leftskip\@tempdima
        \hskip -\leftskip
%      esta � a definicao original da classe report:
%      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
        \@dottedtocline{0}{0em}{\deletex@chapnumindent}{\uppercase{#1}}{#2}
%        \@dottedtocline{0}{0em}{\deletex@chapnumindent}{\MakeUppercase{#1}}{#2}
        \penalty\@highpenalty
        \endgroup
}
\renewcommand*{\l@section}[2]
              {\@dottedtocline{1}{0em}{2.8em}{\textbf{#1}}{\hss #2}}
\renewcommand*{\l@subsection}{\@dottedtocline{2}{0em}{3.7em}}
\newif\if@aftertoc
\@aftertocfalse
\renewcommand{\tableofcontents}{%
        \chapter*{\contentsname}
        \@starttoc{toc}\@aftertoctrue%
}

%==============================================================================
% Defini��o das listas de abreviaturas e siglas e de s�mbolos
%==============================================================================
\newenvironment{listofabbrv}[1]{
        \chapter*{\listabbrvname}
        \begin{list}{\textbf{??}}{
                \settowidth{\labelwidth}{#1}
                \setlength{\labelsep}{1em}
                \setlength{\itemindent}{0mm}
                \setlength{\leftmargin}{\labelwidth}
                \addtolength{\leftmargin}{\labelsep}
                \setlength{\rightmargin}{0mm}
                \setlength{\itemsep}{.1\baselineskip}
                \renewcommand{\makelabel}[1]{\makebox[\labelwidth][l]{##1}}
        }
}{
        \end{list}
}
\newenvironment{listofsymbols}[1]{
        \chapter*{\listsymbolname}
        \begin{list}{\textbf{??}}{
                \settowidth{\labelwidth}{#1}
                \setlength{\labelsep}{1em}
                \setlength{\itemindent}{0mm}
                \setlength{\leftmargin}{\labelwidth}
                \addtolength{\leftmargin}{\labelsep}
                \setlength{\rightmargin}{0mm}
                \setlength{\itemsep}{.1\baselineskip}
                \renewcommand{\makelabel}[1]{\makebox[\labelwidth][l]{##1}}
        }
}{
        \end{list}
}

%==============================================================================
% Resumo (abstract) e Abstract (englishabstract)
%==============================================================================
\renewenvironment{abstract}{%
        \chapter*{\abstractname}
}{%
        \par\vspace{2ex} %\vfill
        \noindent\textbf{\keywordsname: \@abstractkw.}
}
\newenvironment{englishabstract}[1]{%
        \if@openright\cleardoublepage\else\clearpage\fi%
        \gdef\@englishkeywords{#1}%
        \iflanguage{english}{
                \begin{otherlanguage}{brazilian}
        }{
                \begin{otherlanguage}{english}
        }
                \chapter*{\abstractname}
}{
        \par\vspace{2ex} %\vfill
        \noindent\textbf{\keywordsname: \@englishkeywords.}
        \end{otherlanguage}
}

%==============================================================================
% Formata��o dos cap�tulos.
% Os comandos \@chapter e \@schapter s�o redefinidos para que a
% numera��o de p�ginas seja correta (deve aparecer somente a partir do
% primeiro cap�tulo do texto, mas n�o nas p�ginas iniciais de
% cap�tulos).
% Os comandos \@makechapterhead e \@makeschapterhead fazem a
% formata��o dos t�tulos propriamente ditos.
%==============================================================================
\newcommand{\deletex@chapterfont}{\@setfontsize\Large{16}{20}}
\def\@chapapp{}
\def\@chapter[#1]#2{%
        \refstepcounter{chapter}%
        \addcontentsline{toc}{chapter}{\protect\numberline{\@chapapp\thechapter}#1}%
\if@relnum
        \addtocontents{lof}{\protect\addvspace{10\p@}}%
        \addtocontents{lot}{\protect\addvspace{10\p@}}%
\fi
        \pagestyle{deletex}\let\ps@plain\ps@deletex%
        \@makechapterhead{#2}\@afterheading
}
\def\@makechapterhead#1{%
        \vspace*{90pt}
        \reset@font\noindent{\deletex@chapterfont\sffamily\textbf{\@chapapp\thechapter\hspace{1em}\MakeUppercase{#1}}\par}
        \addvspace{42pt}
}
\def\@schapter#1{%
        \if@aftertoc\addcontentsline{toc}{chapter}{#1}\fi%
\if@relnum
        \addtocontents{lof}{\protect\addvspace{10\p@}}%
        \addtocontents{lot}{\protect\addvspace{10\p@}}%
\fi
        \@makeschapterhead{#1}\@afterheading
}
\def\@makeschapterhead#1{%
        \vspace*{90pt}
        \reset@font\centerline{\deletex@chapterfont\sffamily\textbf{\MakeUppercase{#1}}}
        \addvspace{42pt}
}
\renewcommand{\appendix}[1][\appendixname]{%
        \setcounter{chapter}{0}%
        \renewcommand{\thechapter}{\Alph{chapter}}%
        \setcounter{tocdepth}{0}%
        \@captionlistingfalse%
        \gdef\@chapapp{\MakeUppercase{#1}\space}%
        \addtocontents{toc}{%
          \settowidth{\deletex@chapnumindent}{{\sffamily\textbf{\@chapapp}}}
          \addtolength{\deletex@chapnumindent}{1.8em}
        }%
}
\newcommand{\annex}{\appendix[\annexname]}

%==============================================================================
% Formata��o das se��es
%==============================================================================
\setcounter{secnumdepth}{4}
\renewcommand{\section}{%
        \@startsection{section}{1}{0pt}{18pt}{9pt}{\reset@font\large\bfseries}
}
\renewcommand{\subsection}{%
        \@startsection{subsection}{2}{0pt}{12pt}{6pt}{\reset@font\bfseries}
}
\renewcommand{\subsubsection}{%
        \@startsection{subsubsection}{3}{0pt}{12pt}{6pt}{\reset@font\itshape}
}
\renewcommand{\paragraph}{%
        \@startsection{paragraph}{4}{0pt}{12pt}{6pt}{\reset@font}
}
\renewcommand{\subparagraph}{%
        \@startsection{subparagraph}{5}{0pt}{1ex}{-1em}{\reset@font\bfseries}
}

%==============================================================================
% Redefini��o do conte�do das listas de figuras e tabelas
%==============================================================================
\newif\if@captionlisting\@captionlistingtrue
\long\def\@caption#1[#2]#3{%
  \par
  \if@captionlisting%
    \addcontentsline{\csname ext@#1\endcsname}{#1}%
        {\protect\numberline{\csname fnum@#1\endcsname:}{\ignorespaces #2}}%
  \fi%
  \begingroup
    \@parboxrestore
    \if@minipage
      \@setminipage
    \fi
    \normalsize
    \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}\par
  \endgroup%
}
\renewcommand*{\l@figure}{\@dottedtocline{1}{0em}{5.5em}}
\let\l@table\l@figure

%longtable support
\RequirePackage{longtable}
\def\LT@c@ption#1[#2]#3{%
  \LT@makecaption#1\fnum@table{#3}%
  \def\@tempa{#2}%
  \ifx\@tempa\@empty\else
     {\let\\\space
     \addcontentsline{lot}{table}{\protect\numberline{\tablename~\thetable:}{#2}}}%
  \fi}

%==============================================================================
% Redefini��o do formato de cita��es longas
%==============================================================================
\renewenvironment{quote}{%
        \small%
        \begin{list}{}{\setlength{\leftmargin}{40mm}\item\relax}
}{%
        \end{list}
}

%==============================================================================
% Ajuste do formato das cita��es e refer�ncias
%==============================================================================
\setlength{\bibhang}{0pt}
\let\cite\citep

% Segundo a NBR-6023 as referencias devem ser alinhadas somente a esquerda
\let\oldbibliography\bibliography
\renewcommand{\bibliography}[1]{\begin{flushleft}\oldbibliography{#1}\end{flushleft}}

%==============================================================================
% Ajuste do formato das numeracoes das figuras, tabelas e equa��es
%==============================================================================
\if@relnum

\else

\RequirePackage{remreset}

\@removefromreset{equation}{chapter}
\renewcommand{\theequation}{\@arabic\c@equation}

\@removefromreset{figure}{chapter}
\renewcommand{\thefigure}{\@arabic\c@figure}

\@removefromreset{table}{chapter}
\renewcommand{\thetable}{\@arabic\c@table}

\fi
