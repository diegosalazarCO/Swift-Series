/*:
#### Beginning Swift Video Tutorial Series - raywenderlich.com
#### Video 3: Booleans and Loops Challenge

**Note:** If you're seeing this text as comments rather than nicely-rendered text, select Editor\Show Rendered Markup in the Xcode menu.

In this challenge, you'll look a bit closer at Boolean values, and then give loops and ranges another try as well. To follow along, just look for this formatted text amongst the code.
*/
import Cocoa

let totalBill = 95.00
var tipPercentage: Double

/*:
Two things to note here:

- The range `1...5` is an inclusive range, also known as a closed interval. That means the two endpoints, 1 and 5 are included and you'll get 1, 2, 3, 4, 5.
- Remember the conditionals here – `==` and `>=` are actually returning Booleans. Is rating equal to 5? That's a true/false (or yes/no) question.
*/

for rating in 1...5 {
  if rating == 5 {
    tipPercentage = 0.25
  } else if rating >= 3 {
    tipPercentage = 0.15
  } else {
    tipPercentage = 0.10
  }

  let totalPaid = totalBill + totalBill * tipPercentage
  print("With a \(rating) star rating, you should leave a total of $\(totalPaid)")
}

/*:
Let's start with Boolean values. There are only two of them, and you can see what they look like in code and also in the sidebar:
*/
true
false
/*:
That was simple! ;]

What about some conditions?
*/
1 == 1
5 > 3
5 < 3
/*:
You can see right in the sidebar that when you have a condition, it _evaluates_ into a Boolean. That's what lets you use it as part of the `if` and `else if` statements.

Feel free to experiment and try some conditions of your own above.

You can combine conditions with the `&&` and `||` operators. `&&` means "and", meaning all the things must be true.
*/
1 == 1 && 10 > 3
1 == 2 && 3 == 4
1 == 1 && 2 == 2 && "hello" == "nope"
/*:
The `||` operator means "or", meaning only one of the conditions must be true.

Type the three lines of code above, but swap in `||` instead of `&&`. Before you do, think about what the results would be before looking in the sidebar.
*/
1 == 1 || 10 > 3
1 == 2 || 3 == 4
1 == 1 || 2 == 2 || "hello" == "nope"
/*:
The print statement below will never print anything, because the condition is `false`. Instead, change the condition so it prints out if the total bill (`totalBill`) was more than $50 **and** the tip percentage (`tipPercentage`) was more that 15% (0.15).

Based on the values from way up at the start of the playground, this should be true and you should see something printed out.
*/
if totalBill > 50 && tipPercentage > 0.15 {
  print("That was an expensive, but good meal!")
}
/*:
Booleans are all over the place in programming, which makes them very important to understand!

Let's move on to ranges and loops. You already saw a closed range; there's also a **half-closed** (or **half-open**, depending on how your brain works) range that excludes the value at one end.

Here's some code that prints out the values in a range:
*/
for i in 1...5 {
  print("\(i)")
}
/*:
Replace the range with the half-closed version, which looks like this: `1..<5`

What do you notice?

That means that `1..<5` and `1...4` are the same thing. You might wonder why this is useful; why not just stick with the closed range all the time? Later on when we discuss arrays, which are a kind of list, you'll see them come in handy.

Let's look at one final kind of loop that combines looping with a condition. Here's the **repeat-while** loop:
*/
var counter = 0
repeat {
  counter = counter + 1
} while counter < 10
/*:
Can you figure out what it's doing?

It reads pretty nicely, starting with the `repeat` keyword. That means whatever in the curly brace scope there will be repeated. But it's not like a `for` loop and a range – whatever's after the `while` is a condition, which means a Boolean.

You could have any condition after that `while`. In this case, you're just keeping track of a simple counter.

Here's your final challenge:

- Set up another repeat/while loop below.
- Have it count _backwards_ from 10 to 1.
- It should print out the number to the debug console each time through the loop.

Note that you should pick a different variable name rather than `counter` since that's already used above. Good luck!
*/
var backwardsCounter = 10
repeat {
    backwardsCounter = backwardsCounter - 1
} while backwardsCounter > 0
/*:
That's it for this challenge. Keep playing around in this playground to experiment for yourself, and see you in the next video!
*/
