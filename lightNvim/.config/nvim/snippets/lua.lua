require("luasnip-helper-funcs")
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local fmta = require("luasnip.extras.fmt").fmta

return {
	s({ trig = "snip", snippetType = "autosnippet" },
		fmta([[
			s(
				{
				trig = "<>",
				snippetType = "<>",
				condition = <>,
				},
				<>
			),
			]],
			{
				i(1, "trigger"),
				c(2, {
					t("autosnippet"),
					i(nil, "other")
				}),
				c(3, {
					t("in_mathzone"),
					i(nil, "other"),
					t("in_equation"),
					t("in_text"),
					t("in_comment"),
					t("in_env"),
					t("in_tikz"),
					t("in_itemize"),
				}),
				c(4, {
					sn(nil, { t({"{", "		"}), i(1), t({"","	}"}) }),
					sn(nil, { t({"fmt([[", "		"}), i(1), t({"","	]],", "	{", "		"}), i(2), t({"","	})"}) }),
					sn(nil, { t({"fmta([[", "		"}), i(1), t({"","	]],", "	{", "		"}), i(2), t({"","	})"}) }),
				})
			}
		)
	),
}
