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

local function gen_authors(_, snip)
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
				d(2, gen_authors),
				c(3, {
					t("École Nationale de l’Aviation Civile (ENAC)"),
					i(nil, "other"),
				}),
				i(4, "date"),
				c(5, {
					i(nil),
					sn(nil, { t({"\\publishers{", "	\\includegraphics[width=4cm]{"}), c(1, {t("logo_ENAC.png"), i(nil, "logo")}), t({"}", "}"})}),
					t(""),
				}),
				i(0)
			}
		)
	),
}
