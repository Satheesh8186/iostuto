import Foundation
//Write a program which takes two strings as input from the user (str1 and str2). This program should print two strings as output (op1 and op2).
//
//op1 should contain all the characters which are present in str1 but NOT present in str2.
//
//op2 should contain all the characters which are present in str2 but NOT present in str1.
//
//
//
//For example:
//
//
//
//
//str1
//str2
//op1
//op2
//
//Example 1
//ABC
//BC
//A
//<null>
//
//Example 2
//BC
//BANGALORE
//C
//ANGLORE
//
//

func stringOperation(str1:String,str2:String){
    let string1ToArray = Array(str1)
    let string2ToArray = Array(str2);
    
    var newString = ""
    for str in string1ToArray {
        
        if !string2ToArray.contains(str){
            newString += String(str)
        }
    }
    // print("newString",newString)
    
}
stringOperation(str1: "ABC",str2: "BC")
stringOperation(str1: "BANGALORE",str2: "BC")
//correct method to anser
func stringOperation1(str1:String,str2:String) -> String{
    //with only string
    let nonDuplicateValue =   str1.filter{
        !str2.contains($0)
    }
    
    //converting string to array
    //    let string1ToArray = Array(str1)
    //    let ans = string1ToArray.filter({
    //        !str2.contains($0)
    //    })
    //    //!string2ToArray.contains($0)})
    return nonDuplicateValue
}
let ans = stringOperation1(str1: "ABC",str2: "BC")
print("ans",ans)
let ans1 = stringOperation1(str1: "BANGALORE",str2: "BC")
print("ans",ans1)
//swap numbers
var a = 10
var b = 20
//using tuples
// (a,b)=(b,a)
//print("a,b",a,b);
//using function
func swapTwoNumbers(_ a: inout Int,_ b: inout Int){
    (a,b)=(b,a)
}
//make it genric
func swapTwoNumbers<T>(_ a: inout T,_ b: inout T){
    (a,b)=(b,a)
}
//swap array

var samapleArray = ["2","5","20","25"]

func swapArrayObj<T>(_ arrayObt: inout [T], i: Int, j: Int){
    arrayObt.swapAt(i, j)
}

swapTwoNumbers( &b, &a)
swapArrayObj(&samapleArray, i: 2, j: 1)
print("a,b",a,b);



//func solve<T : Equatable>(arrayIp1: [T],arrayIp2: [T]) -> [T] {
//
//    let uniqueSet = Set(array2)
//    let uniqueArray = Array(uniqueSet)
//    let removedDuplicates = removeDuplicates(array: array2)
//
//
//    let commArrayArray = removedDuplicates.filter{(a) -> Bool in
//        let filteredArray = arrayIp1.filter { $0 as! Int == a }
//        return filteredArray.count > 1
//    }
//    var missingElements = uniqueArray.filter{ !arrayIp1.contains($0 as! T)}
//    missingElements.append(contentsOf: commArrayArray)
//    let sortedArray = sortArray(array: missingElements)
//    return sortedArray as! [T]
//
//}
//func removeDuplicates<T: Equatable>(array: [T]) -> [T] {
//    return array.filter { item in array.firstIndex(of: item) == array.lastIndex(of: item) }
//}
//
//func elementExistsMultipleTimes<T: Equatable>(array: [T], element: T) -> Bool {
//    let filteredArray = array.filter { $0 == element }
//    return filteredArray.count > 1
//}
//func sortArray<T: Comparable>(array: [T]) -> [T] {
//
//    return array.sorted()
//}
//
//let finalOutPut = solve(arrayIp1: array1, arrayIp2: array2)
//problem
//Given two arrays, array1 and array2, find which elements in array2 are not present in array1.
//
//Notes
//
//If an element occurs multiple times in the lists, you must ensure that the frequency of that element in both lists is the same. If that is not the case, then it is also a missing element.
//Return the missing elements sorted ascending.
//Only include a missing element once, even if it is missing multiple times.
//Your code should be able to handle any type which can be equated (i.e., ==), sorted and (optionally) hashed. For example: numbers, strings, custom types, etc.
//Do not write an entire application or use multiple files. Write code which can be pasted together into a playground and run as is.
//You may have as many helper functions as you like, but you must have one main function called solve which takes the two arrays (of any conforming type!) as parameters and returns the expected result. You may not overload solve.
//While examples are given below for both Swift and Kotlin, write your code in the language of the job for which you are applying. Use these examples to test your code. They are correct.
//You may use any collection types you wish, as long as the answer is correct: List, Array, Set, etc. Whatever works. Thus, the (pseudocode) definition of your function could be solve(List, List) -> List or solve(Array, Set) -> List.
//Write type-safe code. Do not use metaprogramming, reflection, or types such as Any.
//Efficiency and speed are not important. Solving the problem correctly is important.
//Although solving the problem correctly is the most important consideration, the second most important are brevity and concision. Keep your solution as small as possible without sacrificing good style and clarity, but don't overthink it.
//Do the work yourself. We will be discussing your solution in your interview, so be prepared to explain it.
//Provide your solution as a Gist on GitHub and send the link to your interview contact at Patron so the engineering team can review it.
//Do not leave comments on this Gist. They will be deleted.

//solution
let array1 = [8, 8, 7, 2, 1, 7, 9]
let array2 = [14, 8, 2, 7, 7]
let array11 = [9, 4, 7, 9, 3]
let array22 = [9, 11, 9, 13, 9]
let array111 = ["goat", "fish", "deer", "goat", "bear"]
let array222 = ["ant", "bear", "goat"]
let list1 = ["yes", "yes", "no", "never"]
let list2 = ["yes", "no", "yes", "sometimes"]
func solve1<T : Equatable & Hashable & Comparable>(arrayIp1: [T],arrayIp2: [T]) -> [T] {
    let missingElements = arrayIp2.filter{(a) -> Bool in
      //find the count of repeated elements from the both arrays and checking if repeated element is present in both arrays and if it is not equal adding in to the new array
        if(arrayIp1.contains(a) && arrayIp1.duplicateCount(elementValue: a) != arrayIp2.duplicateCount(elementValue: a)){
            return true
        }else{
            //returning the unmatched array
            return !arrayIp1.contains(a)
        }
    }
    let finalSet = Set(missingElements)
    return Array(finalSet).sorted()
}
extension Array{
    func duplicateCount<T: Equatable>(elementValue:T) -> Int {
        let count = self.reduce(0) { result, current in
            return current as! T == elementValue ? result + 1 : result
        }
        return count
    }
}


let outputtttr = solve1(arrayIp1: array11, arrayIp2: array22)
print("outputtttr",outputtttr)
let outputttt = solve1(arrayIp1: array1, arrayIp2: array2)
print("outputttt",outputttt)
let stringOutputttt = solve1(arrayIp1: array111, arrayIp2: array222)
print("stringOutputttt",stringOutputttt)
let listOutputttt = solve1(arrayIp1: list1, arrayIp2: list2)
print("listOutputttt",listOutputttt);



