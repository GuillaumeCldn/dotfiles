require("luasnip-helper-funcs")
local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
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
}
