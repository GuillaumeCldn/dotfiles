require("luasnip-helper-funcs")

return {
	s(
		{
			trig = "ENAC",
			snippetType = "autosnippet",
		},
		fmta([[
\documentclass[12pt,oneside]{scrreprt}

% ---------------------------------------------------------
% PACKAGES
% ---------------------------------------------------------
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage[french]{babel}
\usepackage{graphicx}
\usepackage{subcaption}
\usepackage{amsmath}
\usepackage{siunitx}
\usepackage{booktabs}
\usepackage[hidelinks]{hyperref}
\usepackage{lmodern}
\usepackage{microtype}
\usepackage{float}
\usepackage{fmtcount}
\usepackage{tikz}
\usetikzlibrary{arrows.meta, matrix, decorations.pathreplacing, calc}
\usepackage{wrapfig}
%\usetikzlibrary{graphs, graphdrawing}
%\usegdlibrary{circular}

% ---------------------------------------------------------
% MISE EN PAGE
% ---------------------------------------------------------
\usepackage[margin=2.5cm]{geometry}

\setlength{\parskip}{0.85em}
\setlength{\parindent}{1.2em}
\linespread{1.15}

% ---------------------------------------------------------
% TITRES (méthode KOMA-Script)
% ---------------------------------------------------------
\RedeclareSectionCommand[
beforeskip=1.8em plus 0.2em minus 0.2em,
afterskip=1em,
font=\normalfont\huge\bfseries]{chapter}

\RedeclareSectionCommand[
beforeskip=1.4em plus 0.2em minus 0.2em,
afterskip=0.8em,
font=\normalfont\Large\bfseries]{section}

\RedeclareSectionCommand[
beforeskip=1em plus 0.2em minus 0.2em,
afterskip=0.5em,
font=\normalfont\large\bfseries]{subsection}

% ---------------------------------------------------------
% TITRE DU RAPPORT
% ---------------------------------------------------------
\title{\Huge \bfseries <>}

\author{%
	\Large <>\\
	\texttt{guillaume.claudon@alumni.enac.fr}\\[1.2em]
	\large École Nationale de l’Aviation Civile (ENAC)%
}

\date{<>}



% ---------------------------------------------------------

\publishers{
	\includegraphics[width=4cm]{<>}
}

\begin{document}
% ---------------------------------------------------------

\maketitle
\tableofcontents
\nopagebreak
\listoffigures
\clearpage

% ===============================================================
\chapter{Introduction}
% ===============================================================
<>
\end{document}
			]],
			{
				i(1, "title"),
				i(2, "author"),
				i(3, "date"),
				c(4, {
					i(nil, "logo"),
					t(""),
				}),
				i(0)
			}
		)
	),
}
