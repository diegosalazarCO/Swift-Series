/*:
#### Beginning Swift Video Tutorial Series - raywenderlich.com
#### Video 1: Playgrounds Challenge

**Note:** If you're seeing this text as comments rather than nicely-rendered text, select Editor\Show Rendered Markup in the Xcode menu.

In this challenge, you'll try some additional calculations. Scroll down past the initial demo code to the next set of instructions to get started!
*/
import Cocoa

42 + 8
3.14 / 7.0
"Hello " + "world, how are you today? I am just fine thanks."

print("Hello debug area!")

53 * 0.15
53 + 7.95
53 * 1.15

print("The total is $53. You should add $\(53 * 0.15) for the tip.")

/*:
That's a pretty simple tip calculation. Let's start a new one: what's the total amount you should pay if you want to leave an 18% tip on $75? Add your calculation below.

You can use `print()` and the debug area, or just type numbers and see the results in the sidebar.
*/
var cuenta = 75.0
var propina = 0.18
var total = cuenta * (1 + propina)
print("El Total de la cuenta es $\( cuenta ) y con la propina son: $\( total )")
/*:
Now say you used a coupon to get $4 off your meal. You should deduct the $4 _after_ calculating the tip.
*/
var cupon = 4.0
total -= 4
print("Ahora el total con el cupón son: $\( total )")
/*:
Finally, what if you were splitting the bill five ways? That's $75, 18% tip, $4 coupon, split five ways. How much should each person contribute?

Remember your order of operations: multiplication and division go before addition and subtraction. If you need to, you can use parentheses to give a higher priority like this: `(1 + 2) * 3` means to do the addition first, and then multiply.
*/
var personas = 5.0
var totalPorPersona = total / personas
print("Ahora el total que debe cada persona es $\( totalPorPersona )")

/*:
That's it for this quick challenge. See you in the next video!
*/
