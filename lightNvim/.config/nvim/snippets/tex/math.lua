local helpers = require("luasnip-helper-funcs")
local tex_utils = require("tex.utils")
local in_mathzone = tex_utils.in_mathzone
local in_equation = tex_utils.in_equation
local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

return {
	s(
		{
		trig = "frac",
		snippetType = "autosnippet",
		condition = in_mathzone,
		},
		fmta(
		[[
\frac{<>}{<>}	
		]],
		{
			i(1),
			i(2)
		}
		)
	)
}
