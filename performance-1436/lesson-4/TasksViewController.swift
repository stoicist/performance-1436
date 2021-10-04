//
//  TasksViewController.swift
//  performance-1436
//
//  Created by Artur Igberdin on 27.09.2021.
//

import UIKit

class TasksViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //testTask1()
        
        //testTask2()
        
        //testTask3()
        
        //testTask4()
        
        //testTask5()
        
        testTask6()
    }
    
    func testTask1() {
        
        //По умолчанию - concurrent
        DispatchQueue.global().async {
            self.perform(#selector(self.sayHello), with: nil, afterDelay: 0.5)
            RunLoop.current.run() //EventQueue - очередь событий которые стоят на выполнение
        }
    }
    
    @objc
    func sayHello() {
        print("Hello")
    }
    

    func testTask2() {
        
        let queue = DispatchQueue(label: "com.imagedowloader") //Именованная dispatch-очередь - serial (последовательная)

        queue.async {
            print("1")
            queue.sync { //На последовательной очереди ставим задачу sync - deadlock
                print("2")
            }
        }
        
    }
    
    func testTask3() {
        
        DispatchQueue.global().async {
            print("1")
            DispatchQueue.global().sync {
                print("2")
                DispatchQueue.global().async {
                    print("3")
                }
                print("4")
            }
            print("5")
        }
        print("6")
    }
    
    func testTask4() {
        
        print("A")

           DispatchQueue.main.async {
               print("B")
               DispatchQueue.main.async {
                   print("C")
               }
               DispatchQueue.main.async {
                   print("D")
               }
               DispatchQueue.global().sync {
                   print ("E")
               }
           }
           print("F")
           DispatchQueue.main.async {
               print("G")
           }
    }
    
    func testTask5() {
        print("A")
           
           DispatchQueue.main.async {
               print("B")
               
               DispatchQueue.main.async {
                   print("С")
                   
                   DispatchQueue.main.async {
                       print("D")
                       
                       DispatchQueue.main.async {
                              print("E")
                       }
                   }
               }
               
               DispatchQueue.global().sync {
                   print("F")
                   
                   DispatchQueue.main.sync {
                       print("G") //Последовательная очередь ставит задачу синхронно
                   }
               }
               print("H")
           }
           print("I")
    }
    
    func testTask6() {
        
            print("A")
            
            DispatchQueue.main.async {
                print("B")
                
                DispatchQueue.main.async {
                    print("С")
                    
                    DispatchQueue.main.async {
                        print("D")
                        
                        DispatchQueue.main.async {
                               print("E")
                        }
                    }
                }
                
                DispatchQueue.global().sync {
                    print("F")
                    
                    DispatchQueue.global().sync {
                        print("G")
                    }
                }
                print("H")
            }
            
            print("I")
        }
    

}
