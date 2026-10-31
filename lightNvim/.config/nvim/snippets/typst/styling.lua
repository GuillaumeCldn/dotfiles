require("luasnip-helper-funcs")
local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta
local typst_utils = require("typst.utils")
local in_text = typst_utils.in_text
local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
	s(
		{
		trig = "axx",
		snippetType = "autosnippet",
		condition = line_begin and in_text,
		},
		fmta([[
#counter(heading).update(1)
#set heading(supplement: [Annexe])
#set heading(numbering: (..nums) =>> {
  let nums-array = nums.pos()
  if nums-array.len() >> 1 {
    let current-level-num = nums-array.last()
    numbering("A.", current-level-num)
  }
})
<>
			
		]],
		{
			i(0)
		})
	),
}
