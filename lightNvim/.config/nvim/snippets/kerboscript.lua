require("luasnip-helper-funcs")
local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local c = ls.choice_node
local t = ls.text_node
local fmta = require("luasnip.extras.fmt").fmta

return {
	s(
		{
		trig = "if",
		snippetType = "autosnippet",
		},
		fmta([[
			if <> {
				<>		
			}
		]],
		{
			i(1, "condition"),
			i(0, "body")
		})
	),
	s(
		{
		trig = "ife",
		snippetType = "autosnippet",
		},
		fmta([[
			if <> {
				<>
			} else {
				<>
			}
		]],
		{
			i(1, "condition"),
			i(2, "body"),
			i(0, "body")
		})
	),
	s(
		{
		trig = "else",
		snippetType = "autosnippet",
		},
		fmta([[
	else {
		<>
	}
		]],
		{
			i(0, "body")
		})
	),
	s(
		{
		trig = "set",
		snippetType = "autosnippet",
		},
		fmta([[
			set <> to <>.
		]],
		{
			i(1, "suffix"),
			i(0, "value")
		})
	),
	s(
		{
		trig = "until",
		snippetType = "autosnippet",
		},
		fmta([[
until <> {
	<>
}
		]],
		{
			i(1, "condition"),
			i(0, "body")
		})
	),
	s(
		{
		trig = "from",
		snippetType = "autosnippet",
		},
		fmta([[
from {<>} until <> step {<>} do {
	<>
}
		]],
		{
			i(1, "initialiser"),
			i(2, "condition"),
			i(3, "step"),
			i(0, "body")
		})
	),
	s(
		{
		trig = "when",
		snippetType = "autosnippet",
		},
		fmta([[
when <> then {
	<>
}
		]],
		{
			i(1, "condition"),
			i(0, "body")
		})
	),
	s(
		{
		trig = "on",
		snippetType = "autosnippet",
		},
		fmta([[
on <> {
	<>
}
		]],
		{
			i(1, "condition"),
			i(0, "body")
		})
	),
	s(
		{
		trig = "for",
		snippetType = "autosnippet",
		},
		fmta([[
for <> in <> {
	<>
}
		]],
		{
			i(1, "element"),
			i(2, "collection"),
			i(0, "body")
		})
	),
	s(
		{
		trig = "log",
		snippetType = "autosnippet",
		},
		fmta([[
log <> to <>.
		]],
		{
			i(1, "value"),
			i(0, "file")
		})
	),
	s(
		{
		trig = "func",
		snippetType = "autosnippet",
		},
		fmta([[
function <> {
	<>
}
		]],
		{
			i(1, "name"),
			i(0, "body")
		})
	),
	s(
		{
		trig = "Func",
		snippetType = "autosnippet",
		},
		fmta([[
<> function <> {
	<>
}
		]],
		{
			c(1, {
				t("local"),
				t("global")
			}),
			i(2, "name"),
			i(0, "body")
		})
	),
	s(
		{
		trig = "var",
		snippetType = "autosnippet",
		},
		fmta([[
<> <> is <>.
		]],
		{
			c(1, {
				t("local"),
				t("global")
			}),
			i(2, "name"),
			i(0, "value")
		})
	),
	s(
		{
		trig = "lock",
		snippetType = "autosnippet",
		},
		fmta([[
lock <> to <>.
		]],
		{
			i(1, "name"),
			i(0, "expression")
		})
	),
}
