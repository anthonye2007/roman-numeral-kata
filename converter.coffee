# http://agilekatas.co.uk/katas/romannumerals-kata
# Convert Arabic to Roman

module.exports =
  toRoman: (arabic) ->
    switch arabic
      when 1 then return "I"
      else
        console.log("Bad input: " + arabic)
