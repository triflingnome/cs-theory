/**
 * Problem: Given the pointer/reference to the head of a singly
 * linked list, reverse it and return the pointer/reference
 * to the head of the reversed linked list.
 */

import Foundation
import UIKit

/**
 * Solution 1: Iterate through the linked list, pushing each node onto a stack.
 * After iterating through the list, start popping nodes off the stack and linking
 * them together. Then return the new linked list
 * Time Complexity: O(n^2)
 * Memory Complexity: O(n)
 */

class Node {
    
    var value: Int
    var next: Node?
    
    init(withValue value: Int) {
        self.value = value
        self.next = nil
    }
    
}

class NodeStack {
    
    private var stackArray = [Node]()
    
    var isEmpty: Bool {
        return stackArray.isEmpty
    }
    
    func push(node: Node?) {
        if let node = node {
            stackArray.append(node)
        } else {
            return
        }
    }
    
    func pop() -> Node? {
        if stackArray.last != nil {
            let node = stackArray.last
            stackArray.removeLast()
            
            return node
        } else {
            return nil
        }
    }
    
    func printStack() {
        print("Printing Stack:")
        print("\(stackArray)")
    }
    
}

func printLinkedList(withHead head: Node?) {
    print("Printing Linked List:")
    
    var current = head
    while true {
        if let unwrappedCurrent = current {
            print("\(unwrappedCurrent.value)")
            current = unwrappedCurrent.next
        } else {
            break
        }
        
    }
}

func solutionOne(withHead head: Node?) -> Node? {
    guard head != nil else {
        return nil
    }
    
    // Step 1: Push linked list onto stack
    let stack = NodeStack()
    var current = head
    while current != nil {
        let nodeToPush = current
        current = current?.next
        
        nodeToPush?.next = nil
        stack.push(node: nodeToPush)
    }
    
    // Step 2: Construct new linked list from stack
    var reversedHead: Node? = nil
    var reversedCurrent: Node? = nil
    while !stack.isEmpty {
        let poppedNode = stack.pop()
        
        if reversedHead == nil && reversedCurrent == nil {
            reversedHead = poppedNode
            reversedCurrent = poppedNode
        } else {
            reversedCurrent?.next = poppedNode
            reversedCurrent = poppedNode
        }
    }
    
    return reversedHead
}

var node1 = Node(withValue: 7)
var node2 = Node(withValue: 14)
var node3 = Node(withValue: 21)
var node4 = Node(withValue: 28)
node1.next = node2
node2.next = node3
node3.next = node4

let head = node1
printLinkedList(withHead: head)

//let solutionOneReversedHead = solutionOne(withHead: head)
//printLinkedList(withHead: solutionOneReversedHead)

/**
 * Solution 2: Starting with pointer reversed, pointing to head and listToReverse, pointing to head.next:
 * 1. Point reversed to listToReverse
 * 2. Advance listToReverse to listToReverse.next
 * Time Complexity: O(n)
 * Space Complexity: O(1)
 */
func solutionTwo(withHead head: Node?) -> Node? {
    if head == nil {
        return nil
    } else if head?.next == nil {
        return head
    }
    
    var reversed = head
    var listToReverse = head?.next
    
    reversed?.next = nil
    while listToReverse != nil {
        let temp = listToReverse
        listToReverse = listToReverse?.next
        temp?.next = reversed
        reversed = temp
    }
    
    return reversed
}

let solutionTwoReversedHead = solutionTwo(withHead: head)
printLinkedList(withHead: solutionTwoReversedHead)
