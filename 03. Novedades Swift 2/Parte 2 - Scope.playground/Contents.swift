/*:
#### What's New in Swift 2 Video Tutorial Series - raywenderlich.com
#### Scope and Guard Challenge

**Note:** If you're seeing this text as comments rather than nicely-rendered text, select Editor\Show Rendered Markup in the Xcode menu.

In this challenge, you'll switch around the logic for several `if` conditionals to use `guard` instead. In addition, now that there's a price list dictionary it's possible that someone might ask for a price for an unknown item. The code currently traps with `fatalError()` in this case, but a nice thrown error would be much nicer!

Scroll down to `deposit(_:)` to begin your challenge! You can peek at the solutions by downloading and opening the completed challenge playground.
*/
import Foundation

enum CoinWalletError: ErrorType {
  case ExceedsMaximumBalance
  case InsufficientFunds(shortAmount: Int)
    case NotFoundPrice
}

let priceList = ["unicorn tears": 60]

class CoinWallet: CustomStringConvertible {
  private let maximumBalance = 1000
  private(set) var balance: Int = 0

  var description: String {
    return "CoinWallet with \(balance) balance"
  }

/*:
Currently, `deposit(_:)` checks for the error condition if you're depositing too much into the account. The `guard` statement does things the other way, to check for the condition you *do* want - in this case, you want the current balance + deposit amount to be less than or equal to the maximum.
  
Update the `if` statement and block to the following:
  
    guard balance + amount <= maximumBalance else {
      throw CoinWalletError.ExceedsMaximumBalance
    }

This has the same effect as before, but `guard` statements must exit the scope somehow – with a return, throwing an error, `fatalError()`, etc. This ensures the idea is clear on what situation you're guarding against, and the early exit.
  
Scroll down to `makePurchase(_:seller:)` and make the same kind of change there. When you've finished, scroll down to the bottom of the file for a final challenge!
*/
  func deposit(amount: Int) throws {
    guard balance + amount <= maximumBalance else {
      throw CoinWalletError.ExceedsMaximumBalance
    }

    balance += amount
  }

  func makePurchase(amount: Int, seller: String) throws {
    guard balance > amount else {
      throw CoinWalletError.InsufficientFunds(shortAmount: amount - balance)
    }

    balance -= amount
  }
}

func beginReceipt() {
  print("Beginning new purchase receipt:")
}

func endReceipt() {
  print("End of receipt. Have a nice day.")
}

func starterWallet() -> CoinWallet {
  let myWallet = CoinWallet()
  try! myWallet.deposit(100)
  return myWallet
}

let wallet = starterWallet()

wallet

do {
  beginReceipt()
  defer {
    endReceipt()
  }

  guard let price = priceList["unicorn tears"] else {
    throw CoinWalletError.NotFoundPrice
  }

  try wallet.makePurchase(price, seller: "Mic")

} catch CoinWalletError.InsufficientFunds(let shortAmount) {
  print("Insufficient funds! You need \(shortAmount) more coins to make that purchase!")
} catch CoinWalletError.NotFoundPrice {
    print("The price is not valid")
}

/*:
#### Final challenge

In the demo, you saw the `priceList` dictionary used to call up a price. Fortunately, there's a `guard` statement to ensure a valid price. Unfortunately, if the price lookup fails (i.e. there's no such key in the dictionary) then the code currently calls `fatalError()`.

Your challenge is to handle this error gracefully by throwing an error. You'll need to make several changes:

1. Define another case in `CoinWalletError` for the "price not found" error condition.
2. Throw that error if the price isn't found rather than calling `fatalError()`.
3. Catch that error and print out an appropriate message.
4. Test all this out by attempting to look up something not in the `priceList` dictionary.

Good luck! As always, you can check out the completed challenge for a sample solution.

*/
