Term = require('../src/term')

class Expression
  constructor: (str) ->
    @str = str.trim()
    @terms = []
    @split_into_terms(@str)
    @

  split_into_terms: (str) ->
    term_string = if /[+-]/.test(str)
      str.slice(str.lastIndexOf(/[+-]/)-1, str.length)
    else
      str
    #console.log term_string
    @terms.push(new Term(term_string))
    #console.log @string_terms()
    if str != term_string
      #console.log "#{str} != #{term_string}"
      @split_into_terms(str.replace(new RegExp(term_string + '$'), ''))
    else
      @terms.reverse()

  string_terms: ->
    terms = []
    for term in @terms
      terms.push term.to_str_with_sign()
    terms

module.exports = Expression