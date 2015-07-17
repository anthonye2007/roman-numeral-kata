var converter = require('../converter.js');

describe("Converting Arabic to Roman numerals", function() {
  it("should convert 1 to I", function() {
    var arabic = 1;
    var roman = "I";
    var result = converter.toRoman(arabic);
    expect(result).toBe(roman);
  });
});
