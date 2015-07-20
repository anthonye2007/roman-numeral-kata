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

romanToArabic =
  "I": 1
  "V": 5
  "X": 10
  "L": 50
  "C": 100
  "D": 500
  "M": 1000

array = [
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
        testForC = ->
          added = input + 100
          if added >= 1000 and added < 1100
            newStr = "CM"
            return newStr

        testForX = ->
          added = input + 10
          if (added >= 100 and added < 110)
            newStr = "XC"
            return newStr
          else if (added >= 50 and added < 60)
            newStr = "XL"
            return newStr

        testForI = ->
          added = input + 1
          if added is 5 or added is 10
            newStr = "I" + romanValues[added]
            return newStr
        # The '1' symbols ('I', 'X', and 'C') can only be subtracted from the
        # 2 next highest values ('IV' and 'IX', 'XL' and 'XC', 'CD' and 'CM')
        cVal = testForC()
        return cVal if cVal?

        xVal = testForX()
        return xVal if xVal?

        return testForI()

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

      findNextRomanNumber = (num) ->
        prevNum = null
        for val, index in romanOrdering
          return val if num is prevNum
          prevNum = val
        return null

      # Happy end condition
      return str if input is 0

      # Sad end condition
      if input < 0
        console.error 'Went too far, input is now ' + input
        return null

      subtractableStrSegment = findIfSubtractable()

      if subtractableStrSegment?
        # always length of 2
        highestLetter = subtractableStrSegment[1]
        lowestLetter = subtractableStrSegment[0]
        highestVal = romanToArabic[highestLetter]
        subtractorVal = romanToArabic[lowestLetter]
        value = highestVal - subtractorVal

        remainder = input - value
        str += subtractableStrSegment
      else
        highestRoman = findHighestRoman()
        remainder = input - highestRoman
        letter = romanValues[highestRoman]
        str += letter

      # Try replacing in string if last four letters are the same
      # example: 'IIII' -> 'IV'
      if str.length >= 4
        if str[str.length - 1] is str[str.length - 2] is str[str.length - 3] is str[str.length - 4]
          currentLetter = str[str.length - 1]
          nextRomanNumber = findNextRomanNumber currentLetter
          # replace last three letters with next higher number
          str = str.slice(0, -3) + nextRomanNumber

      return convertToRoman(remainder, str)

    convertToRoman(arabic, "")
