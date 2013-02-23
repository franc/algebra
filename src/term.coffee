class Term
  constructor: (str) ->
    #console.log str
    @str = str.trim()
    [@sign, @value] = @split_into_sign_and_value()
    @

  split_into_sign_and_value: ()->
    if /^\-/.test @str
      ['-', @str.replace(/^\-/,'').trim()]
    else
      ['+', @str.replace(/^\+/,'').trim()]

  to_s: ->
    @str

  to_str_with_sign: ->
    "#{@sign}#{@value}"

module.exports = Term