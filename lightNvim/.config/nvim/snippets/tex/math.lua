local helpers = require("luasnip-helper-funcs")
local tex_utils = require("tex.utils")
local in_mathzone = tex_utils.in_mathzone
local in_equation = tex_utils.in_equation

return {
	s(
		{
			trig = "test",
			snippetType = "autosnippet",
			condition = in_mathzone
		},
		{
			t("\\text{test}")
		}
	),
}
