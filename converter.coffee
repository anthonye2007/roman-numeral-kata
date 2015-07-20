# http://agilekatas.co.uk/katas/romannumerals-kata
# Convert Arabic to Roman

arabicToRoman =
  "1": "I"
  "5": "V"
  "10": "X"
  "50": "L"
  "100": "C"
  "500": "D"
  "1000": "M"

romanToArabic =
  "I": 1
  "V": 5
  "X": 10
  "L": 50
  "C": 100
  "D": 500
  "M": 1000

arabicOrdering = [
  1
  5
  10
  50
  100
  500
  1000
]

romanOrdering = [
  "I"
  "V"
  "X"
  "L"
  "C"
  "D"
  "M"
]

module.exports =
  toRoman: (arabic) ->
    convertToRoman = (input, str) ->
      findIfSubtractable = ->
        # These subtractions could be abstracted but due to edge cases and only have 3 I think its simpler
        # to leave it in this straightforward manner.
        trySubtractingC = ->
          added = input + 100
          return "CM" if added >= 1000 and added < 1100

        trySubtractingX = ->
          added = input + 10
          return "XC" if added >= 100 and added < 110
          return "XL" if added >= 50 and added < 60

        trySubtractingI = ->
          added = input + 1
          if added is 5 or added is 10
            return "I" + arabicToRoman[added]

        # The '1' symbols ('I', 'X', and 'C') can only be subtracted from the
        # 2 next highest values ('IV' and 'IX', 'XL' and 'XC', 'CD' and 'CM')
        cVal = trySubtractingC()
        return cVal if cVal?

        xVal = trySubtractingX()
        return xVal if xVal?

        return trySubtractingI()

      findHighestRoman = ->
        highestRoman = arabicOrdering[0]
        for value, i in arabicOrdering
          highestRoman = value if value <= input and value > highestRoman

        return highestRoman

      findLowerRoman = (highest) ->
        for value in arabicOrdering
          if value < highest
            difference = highest - value
            if input is difference
              return value

        return undefined

      findNextRomanNumber = (num) ->
        prevNum = null
        for val, index in romanOrdering
          return val if num is prevNum
          prevNum = val
        return null

      findValueOfSubtractableSegment = (str) ->
        console.error 'Subtractable segment did not have length of 2: ' + str if str.length is not 2
        highestLetter = subtractableStrSegment[1]
        lowestLetter = subtractableStrSegment[0]
        highestVal = romanToArabic[highestLetter]
        subtractorVal = romanToArabic[lowestLetter]
        return highestVal - subtractorVal

      replaceEndingLettersWithHigherNumber = (str) ->
        # example: 'IIII' -> 'IV'
        currentLetter = str[str.length - 1]
        nextRomanNumber = findNextRomanNumber currentLetter
        # replace last three letters with next higher number
        str = str.slice(0, -3) + nextRomanNumber

      # Happy end condition
      return str if input is 0

      # Sad end condition
      if input < 0
        console.error 'Went too far, input is now ' + input
        return null

      subtractableStrSegment = findIfSubtractable()

      if subtractableStrSegment?
        value = findValueOfSubtractableSegment subtractableStrSegment
        remainder = input - value
        str += subtractableStrSegment
      else
        highestRoman = findHighestRoman()
        remainder = input - highestRoman
        letter = arabicToRoman[highestRoman]
        str += letter

      areLastFourLettersTheSame = str.length >= 4 and
          (str[str.length - 1] is str[str.length - 2] is str[str.length - 3] is str[str.length - 4])
      str = replaceEndingLettersWithHigherNumber str if areLastFourLettersTheSame

      return convertToRoman(remainder, str)

    convertToRoman(arabic, "")
