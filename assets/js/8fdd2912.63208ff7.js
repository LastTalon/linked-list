"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[306],{38864:e=>{e.exports=JSON.parse('{"functions":[{"name":"new","desc":"Creates a new LinkedList.","params":[],"returns":[],"function_type":"static","source":{"line":45,"path":"lib/init.lua"}},{"name":"Push","desc":"Pushes a new entry to the back of this list.","params":[{"name":"value","desc":"","lua_type":"T"}],"returns":[{"desc":"","lua_type":"Entry<T>\\n"}],"function_type":"method","source":{"line":85,"path":"lib/init.lua"}},{"name":"Unshift","desc":"Unshifts a new entry to the front of this list.","params":[{"name":"value","desc":"","lua_type":"T"}],"returns":[{"desc":"","lua_type":"Entry<T>\\n"}],"function_type":"method","source":{"line":103,"path":"lib/init.lua"}},{"name":"Shift","desc":"Shifts an entry off of the front of this list.","params":[],"returns":[{"desc":"","lua_type":"unknown\\n"}],"function_type":"method","source":{"line":121,"path":"lib/init.lua"}},{"name":"Pop","desc":"Pops an entry off of the back of this list.","params":[],"returns":[{"desc":"","lua_type":"unknown\\n"}],"function_type":"method","source":{"line":133,"path":"lib/init.lua"}},{"name":"Peek","desc":"Returns the value of the first element in the list without removing it.","params":[],"returns":[{"desc":"","lua_type":"unknown\\n"}],"function_type":"method","source":{"line":145,"path":"lib/init.lua"}},{"name":"PeekBack","desc":"Returns the value of the last element in the list without removing it.","params":[],"returns":[{"desc":"","lua_type":"unknown\\n"}],"function_type":"method","source":{"line":155,"path":"lib/init.lua"}},{"name":"PeekEntry","desc":"Returns the first entry in the list without removing it.","params":[],"returns":[{"desc":"","lua_type":"unknown\\n"}],"function_type":"method","source":{"line":165,"path":"lib/init.lua"}},{"name":"PeekBackEntry","desc":"Returns the last entry in the list without removing it.","params":[],"returns":[{"desc":"","lua_type":"unknown\\n"}],"function_type":"method","source":{"line":175,"path":"lib/init.lua"}},{"name":"__iter","desc":"Iterates over all entries in this list.\\n\\nIteration returns the value stored in each entry, followed by an [Entry<T>]\\nobject which can be used to manipulate this entry in the list.\\n\\n```lua\\nfor value, entry in list do\\n\\tif value == \\"foo\\" then\\n\\t\\tentry.remove()\\n\\tend\\nend\\n```","params":[],"returns":[{"desc":"","lua_type":"T"},{"desc":"","lua_type":"Entry<T>"}],"function_type":"method","source":{"line":199,"path":"lib/init.lua"}},{"name":"IterReversed","desc":"Iterates over all entries in this list in reverse order.\\n\\nIteration returns the value stored in each entry, followed by an [Entry<T>]\\nobject which can be used to manipulate this entry in the list.\\n\\n```lua\\nfor value, entry in list:IterReversed() do\\n\\tif value == \\"foo\\" then\\n\\t\\tentry.remove()\\n\\tend\\nend\\n```","params":[],"returns":[{"desc":"The value stored in the entry","lua_type":"T"},{"desc":"The entry object","lua_type":"Entry<T>"}],"function_type":"method","source":{"line":230,"path":"lib/init.lua"}}],"properties":[],"types":[{"name":"Entry<T>","desc":"An entry in a LinkedList.\\n\\nAllows removing this entry from the list. This is a constant time operation.","fields":[{"name":"remove","lua_type":"() -> ()","desc":""}],"source":{"line":11,"path":"lib/init.lua"}}],"name":"LinkedList","desc":"A doubly-linked list.\\n\\nEasily inserts and deletes arbitrarily without reordering. A reference to the\\nentry to insert or delete at is required. References to the front and back of\\nthe list always exist. When inserting new entries, entry references are\\nprovided for convenient removal.","source":{"line":39,"path":"lib/init.lua"}}')}}]);