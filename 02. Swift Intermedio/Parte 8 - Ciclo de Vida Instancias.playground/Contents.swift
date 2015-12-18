/*:
#### Intermediate Swift Video Tutorial Series - raywenderlich.com
#### Video 8: Initialization Challenge

**Note:** If you're seeing this text as comments rather than nicely-rendered text, select Editor\Show Rendered Markup in the Xcode menu.

The job of the initializer is to ensure all of the non-optional properties are set to valid values. Consider the following class:

    class BankAccount {
      var owner: String
      var balance: Int
      var accountNumber: Int

      init(accountNumber: Int) {
        self.accountNumber = accountNumber
      }

      func lookUpAccountInformation() {
        // look up owner and balance over a network call
        owner = ...
        balance = ...
      }
    }

The problem here is that the initializer is not valid! `owner` and `balance` aren't set to anything in the initializer, which means this code won't even compile. You're going to set them soon after though, once the network call is complete.

The solution could be to use optionals:
*/

class BankAccountOptionals {
  var owner: String?
  var balance: Int?
  var accountNumber: Int

  init(accountNumber: Int) {
    self.accountNumber = accountNumber
  }

  func lookUpAccountInformation() {
    owner = "Test"
    balance = 100
  }
}

let myAccount1 = BankAccountOptionals(accountNumber: 1234567890)
myAccount1.lookUpAccountInformation()
let owner1: String = myAccount1.owner!

/*:
The issue here is that every time you want to access the owner's name or the balance, those values are optionals! You need to check, and unwrap every single time. Or, you need to force unwrap every single time.

Say in our case, the network lookup is reasonably fast. In the long-term "steady state" of the app, every bank account object will have a valid owner and balance. But because of initialization rules, they have to be optionals.

That's where implicitly-unwrapped optionals come into play:
*/

class BankAccount {
  var owner: String!
  var balance: Int!
  var accountNumber: Int

  init(accountNumber: Int) {
    self.accountNumber = accountNumber
  }

  func lookUpAccountInformation() {
    owner = "Test"
    balance = 100
  }
}

let myAccount2 = BankAccount(accountNumber: 1234567890)
myAccount2.lookUpAccountInformation()

let owner2: String = myAccount2.owner

/*:
Notice here, the initializer is just fine! And when you access the property, it acts just like a non-optional, with no explicit unwrapping required.

Are these still optionals though? You can test this yourself with something like this:

    var optional: String? = "Hello"
    optional == nil

    var implicitlyUnwrappedOptional: String! = "Hello"
    implicitlyUnwrappedOptional == nil

    var nonOptional: String = "Hello"
    nonOptional == nil

What do you think will happen here? Give it a try, then read on.

*/

var optional: String? = "Hello"
optional == nil

var implicityUnwrappedOptional: String! = "Hello"
implicityUnwrappedOptional == nil

var nonOptional: String = "Hello"
nonOptional == nil

/*:
You can see that implicitly-unwrapped optionals are _still_ optionals. They can be nil, and you can check for nil. Non-optionals, as usual, can _never_ be nil so even checking for this is a compile-time error!

The shortcut here is, as the name suggests, they're implicitly unwrapped. That means you don't have to keep force unwrapping them.

The danger here is that because they're easy to unwrap, you run the risk of a crash if the value is ever nil.

In your own pure Swift code, you could get away with not using implicitly-unwrapped optionals. When dealing with view controllers in particular on iOS and OS X, you'll see them a lot when dealing with UI elements in storyboards.
*/
