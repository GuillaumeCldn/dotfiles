require("luasnip-helper-funcs")

return{
	s("snip",
		fmta([[
		s(
			{
			trig = "<>",
			snippetType = "<>",
			condition = "<>",
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
