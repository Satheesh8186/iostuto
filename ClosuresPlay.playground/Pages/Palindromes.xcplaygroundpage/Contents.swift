//: [Previous](@previous)

import Foundation

let inputValue: String = "madam"

func isPalinDromes(word:String) -> Bool{
    let wordArray = Array(word)
    var currentIndex = 0
    while currentIndex < wordArray.count/2 {
        if(wordArray[currentIndex] != wordArray[wordArray.count - 1 - currentIndex] ){
          return false
        }
        currentIndex += 1
    }

    return true
}

isPalinDromes(word:inputValue)
