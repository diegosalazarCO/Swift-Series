/*:
#### Intermediate Swift Video Tutorial Series - raywenderlich.com
#### Video 3: Methods Challenge

**Note:** If you're seeing this text as comments rather than nicely-rendered text, select Editor\Show Rendered Markup in the Xcode menu.

Scroll down until you see the next block of instructions to get started!
*/
import Cocoa

enum WeatherCondition {
  case Sunny
  case Cloudy(cloudType: String)
  case Rain(inches: Float)
  case Snow(inches: Float, packingSnow: Bool)

  mutating func increasePrecipitationByInches(inches: Float) {
    switch self {
    case .Rain(let oldInches):
      self = .Rain(inches: oldInches + inches)
    case .Snow(let oldInches, let packingSnow):
      self = .Snow(inches: oldInches + inches, packingSnow: packingSnow)
    default:
      break
    }
  }
}

/*:
Before moving on, you're going to need an enumeration here for each temperature scale. Call the enumeration `TemperatureScale` and add two cases for `Celsius` and `Fahrenheit`.
*/

enum TemperatureScale {
    case Celsius
    case Fahrenheit
}

struct Weather {
  var celsius: Double {
    didSet {
      if celsius < -273.15 {
        celsius = -273.15
      }
    }
  }
  var weatherCondition: WeatherCondition
  var specialAdvisory: String?

  var fahrenheit: Double {
    get {
      return celsius * 9/5 + 32
    }
    set {
      celsius = round((newValue - 32) * 5/9 * 100) / 100
    }
  }

  var temperatureString: String {
    return "The temperature is \(celsius)°C or \(fahrenheit)°F"
  }

  mutating func updateTemperatureByPercent(percent: Double) {
    celsius += celsius * percent/100
  }

/*:
Here's the idea: add a method with the following signature:

    func printTemperature(temperatureScale temperatureScale: TemperatureScale)

This method should take a temperature scale enum value, and then print out a string to the debug console with the temperature in that scale.

Once you have that ready, you could call it like this:
  
    currentWeather.printTemperature(temperatureScale: .Celsius)

However, you probably have your own favorite scale, whether that's Celsius or Fahrenheit. Update the method signature to include a default:

    func printTemperature(temperatureScale temperatureScale: TemperatureScale = .Celsius)

Now, you can call the method with _no_ parameters and get your default!

As a comparison, you can imagine how you might implement this without default parameters. Maybe you would have the parameter be an optional, and then you could pass in nil. Then in the method body, you could check for nil and choose a default there.

In contrast, default parameters are much more consise!

*/

    func printTemperature(TemperatureScale temperatureScale: TemperatureScale = .Celsius) {
        switch temperatureScale{
        case .Celsius:
            print("\(celsius)º")
        case .Fahrenheit:
            print("\(fahrenheit)º")
        }
    }
}

var currentWeather = Weather(celsius: 22, weatherCondition: .Rain(inches: 2), specialAdvisory: nil)

currentWeather.weatherCondition

currentWeather.weatherCondition.increasePrecipitationByInches(1.5)
currentWeather.weatherCondition
currentWeather.printTemperature(TemperatureScale: .Celsius)
