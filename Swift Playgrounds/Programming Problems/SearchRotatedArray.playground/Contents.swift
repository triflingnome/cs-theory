/**
 * Problem: Search a given number in a sorted array that has been rotated by some arbitrary
 * number. Return -1 if the number doesn't exist
 */

import Foundation
import UIKit

/**
 * Solution: Basically binary search with some modifications to the checks. In this
 * scenario, we can assume at least half of the array is sorted. So:
 * 1. Start Index > End Index, return -1
 * 2. Calculate mid and see if key == array[mid]
 * 3. Check if the key could fall within the sorted half. If it does, call
 * binary search on the sorted half. 2 conditionals to check if first or second half is sorted
 * and key falls within either
 * 4. If it doesn't, call binary search on the unsorted half. 2 conditionals to see if the first
 * half or the second half is unsorted
 */

let rotatedArray = [121, 130, 202, 1, 9, 16, 47]

func rotatedBinarySearch(with array: [Int], key: Int, startIndex: Int, endIndex: Int) -> Int {
    if startIndex > endIndex {
        return -1
    }
    
    let midIndex = (startIndex + endIndex) / 2
    //let midIndex = startIndex + (endIndex - startIndex) / 2
    
    if array[midIndex] == key {
        return midIndex
    }
    
    if array[startIndex] < array[midIndex] && key < array[midIndex] && key >= array[startIndex] {
        rotatedBinarySearch(with: array, key: key, startIndex: startIndex, endIndex: midIndex - 1)
    }
    
    else if array[midIndex] < array[endIndex] && key <= array[endIndex] && key > array[midIndex] {
        rotatedBinarySearch(with: array, key: key, startIndex: midIndex + 1, endIndex: endIndex)
    }
    
    else if array[startIndex] > array[midIndex] {
        rotatedBinarySearch(with: array, key: key, startIndex: startIndex, endIndex: midIndex - 1)
    }
    
    else if array[endIndex] < array[midIndex] {
        rotatedBinarySearch(with: array, key: key, startIndex: midIndex + 1, endIndex: endIndex)
    }
    
    return -1
}

rotatedArray.count - 1
let rotatedBinarySearchResult = rotatedBinarySearch(with: rotatedArray, key: 130, startIndex: 0, endIndex: rotatedArray.count)
