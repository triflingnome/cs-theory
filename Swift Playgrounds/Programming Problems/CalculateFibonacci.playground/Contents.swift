/**
 * Problem: Calculate the nth fibonacci number
 *
 * Fibonacci numbers: 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610
 * Pattern:
 * Fib(0) = 0
 * Fib(1) = 1
 * Fib(N) = Fib(N - 1) + Fib(n - 2) when N >= 2
 */

import Foundation
import UIKit

/**
 * Solution 1: A simple, recursive solution
 * Runtime Complexity: O(2^n)
 * Memory Complexity: O(n)
 */

func solutionOne(_ n: Int) -> Int {
    if n == 0 || n == 1 {
        return n
    }
    
    return solutionOne(n - 1) + solutionOne(n - 2)
}

print("\(solutionOne(10))")

/**
 * Solution 2: A memory optimized solution to calculating a given fibonacci number
 * Runtime Complexity: O(n)
 * Memory Complexity: O(1)
 */

func solutionTwo(_ n: Int) -> Int {
    if n == 0 || n == 1 {
        return n
    }
    
    var nOne = 1
    var nTwo = 0
    var result = 0
    
    for _ in 2...n {
        result = nOne + nTwo
        nTwo = nOne
        nOne = result
    }
    
    return result
}

print("\(solutionTwo(10))")
