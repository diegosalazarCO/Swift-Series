/*:
#### Intermediate Swift Video Tutorial Series - raywenderlich.com
#### Video 10: Error Handling Challenge

**Note:** If you're seeing this text as comments rather than nicely-rendered text, select Editor\Show Rendered Markup in the Xcode menu.

Scroll down until you see the next block of instructions to get started!
*/
import Cocoa

enum StartupError: ErrorType {
  case ShowStoppingBug(bugId: Int)
  case TooManyDistractions
  case NotEnoughTime
  case NotEnoughFunding(shortfall: Int)
}

class Startup {
  var funding = 0
  var completion = 0
  var burnRate = 10000
  var week = 0

  func raiseCapital(amount: Int) {
    funding += amount
  }

  func completeWork(units: Int) throws {
    week += 1
    completion += units
    funding -= burnRate

    if funding < 0 {
      throw StartupError.NotEnoughFunding(shortfall: funding)
    }
    if completion >= 100 {
      print("Congratulations! You've been acquihired!")
    }
  }
}

/*:
`defer` blocks are blocks of code inside a scope that will run at the _end_ of the current scope. Imagine you open a file, and then close the file:

    let fh = openFile()
    
    // do some work

    fh.close()

Depending on how much work there is in between, it might be difficult to ensure you close the file. What if this is in a function and there's an early return? And for error handling: what if you throw an error somewhere? Then your file closing (or any other cleanup task) won't run at all!

Enter the followning test code below to get a feel for `defer` blocks:

    func testDefer(earlyExitFlag: Bool) {
      print("testDefer 1")
      defer {
        print("Defer block 1")
      }

      if earlyExitFlag {
        return
      }

      print("testDefer 2")
      defer {
        print("Defer block 2")
      }
    }

Before you try calling the function, what do you think will happen? Add two calls to the function next, and have a look at the debug area. Was it what you expected?

    testDefer(true)
    testDefer(false)
*/

func testDefer(earlyExitFlag: Bool) {
    print("testDefer 1")
    defer {
        print("Defer block 1")
    }
    
    if earlyExitFlag {
        return
    }
    
    print("testDefer 2")
    defer {
        print("Defer block 2")
    }
}

testDefer(true)
testDefer(false)

let myStartup = Startup()
myStartup.raiseCapital(25000)


/*:
Imagine a stack, where you push things on top and then pop them off. That's how defer blocks work: when Swift comes across a defer block, it pushes it onto the stack. Then at the end of the scope, it pops them off one by one and executes them. You can see this at work when you have multiple defer blocks – it'll look like they're executed in reverse because of the stack.

In the demo, remember the problem was that if you run out of funding, you never get the "At week 3, ..." string printed out from the `do` block below when you run out of funding. Since running out of funding is cause to throw an error, that line of code is never reached.

How would you fix this? Give it a try in the code below!
*/

do {
  let weeklyWork = 20
  for _ in 1...3 {
    defer { print("At week \(myStartup.week), tried to do \(weeklyWork) units of work.") }
    try myStartup.completeWork(weeklyWork)
  }
} catch {
  if let error = error as? StartupError {
    switch error {
    case .NotEnoughFunding(let shortfall):
      print("Ran out of funding! Shortfall: \(shortfall)")
    default:
      print("Some other problem.")
    }
  }
}
