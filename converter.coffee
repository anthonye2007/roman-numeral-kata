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
        for value, i in array
          highestRoman = value if value <= input and value > highestRoman

        return highestRoman

      findLowerRoman = (highest) ->
        for value in array
          if value < highest
            difference = highest - value
            if input is difference
              return value

        return undefined

      # Happy end condition
      return str if input is 0

      # Sad end condition
      if input < 0
        console.error 'Went too far, input is now ' + input
        return null

      highestRoman = findHighestRoman()
      remainder = input - highestRoman
      letter = romanValues[highestRoman]

      # Try replacing in string if last four letters are the same
      if str.length >= 4
        if str[length - 1] is str[length - 2] is str[length - 3] is str[length - 4]
          # find letter
          # replace with letter and higher
          currentLetter = str[length-1]
          # TODO get next higher letter
          # TODO replace last three letters with next higher number
          # TODO example: 'IIII' -> 'IV'

      # should I subtract and add two letters?
      lowerRoman = findLowerRoman(highestRoman)
      if lowerRoman?
        lowerLetter = romanValues[lowerRoman]
        str += lowerLetter
        difference = highestRoman - lowerRoman
        remainder = input - difference

      return convertToRoman(remainder, str += letter)

    convertToRoman(arabic, "")
