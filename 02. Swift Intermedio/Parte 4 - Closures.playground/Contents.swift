/*:
#### Intermediate Swift Video Tutorial Series - raywenderlich.com
#### Video 4: Closures Challenge

**Note:** If you're seeing this text as comments rather than nicely-rendered text, select Editor\Show Rendered Markup in the Xcode menu.

You've returned a closure from a function. What about passing in a closure (or a function, for that matter) in as a parameter?

Scroll down until you see the next block of instructions to get started!
*/
import Cocoa

func doubler(input: Int) -> Int {
  return input * 2
}

func makeMultiplier(multiplier: Int) -> ((Int) -> Int) {
  let closure = { (input: Int) -> Int in
    return input * multiplier
  }

  return closure
}

let tripler = makeMultiplier(3)

let incrementer = { (input: Int) -> Int in
  return input + 1
}

doubler(10)
tripler(10)
incrementer(10)

var someArithmetic: Int -> Int

someArithmetic = makeMultiplier(5)
someArithmetic(25)

/*:
The goal here is to write a function that takes two numbers and a closure of our usual type here, (Int -> Int), and returns an `Int`. The function should run the closure some number of times with the input, and return the results.

The function is called `repeater` and here's how you could call it:

    let result = repeater(5, value: 10, closure: doubler)

The first parameter is the number of times to repeat. The initial value is 10, and the closure passed in is `doubler`, which if you remember, will double the input. In this case, the `result` by the end should equal to 320 – that's 10 doubled 5 times.

Remember, you can't just keep doubling the same input 10 over and over. You have to remember the result each time through so you get 20, then 40, then 80, then 160, and finally 320. Also, you should be able to pass in any closure or function with the (Int -> Int) type.

Check out the completed challenge for a sample solution, and good luck!

*/
func repeater( timesToRepeat: Int, initialValue: Int, closure: (Int -> Int) ) -> Int {
    var value = initialValue
    for _ in 1...timesToRepeat {
        value = closure(value)
    }
    return value
}

let result = repeater(5, initialValue: 10, closure: doubler)
repeater(99, initialValue: 1, closure: incrementer)


