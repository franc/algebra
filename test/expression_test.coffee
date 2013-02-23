Helpers = require('../test/helpers')
Expression = require('../src/expression')
assert = require("assert")

describe 'expression', ->
  describe '#string_terms()', ->
    it 'should split on - ', ->
      e = new Expression('5-1')
      assert Helpers.arrayEqual(e.string_terms(), ['+5','-1'])

    it 'should split on + ', ->
      e = new Expression('5+1')
      assert Helpers.arrayEqual(e.string_terms(), ['+5','+1'])

    it 'should replace -- with +', ->
      e = new Expression('5--1')
      assert Helpers.arrayEqual(e.string_terms(), ['+5','+1'])

    it 'should replace -+ with 1', ->
      e = new Expression('5-+1')
      assert Helpers.arrayEqual(e.string_terms(), ['+5','-1'])

    it 'should replace +- with 1', ->
      e = new Expression('5+-1')
      assert Helpers.arrayEqual(e.string_terms(), ['+5','-1'])

    it 'should replace ++ with +', ->
      e = new Expression('5++1')
      assert Helpers.arrayEqual(e.string_terms(), ['+5','+1'])

    it 'should replace --- with -', ->
      e = new Expression('5---1')
      assert Helpers.arrayEqual(e.string_terms(), ['+5','-1'])

    it 'should replace ---- with -', ->
      e = new Expression('5----1')
      assert Helpers.arrayEqual(e.string_terms(), ['+5','+1'])