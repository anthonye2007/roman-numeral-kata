// http://agilekatas.co.uk/katas/romannumerals-kata

function Greeter() {
  function sayHello() {
    return "Hello"
  }

  this.sayHello = sayHello;
}

var greeter = new Greeter();
console.log(greeter.sayHello())
