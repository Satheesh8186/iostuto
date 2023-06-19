//: [Previous](@previous)

import Foundation

class Node<T> {
    var value : T
    var next : Node<T>?
    init(value: T) {
        self.value = value
    }
}
class LinkedList<T>{
    var head : Node<T>?
    
    func append(value:T)  {
        let newNode = Node(value: value)
        //check if the list is empty if empty new node will add
        if(head == nil){
            print("new node added to empty list")
            head = newNode
        }else{
            var currentNode = head
            //this will check if the current node has next if it has next it will move to next node
            while currentNode?.next != nil{
                print("current node has next")
                currentNode = currentNode?.next
            }
            //if current node doesnt have next then it will add the newnode
            print("add new node to list")
            currentNode?.next = newNode
        }
    }
    func insert(value:T,at index : Int){
        let newNode = Node(value: value)
        //check if the list is empty if empty it inserts at zero
        if(index == 0){
            print("inserted at zero potion")
            newNode.next = head
            head = newNode
        }else if(index > 0){
            var currentNode = head
            var currentIndex = 0
            while currentIndex < index - 1  && currentNode != nil {
                currentNode = currentNode?.next
                currentIndex += 1
            }
            
            if(currentNode != nil){
                newNode.next = currentNode?.next
                currentNode?.next = newNode
            }
        }
    }
    func remove(at index:Int)  {
        if(index == 0){
            head = head?.next
        } else if index > 0 {
                var currentNode = head
                var currentIndex = 0
                
                while currentIndex < index - 1 && currentNode != nil {
                    currentNode = currentNode?.next
                    currentIndex += 1
                }
                
                currentNode?.next = currentNode?.next?.next
            }
    }
}
let linkedList = LinkedList<Int>()

linkedList.append(value: 10)
linkedList.append(value: 20)
linkedList.append(value: 30)
linkedList.append(value: 40)
linkedList.append(value: 50)
linkedList.insert(value: 510, at: 3)
linkedList.remove(at: 4)
var currentNode = linkedList.head
while currentNode != nil {
    print(currentNode!.value)
    print(currentNode!)
    currentNode = currentNode?.next
}
//
//print("already 3 values appended")
//linkedList.append(value: 40)
