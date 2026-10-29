require("luasnip-helper-funcs")

local typst_utils = require("typst.utils")
local in_mathzone = typst_utils.in_mathzone
local in_text = typst_utils.in_text

local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local fmta = require("luasnip.extras.fmt").fmta

return {
	s(
		{
			trig = "$$",
			snippetType = "autosnippet",
			condition = in_text
		},
		fmta([[
			$<>$<>
		]],
			{
				i(1),
				i(0)
			})
	),
	s(
		{
			trig = "dm",
			snippetType = "autosnippet",
			condition = in_text
		},
		fmta([[
			$ <> $
		]],
			{
				i(0)
			})
	),
	s(
		{
			trig = "%%",
			snippetType = "autosnippet",
			condition = in_mathzone
		},
		fmta([[
			|<>|<>
		]],
			{
				i(1, "abs"),
				i(0)
			})
	),
	s(
		{
		trig = "iit",
		snippetType = "autosnippet",
		condition = in_mathzone
		},
		fmta([[
			integral_(<>)^(<>) <> dif <>
		]],
		{
			i(1, "lower bound"),
			i(2, "upper bound"),
			i(3, "integrand"),
			i(0, "variable")
		})
	),
	s(
		{
		trig = "ity",
		snippetType = "autosnippet",
		condition = in_mathzone
		},
		{
			t("infinity")
		}
	),
	s(
		{
		trig = "ovln",
		snippetType = "autosnippet",
		condition = in_mathzone
		},
		fmta([[
			overline(<>)<>
		]],
		{
			i(1),
			i(0)
		})
	),
}
