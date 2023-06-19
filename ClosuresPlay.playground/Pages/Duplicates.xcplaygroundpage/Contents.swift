import UIKit
import Foundation

//most common element in an array using DS
func mostCommonElement<T: Hashable>(in list: [T]) -> T? {
    var countDict: [T: Int] = [:]

    for element in list {
        countDict[element, default: 0] += 1
    }
   
    var mostCommonElement: T?
    var maxCount = 0

    for (element, count) in countDict {
        if count > maxCount {
            mostCommonElement = element
            maxCount = count
        }
    }

    return mostCommonElement
}
let list = [1, 2, 3, 2, 2, 4, 5, 1, 2, 4, 4, 4]
let colorArray = ["red", "green", "green", "black", "blue", "yellow", "red", "green", "yellow", "red", "red", "green", "green", "grey", "purple", "orange", "grey", "blue", "red", "green", "yellow", "orange", "purple", "black", "red", "blue", "green", "orange", "blue", "white", "yellow", "blue", "red", "green", "orange", "purple", "blue", "black"]

if let mostCommon = mostCommonElement(in: colorArray) {
    print("The most common element is: \(mostCommon)")
} else {
    print("The list is empty.")
}


func findTheMostRepeatedValues<T:Hashable>(in list: [T])-> T? {
    var counterDict: [T: Int] = [:]
    for element in list{
        counterDict[element, default: 0] += 1
    }
    var mostCommonElement : T?
    var elementCount = 0
    for (key,value) in  counterDict{
        if(value > elementCount){
            elementCount = value
            mostCommonElement = key
        }
    }
    return mostCommonElement
}

findTheMostRepeatedValues(in: colorArray)
func findCommonElements(string1: String, string2: String) -> Set<Character> {
    let set1 = Set(string1)
    let set2 = Set(string2)
    let commonElements = set1.intersection(set2)
    return commonElements
}
let string1 = "Hello"
let string2 = "World"
let commonElements = findCommonElements(string1: string1, string2: string2)

//ds for most common repeat
func findTwoMostCommonElements(str1: String, str2: String) -> [Character] {
    var countDict: [Character: Int] = [:]

    // Count occurrences in str1
    for char in Set(str1) {
        countDict[char, default: 0] += 1
    }

    // Count occurrences in str2 and update existing counts
    for char in Set(str2) {
        countDict[char, default: 0] += 1
    }
   var mostCommonElements: [Character] = []
    for(key,count) in countDict{
        if(count > 1){
            mostCommonElements.append(key)
        }
    }
    return mostCommonElements
}
let string11 = "Hello"
let string22 = "World"
let commonElementsObj = findTwoMostCommonElements(str1: string11, str2: string22)


