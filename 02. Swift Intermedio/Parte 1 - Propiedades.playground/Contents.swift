/*:
#### Intermediate Swift Video Tutorial Series - raywenderlich.com
#### Video 1: Properties Challenge

**Note:** If you're seeing this text as comments rather than nicely-rendered text, select Editor\Show Rendered Markup in the Xcode menu.

Scroll down until you see the next block of instructions to get started!
*/
import Cocoa

enum WeatherCondition {
  case Sunny
  case Cloudy(cloudType: String)
  case Rain(inches: Float)
  case Snow(inches: Float, packingSnow: Bool)
}

struct Weather {
    let absoluteZero = -273.15
  var celsius: Double {
    didSet {
      if celsius < absoluteZero {
        celsius = absoluteZero
      }
    }
  }
  var weatherCondition: WeatherCondition
  var specialAdvisory: String?

/*:
The `fahrenheit` computed property only has a getter, which makes it read-only. If you want to update the temperature, you'll have to use the `celsius` property.
  
Why not add a setter here? In that case, you could _set_ `fahrenheit`, then it would do the conversion and store the results to `celsius`.

Here's the formula to go from °F to °C: `c = (f - 32) * 5/9`

Because this will give results like `21.66666667`, you can instead round to two decimal places like this: `round((c - 32) * 5/9 * 100) / 100`

Remembor, inside a setter, you can access the passed-in value as `newValue`. You can store to `celsius' just as you would any other property.
*/
  var fahrenheit: Double {
    get {
      return celsius * 9/5 + 32
    }
    set {
        if newValue < -459.67 {
            celsius = absoluteZero
        }
        celsius = round((newValue - 32) * 5/9 * 100) / 100
    }
  }
    
    var kelvin: Double {
        return celsius - absoluteZero
    }
    
/*:
Additional exercises:

* Setting in a too-low value will still be limited by the `didSet` observer on `celsius`. However, you can still add some code to your `fahrenheit` setter to do the check. Add some code to limit the value; absolute zero in °F is -459.67.

* Try adding additional computed properties for Kelvin and Rankine; your nerdy science friends will love you! Check out the conversion formulas here: https://en.wikipedia.org/wiki/Conversion_of_units_of_temperature
*/
    var temperatureString: String {
        return "The temperature is \(celsius)°C or \(fahrenheit)°F"
    }
}

var currentWeather = Weather(celsius: 22, weatherCondition: .Sunny, specialAdvisory: nil)

currentWeather.celsius = -220

currentWeather.temperatureString
