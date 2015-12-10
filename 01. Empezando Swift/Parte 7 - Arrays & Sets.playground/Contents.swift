/*:
#### Beginning Swift Video Tutorial Series - raywenderlich.com
#### Video 7: Arrays and Sets Challenge

**Note:** If you're seeing this text as comments rather than nicely-rendered text, select Editor\Show Rendered Markup in the Xcode menu.

In this challenge, you'll explore arrays and sets. We'll take a small step away from our tip calculator and look at restaurant visits in general.

Let's start with the big issue here: in the demo, you saw an array of restaurant bills. However, you cannot (at least right now) have a _set_ of restaurant bills.

This is a topic we'll get into a bit more in the intermediate series, but the issue here has to do with uniqueness. Remember, sets store unique objects. Swift can already tell when two strings are the same with the `==` operator, which means the set can tell them apart.

With structs you make yourself though, Swift has no idea how to compare them and how to tell if they're the same or not. That's something you can add with _protocols_, which you'll learn about in the intermediate series.

In the meantime – we'll use strings to see the difference between sets and arrays.
*/
import Cocoa
/*:
Here are are two variables: an array that will keep track of each restaurant visit, and a set that will keep track of every restaurant we've visited. Those sound pretty similar, but you'll see the difference.
*/
var restaurantVisits: [String] = []
var restaurantsVisited: Set<String> = []
/*:
Let's say we make a trip to **Ray's Ramen**. Here's how you would track the trip:
*/

restaurantVisits.append("Ray's Ramen")
restaurantsVisited.insert("Ray's Ramen")

restaurantVisits.count
restaurantsVisited.count

/*:
The array has a method `append(_:)` to add something to the end of the array. Remember, arrays are _ordered_ so things you add to an array have a set position.

The set, on the other hand, has a method `insert(_:)`. There's no order here – you're just inserting something into the set.

Let's say you go to **Ray's Ramen** again. Add the code below to both append to the array and insert into the set, then print out the counts.
*/
restaurantVisits.append("Ray's Ramen")
restaurantsVisited.insert("Ray's Ramen")

restaurantVisits.count
restaurantsVisited.count
/*:
You'll see that since the array tracks _visits_, it now has a count of two.

The set, on the other hand, tracks the restaurants you've visited. Even if you go to Ray's Ramen every day for a year, it's still just one restaurant! Thus the set still has a count of 1.

Here are a few more records for you. Feel free to add some more yourself:
*/

restaurantVisits.append("Burger Barn")
restaurantsVisited.insert("Burger Barn")

restaurantVisits.append("Chicken a la Christine")
restaurantsVisited.insert("Chicken a la Christine")

restaurantVisits.append("Ray's Ramen")
restaurantsVisited.insert("Ray's Ramen")

restaurantVisits.append("Burger Barn")
restaurantsVisited.insert("Burger Barn")

/*:
OK, now what do you think the _count_ of the array and set will be? Figure it out, then add some code to check your answer!

You can iterate through a set just as you'd expect:
*/
for restaurantName in restaurantsVisited {
    print(restaurantName)
}

for restaurantVisit in restaurantVisits {
    print(restaurantVisit)
}
/*:
Add a `print()` call inside the for loop above to print out the names just to be sure.

Both arrays and sets also have a method `contains(_:)` to check whether a thing exists in the collection:
*/
restaurantVisits.contains("Sam's Sandwiches")
restaurantsVisited.contains("Sam's Sandwiches")

/*:
With so much similarity, you might wonder what the other differences are between sets and arrays.

The big answer is the uniqueness of things in the set. That also makes `contains(_:)` extra speedy for sets. You won't really notice it here with the small array and set, but if you had thousands or millions of things in the collection, you'll find the set is extremely fast at this.

Check out our tutorial on _Collection Data Structures in Swift_ for more details – it covers arrays, sets, and dictionaries and talks about their performance characteristics.

http://www.raywenderlich.com/79850/collection-data-structures-swift

In the meantime, you'll learn more about dictionaries in the next video!

*/
