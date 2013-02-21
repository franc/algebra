Term = require('../src/term')
assert = require("assert")

describe 'term', ->
  describe '#sign()', ->
    it 'should be - for negative term ', ->
      t = new Term('-1')
      assert.equal t.sign, '-'

