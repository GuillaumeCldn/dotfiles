local helpers = require("luasnip-helper-funcs")
local date_input = helpers.date_input
local get_visual = helpers.get_visual
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
	-- Paired parentheses
	s({ trig = "(", wordTrig = false, snippetType = "autosnippet" },
		{
			t("("),
			d(1, get_visual),
			t(")"),
		}),
	-- Paired curly braces
	s({ trig = "{", wordTrig = false, snippetType = "autosnippet" },
		{
			t("{"),
			d(1, get_visual),
			t("}"),
		}),
	-- Paired square brackets
	s({ trig = "[", wordTrig = false, snippetType = "autosnippet" },
		{
			t("["),
			d(1, get_visual),
			t("]"),
		}),
	-- Paired tags
	s({ trig = "<", wordTrig = false, snippetType = "autosnippet" },
		{
			t("<"),
			d(1, get_visual),
			t(">"),
		}),
	-- Paired double quotes
	s({ trig = '"', wordTrig = false, snippetType = "autosnippet", priority = 2000 },
		fmta(
			'"<>"',
			{
				d(1, get_visual),
			}
		)
	),
	-- Paired single quotes
	s({ trig = "'", wordTrig = false, snippetType = "autosnippet", priority = 2000 },
		fmta(
			"'<>'",
			{
				d(1, get_visual),
			}
		)
	),
}

