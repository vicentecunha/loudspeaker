% delaeletter.cls - Letter class  for DELAE/EE/UFRGS
% Copyright (C) 2004..2016 Walter Fetter Lages <fetter@ece.ufrgs.br>
%
% This class was adapted from:
% deletter.cls - Letter class  for DELET/EE/UFRGS
% Copyright (C) 2004..2009 Walter Fetter Lages <fetter@ece.ufrgs.br>
%
% iiletter.cls - modelo de carta com logotipo do II/UFRGS
% $Id: iiletter.cls,v 4.1 2002/12/07 17:20:09 utug Exp $
% Copyright (C) 2001 UFRGS TeX Users Group
%
% This is free software, distributed under the GNU GPL; please take
% a look in `deletex.cls' to see complete information on using, copying
% and redistributing these files
%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{deletter}[2016/03/16 v2.0.0 DelaeTeX package - delaeletter.cls - Letter Documents for DELAE/EE/UFRGS]
\DeclareOption{english}{\@englishtrue\OptionNotUsed}\newif\if@english
\DeclareOption{promo}{\@promotrue\OptionNotUsed}\newif\if@promo
\DeclareOption{spf}{\@spftrue\OptionNotUsed}\newif\if@spf
\DeclareOption*{
	\PassOptionsToClass{\CurrentOption}{letter}
}
\ProcessOptions\relax
\LoadClass[a4paper,12pt]{letter}
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
% definicoes padrao
%
\newcommand{\department}[1]{\gdef\@department{#1}}
\date{Porto~Alegre, \today.}
\newcommand{\estilorodape}{\scriptsize\sffamily\bfseries}
\newcommand{\estilospf}{\sffamily\bfseries}
\address{
	\if@spf
		\@ifundefined{@department}{\delae}{\@department}\ --- \ee\\\
		\ufrgs\\
	\fi
	Av.~Osvaldo Aranha, 103 --- 90035--190 Porto~Alegre, RS --- %
	\if@english %
		BRAZIL
	\else %
		Brasil
	\fi %
	\\
	\phonename: +55 (51) 3308-3515\hspace{2em}Fax: +55 (51) 3308-3293\hspace{2em}\@ifundefined{@department}{http://www.ece.ufrgs.br}{http://www.ufrgs.br}
}

%
% definicoes internas
%
\def\linha{\rule[1ex]{\textwidth}{2pt}}
\def\cabecalho{
	\if@spf
		\parbox[b]{\textwidth}{\center\spfshield[0.14]\\\estilospf\spf}
	\else
		\if@promo
			\parbox[b]{\textwidth}{\ufrgslogo[0.4]\hfill
			\parbox[b]{0.7\textwidth}{\center\bf\ufrgs\\\ee\\\@ifundefined{@department}{\delae}{\@department}}
			\hfill\eelogo[0.33]\\\linha}
		\else
			\parbox[b]{\textwidth}{\ufrgsshield[0.2]\hfill
			\parbox[b]{0.7\textwidth}{\center\bf\ufrgs\\\ee\\\@ifundefined{@department}{\delae}{\@department}}
			\hfill\eelogo[0.33]\\\linha}
		\fi
	\fi
}
\def\rodape{\parbox[b]{\textwidth}{
	\linha\\
	\estilorodape\centering\fromaddress
}}

%
% definicao do estilo de pagina (cabecalho e rodape)
%
\def\ps@deletter{
	\let\@evenfoot\@empty
	\let\@evenhead\@empty
	\def\@oddhead{\cabecalho}
	\def\@oddfoot{\rodape}
}
\pagestyle{deletter}
\let\ps@empty\ps@deletter
\let\ps@firstpage\ps@deletter
\let\ps@headings\ps@deletter

%
% margens e etc
%
\setlength{\topmargin}{20mm}			% margem superior
\settoheight{\headheight}{\cabecalho}
\setlength{\headsep}{10mm}			% dist. cabecalho ao texto
\settoheight{\footskip}{\rodape}
	\addtolength{\footskip}{10mm}		% dist. texto ao rodape
\setlength{\textheight}{\paperheight}
	\addtolength{\textheight}{-8mm}		% margem inferior
	\addtolength{\textheight}{-\topmargin}
	\addtolength{\textheight}{-\headheight}
	\addtolength{\textheight}{-\headsep}
	\addtolength{\textheight}{-\footskip}
\setlength{\oddsidemargin}{30mm}		% margem esquerda
\setlength{\evensidemargin}{30mm}		% margem direita
\setlength{\textwidth}{\paperwidth}
	\addtolength{\textwidth}{-\oddsidemargin}
	\addtolength{\textwidth}{-\evensidemargin}
\addtolength{\topmargin}{-1in}
\addtolength{\oddsidemargin}{-1in}
\addtolength{\evensidemargin}{-1in}
\setlength{\parindent}{4em}

%
% redefine o comando opening para nao colocar o endereco
% no canto superior direito
%
\renewcommand*{\opening}[1]{
	{\raggedleft\@date\par}%
	\vspace{2\parskip}%
	{\raggedright\toname \\ \toaddress \par}%
	\vspace{2\parskip}%
	\noindent#1\par\nobreak
}
