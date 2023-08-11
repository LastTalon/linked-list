--[=[
	An entry in a LinkedList.

	Allows removing this entry from the list. This is a constant time operation.

	.remove () -> ()

	@interface Entry<T>
	@within LinkedList
]=]
export type Entry<T> = {
	remove: () -> (),
}

type UnknownNode = {
	value: unknown,
	entry: Entry<unknown>,
	next: UnknownNode?,
	prev: UnknownNode?,
}

type Node<T> = {
	value: T,
	entry: Entry<T>,
	next: UnknownNode?,
	prev: UnknownNode?,
}

--[=[
	A doubly-linked list.

	Easily inserts and deletes arbitrarily without reordering. A reference to the
	entry to insert or delete at is required. References to the front and back of
	the list always exist. When inserting new entries, entry references are
	provided for convenient removal.

	@class LinkedList
]=]
local LinkedList = {}
LinkedList.__index = LinkedList

--[=[
	Creates a new LinkedList.
]=]
function LinkedList.new()
	local self = setmetatable({}, LinkedList)
	return self
end

local function createNode<T>(list: typeof(LinkedList.new()), value: T)
	local node: Node<T>?
	local entry = {
		remove = function()
			if not node then
				error("Attempted to remove node from LinkedList more than once.")
			end

			if node.prev then
				node.prev.next = node.next
			else
				list.front = node.next
			end

			if node.next then
				node.next.prev = node.prev
			else
				list.back = node.prev
			end

			node = nil
		end,
	}

	node = {
		value = value,
		entry = entry,
	}

	return node
end

--[=[
	Pushes a new entry to the back of this list.
]=]
function LinkedList:Push<T>(value: T): Entry<T>
	local node: Node<T> = createNode(self, value)

	node.prev = self.back

	if self.back then
		self.back.next = node
	else
		self.front = node
	end
	self.back = node

	return node.entry
end

--[=[
	Unshifts a new entry to the front of this list.
]=]
function LinkedList:Unshift<T>(value: T): Entry<T>
	local node: Node<T> = createNode(self, value)

	node.next = self.front

	if self.front then
		self.front.prev = node
	else
		self.back = node
	end
	self.front = node

	return node.entry
end

--[=[
	Shifts an entry off of the front of this list.
]=]
function LinkedList:Shift(): unknown
	local node = self.front
	if node then
		node.entry.remove()
		return node.value
	end
	return
end

--[=[
	Pops an entry off of the back of this list.
]=]
function LinkedList:Pop(): unknown
	local node = self.back
	if node then
		node.entry.remove()
		return node.value
	end
	return
end

--[=[
  Returns the value of the first element in the list without removing it.
]=]
function LinkedList:Peek(): unknown
	if self.front then
		return self.front.value
	end
	return
end

--[=[
	Returns the value of the last element in the list without removing it.
]=]
function LinkedList:PeekBack(): unknown
	if self.back then
		return self.back.value
	end
	return
end

--[=[
  Returns the first entry in the list without removing it.
]=]
function LinkedList:PeekEntry(): Entry<unknown>?
	if self.front then
		return self.front.entry
	end
	return
end

--[=[
	Returns the last entry in the list without removing it.
]=]
function LinkedList:PeekBackEntry(): Entry<unknown>?
	if self.back then
		return self.back.entry
	end
	return
end

--[=[
	Iterates over all entries in this list.

	Iteration returns the value stored in each entry, followed by an [Entry<T>]
	object which can be used to manipulate this entry in the list.

	```lua
	for value, entry in list do
		if value == "foo" then
			entry.remove()
		end
	end
	```

	@return T
	@return Entry<T>
]=]
function LinkedList:__iter(): <T>() -> (T, Entry<T>)
	local node: UnknownNode? = self.front

	return function()
		if not node then
			return
		end

		local currentNode = node
		node = node.next
		return currentNode.value, currentNode.entry
	end
end

--[=[
	Iterates over all entries in this list in reverse order.

	Iteration returns the value stored in each entry, followed by an [Entry<T>]
	object which can be used to manipulate this entry in the list.

	```lua
	for value, entry in list:IterReversed() do
		if value == "foo" then
			entry.remove()
		end
	end
	```

	@return T -- The value stored in the entry
	@return Entry<T> -- The entry object
]=]
function LinkedList:IterReversed(): <T>() -> (T, Entry<T>)
	local node: UnknownNode? = self.back

	return function()
		if not node then
			return
		end

		local currentNode = node
		node = node.prev
		return currentNode.value, currentNode.entry
	end
end

return LinkedList
