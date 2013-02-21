example = require('../src/example')
assert = require("assert")

describe 'example', ->
  describe '#truth()', ->
    it 'should return the Boolean value true', ->
      assert.equal example.truth(), true