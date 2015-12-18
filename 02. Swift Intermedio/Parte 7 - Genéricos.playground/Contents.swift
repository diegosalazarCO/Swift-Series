/*:
#### Intermediate Swift Video Tutorial Series - raywenderlich.com
#### Video 7: Generics Challenge

**Note:** If you're seeing this text as comments rather than nicely-rendered text, select Editor\Show Rendered Markup in the Xcode menu.

Scroll down until you see the next block of instructions to get started!
*/
import Cocoa

// Generics with types

class Car { }
class Phone { }
class TV { }

/*:
The enumeration here is nice, but to get the present out from the `.Purchased` case is a little involved:

    switch birthday {
    case .Purchased(let present):
      // got the present here!
    default:
      // need to be exhaustive
      break
    }

It would be useful to have a method on the enumeration to return the present. The return value should be optional so you can return `nil` in the `.NotYetPurchased` case. Add a method to the enumeration with the following signature:

    func present() -> PresentType?

You can write the rest of the method. Go ahead and do that, and try testing it out in both cases – `.NotYetPurchased` and `.Purchased`.

*/

enum BirthdayPresentShoppingStatus<PresentType> {
  case NotYetPurchased
  case Purchased(present: PresentType)
    
    func present() -> PresentType? {
        switch self {
        case .Purchased(let present):
            return present
        default:
            return nil
        }
    }
}

var vickiBirthday = BirthdayPresentShoppingStatus<Car>.NotYetPurchased
var rayBirthday = BirthdayPresentShoppingStatus<Phone>.NotYetPurchased

rayBirthday = .Purchased(present: Phone())
rayBirthday.present()
vickiBirthday.present()

/*:
Believe it or not, you're very close to re-implementing your own version of _optionals_! Optionals are just generic enumerations, just like your birthday present tracker. They have one case `.None` when there's no value (`nil`) and another case `.Some` with an associated value.

That means this: `Int?` is the same as this: `Optional<Int>`. Just like your birthday present tracker, optionals have a generic type, they can tell whether there's a value present or not, and they can return the value.

For more on optionals, check out raywenderlich.com team member Rich Turton's blog post on the topic:
http://commandshift.co.uk/blog/2014/06/11/understanding-optionals-in-swift/

See you in the next video!

*/

// Generics with functions

func intIncrement(number: Int) -> Int {
  return number + 1
}

func doubleIncrement(number: Double) -> Double {
  return number + 1
}

intIncrement(10)
doubleIncrement(14.3)

func genericIncrement<T: Strideable>(number: T) -> T {
  return number + 1
}

genericIncrement(25.47)

