/**
 * Problem: Given an integer array, sort it in ascending order using Quicksort
 */

import Foundation
import UIKit

var array = [13, 19, 9, 5, 12, 8, 7, 4, 21, 13, 19, 11]

/**
 * Solution 1: Quicksort algorithm, arbitrarily making (high - 1) the pivot
 * at each iteration.
 */

func quicksort(_ array: inout [Int], low: Int, high: Int) {
    if low < high {
        let pivot = partition(&array, low: low, high: high)
        quicksort(&array, low: low, high: pivot - 1)
        quicksort(&array, low: pivot + 1, high: high)
    }
}

func partition(_ array: inout [Int], low: Int, high: Int) -> Int {
    let pivot = array[high]
    var i = low - 1
    
    for j in low...(high - 1) {
        if array[j] <= pivot {
            i = i + 1
            if array[i] != array[j] {
                swap(&array[i], &array[j])
            }
        }
    }
    
    if array[i + 1] != array[high] {
        swap(&array[i + 1], &array[high])
    }
    return i + 1
}

print("\(array)")
quicksort(&array, low: 0, high: array.count - 1)
print("\(array)")