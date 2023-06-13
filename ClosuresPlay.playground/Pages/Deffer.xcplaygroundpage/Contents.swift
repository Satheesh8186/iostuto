//: [Previous](@previous)

import Foundation

func deffer()-> String {
    print("function beign")
    defer {
        print("deffer excetution")
    }
    print("function End")
    return "edwewsd"
}
deffer()
class MyClass {
    var completionHandler: (() -> Void)?
    
    func performTask() {
//        completionHandler = { [unowned self] in
//            // Access self safely, assuming self will always exist
//            self.doSomething()
//        }
        
        // Or use [weak self] instead
         completionHandler = { [weak self] in
             // Safely access self with optional chaining
             self?.doSomething()
         }
        
        // Perform the task
        completionHandler?()
    }
    
    func doSomething() {
        print("Task completed.")
    }
}

// Usage
let obj = MyClass()
obj.performTask()
