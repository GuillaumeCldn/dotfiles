require("luasnip-helper-funcs")
local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local c = ls.choice_node
local t = ls.text_node
local rep = require("luasnip.extras").rep
local fmta = require("luasnip.extras.fmt").fmta
local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
	s(
		{
		trig = "inc",
		snippetType = "autosnippet",
		condition = line_begin
		},
		fmta([[
		#include <>
		]],
		{
			i(0)
		})
	),
}
