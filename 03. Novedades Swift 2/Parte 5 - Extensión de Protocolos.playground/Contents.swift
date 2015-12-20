/*:
#### What's New in Swift 2 Video Tutorial Series - raywenderlich.com
#### Protocol Extensions Challenge

**Note:** If you're seeing this text as comments rather than nicely-rendered text, select Editor\Show Rendered Markup in the Xcode menu.

Protocol extensions is a powerful new feature in Swift 2 that may change
the way you think about how you code. In this challenge, you'll extend the `CollectionType` protocol in order to get the largest item from a collection.

This challenge playground will give you all the pieces to make this happen.
*/

import Foundation

/*:

First you need to determine what you are extending. In your case, you are extending the `CollectionType` protocol. Since you will be making comparisons, you need to constrain this protocol to collections that contain Elements that implement the `Comparable` protocol.

In the following line, declare your extension. It should extend `CollectionType` and constrain to `Self.Generator.Element` that are `Comparable`.

Remember to use the `where` keyword and if you find yourself stuck, check out the video again.

*/

extension CollectionType where Self.Generator.Element: Comparable {
    
/*:

Next, define your largest function. This function will return a Generator.Element

*/
    func largest() -> Self.Generator.Element {
        var index = startIndex
        var result = self[index]
        
        
        while index != endIndex {
            if result < self[index] {
                result = self[index]
            } 
            index = index.successor()
        }
        
        return result
    }
}
/*:

At this point, you'll write the body of your function. Here's what you'll need to do to pull this off. First, have a variable to hold a type of `Generator.Element`. You should initialize it with the first element of the array. You'll learn about getting elements in just a moment.

Next, you'll loop through the array one element at a time. If the current element is larger than the stored element, then the current element replaces the stored element.

So this brings about a big question ... how do you loop?

CollectionType define some properties that you can use. There's a `startIndex` object and an `endIndex` object. Each index object has `successor()` which retrieves the very next index object.

Here's your logic. Create an `index` variable to store the startIndex.

Next, create a while loop, checking to make sure that the current index does not equal the `endIndex`. If they equal each other, then the loop is complete.

Make sure to increment your counter by assigning the result of `successor()` to the current index.

Finally, to get the current element, you simply use subscripting on self. Example: `self[index]`

If you get stuck, check out the Challenge finished file.

Here are some test numbers:
*/

var numbers = [0, 1, 2,10, 3, 4, 5, 6, 7, 8]
print(numbers.largest()) // should read 10
