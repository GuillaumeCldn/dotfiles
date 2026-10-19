require("luasnip-helper-funcs")
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
		trig = "infty",
		snippetType = "autosnippet",
		},
		{
			t("infinity")
		}
	),
	s(
		{
		trig = "ovln",
		snippetType = "autosnippet",
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
