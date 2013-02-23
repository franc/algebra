class Helpers
  @arrayEqual: (a, b) ->
    a.length is b.length and a.every (elem, i) -> elem is b[i]


module.exports = Helpers