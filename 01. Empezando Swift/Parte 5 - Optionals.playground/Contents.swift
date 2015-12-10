/*:
#### Beginning Swift Video Tutorial Series - raywenderlich.com
#### Video 5: Optionals Challenge

**Note:** If you're seeing this text as comments rather than nicely-rendered text, select Editor\Show Rendered Markup in the Xcode menu.

In this challenge, you'll work with some more optionals along with the `guard` syntax for safe unwrapping and general checking. Scroll down past the initial demo code to the next set of instructions to get started!

Here's the overall goal: have `tipPercentageForRating(_:)` below return an optional Double (`Double?`) rather than a regular `Double`. That will cover the cases when you pass in an invalid rating – in those cases, the function will return `nil`.
*/
import Cocoa
/*:
First, update the method signature below to change its return type to `Double?`
*/
func tipPercentageForRating(rating: Int) -> Double? {
/*:
You could check for an invalid rating – less than 1 and greater than 5 – here, and just return `nil` if it were out of bounds:

    if rating < 1 || rating > 5 {
      return nil
    }

But this is a great time to try out the `guard` syntax. `guard` lets you say what condition you _want_ rather than the one you _don't_ want. In this case, you want a rating that's between 1–5, inclusive. If you don't have that, you want to return `nil`.

Here's what that looks like; add the following code below:

    guard rating >= 1 && rating <= 5 else {
      return nil
    }
*/
    guard rating >= 1 && rating <= 5 else {
        return nil
    }
/*:
You're "guarding" for the case you want: a rating that's greater than or equal to one and also less than or equal to five. Notice the `else` keyword there – that means the code inside the curly braces is executed if what you're checking for doesn't match.

`guard` is a bit different from a standard if/else since whatever you have inside the `else` block *must* exit somehow; that means you need to return, generate a fatal error, or throw an error (which you'll learn about later in the intermediate series).
  
In this case, you can just return `nil`.
*/
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

/*:
Now that `tipPercentageForRating(_:)` returns an optional, you'll see an issue here in this function. You're trying to multiply `totalBill` (a `Double`) with `tipPercentage` (a `Double?`). But you can't multiply a number with an optional!

Update the function below to handle the optional. If you get a valid tip percentage back, you should do the calculation as usual; otherwise, just return 0 to treat it as a "no tip" situation.

You could use if-let to do the calculation inside the if-let curly braces and return the plain `totalBill` in an else; or, you could use `guard` to return the total bill in the `else` and do the calculation outside.
*/
func calculateTipOnTotal(totalBill: Double, withRating rating: Int) -> Double {
    if let tipPercentage = tipPercentageForRating(rating) {
        return totalBill * tipPercentage
    } else {
        return 0
    }
  }

func showTipAdvice(restaurantTotal restaurantTotal: Double, rating: Int, restaurantName: String?) {
  let tip = calculateTipOnTotal(restaurantTotal, withRating: rating)

  if let restaurantName = restaurantName {
    print("You went out to eat at \(restaurantName)")
  }

  print("On a bill of $\(restaurantTotal), you should leave a tip of $\(tip)")
  print("That means a total of $\(restaurantTotal + tip)")
}

var restaurantName: String?
restaurantName = "Burger Barn"

showTipAdvice(restaurantTotal: 65, rating: 5, restaurantName: restaurantName)
