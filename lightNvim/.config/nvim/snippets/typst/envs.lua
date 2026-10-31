require("luasnip-helper-funcs")
local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local c = ls.choice_node
local fmta = require("luasnip.extras.fmt").fmta
local typst_utils = require("typst.utils")
local in_text = typst_utils.in_text
local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
	s(
		{
		trig = "fig",
		snippetType = "autosnippet",
		condition = line_begin and in_text,
		},
		fmta([[
		#figure(
			<>
			caption: [<>]
		)<>
		]],
		{
			i(1, "content"),
			i(2),
			i(0)
		})
	),
	s(
		{
		trig = "ali",
		snippetType = "autosnippet",
		condition = line_begin and in_text,
		},
		fmta([[
		#align(<>)[
		<>
		]<>
		]],
		{
			c(1, {
				i(nil),
				t("center"),
				t("left"),
				t("right")
			}),
			i(2, "content"),
			i(0)
		})
	),
	s(
		{
		trig = "l££",
		snippetType = "autosnippet",
		condition = line_begin and in_text,
		},
		fmta([[
		```<> <>```<>
		]],
		{
			c(1, {
				i(nil, "language"),
				t("python"),
				t("c"),
				t("cpp"),
				t("lua")
			}),
			i(2, "content"),
			i(0)
		})
	),
}
