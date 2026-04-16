-- Imports
require("luasnip-helper-funcs")
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local d = ls.dynamic_node
local l = require("luasnip.extras").lambda
local sn = ls.snippet_node
local fmta = require("luasnip.extras.fmt").fmta


-- Utils
local function gen_authors_ENAC(_, snip)
	local rows = tonumber(snip.captures[1]) or 1
	local nodes = {}
	local index = 1

	for row = 1, rows do

		table.insert(nodes, t({"", "	\\Large "}))
		table.insert(nodes, i(index, "Prénom"))
		table.insert(nodes, t(" "))
		table.insert(nodes, i(index+1, "Nom"))
		table.insert(nodes, t({" \\\\", "	\\texttt{"}))
		table.insert(nodes, l(l._1:lower(), {index}))
		table.insert(nodes, t("."))
		table.insert(nodes, l(l._1:lower(), {index+1}))
		table.insert(nodes, t({"@alumni.enac.fr}\\\\[1.2em]", ""}))

		index = index + 2
	end

	return sn(nil, nodes)
end

local function gen_authors_IFAC(_, snip)
	local rows = tonumber(snip.captures[1]) or 1
	local nodes = {}
	local index = 1

	for row = 1, rows do

		table.insert(nodes, t({"\\author[A"..row.."]{"}))
		table.insert(nodes, i(index, "Prénom"))
		table.insert(nodes, t(" "))
		table.insert(nodes, i(index+1, "Nom"))
		table.insert(nodes, t({"}", "\\address[A"..row.."]{Ecole Nationale de l'Aviation Civile, Toulouse France (e-mail: "}))
		table.insert(nodes, l(l._1:lower(), {index}))
		table.insert(nodes, t("."))
		table.insert(nodes, l(l._1:lower(), {index+1}))
		table.insert(nodes, t({"@alumni.enac.fr)}", ""}))

		index = index + 2
	end

	return sn(nil, nodes)
end

-- Snippets
return {
	s(
		{
			trig = "ENAC(%d+)",
			snippetType = "autosnippet",
			regTrig = true,
			wordTrig = false
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

% Better diff symbol
\newcommand{\diff}{\ensuremath{\operatorname{d}\!}}

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
	<>
	\large <> %
}

\date{<>}



% ---------------------------------------------------------

<>

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
				d(2, gen_authors_ENAC),
				c(3, {
					t("École Nationale de l’Aviation Civile (ENAC)"),
					i(nil, "other"),
				}),
				i(4, "date"),
				c(5, {
					i(nil, "logo"),
					sn(nil, { t({"\\publishers{", "	\\includegraphics[width=4cm]{"}), c(1, {t("logo_ENAC.png"), i(nil, "logo")}), t({"}", "}"})}),
					t(""),
				}),
				i(0)
			}
		)
	),
	s(
		{
		trig = "IFAC(%d+)",
		snippetType = "autosnippet",
		regTrig = true,
		wordTrig = false
		},
		fmta([[
			
\documentclass{ifacconf}

% ---------------------------------------------------------
% PACKAGES
% ---------------------------------------------------------
\usepackage{natbib}        % required for bibliography
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage{graphicx}
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

\newcommand{\diff}{\ensuremath{\operatorname{d}\!}}% Better diff symbol


\begin{document}

\begin{frontmatter}
\title{<>\thanksref{footnoteinfo}} 

\thanks[footnoteinfo]{<>}

<>

\begin{abstract}   
<>
\end{abstract}

\begin{keyword}
<>
\end{keyword}

\end{frontmatter}

<>
<>

<>

\end{document}
		]],
		{
			i(1, "Title"),
			i(2, "Acknowledgments"),
			d(3, gen_authors_IFAC),
			i(4, "Abstract"),
			i(5, "Keywords"),
			c(6, {
				i(nil, "Logo right"),
				sn(nil, fmta(
					[[
\begin{tikzpicture}[remember picture, overlay]
\node[anchor=north west, xshift=1cm, yshift=0cm] at (current page.north west) {
\includegraphics[width=4cm]{<>}};
\end{tikzpicture}
					]],
					{
						i(1, "Logo name")
					}
				)
				),
				t(""),
			}),
			c(7, {
				i(nil, "Logo left"),
				sn(nil, fmta(
					[[
\begin{tikzpicture}[remember picture, overlay]
\node[anchor=north east, xshift=0cm, yshift=0cm] at (current page.north east) {
\includegraphics[width=4cm]{<>}};
\end{tikzpicture}
					]],
					{
						i(1, "Logo name")
					}
				)
				),
				t(""),
			}),
			i(0),

		})
	),
}
