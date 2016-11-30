/**
 * Problem: Given a linked list of integers, remove all duplicate
 * nodes from it by keeping only the first occurence of each
 * duplicate
 */

import Foundation
import UIKit

class Node {
    
    let data: Int
    var next: Node?
    
    init(withInteger data: Int) {
        self.data = data
    }

}

func printLinkedList(withHead head: Node?) {
    var current = head
    
    print("Printing Linked List:")
    
    while current != nil {
        if let current = current {
            print("\(current.data)")
        }
        
        current = current?.next
    }
}

let node1 = Node(withInteger: 3)
let node2 = Node(withInteger: 3)
let node3 = Node(withInteger: 2)
let node4 = Node(withInteger: 4)
node1.next = node2
node2.next = node3
node3.next = node4

let head = node1

/**
 * Solution: While iterating through the linked list:
 * 1. Check to see if the node's data is in the hashset
 * a. If it is, delete the node from the list
 * b. If it isn't, add the node's data to the list
 * Time Complexity: O(n)
 * Memory Complexity: O(n)
 */

func solution(withHead head: Node) {
    var previous: Node?
    var current: Node? = head
    var set = Set<Int>()
    
    while current != nil {
        if let temp = current {
            if set.contains(temp.data) {
                previous?.next = current?.next
                current = current?.next
                temp.next = nil
            } else {
                set.insert(temp.data)
                previous = current
                current = current?.next
            }
        }
    }
}

printLinkedList(withHead: head)
solution(withHead: head)
printLinkedList(withHead: head)
