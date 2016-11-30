/**
 * Problem: Given a large array of integers and a window size 'w',
 * find the current maximum in the window as the window slides
 * throught the entire array.
 */

import Foundation
import UIKit

let array1 = [45, 8, 80, 13, 121, 98]
let array2 = [-4, 2, -5, 3, 6]

/**
 * Solution 1: Linearly go through the array, comparing all elements in the window for the
 * max, then incrementing the start index of the search by 1.
 * Runtime Complexity: O(wlog_n) since we are iterating through arrays of size w at each
 * recursive step
 * Memory Complexity: O(w) since we are taking array slices of size w at each recursive step
 */

func solutionOne(array: [Int], window: Int, startIndex: Int) {
    let endIndex = startIndex + (window - 1)
    
    if endIndex >= array.count {
        return
    } else {
        let subArray = array[startIndex...endIndex]
        
        print("max value of window \(subArray): \(max(of: subArray))")
        solutionOne(array: array, window: window, startIndex: startIndex + 1)
    }
}

func max(of arraySlice: ArraySlice<Int>) -> Int {
    var max = -10000
    
    for element in arraySlice {
        if element > max {
            max = element
        }
    }
    
    return max
}

solutionOne(array: array1, window: 3, startIndex: 0)
solutionOne(array: array2, window: 3, startIndex: 0)
