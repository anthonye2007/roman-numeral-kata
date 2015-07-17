converter = require('../converter.js')

describe "Converting Arabic to Roman numerals", ->
  it "should convert 1 to I", ->
    arabic = 1
    roman = "I"
    result = converter.toRoman(arabic)
    expect(result).toBe(roman)
