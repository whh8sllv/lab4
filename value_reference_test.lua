local busted = require('busted')
local assert = require('luassert')

local function change_value(x)
    x = 1000
    return x
end

describe('ValueTest - ', function()
    it('value types', function()
        local number = 15
        change_value(number)

        assert.equals(number, 15)
    end) 
end)

local function change_reference(table)
    table.key = 'updated'
end

describe('ReferenceTest - ', function()
    it('reference types', function()
        local primary_table = {key='primary'}
        local updated_table = primary_table

        change_reference(updated_table)

        assert.is_true(primary_table.key == 'updated')
    end)
end)