//: [Previous](@previous)

import Foundation

let numberArray = [3,7,1,2,8,4,5]

func filterOfArray(arrInput:[Int],resultNumber:Int) -> [Int]{
    //full closour
    let sumArray = arrInput.filter{(a) ->  Bool in
      
        return a > 2
    }
    let filterArr = arrInput.filter{$0 > resultNumber}
    print(filterArr)
    return sumArray
}


// filter Array of Integers in between some range
let array = [99, 42, 34, 19, 167, 30, 49, 39, 75, 175, 270, 540]
//one way
let range = 30 ... 167;
func findTheRangeInTheArray(inpurArray:[Int], rangeValue:ClosedRange<Int>){
    let rangeArray = array.filter{ rangeValue ~= $0 }
    //other way is
    let otherRange = array.filter{ $0 > 30 && $0 < 167}
    //other way is
    let otherRangeone = array.filter{ (30...167).contains($0)}
}
findTheRangeInTheArray(inpurArray:array,rangeValue:range)

func mapOfArray(arrInput:[Int],resultNumber:Int) -> [Int]{
    let maparray = arrInput.map { (a) in
        a*5
    }
    print(maparray)
    let mappp = arrInput.map{ $0 * resultNumber}
    return mappp
}
mapOfArray(arrInput: numberArray, resultNumber: 15)
