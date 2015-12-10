/*:
#### Beginning Swift Video Tutorial Series - raywenderlich.com
#### Video 10: Enumerations Challenge

**Note:** If you're seeing this text as comments rather than nicely-rendered text, select Editor\Show Rendered Markup in the Xcode menu.

In this challenge, you'll add raw values to your `RestaurantRating` enumeration to consolidate all its details into a single type. Scroll down past to the next set of instructions to get started!
*/
import Cocoa

class Restaurant {
  var name: String

  init(name: String) {
    self.name = name
  }
}

/*:
Here's the enumeration! You have two things to update here:

- Change the definition to `enum RestaurantRating: Double` to indicate the raw value type.
- Update each case with a value. This will look something like `case Awesome = 0.20' and you can look below at the `tipPercentages` dictionary for the values.

Scroll down to the next set of instructions when you're done!
*/
enum RestaurantRating: Double {
  case Awesome = 0.25
  case Average = 0.20
  case Poor = 0.15
  case NeverGoingBack = 0.12
  case FoodPoisoning = 0.01

  func niceDescription() -> String {
    if self == .Awesome {
      return "Awesome!"
    } else if self == .Average {
      return "Average"
    } else if self == .Poor {
      return "Poor :["
    } else if self == .NeverGoingBack {
      return "Don't go back!"
    } else {
      return "Contracted food poisoning! :O"
    }
  }
}

struct RestaurantBill {
  var restaurant: Restaurant
  var totalBill: Double
  var rating: RestaurantRating

/*:
Now that the tip percentages are stored right in the enumeration, you don't need this dictionary anymore. Remove it!
*/


/*:
Now how do you access the raw value? Once you have an enumeration instance such as `rating`, just use the `rawValue` property on it!

Update the method below to use the enumeration's raw value. This will also simplify the code since you don't have to worry about it being an optional.
*/
  func calculateTip() -> Double {
    let tipPercentage = rating.rawValue

    return totalBill * tipPercentage
  }

}

let chickenCafe = Restaurant(name: "Chicken Café")
var bill1 = RestaurantBill(restaurant: chickenCafe, totalBill: 85, rating: .FoodPoisoning)
var bill2 = RestaurantBill(restaurant: chickenCafe, totalBill: 30, rating: .Average)

bill2.calculateTip()

if bill2.rating == .Awesome {
  "awesome! :]"
} else {
  "not awesome! :["
}
