local busted = require('busted')
local assert = require('luassert')

describe('StackValueTest - ', function()
    it('stack works for value types', function()
        local memory_before = collectgarbage('count')
        local num = 0
        num = nil
        local memory_after = collectgarbage('count')

        assert.equals(memory_before, memory_after)
    end)
end)

describe('HeapReferenceTest - ', function()
    it('heap works for reference types', function()
        local memory_before = collectgarbage('count')
        local alphabet = {'a', 'b', 'c'}
        alphabet = nil
        local memory_after = collectgarbage('count')

        assert.is_true(memory_before < memory_after)
    end)
end)