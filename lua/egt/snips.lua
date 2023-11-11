local ls = require("luasnip");


local s = ls.s
local i = ls.insert_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep
ls.add_snippets("all", {
    ls.parser.parse_snippet("expand", "-- this is what was expanded")
})

ls.add_snippets("lua", {
    s("req", fmt("local {} = require('{}')", { i(1), rep(1)})),
})
