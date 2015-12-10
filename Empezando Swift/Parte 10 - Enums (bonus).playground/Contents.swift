/*:
#### Beginning Swift Video Tutorial Series - raywenderlich.com
#### Video 10: Bonus Enumerations Challenge!

**Note:** If you're seeing this text as comments rather than nicely-rendered text, select Editor\Show Rendered Markup in the Xcode menu.

In this challenge, you'll build out part of the weather enumeration example from the demo. That will give you a chance to see associated values in action.

Here's the starter enumeration. The `Snow` case is already there and has some associated values; add some additional cases as follows:

- `Cloudy` should have one associated string value `cloudType`
- `Rain` should have one associated float value `inches`

*/
import Cocoa

enum Weather {
    case Cloudly(cloudType: String)
    case Rain(inches: Float)
    case Sunny
    case Snow(inches: Float, packingSnow: Bool)
}

/*:
You create values of type weather just as you'd expect. For the `Sunny` case, since it has no associated values you just create it as you see below.

For the other cases, it looks almost like a struct or class initializer:

    let rainyWeather = Weather.Rain(inches: 2.5)

Add this to the playground below, and also try adding constants for cloudy and snow.
*/

let sunnyWeather = Weather.Sunny
let cloudlyWeahter = Weather.Cloudly(cloudType: "Cúmulos")
let rainyWeather = Weather.Rain(inches: 5.2)
let snowyWeather = Weather.Snow(inches: 2.2, packingSnow: true)

/*:
When it comes to accessing associated values, you need to use the `switch` statement. `switch` can do everything `if`/`else` can do, but has some extra features to make working with enumerations easier.

Below, you'll find a starter function that takes an enumeration instance. The idea is to then print out the weather conditions to the debug area.

Add the following code to the function to get the first case working, then scroll down to the next set of instructions:

    switch weather {
    case .Sunny:
      print("It's sunny! Enjoy the day!")
    }

*/

func printWeatherInformation(weather: Weather) {
    let wheater = weather
    switch wheater {
    case .Sunny:
        print("Está haciendo mucho calor!")
    case .Rain(let inches):
        print("Alista el paraguas, está lloviendo. La precipitación es de: \(inches) pulgadas")
    case .Cloudly(let cloudType):
        print("Puede que quizás llueva, o va a estar opaco el cielo. Hay \(cloudType) afuera")
    case .Snow(let inches, let packingSnow):
        if packingSnow {
            print("Está nevando, puedes ir a skiar! :). La precipitación es de: \(inches) pulgadas.")
        } else {
            print("Está nevando, y no puedes ir a skiar! :(. La precipitación es de: \(inches) pulgadas.")
        }
    }
}

printWeatherInformation(snowyWeather)
/*:
That looks pretty easy! But you'll notice an error because Swift wants switch statements to be _exhaustive_. There are four weather cases, but you're only checking for one! Swift has your back here, and ensures you cover all the cases.

The equivalent of `else` for switch statements is the default case, which looks something like this:

    default:
      print("Weather is something other than sunny.")

But in this case, don't add that to your switch. Fill out the rest of the cases with the actual values.

To access the associated values, you _bind_ them as part of the switch case. Here's what that looks like:

    case .Cloudy(let cloudType):
      print("There are \(cloudType) clouds out there")

You're binding the associated value to the constant `cloudType`, which you can then access inside that case.

Add the code for the `.Cloudy` case above to your `switch` statement. Make sure it's immediately following the code for the `.Sunny` case, still inside the curly braces of the switch. Then go ahead and add code for the `.Rain` and `.Snow` cases.

When you're done, try calling your function with the values you set up earlier, and check out the output in the debug area!

    printWeatherInformation(sunnyWeather)

That's it for this bonus challenge! Tune in to the conclusion video to wrap things up for this beginner series!
*/
