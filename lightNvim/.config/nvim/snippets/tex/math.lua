local ls = require("luasnip")
local tex_utils = require("tex.utils")

local in_mathzone = tex_utils.in_mathzone
local in_text = tex_utils.in_text

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

local function gen_vector(_, snip)
	local cols = tonumber(snip.captures[1])
	local nodes = {}
	local insert_index = 1

	for col = 1, cols do

		table.insert(nodes, i(insert_index))
		insert_index = insert_index + 1

		if col < cols then
			table.insert(nodes, t({ " \\\\", "	" }))
		else
			table.insert(nodes, t( " \\\\"))
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
	),
	s(
		{
			trig = "v(%d+)",
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
				d(2, gen_vector),
				rep(1),
				i(0)

			}
		)
	),
	s(
		{
		trig = "ii",
		snippetType = "autosnippet",
		condition = in_mathzone,
		},
		fmta([[
			\int_{<>}^{<>}<>\diff <>
		]],
		{
			i(1),
			i(2),
			i(3),
			i(0)
		})
	),
	s(
		{
		trig = "dm",
		condition = in_text,
		},
		fmta([[
			$$
			<>
			$$
		]],
		{
			i(0)
		})
	),
	s(
		{
		trig = "im",
		condition = in_text,
		},
		fmta([[
			$ <> $
		]],
		{
			i(0)
		})
	),
}
