class Term
  constructor: (str) ->
    @str = str.trim()
    [@sign, @value] = @split_into_sign_and_value()
    @

  split_into_sign_and_value: ()->
    if /^\-/.test @str
      ['-', @str.replace(/^\-/,'').trim()]
    else
      ['+', @str.replace(/^\+/,'').trim()]

module.exports = Term