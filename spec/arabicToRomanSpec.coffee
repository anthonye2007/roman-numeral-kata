converter = require('../converter.js')

describe "Converting Arabic to Roman numerals", ->
  test = (arabic, roman) ->
    it "should convert " + arabic + " to " + roman, ->
      result = converter.toRoman(arabic)
      expect(result).toBe(roman)

  test(1, "I")
  test(5, "V")
  test(10, "X")
  test(3, "III")
  test(4, "IV")
