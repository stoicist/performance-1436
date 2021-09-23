//
//  OperationQueueViewController.swift
//  performance-1436
//
//  Created by Artur Igberdin on 23.09.2021.
//

import UIKit

class OperationQueueViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //startAsyncOperationFinishMain()
        
        //concurrentOperationInOperationQueue()
        
        dependencyOperations()
    }
    
    func dependencyOperations() {
        
        let queue = OperationQueue.main
        
        //BlockOperation - синхронная задача
        let operation1 = BlockOperation() {
            for i in 0..<10 {
                print("🤠\(i)")
                self.printThread()
            }
        }
        
        let operation2 = BlockOperation() {
            for i in 0..<10 {
                print("🤡\(i)")
                self.printThread()
            }
        }
        
        let operation3 = BlockOperation() {
            for i in 0..<10 {
                print("🤖\(i)")
                self.printThread()
            }
        }
        
        let finalOperation = BlockOperation() {
            print("All operations completed!")
            
            for i in 0..<10 {
                print("🎃\(i)")
                self.printThread()
            }
            
            self.printThread()
        }
        
        operation2.addDependency(operation1)
        operation3.addDependency(operation2)
        finalOperation.addDependency(operation3)
        
        let operations = [
            finalOperation,
            operation3,
            operation1,
            operation2
        ]
        
        queue.addOperations(operations, waitUntilFinished: false)
        
    }
    
    func concurrentOperationInOperationQueue() {
        
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = 1 // можем сделать последовательной
        
        queue.addOperation {
            for i in 0..<10 {
                print("🤠\(i)")
                self.printThread()
            }
        }
        
        queue.addOperation {
            for i in 0..<10 {
                print("🤡\(i)")
                self.printThread()
            }
        }
        
        queue.addOperation {
            for i in 0..<10 {
                print("🤖\(i)")
                self.printThread()
            }
        }
        
    }
    
    func startAsyncOperationFinishMain() {
        
        DispatchQueue.global().async {
            
            //Processing
            DispatchQueue.main.async {
                
                //UI
            }
        }
        
        
        let queue = OperationQueue()
        
        queue.addOperation {
            print("1")
            self.printThread()
            
            OperationQueue.main.addOperation {
                print("This is main thread")
                self.printThread()
                
            }
        }
    }
    
    func printThread() {
        print("Is main Thread: \(Thread.isMainThread)")
        print(Thread.current)
    }
    
    

   

}
