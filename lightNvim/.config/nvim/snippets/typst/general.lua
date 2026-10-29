local helpers = require("luasnip-helper-funcs")
local get_visual = helpers.get_visual

local typst_utils = require("typst.utils")
local in_text = typst_utils.in_text

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local d = ls.dynamic_node
local c = ls.choice_node
local sn = ls.snippet_node
local fmta = require("luasnip.extras.fmt").fmta

return {
	s(
		{
			trig = "txt",
			snippetType = "autosnippet",
			wordTrig = false,
			condition = in_text
		},
		fmta([[
		#text[<>]<>
		]],
			{
				i(1),
				i(0)
			})
	),
	s(
		{
			trig = "gadd",
			snippetType = "autosnippet",
			condition = in_text
		},
		fmta([[
[<>], [<>],
<>
		]],
			{
				i(1, "allemand"),
				i(2, "français"),
				i(0)
			})
	),
	-- Italic
	s(
		{
			trig = "_",
			wordTrig = false,
			snippetType = "autosnippet",
			condition = in_text
		},
		fmta([[
			_<>_
			]],
			{
				d(1, get_visual),
			}
		)
	),
	-- Bold
	s(
		{
			trig = "*",
			wordTrig = false,
			snippetType = "autosnippet",
			condition = in_text
		},
		fmta([[
			*<>*
			]],
			{
				d(1, get_visual),
			}
		)
	),
	s(
		{
			trig = "TOC",
			snippetType = "autosnippet",
			condition = in_text
		},
		fmta([[
#outline(title: <>, indent: auto)<>
			]],
			{
				c(1, {
					t("auto"),
					sn(nil, {
						t("["),
						i(1, "title"),
						t("]"),
					})
				}),
				i(0)
			}
		)
	),
	s(
		{
			trig = "jstf",
			snippetType = "autosnippet",
			condition = in_text
		},
		{
			t("#set par(justify: true)")
		}
	),
	s(
		{
			trig = "hdg",
			snippetType = "autosnippet",
			condition = in_text
		},
		fmta([[
#set heading(numbering: <>)<>
		]],
			{
				c(1, {
					t('"1.1."'),
					i(nil, "numbering convention")
				}),
				i(0)
			})
	),
	s(
		{
			trig = "pge",
			snippetType = "autosnippet",
			condition = in_text
		},
		fmta([[
#set page(
  paper: <>,
  margin: (x: 2.5cm, y: 3cm),
  numbering: <>,
  number-align: <>
)<>
		]],
			{
				c(1, { t('"a4"'), i(nil, "page size") }),
				c(2, { t('"1"'), i(nil, "page numbering") }),
				c(3, { t("center + bottom"), i(nil, "numbering location") }),
				i(0)
			})
	),
	s(
		{
			trig = "lng",
			snippetType = "autosnippet",
			condition = in_text
		},
		fmta([[
#set text(lang: <>, font: <>, size: 11pt)<>
		]],
			{
				c(1, { t('"fr"'), t('"en"'), t('"de"'), i(nil, "language code") }),
				c(2, { t('"New Computer Modern"'), i(nil, "font name") }),
				i(0)
			})
	),
	s(
		{
			trig = "dct",
			snippetType = "autosnippet",
			condition = in_text
		},
		fmta([[
#set document(title: [<>], author: [<>])<>
		]],
			{
				i(1),
				i(2),
				i(0)
			})
	),
	s(
		{
			trig = "brk",
			snippetType = "autosnippet",
			condition = in_text
		},
		{
			t("#pagebreak()")
		}
	),
}
