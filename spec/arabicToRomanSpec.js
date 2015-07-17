var converter = require('../kata.js');

describe("Converting Arabic to Roman numerals", function() {
  it("should convert 1 to I", function() {
    expect(converter.toRoman(1)).toBe("I");
  });
});
