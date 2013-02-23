Term = require('../src/term')

class Expression
  constructor: (str) ->
    @str = Expression.resolve_add_subtract_combination str.replace(/\s/g, '')
    @terms = []
    @split_into_terms(@str)
    @

  @resolve_add_subtract_combination: (str) ->
    if /--/.test(str)
      Expression.resolve_add_subtract_combination(str.replace(/--/, '+'))
    else if /-\+/.test(str)
      Expression.resolve_add_subtract_combination(str.replace(/-\+/, '-'))
    else if /\+-/.test(str)
      Expression.resolve_add_subtract_combination(str.replace(/\+-/, '-'))
    else if /\+\+/.test(str)
      Expression.resolve_add_subtract_combination(str.replace(/\+\+/, '+'))
    else
      str

  split_into_terms: (str) ->
    term_string = if /[\+-]/.test(str)
      str.slice(str.lastIndexOf(/[\+-]/)-1, str.length)
    else
      str
    @terms.push(new Term(term_string))
    if str != term_string
      @split_into_terms(str.replace(new RegExp("[-\+]" + term_string.replace(/[-\+]/,'') + '$'), ''))
    else
      @terms.reverse()

  string_terms: ->
    for term in @terms  
      term.to_str_with_sign()
    

module.exports = Expression