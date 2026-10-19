require("luasnip-helper-funcs")
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
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
			trig = "gadd",
			snippetType = "autosnippet",
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
	-- Bold
	s({ trig = "*", wordTrig = false, snippetType = "autosnippet" },
		{
			t("*"),
			d(1, get_visual),
			t("*"),
		}),
	-- Itallic
	s({ trig = "_", wordTrig = false, snippetType = "autosnippet" },
		{
			t("_"),
			d(1, get_visual),
			t("_"),
		}
	),
}
