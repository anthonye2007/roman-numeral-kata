converter = require('../converter.js')

describe "Converting Arabic to Roman numerals", ->
  test = (arabic, roman) ->
    it "should convert " + arabic + " to " + roman, ->
      result = converter.toRoman(arabic)
      expect(result).toBe(roman)

  test(1, "I")
  test(3, "III")
  test(4, "IV")
  test(5, "V")
  test(9, "IX")
  test(10, "X")
  test(11, "XI")
  test(14, "XIV")
  test(15, "XV")
  test(19, "XIX")
  test(29, "XXIX")
  test(40, "XL")
  test(90, "XC")
