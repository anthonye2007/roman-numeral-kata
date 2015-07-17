# http://agilekatas.co.uk/katas/romannumerals-kata
# Convert Arabic to Roman

module.exports =
  toRoman: (arabic) ->
    switch arabic
      when 1 then return "I"
      when 5 then return "V"
      when 10 then return "X"
      else
        console.log("Bad input: " + arabic)
