//
//  GCDViewController.swift
//  performance-1436
//
//  Created by Artur Igberdin on 20.09.2021.
//

import UIKit

class GCDViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
        //test1() //сравнение параллельного выполнения на main-очереди и global-очереди
        
        //test2() //проверка приоритетов
        
        //test3() //проверка main-очереди на то что она последовательная (serial)
        
        //test4() //проверка global-очереди на то что она паралельная (concurrent)
        
        //test5() //sync задача на global-очереди ставиться на main-поток
        
        test6() //пользовательская очередь которая является последовательной но можно сделать concurrent
        
    }
    
    func test6() {
        let myQueue = DispatchQueue(label: "myQueue")
        
        myQueue.async {
            for _ in (0..<1000) {
                print("😈")
            }
            print(Thread.current)
        }
        
        myQueue.async {
            for _ in (0..<1000) {
                print("😇")
            }
            print(Thread.current)
        }
    }
    
    func test5() {
        
        DispatchQueue.global().sync {
            print(Thread.current)
            print("😈")
        }
           
        print(Thread.current)
        print("😇")
    }
    
    func test4() {
        DispatchQueue.global().async {
            print("H")
            print(Thread.current)
        }
        DispatchQueue.global().async {
            sleep(1)
            print("e")
            print(Thread.current)
        }
        DispatchQueue.global().async {
            print("l")
            print(Thread.current)
        }
        DispatchQueue.global().async {
            print("l")
            print(Thread.current)
        }
        DispatchQueue.global().async {
            
            sleep(1) //усыпить на 1 секунду
            print("o")
            print(Thread.current)
            
        }
    }
    
    func test3() {
        DispatchQueue.main.async { print("H") }
        DispatchQueue.main.async { print("e") }
        DispatchQueue.main.async { print("l") }
        DispatchQueue.main.async { print("l") }
        DispatchQueue.main.async { print("o") }
    }
    
    func test2() {
        
        DispatchQueue.main.async {
            for _ in (0..<10) {
                print("😈")
            }
        }
        
        DispatchQueue.global(qos: .userInteractive).async {
            for _ in (0..<10) {
                print("😇")
            }
        }

        DispatchQueue.global(qos: .userInitiated).async {
            for _ in (0..<10) {
                print("👻")
            }
        }

        DispatchQueue.global(qos: .utility).async {
            for _ in (0..<10) {
                print("👽")
            }
        }
    }
    
    func test1() {
        
        DispatchQueue.main.async {
            for _ in (0..<10000) {
                print("😈")
            }
        }
        
        DispatchQueue.global(qos: .userInteractive).async {
            for _ in (0..<10000) {
                print("😇")
            }
        }
    }



}
