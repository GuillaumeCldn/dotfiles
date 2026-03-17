require("luasnip-helper-funcs")
local ls = require("luasnip")
local s = ls.snippet
local fmta = require("luasnip.extras.fmt").fmta

return {
	s(
		{
		trig = "txt",
		snippetType = "autosnippet",
		},
		fmta([[
		#text[<>]<>
		]],
		{
			i(1),
			i(0)
		})
	),
}
