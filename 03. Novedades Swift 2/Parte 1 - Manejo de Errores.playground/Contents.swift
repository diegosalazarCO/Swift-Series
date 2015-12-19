/*:
#### What's New in Swift 2 Video Tutorial Series - raywenderlich.com
#### Error Handling Challenge

**Note:** If you're seeing this text as comments rather than nicely-rendered text, select Editor\Show Rendered Markup in the Xcode menu.

In this challenge, you'll try handling the `InsufficientFunds` error case. We already added the enum case to `CoinWalletError` in the demo, so scroll down to `makePurchase(_:seller:)` to continue.
*/
import Foundation

enum CoinWalletError: ErrorType {
  case ExceedsMaximumBalance
  case InsufficientFunds(shortAmount: Int)
}

class CoinWallet: CustomStringConvertible {
  private let maximumBalance = 1000
  private(set) var balance: Int = 0

  var description: String {
    return "CoinWallet with \(balance) balance"
  }

  func deposit(amount: Int) throws {
    if balance + amount > maximumBalance {
      throw CoinWalletError.ExceedsMaximumBalance
    }

    balance += amount
  }

/*:
Just as you did for `deposit(_:)` in the demo, you'll need to edit this method to throw an error.

1. Remove the existing error handling code that calls `fatalError(_:)`
2. Add a check to the top of the method. You'll need to throw an error if the purchase `amount` is greater than the current balance. Remember, the `InsufficientFunds` case also has an associated `Int` value with the amount of coins short.
3. Mark the method as `throws`.

Once you've finished, scroll down to the bottom of the playground to test!
*/
  func makePurchase(amount: Int, seller: String) throws {
    if amount > balance {
        let difference = amount - balance
        throw CoinWalletError.InsufficientFunds(shortAmount: difference)
    }
    
    balance -= amount
  }
}

func starterWallet() -> CoinWallet {
  let myWallet = CoinWallet()
  try! myWallet.deposit(100)
  return myWallet
}

let wallet = starterWallet()

do {
  try wallet.deposit(9500)
} catch CoinWalletError.ExceedsMaximumBalance {
  print("You cannot deposit that many coins!")
}

wallet

/*:
Now it's time to test your code! At this point, you have 100 coins in your wallet. Try making a purchase for 50 coins and ensure it works. Then, try making a purchase for 200 coins and make sure you catch the error correctly!

You can have a look above at the `deposit(_:)` example if you need a reminder on the do/try/catch syntax. Good luck!

As a first try, make sure you're catching the `InsufficientFunds` error correctly. Remember, there's also that `shortAmount` associated value that can help you print out a more helpful error message such as "You need n more coins to make that purchase". If you've forgotten how to bind an associated value, check out the challenge solution.
*/
do {
    try wallet.makePurchase(50, seller: "Zara")
} catch CoinWalletError.InsufficientFunds(let shortAmount) {
    print("You cannot purchase that in Zara. You need \(shortAmount)")
}

wallet

do {
    try wallet.makePurchase(200, seller: "Zara")
} catch CoinWalletError.InsufficientFunds(let shortAmount) {
    print("You cannot purchase that in Zara. You need \(shortAmount)")
}

wallet

