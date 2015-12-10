/*:
#### Beginning Swift Video Tutorial Series - raywenderlich.com
#### Video 2: Tuples Challenge

**Note:** If you're seeing this text as comments rather than nicely-rendered text, select Editor\Show Rendered Markup in the Xcode menu.

In this challenge, you'll go a bit beyond simple variables and constants to learn about *tuples*.

Tuples are a very lightweight data structure that combine a set of values together. They're relatively rare compared to other compositional types such as structs and classes, which you'll learn about later in the series. However, tuples do pop up later when we cover dictionaries and functions.

Let's get started! Keep reading and you'll see these instructions and text mixed in with code. Sometimes, there will be spots for *you* to try some code too!
*/
import Cocoa
/*:
You've seen how to store things into separate variable or constants, like the following:
*/
let restaurantName = "Salad Savannah"
let totalBill = 10.00
let tipPercentage = 0.15
let totalPaid = totalBill + totalBill * tipPercentage
/*:
These things are all related though: restaurant name, total bill, tip percentage, and total paid. You could combine them together into a tuple to "keep them together" so to speak:
*/
let restaurantVisit = (restaurantName, totalBill, tipPercentage, totalPaid)
/*:
That's a tuple! By grouping the three values together inside the parentheses, you've created a tuple.

What type do you think `restaurantVisit` is? Take a guess, then option-click on `restaurantVisit` in the code above to have a look. Were you right?

Now that you have the tuple, you'll want to get data _out_ of it too. In this example, you have to access them by _index_. You have four things in the tuple, so you access them like this: `restaurantVisit.0`. You start counting at 0, which means you can go up to `restaurantVisit.3`.

Try printing out each tuple value below. You can just type something like `restaurantVisit.0` to see the value in the sidebar, or you can use `print()` to print them to the debug area. It's up to you.
*/
print(restaurantVisit.0)
print(restaurantVisit.1)
print(restaurantVisit.2)
print(restaurantVisit.3)
/*:
That works, but it's a little cumbersome because you have to remember what goes where. Where was the total again? Was it at 0? 1? 2?

Instead of the number-based access, you can also name the element of your tuple. Let's say you wanted to store the restaurant information into a tuple. That might look something like this:

`let restaurantInfo = (name: "Wing Warehouse", address: "402 Bongo Road")`

Create a tuple below with the following fields, and fill in some test information:

- name
- address
- city
- rating (assign a 1-5 number)

*/
let restaurantInfo = (name: "McDonalds", address: "Av. Libertador 209", city: "Buenos Aires", rating: 3)
/*:
Now, how do you think you would access the fields? Remember, when it was number index-based, you did something like `tuple.0`. Now – you can do something like `restaurantInfo.name`.

Try using `print()` to print out some text like the following:

> The [rating]-star restaurant [name] is at [address] in [city].

Remember, you can have values in your string if you format it like this: "Hello \\(name)"
*/
print("The \(restaurantInfo.rating)-star restaurant \(restaurantInfo.name) is at \(restaurantInfo.address) in \(restaurantInfo.city)")
/*:
That's it for this quick challenge. See you in the next video!
*/
