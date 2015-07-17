require('coffee-script/register');
var converter = require('../converter.coffee');

describe("Converting Arabic to Roman numerals", function() {
  it("should convert 1 to I", function() {
    var arabic = 1;
    var roman = "I";
    var result = converter.toRoman(arabic);
    expect(arabic).toBe(roman);
  });
});
