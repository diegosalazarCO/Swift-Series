/*:
#### Beginning Swift Video Tutorial Series - raywenderlich.com
#### Video 6: Structs Challenge

**Note:** If you're seeing this text as comments rather than nicely-rendered text, select Editor\Show Rendered Markup in the Xcode menu.

In this challenge, you'll add a new `Restaurant` struct and refactor the rest of the code here to use it.

Follow along with the instructions, and be sure to scroll all the way to the bottom for some bonus exercises with strings and integers!
*/
import Cocoa
/*:
Right now, you're storing the restaurant name right in the `RestaurantBill` struct. However, you might want to add other restaurant information later on, such as phone number and address.

As a first step, create a new struct called `Restaurant`. Give it a single `String` property called `name`.
*/
struct Restaurant {
    let name: String
}

/*:
Now that you've created your new struct type, it's time to use it! Update the properties of the `RestaurantBill` struct below so instead of `restaurantName`, you have a property `restaurant` of type `Restaurant`.
*/
struct RestaurantBill {
  let restaurant: Restaurant
  var totalBill: Double
  var rating: Int

  private func tipPercentage() -> Double? {
    guard rating >= 1 && rating <= 5 else {
      return nil
    }

    let tipPercentage: Double

    if rating == 5 {
      tipPercentage = 0.25
    } else if rating >= 3 {
      tipPercentage = 0.15
    } else {
      tipPercentage = 0.10
    }

    return tipPercentage
  }

  func calculateTip() -> Double {
    guard let tipPercentage = tipPercentage() else {
      return totalBill
    }

    return totalBill * tipPercentage
  }

}

/*:
Finally, it's time to instantiate some structs!

Add a new variable or constant for the restaurant of your choice. Then, update the `RestaurantBill` created below to use it.
*/
let chickenCafeRestaurant = Restaurant(name: "Chicken Café")
let chickenCafeBill = RestaurantBill(restaurant: chickenCafeRestaurant, totalBill: 85, rating: 5)
chickenCafeBill.calculateTip()


/*:
As mentioned in the final slide, structs are actually nothing new: you've been using them all along! Strings, integers, and floating-point numbers are all structs.

That means they have handy methods for you to call. Here are some examples:
*/

let testString = "Hello world"
testString.hasPrefix("H")
testString.hasPrefix("Hello")
testString.hasPrefix("world")

/*:
You can also call them right on literal values:
*/

"Swift programming".hasSuffix("ing")

/*:
Integers have a method `distanceTo(_:)` where you pass in another integer parameter, and it tells you how far apart they are. Give it a try below with all kinds of numbers – higher to lower, lower to higher, negative numbers, etc.
*/

10.distanceTo(-10)
10.distanceTo(100)

