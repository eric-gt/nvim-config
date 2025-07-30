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

function thresholdBlock()
	return sn(nil, {})
end

function listBlock()
	return sn(nil, {})
end

ls.add_snippets("json", {
	s(
		"tsMonitoringCriteria",
		fmta(
			[[ 
        "monitoringCriteria": {
          "event": {
            "status": {
              "in": [<status>]
            }
          },
          "stream": {
            "playbackState": {
              "in": [<playbackState>]
            }
          }
        }<finish>
      ]],
			{
				status = i(1),
				playbackState = i(2),
				finish = i(0),
			}
		)
	),
	-- s(
	-- 	"tsMetric",
	-- 	fmta(
	-- 		[[
	--      "<name>": {
	--        "code": "<code>",
	--        <statusBlock>
	--      }<finish>
	--      ]],
	-- 		{
	-- 			name = i(1),
	-- 			code = i(2),
	-- 			statusBlock = c(3, {
	-- 				t(""),
	-- 				thresholdBlock(),
	-- 				listBlock(),
	-- 			}),
	-- 			warn = i(3),
	-- 			err = i(4),
	-- 			finish = i(0),
	-- 		}
	-- 	)
	-- ),
})
