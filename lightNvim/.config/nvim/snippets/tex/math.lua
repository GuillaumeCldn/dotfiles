local ls = require("luasnip")
local tex_utils = require("tex.utils")

local in_mathzone = tex_utils.in_mathzone
local in_equation = tex_utils.in_equation

local s = ls.snippet
local sn = ls.snippet_node
local i = ls.insert_node
local t = ls.text_node
local d = ls.dynamic_node
local c = ls.choice_node
local rep = require("luasnip.extras").rep
local fmta = require("luasnip.extras.fmt").fmta

local function gen_matrix(_, snip)
	local rows = tonumber(snip.captures[1])
	local cols = tonumber(snip.captures[2])
	local nodes = {}
	local insert_index = 1

	for row = 1, rows do
		for col = 1, cols do

			table.insert(nodes, i(insert_index))
			insert_index = insert_index + 1

			if col < cols then
				table.insert(nodes, t(" & "))
			end
		end

		if row < rows then
			table.insert(nodes, t({ " \\\\", "	" }))
		end
	end

	return sn(nil, nodes)
end

return {
	s(
		{
			trig = "fr",
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
			\frac{<>}{<>}<>	
			]],
			{
				i(1),
				i(2),
				i(0)
			}
		)
	),
	s(
		{
			trig = "m(%d+)(%d+)",
			regTrig = true,
			wordTrig = false,
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
			\begin{<>matrix}
				<>
			\end{<>matrix}<>
			]],
			{
				c(1, {
					t("p"),
					t("b")
				}),
				d(2, gen_matrix),
				rep(1),
				i(0)

			}
		)
	)
}
