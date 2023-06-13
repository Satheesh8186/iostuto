//: [Previous](@previous)

import Foundation

//two sum problem: Given an array of integer num and an integer taget,return the
let  numbs=[2,7,11,15,5,3]
let target = 20
//o/p:[3,4]

func addTwoNumberInArray(_ numbs : [Int], target:Int) -> [Int]{
    var dictor = [Int:Int]()
    for (index,value) in numbs.enumerated() {
        if let oneIndex = dictor[target - value], oneIndex != index{
          return [oneIndex,index]
        }
        dictor[value] = index
    }
    return []
}
let vallll = addTwoNumberInArray(numbs,target:20);
print("vallll...",vallll);


//find the fibanaic series at give number number = 10  1,1,2,3,5,8,13,21

func fibnaicSeriesAtGivenNumber(numb : Int)->Int{
    if numb < 2 {
        return numb
    }
    var firstNumber = 1
    var seconDNumber = 1
    var val = 0
    for _ in 2...numb {
        val = firstNumber + seconDNumber
        firstNumber = seconDNumber
        seconDNumber = val
    }
    return val
}
fibnaicSeriesAtGivenNumber(numb: 5);

//Most common elements in array
var colorArray = ["red", "green", "green", "black", "blue", "yellow", "red", "green", "yellow", "red", "red", "green", "green", "grey", "purple", "orange", "grey", "blue", "red", "green", "yellow", "orange", "purple", "black", "red", "blue", "green", "orange", "blue", "white", "yellow", "blue", "red", "green", "orange", "purple", "blue", "black"]

func getMostColours(colourArray:[String]) -> [String]{
    
    //first create a dict from array
    var topColor = [String]()
    var colorDict = [String:Int]()
    
    for colour in colourArray{
        if let count = colorDict[colour]{
           colorDict[colour] = count + 1
        }else{
            colorDict[colour] = 1
        }
    }

    let highestNumber = colorDict.values.max()
    for (color, _) in colorDict {
            if colorDict[color] == highestNumber {
                topColor.append(color)
            }
        }
        
        return topColor
    
}
getMostColours(colourArray: colorArray)

//find the second heighest number in an array

func secondHighestNumber(inputArry:[Int]) -> Int {
    var firstHighetNumber = 0
    var seconHighetnumber = 0
    for number in inputArry{
        if(number > firstHighetNumber){
            seconHighetnumber = firstHighetNumber
            firstHighetNumber = number
        }
    }
    return seconHighetnumber
}
secondHighestNumber(inputArry: arrayObj)

//find the second heighest number in an string

func secondHighestNumberInString(inputString:String) -> Int {
    
    var intObjArr : [Int] = []
    for cha in inputString{
        if(cha.isNumber){
            if let number = Int(String(cha)){
                intObjArr.append(number)
            }
            
        }
    }
    return secondHighestNumber(inputArry: intObjArr.sorted())
}

secondHighestNumberInString(inputString: "f2hbhb232b7737267632")

//Binary search or find the give value is present in the array
//steps
//step:1 check if array count is graterthan 0 else retun false
//step:2 sort the give array
//step:3 get the first and last index of the array
//step:4 run while loop till the first index is grater than second index
//step:5 divide array in half
//searchNumber > midIndex then move first index to middle
//searchNumber < midIndex then move last index to middle
var arrayObj = [1,2,3,23,56,67,647,87,54,99,23]
func binarySearch(inputArray: inout [Int],searchNumber:Int) -> Bool {
    if inputArray.count < 0 {
        return false
    }
    inputArray.sort()
    var firstIndex = 0
    var lastIndex = inputArray.count - 1
    while firstIndex <= lastIndex {
        let midIndex = (firstIndex+lastIndex)/2
        if(inputArray[midIndex] == searchNumber){
            return true
        }else if(searchNumber > midIndex){
            firstIndex = midIndex + 1
        }else{
            lastIndex = midIndex - 1
        }
        
    }
    return false
}
binarySearch(inputArray:&arrayObj,searchNumber:55)

//sorting alogorith ->quick sort
//-> create three arrays greater array,equal array,lessArray
//-> in for loop take pivot i.e one refrence value from index and compare  and appden the values to respected arrays
//-> call dame method again
func quickSort(arrayInput:[Int]) -> [Int]{
    var graterArray = [Int]()
    var equalArray = [Int]()
    var lessArray = [Int]()
    if(arrayInput.count > 1){
        for element in arrayInput{
            let pivot = arrayInput[0]
            if(element > pivot){
                graterArray.append(element)
            }else if(element < pivot){
                lessArray.append(element)
            }else{
                equalArray.append(element)
            }
        }
        return (quickSort(arrayInput: lessArray)+equalArray+quickSort(arrayInput: graterArray))
    }else{
        return arrayInput
    }
}
quickSort(arrayInput: arrayObj)


//merge sort
//https://www.youtube.com/watch?v=DfO089qWEE8,https://www.youtube.com/watch?v=CLXS1XoihJI

