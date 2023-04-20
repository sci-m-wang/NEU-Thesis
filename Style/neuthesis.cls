% !TEX ROOT = ../Thesis.tex 

%---------------------------------------------------------------------------%
%-                                                                         -%
%-                           Document Class                                -%
%-                                                                         -%
%---------------------------------------------------------------------------%
%- Copyright (C) Huangrui Mo <huangrui.mo@gmail.com> 
%- This is free software: you can redistribute it and/or modify it
%- under the terms of the GNU General Public License as published by
%- the Free Software Foundation, either version 3 of the License, or
%- (at your option) any later version.
%---------------------------------------------------------------------------%
%->> Identification
%---------------------------------------------------------------------------%
\NeedsTeXFormat{LaTeX2e}%
\ProvidesClass{Style/neuthesis}[2014/10/01 v1.0 LaTeX document class]%
%---------------------------------------------------------------------------%
%->> Declare options
%---------------------------------------------------------------------------%
%-
%-> Layout
%-
\newif\ifneu@singlesided \neu@singlesidedfalse
\DeclareOption{singlesided}{% enable single-sided printing
	\neu@singlesidedtrue%
}
\newif\ifneu@doublesided \neu@doublesidedfalse
\DeclareOption{doublesided}{% enable double-sided printing
	\neu@doublesidedtrue%
}
\newif\ifneu@printcopy \neu@printcopyfalse
\DeclareOption{printcopy}{% enable print copy layout
	\neu@doublesidedtrue% auto enable double-sided style
	\neu@printcopytrue%
}
%-
%-> review 
%-
\newif\ifneu@review \neu@reviewfalse
\DeclareOption{review}{% enable print copy layout
	% \neu@doublesidedtrue% auto enable double-sided style
	\neu@reviewtrue%
	% \newcommand{\isreview}{true}
}
%-
%-> Draft version info
%-
\newif\ifneu@versioninfo \neu@versioninfofalse
\DeclareOption{draftversion}{%
	\neu@versioninfotrue%
}
%-
%-> Handle non-implemented options
%-
\DeclareOption*{%
	\PassOptionsToClass{\CurrentOption}{ctexbook}%
}
%-
%-> Terminates all options processing
%-
\ProcessOptions\relax%
%---------------------------------------------------------------------------%
%->> Load class information
%---------------------------------------------------------------------------%
\ifneu@doublesided% if double-sided printing enabled
	\LoadClass[UTF8,a4paper,twoside,zihao=-4]{ctexbook}
\else% if double-sided printing isn't enabled
	\LoadClass[UTF8,a4paper,oneside,zihao=-4]{ctexbook}
\fi
%---------------------------------------------------------------------------%
%->> Required packages
%---------------------------------------------------------------------------%
\RequirePackage{ifxetex}% LaTeX engine detection
\RequirePackage{etoolbox}% a toolbox of programming facilities
\newcommand{\neuifstreq}{\expandafter\ifstrequal\expandafter}% expansion control
\newcommand{\neuifstrbk}{\expandafter\ifblank\expandafter}% expansion control
\RequirePackage{ragged2e}
%---------------------------------------------------------------------------%
%->> Load class configuration
%---------------------------------------------------------------------------%
\AtEndOfPackage{% class cfg loaded after package to make preamble commands take effect
	\makeatletter
	\InputIfFileExists{Style/neuthesis.cfg}{}{}
	\makeatother
}
%---------------------------------------------------------------------------%
%->> Page layout
%---------------------------------------------------------------------------%
%- part one -- horizontal widths
%- left side width + textwidth + right side width = paperwidth
%- binding side width + textwidth + nonbinding side width = paperwidth
%- binding side width of [odd, even] page = [left, right] side width
%- left side width of [odd, even] page = 1.0in (fixed) + hoffset + [odd, even]sidemargin
%- assuming A4 paper (210mm x 297mm)
\setlength{\textwidth}{160mm}% set required text width first
\setlength{\hoffset}{0mm}% set horizontal offset
\ifneu@printcopy% if print copy layout enabled
	\setlength{\oddsidemargin}{12.6mm}% binding side margin
	\setlength{\evensidemargin}{0mm}% ensure uniform binding side width for printing
