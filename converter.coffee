# http://agilekatas.co.uk/katas/romannumerals-kata
# Convert Arabic to Roman

romanValues =
  "1": "I"
  "5": "V"
  "10": "X"
  "50": "L"
  "100": "C"
  "500": "D"
  "1000": "M"

module.exports =
  toRoman: (arabic) ->
    return romanValues[arabic] if romanValues[arabic]?
    console.log("Bad input: " + arabic)
