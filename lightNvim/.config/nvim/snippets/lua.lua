require("luasnip-helper-funcs")
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local fmta = require("luasnip.extras.fmt").fmta
local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
	s(
		{
			trig = "snip",
			snippetType = "autosnippet",
			condition = line_begin
		},
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
					t("snippet"),
				}),
				c(3, {
					t("line_begin"),
					t("in_mathzone"),
					t("in_text"),
					t("in_equation"),
					t("in_comment"),
					t("in_env"),
					t("in_tikz"),
					t("in_itemize"),
				}),
				c(4, {
					sn(nil, { t({ "{", "		" }), i(1), t({ "", "	}" }) }),
					sn(nil, { t({ "fmta([[", "		" }), i(1), t({ "", "	]],", "	{", "		" }), i(2), t({ "", "	})" }) }),
					sn(nil, { t({ "fmt([[", "		" }), i(1), t({ "", "	]],", "	{", "		" }), i(2), t({ "", "	})" }) }),
				})
			}
		)
	),
	s(
		{
			trig = "sini",
			snippetType = "autosnippet",
			condition = line_begin,
		},
		fmta([[
			require("luasnip-helper-funcs")
			local ls = require("luasnip")
			local s = ls.snippet
			local fmta = require("luasnip.extras.fmt").fmta

			return {
				<>
			}
		]],
			{
				i(0)
			})
	),
}
