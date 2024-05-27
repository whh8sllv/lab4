local busted = require('busted')
local assert = require('luassert')

describe('GarbageCollectorValuesTest - ', function()
    it('no garbage collector needed for value types', function()
        collectgarbage('collect')
        collectgarbage('collect')
        local s = 'string'
        local memory_before = collectgarbage('count')
        s = nil
        collectgarbage('collect')
        local memory_after = collectgarbage('count')

        assert.equals(memory_after, memory_before)        
    end)
end)

describe('GarbageCollectorReferencesTest - ', function()
    it('garbage collector works for reference types', function()
        collectgarbage('collect')
        collectgarbage('collect')
        local alphabet = {'a', 'b', 'c'}
        local memory_before = collectgarbage('count')
        alphabet = nil
        collectgarbage('collect')
        local memory_after = collectgarbage('count')

        assert.is_true(memory_after < memory_before)        
    end)
end)


