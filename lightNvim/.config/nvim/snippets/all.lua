local helpers = require("luasnip-helper-funcs")
local date_input = helpers.date_input

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

