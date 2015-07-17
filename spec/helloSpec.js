var greeter = require('../hello.js');

describe("Greeter Test Suite", function() {
  it("says Hello", function() {
    var string = greeter.sayHello();
    expect(string).toBe("Hello");
  });
});
