/*:
#### Intermediate Swift Video Tutorial Series - raywenderlich.com
#### Video 9: Types / Casting Challenge

**Note:** If you're seeing this text as comments rather than nicely-rendered text, select Editor\Show Rendered Markup in the Xcode menu.

Scroll down until you see the next block of instructions to get started!
*/
import Cocoa

protocol Door {
  var isLocked: Bool { get set }
  func open()
  func close()
}

struct SlidingDoor: Door {
  var isLocked: Bool = false

  func open() {
    print("whoosh!")
  }

  func close() {
    print("whoosh!")
  }
}

class BankVault: Door, CustomStringConvertible {
  var isLocked: Bool = true

  var description: String {
    if isLocked {
      return "A bank vault that is locked"
    } else {
      return "An unlocked bank vault"
    }
  }

  func open() {
    if isLocked {
      print("Locked!")
    } else {
      print("clang!")
    }
  }

  func close() {
    print("SLAM!!!!!")
    isLocked = true
  }

  func unlock(combination: String) {
    isLocked = false
  }
}

class RustyBankVault: BankVault {
  var needsOil: Bool = true

  override func open() {
    if isLocked {
      print("Locked!")
    } else {
      print("creeeeeeak!!!")
    }
  }

  override func close() {
    needsOil = true

    super.close()
  }
}

let door1 = BankVault()
let door2 = SlidingDoor()
let door3 = RustyBankVault()
let door4 = BankVault()

let doors: [Door] = [door1, door2, door3, door4]

var bankVaultCount = 0

/*:
You have two quick challenges here:

1. For the `RustyBankVault`, You're currently doing two steps: the `is` and then the `as!`. You can consolidate these into a single `as?` with optional binidng, which is the style you'll see more often in the code out there in the world. Update the code below to use this style.

2. Once you have that figured out, go ahead and do a similar check to look for `BankVault` objects. You can try doing something like unlocking and opening them and making sure the correct thing is printed out to the debug area.

*/

for object in doors {
  if object is BankVault {
    bankVaultCount += 1
  }
    
    if let myRustyBankVault = object as? RustyBankVault {
        myRustyBankVault.needsOil = true
    }
    
    if let myBankVault = object as? BankVault {
        myBankVault.open()
        myBankVault.unlock("xxx")
        myBankVault.open()
    }

//  if object is RustyBankVault {
//    let myRustyBankVault = object as! RustyBankVault
//    myRustyBankVault.needsOil = true
//  }
}

bankVaultCount
