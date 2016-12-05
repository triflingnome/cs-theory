/**
 * Problem: Given a linked list & a key, delete the node
 * from the linked list with the given key.
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
        if let temp = current {
            print("\(temp.data)")
        }
        current = current?.next
    }
}

let node1 = Node(withInteger: 1)
let node2 = Node(withInteger: 2)
let node3 = Node(withInteger: 3)
let node4 = Node(withInteger: 4)
node1.next = node2
node2.next = node3
node3.next = node4

var head = node1

/**
 * Solution: Keeping track of the node before current, iterate through
 * the linked list, deleting the first node we find where data == key
 */

func solution(withHead head: Node?, key: Int) {
    var current = head
    
    if var temp = current {
        if temp.data == key {
            //current = current?.next
            //temp.next = nil
            temp = temp.next!
            return
        }
    }
    
    var previous = current
    current = current?.next
    while current != nil {
        if let temp = current {
            if temp.data == key {
                previous?.next = current?.next
                temp.next = nil
                return
            } else {
                previous = current
                current = current?.next
            }
        }
    }
}

printLinkedList(withHead: head)
solution(withHead: head, key: 1)
printLinkedList(withHead: head)
