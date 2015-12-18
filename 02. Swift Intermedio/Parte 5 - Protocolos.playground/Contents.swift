/*:
#### Intermediate Swift Video Tutorial Series - raywenderlich.com
#### Video 5: Protocols Challenge

**Note:** If you're seeing this text as comments rather than nicely-rendered text, select Editor\Show Rendered Markup in the Xcode menu.

Scroll down until you see the next block of instructions to get started!
*/
import Cocoa

protocol Door {
  var isLocked: Bool { get set }
  func open()
  func close()
}

/*:
Swift includes many handy protocols. There's one called `Hashable`, which gives a unique hash value based on the contents of the data in your type to help establish uniqueness.

If you watched the beginner series videos on collection types, this is part of the reason why sets and dictionaries can only store certain types: to maintain unique set values and dictionary keys, they need to be `Hashable`.

Another very common protocol is `CustomStringConvertible`. This protocol requires you to have a computed string property `description`. This is the string that shows up when you try to "print out" an instance.

In this challenge, you'll implement `CustomStringConvertible` on some of your `Door` types. If you look in the debug area, you'll alreade see two doors being printed out. It would be nice if rather than "BankVault", you got a string like "A bank vault that is locked".

To begin, you can say that `SlidingDoor` conforms to `CustomStringConvertible`. Update the declaration below:

    struct SlidingDoor: Door, CustomStringConvertible

Then inside the curly braces, add a computed `String` property called `description`. You can print out whatever you think appropriate. Then, do the same with `BankVault' to get both of them showing more useful string descriptions.

Check out the sample in the challenge solution playground if you need some hints!

*/

struct SlidingDoor: Door, CustomStringConvertible {
  var isLocked: Bool = false

  func open() {
    print("whoosh!")
  }

  func close() {
    print("whoosh!")
  }
    
    var description: String {
        get {
            return "A cool Sliding Door"
        }
    }
}

class BankVault: Door, CustomStringConvertible {
  var isLocked: Bool = true

  func open() {
    if isLocked {
      print("Locked!")
    } else {
      print("clang!")
    }
  }

  func close() {
    print("slam!!")
    isLocked = true
  }

  func unlock(combination: String) {
    isLocked = false
  }
    
    var description: String {
        get {
            return "A Bank Vault door"
        }
    }
}

let door1 = SlidingDoor()
let door2 = BankVault()

door1.open()
door2.open()
door2.unlock("xyzzy")
door2.open()

let allDoors: [Door] = [door1, door2]

for door in allDoors {
  print("Got door: \(door)")
}
