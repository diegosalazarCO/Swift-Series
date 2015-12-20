/*:
#### What's New in Swift 2 Video Tutorial Series - raywenderlich.com
#### Option Sets Challenge

**Note:** If you're seeing this text as comments rather than nicely-rendered text, select Editor\Show Rendered Markup in the Xcode menu.

Zombie survival games are all the rage these days and this challenge is no exception! Zombie
survival games task the players with finding food and shelter all while trying to fight
off the constant undead menace.

A player object is already created for you, but it needs to keep track of its state.
The player can eat, sleep, famish, and exhaust. Of course, there's a method for zombie
bites as well :]

You'll notice these are all empty, you'll need to fill them in with some content.

Unfortunately, there's no mechanism to track the state of the player. You'll need to create
a new option set to do this. The option set should have four options: **Healthy**, **Hungry**, **Tired**, and **Sick**.

When a player is bitten, they will be both tired and sick except sleeping will not remove the
tired state. Otherwise, `eat()` should remove the `.Hungry` state. `Famish()` will add the `.Hungry` state.
`Exhaust()` will add the `.Tired` state and `sleep()` will remove it. */

import Foundation

struct Player {
  var condition: Conditions = []

  mutating func eat() {
    if condition.contains(.Hungry) {
      condition.subtractInPlace(.Hungry)
    }
  }

  mutating func famish() {
    if !condition.contains(.Hungry) {
      condition.unionInPlace(.Hungry)
    }
  }

  mutating func exhaust() {
    if !condition.contains(.Tired) {
      condition.unionInPlace(.Tired)
    }
  }

  mutating func sleep() {
    if condition.contains(.Tired) && !condition.contains(.Sick) {
      condition.subtractInPlace(.Tired)
    }
  }

  mutating func zombieBite() {
    condition.unionInPlace(.Tired)
    condition.unionInPlace(.Sick)
  }

  func status() -> String {

    var status = ""
    if condition.contains(.Hungry) {
      status += "You are feeling hungry"
    }
    if condition.contains(.Tired) && !condition.contains(.Sick) {
      if status .isEmpty {
        status += "You are feeling run down."
      } else {
        status += " and feeling run down."
      }
    }
    if condition.contains(.Tired) && condition.contains(.Sick) {
      if status .isEmpty {
        status = "You're one breath away from being a zombie."
      } else {
        status += " And well, you feel yourself growing cold."
      }
    }
    if condition.isEmpty {
      status = "You feel fine."
    }
    return status
  }
}

struct Conditions: OptionSetType {
  let rawValue: Int
  static let Healthy = Conditions(rawValue: 1)
  static let Hungry = Conditions(rawValue: 1 << 1)
  static let Tired = Conditions(rawValue: 1 << 2)
  static let Sick = Conditions(rawValue: 1 << 3)
}
/*:
This is where the status of the player is printed. Try and have it match the following:
*/
var player = Player()
player.status()
/*:
Should say: You feel fine.
*/
player.famish()
player.status()
/*:
Should say: You are feeling hungry.
*/
player.eat()
player.status()
/*:
Should say: You feel fine.
*/
player.exhaust()
player.status()
/*:
Should say: You are feeling run down.
*/
player.zombieBite()
player.status()
/*:
Should say: You're one breath away from being a zombie.
*/

