require("luasnip-helper-funcs")
local ls = require("luasnip")
local s = ls.snippet
local fmta = require("luasnip.extras.fmt").fmta

return {
	s(
		{
		trig = "txt",
		snippetType = "autosnippet",
		wordTrig = false,
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
			i(1),
			i(0)
		})
	),
	s(
		{
		trig = "bcksl",
		snippetType = "autosnippet",
		},
		{
			t("#sym.backslash")
		}
	),
	s(
		{
		trig = "slsh",
		snippetType = "autosnippet",
		},
		{
			t("#sym.slash")
		}
	),
}
