local ls = require("luasnip")

local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local k = require("luasnip.nodes.key_indexer").new_key

local s = ls.snippet
local c = ls.choice_node
local d = ls.dynamic_node
local i = ls.insert_node
local t = ls.text_node
local sn = ls.snippet_node

ls.add_snippets("typescript", {
	s(
		"testsuite",
		fmta(
			[[
  describe('<suite>', (<suiteArgs>)=>>{ 
      <suiteVars>
      beforeEach(<basync>(<bargs>)=>> {
        <beforeEach>
      });
    <finish>
    });
        ]],
			{
				suite = i(1),
				suiteArgs = i(2),
				suiteVars = i(3),
				basync = c(4, {
					t(""),
					t("async"),
				}),
				bargs = i(5),
				beforeEach = i(6),
				finish = i(0),
			}
		)
	),
	s(
		"test",
		fmta(
			[[
    it('<desc>', <testAsync>(<args>)=>> {
      <body>
    });
    <finish>
      ]],
			{
				desc = i(1),
				testAsync = c(2, {
					t(""),
					t("async"),
				}),
				args = i(3),
				body = i(4),
				finish = i(0),
			}
		)
	),
})
