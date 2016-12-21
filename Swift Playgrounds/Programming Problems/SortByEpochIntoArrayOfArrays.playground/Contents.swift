/**
 * Problem: Given an array of ints representing epochs, return an array of arrays.
 * Each of the subarrays will contain all the epochs for a given day.
 *
 * We know that the array passed in will start with numbers for one day. Then somewhere
 * in the input array, the day will change. When this happens, all the numbers collected
 * previously will be added into the returned array of arrays and a new array will be
 * inialized and the epochs for the new day will be put in that new array.
 *
 * We also know that the passed in array will be sorted already
 */

import UIKit

let sampleEpochArray = [1481130000, 1481133600, 1481137200, 1481140800, 1481144400, 1481148000, 1481151600, 1481155200, 1481158800,
                   1481162400, 1481166000, 1481169600, 1481173200, 1481176800 /* new day */, 1481180400, 1481184000, 1481187600,
                   1481191200, 1481194800, 1481198400, 1481202000, 1481205600, 1481209200, 1481212800, 1481216400, 1481220000,
                   1481223600, 1481227200, 1481230800, 1481234400, 1481238000, 1481241600, 1481245200, 1481248800, 1481252400,
                   1481256000]

/*func sortByEpoch(with epochArray: [Int]) -> [[Int]] {
 var arrayToReturn = [[Int]]()
 
 for epoch in epochArray {
 if epoch % 86400 == 0 {
 
 } else {
 
 }
 }
 }*/

/*func butts(with epochArray: [Int]) {
 for epoch in epochArray {
 print("\(epoch) : \(epoch % 86400)")
 }
 }
 
 butts(with: sampleEpochArray)*/

let sampleHourArray = [11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 0, 1, 2, 3, 4, 5, 6, 7,
                       8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22]

//var subArrays: [[Int]] = sampleHourArray.split(0).map{Array($0)}
/*var subArrays = sampleHourArray.split(separator: 0).map{Array($0)}
var subArrayIncludingSeparator = sampleHourArray.split(separator: 0, omittingEmptySubsequences: false).map{Array($0)}
print("\(subArrays)")
print("\(subArrayIncludingSeparator)")*/

func solution(with array: [Int]) -> [[Int]] {
    var arrayToReturn = [[Int]]()
    
    var subArray = [Int]()
    for element in array {
        if element == 0 {
            arrayToReturn.append(subArray)
            subArray.removeAll()
        }
        subArray.append(element)
    }
    
    if !subArray.isEmpty {
        arrayToReturn.append(subArray)
    }
    
    return arrayToReturn
}

print("\(solution(with: sampleHourArray))")
print(NSDate(timeIntervalSince1970: 1481256000))
