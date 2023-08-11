local LinkedList = require(script.Parent)

return function()
	describe("LinkedList", function()
		describe("new", function()
			it("should create a new linked list", function()
				local list = LinkedList.new()

				expect(list).to.be.ok()
				expect(list).to.be.a("table")
			end)
		end)

		describe("Push", function()
			it("should add an element to an empty list", function()
				local list = LinkedList.new()

				list:Push(1)

				expect(list.front).to.be.ok()
				expect(list.front.value).to.equal(1)
				expect(list.back).to.be.ok()
				expect(list.back.value).to.equal(1)
			end)

			it("should add an element to a non-empty list", function()
				local list = LinkedList.new()

				list:Push(1)
				list:Push(2)

				expect(list.front).to.be.ok()
				expect(list.front.value).to.equal(1)
				expect(list.back).to.be.ok()
				expect(list.back.value).to.equal(2)
			end)

			it("should return an entry", function()
				local list = LinkedList.new()

				local entry = list:Push(1)

				expect(entry).to.be.ok()
				expect(entry).to.be.a("table")
			end)
		end)

		describe("Unshift", function()
			it("should add an element to an empty list", function()
				local list = LinkedList.new()

				list:Unshift(1)

				expect(list.front).to.be.ok()
				expect(list.front.value).to.equal(1)
				expect(list.back).to.be.ok()
				expect(list.back.value).to.equal(1)
			end)

			it("should add an element to a non-empty list", function()
				local list = LinkedList.new()

				list:Unshift(1)
				list:Unshift(2)

				expect(list.front).to.be.ok()
				expect(list.front.value).to.equal(2)
				expect(list.back).to.be.ok()
				expect(list.back.value).to.equal(1)
			end)

			it("should return an entry", function()
				local list = LinkedList.new()

				local entry = list:Unshift(1)

				expect(entry).to.be.ok()
				expect(entry).to.be.a("table")
			end)
		end)

		describe("Pop", function()
			it("should return nil for an empty list", function()
				local list = LinkedList.new()

				local value = list:Pop()

				expect(value).to.equal(nil)
			end)

			it("should return the last element of a list", function()
				local list = LinkedList.new()

				list:Push(1)
				list:Push(2)

				local value = list:Pop()

				expect(value).to.equal(2)
			end)

			it("should remove the last element of a list", function()
				local list = LinkedList.new()

				list:Push(1)
				list:Push(2)

				list:Pop()

				expect(list.front).to.be.ok()
				expect(list.front.value).to.equal(1)
				expect(list.back).to.be.ok()
				expect(list.back.value).to.equal(1)
			end)
		end)

		describe("Shift", function()
			it("should return nil for an empty list", function()
				local list = LinkedList.new()

				local value = list:Shift()

				expect(value).to.equal(nil)
			end)

			it("should return the first element of a list", function()
				local list = LinkedList.new()

				list:Push(1)
				list:Push(2)

				local value = list:Shift()

				expect(value).to.equal(1)
			end)

			it("should remove the first element of a list", function()
				local list = LinkedList.new()

				list:Push(1)
				list:Push(2)

				list:Shift()

				expect(list.front).to.be.ok()
				expect(list.front.value).to.equal(2)
				expect(list.back).to.be.ok()
				expect(list.back.value).to.equal(2)
			end)
		end)

		describe("__iter", function()
			it("should iterate over an empty list", function()
				local list = LinkedList.new()

				local values = {}

				for value in list do
					table.insert(values, value)
				end

				expect(#values).to.equal(0)
			end)

			it("should iterate over a non-empty list", function()
				local list = LinkedList.new()

				list:Push(1)
				list:Push(2)

				local values = {}

				for value in list do
					table.insert(values, value)
				end

				expect(#values).to.equal(2)
				expect(values[1]).to.equal(1)
				expect(values[2]).to.equal(2)
			end)

			it("should iterate over a list with a removed element", function()
				local list = LinkedList.new()

				list:Push(1)
				list:Push(2)
				list:Pop()

				local values = {}

				for value in list do
					table.insert(values, value)
				end

				expect(#values).to.equal(1)
				expect(values[1]).to.equal(1)
			end)
		end)

		describe("IterReversed", function()
			it("should iterate over an empty list", function()
				local list = LinkedList.new()

				local values = {}

				for value in list:IterReversed() do
					table.insert(values, value)
				end

				expect(#values).to.equal(0)
			end)

			it("should iterate over a non-empty list", function()
				local list = LinkedList.new()

				list:Push(1)
				list:Push(2)

				local values = {}

				for value in list:IterReversed() do
					table.insert(values, value)
				end

				expect(#values).to.equal(2)
				expect(values[1]).to.equal(2)
				expect(values[2]).to.equal(1)
			end)

			it("should iterate over a list with a removed element", function()
				local list = LinkedList.new()

				list:Push(1)
				list:Push(2)
				list:Pop()

				local values = {}

				for value in list:IterReversed() do
					table.insert(values, value)
				end

				expect(#values).to.equal(1)
				expect(values[1]).to.equal(1)
			end)
		end)
	end)

	describe("Entry", function()
		describe("remove", function()
			it("should remove an entry from a list", function()
				local list = LinkedList.new()

				local entry = list:Push(1)

				entry.remove()

				expect(list.front).to.equal(nil)
				expect(list.back).to.equal(nil)
			end)

			it("should remove an entry from the middle of a list", function()
				local list = LinkedList.new()

				list:Push(1)
				local entry2 = list:Push(2)
				list:Push(3)

				entry2.remove()

				expect(list.front).to.be.ok()
				expect(list.front.value).to.equal(1)
				expect(list.front.next).to.be.ok()
				expect(list.front.next.value).to.equal(3)
				expect(list.back).to.be.ok()
				expect(list.back.value).to.equal(3)
				expect(list.back.prev).to.be.ok()
				expect(list.back.prev.value).to.equal(3)
			end)

			it("should remove an entry from the front of a list", function()
				local list = LinkedList.new()

				local entry1 = list:Push(1)
				list:Push(2)
				list:Push(3)

				entry1.remove()

				expect(list.front).to.be.ok()
				expect(list.front.value).to.equal(2)
				expect(list.front.next).to.be.ok()
				expect(list.front.next.value).to.equal(3)
				expect(list.back).to.be.ok()
				expect(list.back.value).to.equal(3)
				expect(list.back.prev).to.be.ok()
				expect(list.back.prev.value).to.equal(3)
			end)

			it("should remove an entry from the back of a list", function()
				local list = LinkedList.new()

				list:Push(1)
				list:Push(2)
				local entry3 = list:Push(3)

				entry3.remove()

				expect(list.front).to.be.ok()
				expect(list.front.value).to.equal(1)
				expect(list.front.next).to.be.ok()
				expect(list.front.next.value).to.equal(2)
				expect(list.back).to.be.ok()
				expect(list.back.value).to.equal(2)
				expect(list.back.prev).to.be.ok()
				expect(list.back.prev.value).to.equal(1)
			end)

			it("should error when removing an entry twice", function()
				local list = LinkedList.new()

				local entry = list:Push(1)

				entry.remove()

				expect(function()
					entry.remove()
				end).to.throw("Attempted to remove node from LinkedList more than once.")
			end)

			it("should not break iteration order when removing during iteration", function()
				local list = LinkedList.new()

				list:Push(1)
				list:Push(2)
				list:Push(3)

				local allValues = {}
				local keptValues = {}

				for value, entry in list do
					table.insert(allValues, value)
					if value == 2 then
						entry.remove()
					else
						table.insert(keptValues, value)
					end
				end

				expect(#allValues).to.equal(3)
				expect(allValues[1]).to.equal(1)
				expect(allValues[2]).to.equal(2)
				expect(allValues[3]).to.equal(3)

				expect(#keptValues).to.equal(2)
				expect(keptValues[1]).to.equal(1)
				expect(keptValues[2]).to.equal(3)
			end)
		end)
	end)
end
