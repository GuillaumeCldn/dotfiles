local helpers = require("luasnip-helper-funcs")
local date_input = helpers.date_input
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local d = ls.dynamic_node
local fmta = require("luasnip.extras.fmt").fmta

return {
	s("hi", -- LuaSnip expands this to {trig = "hi"}
		{ t("Hello, world!"), }
	),
	s("today",
		fmta("<>",
			{
				d(1, date_input),
			}
		)
	),
}