\else
	\setlength{\oddsidemargin}{6.3mm}% left side margin
	\setlength{\evensidemargin}{6.3mm}% ensure uniform left side width for EThesis
\fi
\setlength{\marginparwidth}{35pt}% width of margin notes
\setlength{\marginparsep}{10pt}% width of space between body text and margin notes
%- part two -- vertical heights
%- top height + textheight + bottom height = paperheight
%- top height = 1.0in (fixed) + voffset + topmargin + headheight + headsep 
\setlength{\textheight}{247mm}% set required text height first
% \setlength{\voffset}{-17.4mm}% set vertical offset
\setlength{\voffset}{0mm}% set vertical offset
\setlength{\topmargin}{20pt}% vertical margin above header
\setlength{\headheight}{12.7pt}% header height
\setlength{\headsep}{17.5pt}% vertical margin between header and body text
\setlength{\footskip}{29.5pt}% vertical margin between footer and body text
%- specifies the amount of space between paragraphs.
\setlength{\parskip}{0.5ex plus 0.25ex minus 0.25ex}
%- line spacing
\linespread{1.5}% line space setting
\raggedbottom% prevent adding vertical white space in strange places
%- default pagestyle is page number at bottom without headers and footers
\pagestyle{plain}
%---------------------------------------------------------------------------%
%->> Style control commands
%---------------------------------------------------------------------------%
%- redefine cleardoublepage to have page style argument
\renewcommand{\cleardoublepage}[1][plain]{%
	\clearpage\if@twoside\ifodd\c@page\else%
			\thispagestyle{#1}%
			\hbox{}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi%
}
%- underline
% \ifxetex% use underline from xeCJKfntef
% 	\renewcommand{\CJKunderlinecolor}{\color[rgb]{0,0,0}}% set underline color
% 	\renewcommand{\uline}[1]{\CJKunderline{#1}}% unified name
% \else% use underline from ulem
	\RequirePackage{ulem}%
% \fi
\newcommand{\ulenhance}[2][1pt]{% enhanced underline
	\def\ULthickness{#1}% set thickness
	\uline{#2}}
\newcommand{\ulhshift}{-4em}% horizontal shift on underline
\newcommand{\ulextend}[2][350pt]{% extend underline length
	\hbox to #1{\hfill\hspace*{\ulhshift}#2\hfill}}

%---------------------------------------------------------------------------%
%->> Titlepage
%---------------------------------------------------------------------------%
%-
%-> Chinese item commands
%-
% \makeatletter
% category
\def\neu@value@category{}
\newcommand{\category}[1]{\def\neu@value@category{#1}}
% confidential
\def\neu@value@confidential{}
\newcommand{\confidential}[1]{\def\neu@value@confidential{#1}}
% UDC
\def\neu@value@UDC{}
\newcommand{\UDC}[1]{\def\neu@value@UDC{#1}}
\def\neu@value@schoollogo{}

\newcommand{\schoollogo}{\def\neu@value@schoollogo{
		\begin{minipage}[t]{100mm}
			\parbox[c]{37mm}{\includegraphics[width=35mm, height=10mm]{neu/neu_title}}
			\parbox[c]{18mm}{\includegraphics[width=16mm, height=16mm]{neu/neu_logo.jpg}}
			\parbox[c]{35mm}{ \songti \bfseries \zihao{-4}  \makebox[35mm][c]{NORTHEASTERN}  \makebox[35mm][c]{ U N I V E R S I T Y}}
		\end{minipage}
	}}
\def\neu@value@title{}
\def\neu@value@titlemark{}
\renewcommand{\title}[2][\neu@value@title]{%
	\def\neu@value@title{#2}
	%\def\neu@value@titlemark{\MakeUppercase{#1}}}
	\def\neu@value@titlemark{#1}}
\renewcommand{\@title}{\neu@value@titlemark}
% major 
\def\neu@value@major{}
\newcommand{\major}[1]{\def\neu@value@major{#1}}
% research
\def\neu@value@research{}
\newcommand{\research}[1]{\def\neu@value@research{#1}}
% authorno
\def\neu@value@authorno{}
\newcommand{\authorno}[1]{\def\neu@value@authorno{#1}}
% date
\def\neu@value@chinesedate{}
\newcommand{\chinesedate}[1]{\def\neu@value@chinesedate{#1}}

\def\neu@value@author{}
\renewcommand{\author}[1]{\def\neu@value@author{#1}}
\def\neu@value@advisor{}
\newcommand{\advisor}[1]{\def\neu@value@advisor{#1}}
\def\neu@value@advisorsec{}
\newcommand{\advisorsec}[1]{\def\neu@value@advisorsec{#1}}
\def\neu@value@degree{}
\newcommand{\degree}[1]{\def\neu@value@degree{#1}}
\def\neu@value@degreetype{}
\newcommand{\degreetype}[1]{\def\neu@value@degreetype{#1}}
\def\neu@value@submissiondate{}
\newcommand{\submissiondate}[1]{\def\neu@value@submissiondate{#1}}
\def\neu@value@oraldefencedate{}
\newcommand{\oraldefencedate}[1]{\def\neu@value@oraldefencedate{#1}}
\def\neu@value@degreedate{}
\newcommand{\degreedate}[1]{\def\neu@value@degreedate{#1}}
\def\neu@value@chairman{}
\newcommand{\chairman}[1]{\def\neu@value@chairman{#1}}
\def\neu@value@reviewer{}
\newcommand{\reviewer}[1]{\def\neu@value@reviewer{#1}}
% \def\neu@value@major{}
% \newcommand{\major}[1]{\def\neu@value@major{#1}}
\def\neu@value@institute{}
\newcommand{\institute}[1]{\def\neu@value@institute{#1}}
% \def\neu@value@chinesedate{}
% \newcommand{\chinesedate}[1]{\def\neu@value@chinesedate{#1}}


%- 
%- define the review cover
%-
\newcommand{\makereviewcover}{
	\hypersetup{% set hyperlinks
		pdftitle={\neu@value@title},% title
		pdfauthor={\neu@value@author},% author
		pdfsubject={\neu@value@research},% subject
	}

	\neuifstreq{\neu@value@englishdegree}{Bachelor}{%
		\def\neu@label@thesis{\neu@label@bacthesis}%
		\def\neu@label@major{\neu@label@ungradmajor}%
		\def\neu@label@institute{\neu@label@ungradinstitute}%
	}{%
		\neuifstreq{\neu@value@englishdegree}{Master}{%
			\def\neu@label@thesis{\neu@label@masthesis}%
			\def\neu@label@major{\neu@label@gradmajor}%
			\def\neu@label@institute{\neu@label@gradinstitute}%
		}{%
			\def\neu@label@thesis{\neu@label@docthesis}%
			\def\neu@label@major{\neu@label@gradmajor}%
			\def\neu@label@institute{\neu@label@gradinstitute}%
		}}%
	\cleardoublepage
	\thispagestyle{empty}
	\newgeometry{top=19.2mm, bottom=25.4mm, left=28mm, right=26mm}
	\begin{center}
		\linespread{1}
		\zihao{5}
		\vspace*{\stretch{1}}

		{\neu@value@schoollogo}

		\linespread{1}
		\zihao{5}
		\vspace*{\stretch{6}}

		{\fontsize{54}{\baselineskip}\rmfamily {\neu@label@thesis}}

		\vspace*{\stretch{1}}
		{\zihao{2} \songti {\neu@label@enthesis}}

	\end{center}
	\begin{flushleft}
		\linespread{1}
		\zihao{5}
		\vspace*{\stretch{5}}

		{\zihao{3} \rmfamily \neu@label@title {\neu@value@title}}

		\linespread{1}
		\vspace*{\stretch{4}}
		\linespread{1.2}
		\zihao{3}
		\def\tabcolsep{1pt}
		\def\arraystretch{1.75}
		\begin{tabular}{ll}
			\neu@label@major       & \neu@value@major       \\
			\neu@label@research    & \neu@value@research    \\
			\neu@label@thesisno    & \neu@value@authorno    \\
			\neu@label@chinesedate & \neu@value@chinesedate \\
		\end{tabular}
		\linespread{1}
		\zihao{5}
		\vspace*{\stretch{4}}
	\end{flushleft}
	\restoregeometry
	\clearpage
	\if@twoside
		\thispagestyle{empty}
		\cleardoublepage[empty]
	\fi
}
%- 
%- define the front cover
%-
\newcommand{\makeprintcover}{
	\hypersetup{% set hyperlinks
		pdftitle={\neu@value@title},% title
		pdfauthor={\neu@value@author},% author
		pdfsubject={\neu@value@research},% subject
	}

	\neuifstreq{\neu@value@englishdegree}{Bachelor}{%
		\def\neu@label@thesis{\neu@label@bacthesis}%
		\def\neu@label@major{\neu@label@ungradmajor}%
		\def\neu@label@institute{\neu@label@ungradinstitute}%
	}{%
		\neuifstreq{\neu@value@englishdegree}{Master}{%
			\def\neu@label@thesis{\neu@label@masthesis}%
			\def\neu@label@major{\neu@label@gradmajor}%
			\def\neu@label@institute{\neu@label@gradinstitute}%
		}{%
			\def\neu@label@thesis{\neu@label@docthesis}%
			\def\neu@label@major{\neu@label@gradmajor}%
			\def\neu@label@institute{\neu@label@gradinstitute}%
		}}%
	\cleardoublepage
	\thispagestyle{empty}
	\newgeometry{top=19.2mm, bottom=25.4mm, left=28mm, right=26mm}
	\begin{center}
		\linespread{1}
		\zihao{5}
		\vspace*{3em}

		{\neu@value@schoollogo}

		\linespread{1}
		\zihao{5}
		\vspace*{7em}

		{\fontsize{54}{\baselineskip}\rmfamily {\neu@label@thesis}}

		\vspace*{2em}
		{\zihao{2} \textrm{\neu@label@enthesis}}
	\end{center}
	\begin{flushleft}
		\linespread{1}
		\zihao{5}
		\vspace*{6em}
		\bfseries

		{\zihao{3} 论文题目 \qquad {\neu@value@title}}

		\linespread{1}
		\vspace*{8em}
		\zihao{3}
		\def\tabcolsep{0em}
		\def\arraystretch{2}
		\begin{tabular}{p{6em} l}
			作 \qquad 者 & \neu@value@author    \\
			学 \qquad 号 & \neu@value@authorno  \\
			学 \qquad 院 & \neu@value@institute \\
			专 \qquad 业 & \neu@value@major     \\
			指导教师     & \neu@value@advisor   \\
		\end{tabular}

	\end{flushleft}
	\begin{center}
		\linespread{1}
		\zihao{3}
		\vspace*{3em}
		{\bfseries \neu@value@chinesedate}
		% \vspace*{\stretch{3}}
	\end{center}
	\restoregeometry
	\clearpage
	\if@twoside
		\thispagestyle{empty}
		\cleardoublepage[empty]
	\fi
}
%-
%-> Redefine Chinese style
%-
\newcommand{\makechinesetitle}{%

	\def\neu@label@thesis{\neu@label@otherthesis}
	\def\neu@label@major{\neu@label@othermajor}
	\cleardoublepage
	\thispagestyle{empty}
	% \newgeometry{top=25.4mm, bottom=25.4mm, left=30mm, right=30mm}
	\begin{center}
		\linespread{1.5}
		\zihao{4}
		\sffamily

		{\neu@label@category \ulenhance{\ulextend[100pt]{\hspace*{-\ulhshift}\zihao{4}\neu@value@category}}}
		\neuifstrbk{\neu@value@confidential}{}\quad
		{\neu@label@confidential \ulenhance{\ulextend[80pt]{\hspace*{-\ulhshift}\zihao{4}\neu@value@confidential}}} \hfill{}

		{\neu@label@UDC \ulenhance{\ulextend[113pt]{\hspace*{-\ulhshift}\zihao{5}\neu@value@UDC}}}\hfill{}

		\linespread{1}
		\zihao{5}
		\vspace*{\stretch{1}}

		{\zihao{2} \rmfamily {\neu@label@thesis}}

		\vspace*{\stretch{1}}

		{\zihao{-2} \sffamily \neu@value@title}
	\end{center}
	\begin{flushleft}
		\linespread{1}
		\zihao{5}
		\vspace{\stretch{1.5}}

		\linespread{1.5}
		\zihao{4}
		\rmfamily
		\def\tabcolsep{1pt}
		\def\arraystretch{1.2}
		\begin{tabular}{llll}
			\neu@label@author         & \multicolumn{3}{l}{\neu@value@author}                                                               \\
			\neu@label@authorno       & \multicolumn{3}{l}{\neu@value@authorno}                                                             \\
			\neu@label@advisor        & \multicolumn{3}{l}{\neu@value@advisor}                                                              \\
			                          & \multicolumn{3}{l}{\neu@value@advisorsec}                                                           \\
			\neu@label@degree         & \neu@value@degree                         & \neu@label@degreetype      & \neu@value@degreetype      \\
			\neu@label@major          & \neu@value@major                                                                                    \\
			\neu@label@submissiondate & \neu@value@submissiondate                 & \neu@label@oraldefencedate & \neu@value@oraldefencedate \\
			\neu@label@degreedate     & \neu@value@degreedate                     & \neu@label@chairman        & \neu@value@chairman        \\
		\end{tabular}
		\linespread{1}
		\zihao{5}
		\vspace*{\stretch{3}}
	\end{flushleft}

	\begin{center}
		\linespread{1}
		\zihao{4}
		{\neu@label@university}

		% \vspace*{\stretch{1}}
		\vspace{\baselineskip}
		% \vspace*{1ex}

		{\neu@value@chinesedate}
		\vspace*{\stretch{3}}
	\end{center}
	% \restoregeometry
	\clearpage
	\if@twoside
		\thispagestyle{empty}
		\ifneu@versioninfo
			\vspace*{\stretch{1}}
			\begin{footnotesize}
				\noindent
				Draft Version (\today)
			\end{footnotesize}
		\fi
		\cleardoublepage[empty]
	\else
		\ifneu@versioninfo
			\thispagestyle{empty}
			\vspace*{\stretch{1}}
			\begin{footnotesize}
				\noindent
				Draft Version (\today)
			\end{footnotesize}
			\cleardoublepage[empty]
		\fi
	\fi
}
%-
%-> English item commands
%-
\def\neu@value@englishtitle{}
\newcommand{\englishtitle}[1]{\def\neu@value@englishtitle{#1}}
\def\neu@value@englishauthor{}
\newcommand{\englishauthor}[1]{\def\neu@value@englishauthor{#1}}
\def\neu@value@englishadvisor{}
\newcommand{\englishadvisor}[1]{\def\neu@value@englishadvisor{#1}}
\def\neu@value@englishdegree{}
\newcommand{\englishdegree}[1]{\edef\neu@value@englishdegree{\zap@space#1 \@empty}}% expand and remove space
\def\neu@value@englishdegreetype{}
\newcommand{\englishdegreetype}[1]{\def\neu@value@englishdegreetype{#1}}
\def\neu@value@englishthesistype{}
\newcommand{\englishthesistype}[1]{\def\neu@value@englishthesistype{#1}}
\def\neu@value@englishmajor{}
\newcommand{\englishmajor}[1]{\def\neu@value@englishmajor{#1}}
\def\neu@value@englishuniversity{}
\newcommand{\englishuniversity}[1]{\def\neu@value@englishuniversity{#1}}
\def\neu@value@englishinstitute{}
\newcommand{\englishinstitute}[1]{\def\neu@value@englishinstitute{#1}}
\def\neu@value@englishdate{}
\newcommand{\englishdate}[1]{\def\neu@value@englishdate{#1}}
%-
%-> Redefine English style
%-
\newcommand{\makeenglishtitle}{%
	\cleardoublepage
	\thispagestyle{empty}
	\begin{flushleft}
		\linespread{1}
		\zihao{4}
		{\bfseries \neu@label@enthesisheader}
	\end{flushleft}

	\begin{center}
		\linespread{1}
		\zihao{5}
		\vspace*{4em}

		{\begin{spacing}{1.0}\zihao{2} \bfseries \neu@value@englishtitle\end{spacing}}

		\linespread{1}
		\zihao{5}
		\vspace*{6em}

		{\zihao{4} {by} {\neu@value@englishauthor}}

		\linespread{1}
		\zihao{5}
		\vspace*{6em}

		{\zihao{4} {Supervisor: }{\neu@value@englishadvisor}}

		\linespread{1}
		\zihao{5}
		\vspace*{28em}
		{
			\linespread{1}
			\zihao{3}
			\bfseries
			{\neu@value@englishuniversity}

			\vspace*{0.8em}

			{\neu@value@englishdate}

			\vspace*{3em}

		}

	\end{center}
	\clearpage
	\if@twoside
		\thispagestyle{empty}
		\cleardoublepage[empty]
	\fi
}
%---------------------------------------------------------------------------%
%->> Author's declaration
%---------------------------------------------------------------------------%
\newcommand{\makedeclaration}{
\cleardoublepage
\thispagestyle{empty}
\setcounter{page}{1}% 开始页码
\pagenumbering{Roman}% 页码符号
{
\chapter{\neu@value@declare@create}\chaptermark{\neu@value@declare@create}

\thispagestyle{noheaderstyle}
\linespread{1.83}
\zihao{4}
{\neu@value@declare@creativity}

{\hfill{} {\neu@value@declare@s \hspace*{6em}}}

{\hfill{} {\neu@value@declare@d \hspace*{6em}}}

\begin{center}
	{\linespread{1.5} \zihao{2}\sffamily \neu@value@declare@right}
\end{center}

{\neu@value@declare@rights}

\vspace*{2em}

{\neu@value@declare@rule}
\vspace*{1em}

{半年 \;  \scalebox{1.5}{\(\square\)} \qquad 一年  \;   \scalebox{1.5}{\(\square\)} \qquad 一年半  \; \scalebox{1.5}{\(\square\)} \qquad 两年 \; \scalebox{1.5}{\(\square\)}}

\vspace*{1em}

{\noindent{\neu@value@declare@s \hspace*{10em} \neu@value@declare@t \hspace*{9em}}}


{\noindent{\hspace*{4em}\neu@value@declare@d \hspace*{10em} \neu@value@declare@d \hspace*{9em}}}

\vspace*{\stretch{1}}
}
\clearpage
\if@twoside
	\thispagestyle{empty}
	\cleardoublepage[empty]
\fi
}
%---------------------------------------------------------------------------%
%->> New environments
%---------------------------------------------------------------------------%
%- define chinese keywords
\newcommand{\keywords}[1]{%
	\vspace{\baselineskip}
	{\noindent \linespread{1.83} \zihao{-4} {\sffamily \neu@label@keywords}  #1}}
%- define engish keywords
\newcommand{\englishkeywords}[1]{%
	\vspace{\baselineskip}
	\noindent \linespread{1.83} \zihao{-4} {\bfseries \neu@label@englishkeywords} #1}
%---------------------------------------------------------------------------%
%->> Configure table of contents
%---------------------------------------------------------------------------%
%- define spacing and length
\def\@dotsep{1.5mu}% spacing for dots
\def\@pnumwidth{1em}% spacing between titles and page numbers
\def\@tocrmarg{2em}% right margin indentation
\def\@chaptervspace{0ex}% spacing between chapter titles
%- redefine dottedtocline from classes.dtx and latex.ltx
% \fnum@figure
% \renewcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}{\fnum@figure}{\thepage}}
\renewcommand*{\@dottedtocline}[5]{% [<level>,<indent>,<numwidth>,<title>,<page>]
	\ifnum #1>\c@tocdepth \else
		\vskip \z@ \@plus.2\p@
		{\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
			\parindent #2\relax\@afterindenttrue
			\interlinepenalty\@M
			% \leavevmode \zihao{-4}\sffamily
			\leavevmode \zihao{-4}\rmfamily
			\@tempdima #3\relax
			\advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
			{#4}\nobreak
			\leaders\hbox{$\m@th\mkern \@dotsep \cdot\mkern \@dotsep$}\hfill
			\nobreak
			\hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor \zihao{-4} #5}%
			\par\penalty\@highpenalty}%
	\fi
}
%- redefine l@part from book.cls to add dotted toc line
\renewcommand*{\l@part}[2]{% [<title>,<page>]
	\ifnum \c@tocdepth >-2\relax
		\addpenalty{-\@highpenalty}%
		\addvspace{2.25em \@plus\p@}%
		\setlength\@tempdima{3em}%
		\begingroup
		\parindent \z@ \rightskip \@pnumwidth
		\parfillskip -\@pnumwidth
		{\leavevmode
			\zihao{-4}\sffamily #1
			\leaders\hbox{$\m@th\mkern \@dotsep \cdot\mkern \@dotsep$}% add dotted toc line
			\hfil \hb@xt@\@pnumwidth{\hss \zihao{-4} #2}}\par
		\nobreak
		\global\@nobreaktrue
		\everypar{\global\@nobreakfalse\everypar{}}%
		\endgroup
	\fi
}
%- redefine l@chapter from book.cls to add dotted toc line
\renewcommand*{\l@chapter}[2]{% [<title>,<page>]
	\ifnum \c@tocdepth >\m@ne
		\addpenalty{-\@highpenalty}%
		\vskip \@chaptervspace \@plus\p@
		\setlength\@tempdima{1.5em}%
		\begingroup
		\parindent \z@ \rightskip \@pnumwidth
		\parfillskip -\@pnumwidth
		\leavevmode \zihao{3}\sffamily
		\advance\leftskip\@tempdima
		\hskip -\leftskip
		#1\nobreak
		\leaders\hbox{\zihao{-4} $\m@th\mkern \@dotsep \cdot\mkern \@dotsep$}% add dotted toc line
		\hfil \nobreak\hb@xt@\@pnumwidth{\hss \zihao{-4} #2}\par
		\penalty\@highpenalty
		\endgroup
	\fi
}

\newcommand{\makereference}{
	\ifartx@biber%
		\printbibliography[title=\bibname]
	\else
		\bibliography{Biblio/ref.bib}% bibliography
	\fi
}
%---------------------------------------------------------------------------%
% 
% review or print version information/content
% 
\newcommand{\reviewORprint}[2]{
	\ifneu@review
		#1
	\else
		#2
	\fi
}
\endinput

