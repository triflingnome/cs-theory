/**
 * Problem: Implement a queue using stacks. Specifically,
 * implement a queue with enqueue and dequeue functionality.
 */

import Foundation
import UIKit

class IntStack {
 
    private var stackArray: [Int] = [Int]()
 
    var isEmpty: Bool {
        return stackArray.isEmpty
    }
    
    func push(_ data: Int) {
        stackArray.append(data)
    }
    
    func pop() -> Int? {
        if stackArray.last != nil {
            let dataToReturn = stackArray.last
            stackArray.removeLast()
            return dataToReturn
        } else {
            return nil
        }
    }
    
    func printStack() {
        print("Printing Stack:")
        print("\(stackArray)")
    }
    
}

/**
 * Solution: Create a class called queue that has 2 stacks.
 * enqueue()
 * Time Complexity: O(1)
 * dequeue()
 * Time Complexity: O(n)
 */

class IntQueue {
    
    private var stackOne: IntStack = IntStack()
    private var stackTwo: IntStack = IntStack()
    
    func enqueue(_ data: Int) {
        stackOne.push(data)
    }
    
    func dequeue() -> Int? {
        if stackTwo.isEmpty {
            while !stackOne.isEmpty {
                let dataToBePushed = stackOne.pop()
                
                // it's okay to force unwrap here because stackOne is being checked
                // for contents first, so nil can't be returned in this case
                stackTwo.push(dataToBePushed!)
            }
        }
        
        return stackTwo.pop()
    }
    
}

let queue = IntQueue()

// test to see if dequeue expectedly returns nil when the queue is empty
let expectedValueNil = queue.dequeue()

if expectedValueNil == nil {
    print("nil expectedly returned")
} else {
    print("unexpected value returned")
}

queue.enqueue(5)
queue.enqueue(12)
queue.enqueue(28)
queue.enqueue(1)

let expectedValueFive = queue.dequeue()

if let expectedValueFive = expectedValueFive {
    print("\(expectedValueFive)")
} else {
    print("nil unexpectedly returned")
}
