// ref: https://krakendev.io/blog/the-right-way-to-write-a-singleton

// both imports needed for this class
import Foundation
import UIKit

class TheOneAndOnlyKraken {
    
    /**
     * The reason declaring this property as static is all that needs to be done
     * is that swift implicits makes a GCD dispatch_once call to initialize the
     * object the first time the class init is called. Every subsequent time,
     * a reference to the static object is returned, instead of initing a new
     * instance
     */
    static let sharedInstance = TheOneAndOnlyKraken()
    
    var theWorstJoke: String
    
    private init() {
        theWorstJoke = "yall better not be kraken jokes"
    }
    
}

let krakenOne = TheOneAndOnlyKraken.sharedInstance
krakenOne.theWorstJoke = "oh we are kraken jokes"
let krakenOneState = krakenOne.theWorstJoke

let krakenTwo = TheOneAndOnlyKraken.sharedInstance
let krakenTwoState = krakenTwo.theWorstJoke

if krakenOneState == krakenTwoState {
    print("it works!")
} else {
    print("it DOESN'T work!")
}
