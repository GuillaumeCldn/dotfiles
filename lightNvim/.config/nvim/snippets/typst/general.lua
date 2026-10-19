require("luasnip-helper-funcs")
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

return {
	s(
		{
			trig = "txt",
			snippetType = "autosnippet",
			wordTrig = false,
		},
		fmta([[
		#text[<>]<>
		]],
			{
				i(1),
				i(0)
			})
	),
	s(
		{
			trig = "$$",
			snippetType = "autosnippet",
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
		},
		fmta([[
			$ <> $
		]],
			{
				i(0)
			})
	),
	s(
		{
			trig = "%%",
			snippetType = "autosnippet",
		},
		fmta([[
			|<>|<>
		]],
			{
				i(1),
				i(0)
			})
	),
	s(
		{
			trig = "bcksl",
			snippetType = "autosnippet",
		},
		{
			t("#sym.backslash")
		}
	),
	s(
		{
			trig = "slsh",
			snippetType = "autosnippet",
		},
		{
			t("#sym.slash")
		}
	),
	s(
		{
			trig = "->",
			snippetType = "autosnippet",
		},
		{
			t("#sym.arrow.r")
		}
	),
	s(
		{
			trig = "<-",
			snippetType = "autosnippet",
		},
		{
			t("#sym.arrow.l")
		}
	),
	s(
		{
			trig = "gadd",
			snippetType = "autosnippet",
		},
		fmta([[
[<>], [<>],
<>
		]],
			{
				i(1, "allemand"),
				i(2, "français"),
				i(0)
			})
	),
	-- Bold
	s({ trig = "*", wordTrig = false, snippetType = "autosnippet" },
		{
			t("*"),
			d(1, get_visual),
			t("*"),
		}),
	-- Itallic
	s({ trig = "_", wordTrig = false, snippetType = "autosnippet" },
		{
			t("_"),
			d(1, get_visual),
			t("_"),
		}
	),
	s({trig=";a", snippetType="autosnippet"},
    {
      t("alpha"),
	}),
	s({trig=";b", snippetType="autosnippet"},
    {
      t("beta"),
	}),
	s({trig=";g", snippetType="autosnippet"},
    {
      t("gamma"),
	}),
	s({trig=";G", snippetType="autosnippet"},
    {
      t("Gamma"),
	}),
	s({trig=";d", snippetType="autosnippet"},
    {
      t("delta"),
	}),
	s({trig=";D", snippetType="autosnippet"},
    {
      t("Delta"),
	}),
	s({trig=";e", snippetType="autosnippet"},
    {
      t("epsilon"),
	}),
	s({trig=";z", snippetType="autosnippet"},
    {
      t("zeta"),
	}),
	s({trig=";h", snippetType="autosnippet"},
    {
      t("eta"),
	}),
	s({trig=";o", snippetType="autosnippet"},
    {
      t("theta"),
	}),
	s({trig=";O", snippetType="autosnippet"},
    {
      t("Theta"),
	}),
	s({trig=";k", snippetType="autosnippet"},
    {
      t("kappa"),
	}),
	s({trig=";l", snippetType="autosnippet"},
    {
      t("lambda"),
	}),
	s({trig=";L", snippetType="autosnippet"},
    {
      t("Lambda"),
	}),
	s({trig=";m", snippetType="autosnippet"},
    {
      t("mu"),
	}),
	s({trig=";n", snippetType="autosnippet"},
    {
      t("nu"),
	}),
	s({trig=";x", snippetType="autosnippet"},
    {
      t("xi"),
	}),
	s({trig=";X", snippetType="autosnippet"},
    {
      t("Xi"),
	}),
	s({trig=";i", snippetType="autosnippet"},
    {
      t("pi"),
	}),
	s({trig=";I", snippetType="autosnippet"},
    {
      t("Pi"),
	}),
	s({trig=";r", snippetType="autosnippet"},
    {
      t("rho"),
	}),
	s({trig=";s", snippetType="autosnippet"},
    {
      t("sigma"),
	}),
	s({trig=";S", snippetType="autosnippet"},
    {
      t("Sigma"),
	}),
	s({trig=";t", snippetType="autosnippet"},
    {
      t("tau"),
	}),
	s({trig=";f", snippetType="autosnippet"},
    {
      t("phi"),
	}),
	s({trig=";F", snippetType="autosnippet"},
    {
      t("Phi"),
	}),
	s({trig=";c", snippetType="autosnippet"},
    {
      t("chi"),
	}),
	s({trig=";p", snippetType="autosnippet"},
    {
      t("psi"),
	}),
	s({trig=";P", snippetType="autosnippet"},
    {
      t("Psi"),
	}),
	s({trig=";w", snippetType="autosnippet"},
    {
      t("omega"),
	}),
	s({trig=";W", snippetType="autosnippet"},
    {
      t("Omega"),
	}),
}
