/**
 * Problem: Given roots of two binary trees, determine if these
 * trees are identical or not. Identical trees have the same
 * layout and data at each node.
 * Runtime Complexity: O(n)
 * Memory Complexity: O(h) where h is the height of the BST
 */

import Foundation
import UIKit

class BSTNode {
    
    let data: Int
    var leftNode: BSTNode?
    var rightNode: BSTNode?
    
    init(withData data: Int) {
        self.data = data
    }
    
}

// BST 1
let bst1Root = BSTNode(withData: 100)
let bst1RootLeft = BSTNode(withData: 50)
let bst1RootRight = BSTNode(withData: 200)
bst1Root.leftNode = bst1RootLeft
bst1Root.rightNode = bst1RootRight

let bst1LeftSubtreeLeft = BSTNode(withData: 25)
bst1RootLeft.leftNode = bst1LeftSubtreeLeft

let bst1RightSubtreeLeft = BSTNode(withData: 125)
let bst1RighSubtreeRight = BSTNode(withData: 350)
bst1RootRight.leftNode = bst1RightSubtreeLeft
bst1RootRight.rightNode = bst1RighSubtreeRight

// BST 2
let bst2Root = BSTNode(withData: 100)
let bst2RootLeft = BSTNode(withData: 50)
let bst2RootRight = BSTNode(withData: 200)
bst2Root.leftNode = bst2RootLeft
bst2Root.rightNode = bst2RootRight

let bst2LeftSubtreeLeft = BSTNode(withData: 25)
bst2RootLeft.leftNode = bst2LeftSubtreeLeft

let bst2RightSubtreeLeft = BSTNode(withData: 125)
let bst2RighSubtreeRight = BSTNode(withData: 350)
bst2RootRight.leftNode = bst2RightSubtreeLeft
bst2RootRight.rightNode = bst2RighSubtreeRight

/**
 * Solution: Two trees, A and B, are identical if:
 * - data at the roots are the same/both are nil
 * - left subtree of A is identical to left subtree of B
 * - right subtree of A is identical to right subtree of B
 *
 * To fulfill these conditions, depth first traversal will be used, while
 * comparing data at each level.
 */

func solution(nodeOne: BSTNode?, nodeTwo: BSTNode?) -> Bool {
    if nodeOne == nil && nodeTwo == nil {
        return true
    }
    
    if let nodeOne = nodeOne,
        let nodeTwo = nodeTwo {
        return nodeOne.data == nodeTwo.data &&
                solution(nodeOne: nodeOne.leftNode, nodeTwo: nodeTwo.leftNode) &&
                solution(nodeOne: nodeOne.rightNode, nodeTwo: nodeTwo.rightNode)
    }
    
    return false
}

print("\(solution(nodeOne: bst1Root, nodeTwo: bst2Root))")
