/**
 * Problem: Given an array of sorted integers, return the index
 * of the given key. Return -1 if not found.
 */

import Foundation
import UIKit

let array1 = [1, 7, 15, 31, 44, 79]
let array2 = [1, 10, 20, 47, 59, 63, 75, 88, 99, 107,
              120, 133, 155, 162, 176, 188, 199, 200, 210, 222]

/**
 * Solution 1: Iterate through the array and return index if key == value at index
 * Runtime: O(n) or linear
 */
func linearSearch(arrayToSearch: [Int], key: Int) -> Int {
    for (index, element) in arrayToSearch.enumerated() {
        if element == key {
            return index
        }
    }
    
    return -1 // if flow gets to this point, key wasn't found in arrayToSearch, so return -1
}

let linearSearchResultFound = linearSearch(arrayToSearch: array1, key: 44)
let linearSearchResultNotFound = linearSearch(arrayToSearch: array1, key: 100)

/**
 * Solution 2: Binary Search
 * Runtime: O(log_n) or logarithmic
 * Memory Complexity: O(log_n) or logarithmic
 *
 * A recursive solution, where at each method call:
 * 1. Consider the array between LOW and HIGH indices
 * 2. Calculate the MID index
 * 3. If element at MID index is the key, return MID
 * 4. If element at MID is greater than KEY, then reduce the array size s.t. LOW = LOW && HIGH = MID - 1
 * 5. If element at MID is less than KEY, then reduce the array size s.t. LOW = MID + 1 && HIGH = HIGH
 * 6. When LOW is greater than HIGH, key doesn't exist. Return -1
 *
 * Required parameters: array pointer, key, low index, high index
 */
func binarySearch(array: [Int], key: Int, lowIndex: Int, highIndex: Int) -> Int {
    if lowIndex > highIndex {
        return -1
    }
    
    let midIndex = (lowIndex + highIndex) / 2
    
    if array[midIndex] == key {
        return midIndex
    } else if array[midIndex] > key {
        return binarySearch(array: array, key: key, lowIndex: lowIndex, highIndex: midIndex - 1)
    } else {// array[midIndex] < key
        return binarySearch(array: array, key: key, lowIndex: midIndex + 1, highIndex: highIndex)
    }
}

let binarySearchResultFound1 = binarySearch(array: array1, key: 31, lowIndex: 0, highIndex: array1.count)
let binarySearchResultFound2 = binarySearch(array: array2, key: 210, lowIndex: 0, highIndex: array2.count)
let binarySearchResultNotFound1 = binarySearch(array: array1, key: 20, lowIndex: 0, highIndex: array1.count)
let binarySearchResultNotFound2 = binarySearch(array: array2, key: 143, lowIndex: 0, highIndex: array2.count)
