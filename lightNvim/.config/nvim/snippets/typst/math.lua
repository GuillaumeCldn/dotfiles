local helpers = require("luasnip-helper-funcs")
local get_visual = helpers.get_visual

local typst_utils = require("typst.utils")
local in_mathzone = typst_utils.in_mathzone
local in_text = typst_utils.in_text

local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local d = ls.dynamic_node
local sn = ls.snippet_node
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
				table.insert(nodes, t(", "))
			end
		end

		if row < rows then
			table.insert(nodes, t({ ";", "	" }))
		end
	end

	return sn(nil, nodes)
end

local function gen_vector(_, snip)
	local rows = tonumber(snip.captures[1])
	local nodes = {}
	local insert_index = 1

	for row = 1, rows do

		table.insert(nodes, i(insert_index))
		insert_index = insert_index + 1

		if row < rows then
			table.insert(nodes, t({ ",", "	" }))
		end

	end

	return sn(nil, nodes)
end

return {
	s(
		{
			trig = "$$",
			snippetType = "autosnippet",
			condition = in_text
		},
		fmta([[
			$<>$<>
		]],
			{
				i(1),
				i(0)
			})
	),
	s(
		{
			trig = "dm",
			snippetType = "autosnippet",
			condition = in_text
		},
		fmta([[
			$ <> $
			<>
		]],
			{
				i(1),
				i(0)
			})
	),
	s(
		{
			trig = "%%",
			snippetType = "autosnippet",
			condition = in_mathzone
		},
		fmta([[
			|<>|<>
		]],
			{
				i(1, "abs"),
				i(0)
			})
	),
	s(
		{
		trig = "iit",
		snippetType = "autosnippet",
		condition = in_mathzone
		},
		fmta([[
			integral_(<>)^(<>) <> dif <>
		]],
		{
			i(1, "lower bound"),
			i(2, "upper bound"),
			i(3, "integrand"),
			i(0, "variable")
		})
	),
	s(
		{
		trig = "ity",
		snippetType = "autosnippet",
		condition = in_mathzone
		},
		{
			t("infinity")
		}
	),
	s(
		{
		trig = "ol",
		snippetType = "autosnippet",
		condition = in_mathzone
		},
		fmta([[
			overline(<>)<>
		]],
		{
			i(1),
			i(0)
		})
	),
	s(
		{
		trig = "ul",
		snippetType = "autosnippet",
		condition = in_mathzone
		},
		fmta([[
			underline(<>)<>
		]],
		{
			i(1),
			i(0)
		})
	),
	s(
		{
		trig = "bd",
		snippetType = "autosnippet",
		condition = in_mathzone,
		},
		fmta([[
			bold(<>)<>
		]],
		{
			d(1, get_visual),
			i(0)
		})
	),
	s(
		{
		trig = "mt",
		snippetType = "autosnippet",
		condition = in_mathzone,
		},
		fmta([[
		mat(
			<>
		)<>
		]],
		{
			i(1),
			i(0)
		})
	),
	s(
		{
		trig = "vc",
		snippetType = "autosnippet",
		condition = in_mathzone,
		},
		fmta([[
		vec(<>)<>
		]],
		{
			i(1),
			i(0)
		})
	),
	s(
		{
		trig = "dt",
		snippetType = "autosnippet",
		wordTrig = false,
		condition = in_mathzone,
		},
		fmta([[
			dot(<>)<>
		]],
		{
			i(1),
			i(0)
		})
	),
	s(
		{
		trig = "ht",
		snippetType = "autosnippet",
		wordTrig = false,
		condition = in_mathzone,
		},
		fmta([[
			hat(<>)<>
		]],
		{
			i(1),
			i(0)
		})
	),
	s(
		{
		trig = "td",
		snippetType = "autosnippet",
		wordTrig = false,
		condition = in_mathzone,
		},
		fmta([[
			tilde(<>)<>
		]],
		{
			i(1),
			i(0)
		})
	),
}
