require("luasnip-helper-funcs")
local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local rep = require("luasnip.extras").rep
local fmta = require("luasnip.extras.fmt").fmta

local tex_utils = require("tex.utils")
local in_text = tex_utils.in_text

return {
	s(
		{
		trig = "en",
		condition = in_text,
		},
		fmta([[
			\begin{<>}
				<>
			\end{<>}
		]],
		{
			i(1),
			i(0),
			rep(1)
		})
	),
}
