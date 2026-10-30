local M = {}

-- Typst math node types across common tree-sitter parsers
local MATH_NODES = {
  math = true,
  formula = true,
  equation = true,
}

-- Nodes that break math context (e.g. text/strings or comments inside $ ... $)
local NON_MATH_NODES = {
  string = true,        -- Typst text in math: $ "text" $
  comment = true,       -- Comments (uben0)
  line_comment = true,  -- Line comment (SeniorMars)
  block_comment = true, -- Block comment (SeniorMars)
  content = true,       -- Embedded content block (uben0)
  content_block = true, -- Embedded content block (SeniorMars)
  raw_span = true,      -- Inline raw code (uben0)
  raw_blck = true,      -- Raw block (uben0)
  raw = true,           -- Raw code/block (SeniorMars)
}

--- Checks if (crow, ccol) is strictly inside the math delimiters
local function is_inside_math_bounds(math_node, crow, ccol)
  local srow, scol, erow, ecol = math_node:range()

  -- At or before the opening delimiter '$'
  if crow < srow or (crow == srow and ccol <= scol) then
    return false
  end

  -- At or after the closing delimiter '$'
  if crow > erow or (crow == erow and ccol >= ecol) then
    return false
  end

  return true
end

--- Returns true if cursor is currently inside a Typst math environment
function M.in_mathzone()
  local ok, node = pcall(vim.treesitter.get_node, { ignore_injections = false })
  if not ok or not node then
    return false
  end

  local cursor = vim.api.nvim_win_get_cursor(0)
  local crow = cursor[1] - 1
  local ccol = cursor[2]

  while node do
    local ntype = node:type()

    -- If we hit a string/comment/content block first, we're not in math mode
    if NON_MATH_NODES[ntype] then
      return false
    end

    -- If we hit a math container, verify cursor is within delimiters
    if MATH_NODES[ntype] then
      return is_inside_math_bounds(node, crow, ccol)
    end

    node = node:parent()
  end

  return false
end

--- Returns true if cursor is outside math
function M.in_text()
  return not M.in_mathzone()
end

--- Returns true if cursor is inside a comment
function M.in_comment()
  local ok, node = pcall(vim.treesitter.get_node, { ignore_injections = false })
  if not ok or not node then
    return false
  end

  while node do
    local ntype = node:type()
    if ntype == "comment" or ntype == "line_comment" or ntype == "block_comment" then
      return true
    end
    node = node:parent()
  end

  return false
end

return M
