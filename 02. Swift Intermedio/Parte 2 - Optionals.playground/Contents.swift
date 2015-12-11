/*:
#### Intermediate Swift Video Tutorial Series - raywenderlich.com
#### Video 2: Optionals Challenge

**Note:** If you're seeing this text as comments rather than nicely-rendered text, select Editor\Show Rendered Markup in the Xcode menu.

In this short challenge, you'll add one more optional and then have to make a choice on how to deal with it.

Scroll down until you see the next block of instructions to get started!
*/
import Cocoa

class Restaurant {
  var name: String

  init(name: String) {
    self.name = name
  }
}

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

/*:
Update the rating property below to be an optional:

    var rating: RestaurantRating?

This should be a quick, but open-ended challenge. What would it mean if you instantiated a new restaurant bill with a `nil` rating? No tip? Or a standard tip? This depends on your own needs, of course.

Now that the rating is optional, you'll need to update `calculateTip()` to handle it. You have several options here, from if-let binding to nil coalescing. See what you come up with, and be sure to test your results at the bottom with a new `RestaurantBill` that has a nil rating.

    let bill2 = RestaurantBill(restaurant: restaurant, totalBill: 100, rating: nil)

*/
struct RestaurantBill {
  var restaurant: Restaurant?
  var totalBill: Double
  var rating: RestaurantRating?

  func calculateTip() -> Double {
    let tipPercentage = rating?.rawValue ?? 0.0

    return totalBill * tipPercentage
  }

  func printDetails() {
    let restaurantName = restaurant?.name ?? "the restaurant"
    print("Leave a tip of $\(calculateTip()) for your meal at \(restaurantName)")
  }
}

var bill: RestaurantBill?
let restaurant = Restaurant(name: "Chicken Café")
bill = RestaurantBill(restaurant: restaurant, totalBill: 85, rating: .Average)
let bill2 = RestaurantBill(restaurant: restaurant, totalBill: 100, rating: nil)

bill?.printDetails()
bill2.printDetails()
