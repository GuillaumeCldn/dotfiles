require("luasnip-helper-funcs")
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local fmta = require("luasnip.extras.fmt").fmta

return{
	s("snip",
		fmta([[
		s(
			{
			trig = "<>",
			snippetType = "<>",
			condition = <>,
			},
			{
				<>
			},
		)
		]],
			{
				i(1, "trigger"),
				c(2, {
					t("autosnippet"),
					i(nil, "other")
				}),
				c(3, {
					t("in_mathzone"),
					t("in_equation"),
					t("in_text"),
					t("in_comment"),
					t("in_env"),
					t("in_tikz"),
					t("in_itemize"),
					i(nil, "other"),
				}),
				i(0)
			}
		)
	),
}
