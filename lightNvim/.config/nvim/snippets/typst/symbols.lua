require("luasnip-helper-funcs")
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

return {
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
	s(
		{
			trig = "->",
			snippetType = "autosnippet",
		},
		{
			t("#sym.arrow.r")
		}
	),
	s(
		{
			trig = "<-",
			snippetType = "autosnippet",
		},
		{
			t("#sym.arrow.l")
		}
	),
}
