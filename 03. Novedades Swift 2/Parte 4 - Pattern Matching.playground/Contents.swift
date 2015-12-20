/*:
#### What's New in Swift 2 Video Tutorial Series - raywenderlich.com

Pattern Matching Challenge!

**Note:** If you're seeing this text as comments rather than nicely-rendered text, select Editor\Show Rendered Markup in the Xcode menu.

In the demo, you saw how the new `for case` syntax works. In this challenge, you'll try the new `if case`, which is very similar. Scroll down to the bottom of the playground for more instructions.
*/
import Foundation

enum Suspect: CustomStringConvertible {
  case Person(name: String)
  case Robot(registrationNumber: Int)
  case Animal(name: String, species: String)

  var description: String {
    switch self {
    case let .Person(name):
      return "A person named \(name)"
    case let .Robot(registrationNumber):
      return "A robot with registration #\(registrationNumber)"
    case let .Animal(name, species):
      return "An animal (\(species)) named \(name)"
    }
  }
}

extension Array {
  func randomElement() -> Generator.Element {
    return self[Int(arc4random_uniform(UInt32(self.count)))]
  }
}

var suspects = [
  Suspect.Person(name: "Mic"),
  Suspect.Person(name: "Brian"),
  Suspect.Person(name: "Ray"),
  Suspect.Animal(name: "Flappy", species: "Bird"),
  Suspect.Animal(name: "Furball", species: "Cat"),
  Suspect.Animal(name: "Bobo", species: "Doge"),
  Suspect.Animal(name: "Sushi", species: "Doge"),
  Suspect.Robot(registrationNumber: 42),
  Suspect.Robot(registrationNumber: 2001)
]

for case let .Animal(name, species) in suspects where species == "Doge" {
  print("Got \(species) named \(name)")
}

/*:
You're at a standstill in the suspect investigation, and the new approach is to pick a random suspect for further analysis. The idea is to pick a random suspect, and then check that they're a person.

Someone has already written the code using a `switch` but as in the demo, you're only interested in a specific case. Rewrite the code below to use the new `if case` instead.

Since it's a random suspect, you'll need to re-run the playground a few times to test both cases. In the Xcode menu, navigate to **Editor\Execute Playground** to run the code again and get a different random element.

Here's an extra bonus: you can include a `where` clause in your `if case` statements too! Try adding an `else if case` to check for robots whose `registrationNumber` is greater than 100. That will only match one robot so you may need to run the playground a few times to get a match!
*/

let randomSuspect = suspects.randomElement()

switch randomSuspect {
case .Person(let name):
  print("Begin investigation of suspect named \(name)...")
default:
  print("Not an interesting suspect; try again!")
}

if case .Person(let name) = randomSuspect {
    print("Let's investigate \(name)")
} else if case .Robot(let registrationNumer) = randomSuspect where registrationNumer > 100 {
    print("R-TWO-DEE-TOO) ")
} else {
    print("Not interesting")
}






