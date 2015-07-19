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

array = [
  1
  5
  10
  50
  100
  500
  1000
]

module.exports =
  toRoman: (arabic) ->
    convertToRoman = (input, str) ->
      findHighestRoman = ->
        highestRoman = array[0]
        for value in array
          highestRoman = value if value <= input and value > highestRoman
        return highestRoman

      # Happy end condition
      return str if input is 0

      # Sad end condition
      if input < 0
        console.error 'Went too far, input is now ' + input
        return null

      highestRoman = findHighestRoman()
      letter = romanValues[highestRoman]
      return convertToRoman(input - highestRoman, str += letter)

    convertToRoman(arabic, "")
