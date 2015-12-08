/*:
#### Beginning Swift Video Tutorial Series - raywenderlich.com
#### Video 8: Dictionaries Challenge

**Note:** If you're seeing this text as comments rather than nicely-rendered text, select Editor\Show Rendered Markup in the Xcode menu.

In this challenge, you'll try some additional calculations and store the results in a dictionary. Scroll down past the initial demo code to the next set of instructions to get started!
*/
import Cocoa

struct Restaurant {
  let name: String
}

struct RestaurantBill {
  let restaurant: Restaurant
  var totalBill: Double
  var rating: Int

  let tipPercentages: [Int: Double] = [5: 0.25, 4: 0.20, 3: 0.15, 2: 0.12, 1: 0.10]

  func printAllTipOptions() {
    for (rating, tipPercentage) in tipPercentages {
      let tip = totalBill * tipPercentage
      print("Leave a $\(tip) tip for a \(rating)-star rating")
    }
  }

  func calculateTip() -> Double {
    guard let tipPercentage = tipPercentages[rating] else {
      return totalBill
    }

    return totalBill * tipPercentage
  }

}

/*:
Here, you'll see two restaurants and many restaurant bills. Eventually, all the bills make it into the `restaurantBills` array.
*/
let chickenCafe = Restaurant(name: "Chicken Café")
let bill1 = RestaurantBill(restaurant: chickenCafe, totalBill: 85, rating: 3)
let bill2 = RestaurantBill(restaurant: chickenCafe, totalBill: 25, rating: 4)
let bill3 = RestaurantBill(restaurant: chickenCafe, totalBill: 50, rating: 4)

let tacoTavern = Restaurant(name: "Taco Tavern")
let bill4 = RestaurantBill(restaurant: tacoTavern, totalBill: 25, rating: 5)
let bill5 = RestaurantBill(restaurant: tacoTavern, totalBill: 20, rating: 4)
let bill6 = RestaurantBill(restaurant: tacoTavern, totalBill: 15, rating: 4)
let bill7 = RestaurantBill(restaurant: tacoTavern, totalBill: 18, rating: 5)

let restaurantBills = [bill1, bill2, bill3, bill4, bill5, bill6, bill7]

/*:
The idea is to have a dictionary where the key is the restaurant name, and the value is the total amount (with tip) spent. If you followed the previous challenge on sets, you'll remember that you can't store `Restaurant` objects in sets and similarly, you can use them as keys. Instead, use the restaurant's `name` (a string) as the key.

Here's the basic idea:

- Set up an empty dictionary.
- Loop through all items in `restaurantBills'
- Get the dictionary value for the current restaurant. Remember, it's possible the value will be nil in which case you should start a new record with a value of 0.0
- Add the current bill's total + tip to the current value, and make sure the new total gets stored in the dictionary.

Finally, loop through the dictionary and print out each restaurant and total. You should get the following results:

- Chicken Café: $187.75
- Taco Tavern: $95.75

Check out the challenge solution playground for one way to do it. There are different ways to solve this one, so don't worry if yours doesn't match exactly!
*/

var totalsByRestaurant: [String: Double] = [:]

for bill in restaurantBills {
    if let thisTotal = totalsByRestaurant[bill.restaurant.name] {
        totalsByRestaurant[bill.restaurant.name] = thisTotal + bill.totalBill + bill.calculateTip()
    } else {
        totalsByRestaurant[bill.restaurant.name] = bill.totalBill + bill.calculateTip()
    }
}

for (restaurantName, total) in totalsByRestaurant {
    print("\(restaurantName): $\(total)")
}


