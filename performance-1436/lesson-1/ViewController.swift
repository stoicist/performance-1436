//
//  ViewController.swift
//  performance-1436
//
//  Created by Artur Igberdin on 16.09.2021.
//

import UIKit

class ThreadprintDemon: Thread {
    override func main() {
        for _ in (0..<100) {
            print("😈")
        }
    }
}
class ThreadprintAngel: Thread {
    override func main() {
        for _ in (0..<100) {
            print("😇")
        }
    }
}

class TimeThread: Thread {
    override func main() {
        
        
        // Настраиваем таймер
        Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) { timer in
            print("Tick")
        }
        
        // Запускаем петлю
        RunLoop.current.run()
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //memoryLeak()
        //fixMemoryLeakWithAutoreleasepool()
        
        //asyncTaskWithTimer()
        
        //syncTaskOnMainThread()
        
        //parallelTaskOnBackgroundThread()
        
        //parallelTaskOnBackgroundThread2()
        
        //threadsWithQos()
        
        timerTaskOnBackgroundTreadWithoutRunLoop()
    }
    
    func timerTaskOnBackgroundTreadWithoutRunLoop() {
        
        let thread = TimeThread()
        thread.start()
    }
    
    func threadsWithQos() {
        
        //фоновые потоки
        let thread1 = ThreadprintDemon()
        let thread2 = ThreadprintAngel()
                
        thread1.qualityOfService = .userInteractive
        thread2.qualityOfService = .userInteractive
                
        thread1.start()
        thread2.start()
    }
    
    func parallelTaskOnBackgroundThread() {
        
        let thread1 = Thread {
            for _ in (0..<10) {
            print("😈")
            }
        }
                
        thread1.start()
                
        for _ in (0..<10) {
            print("😇")
        }
    }
    
    func parallelTaskOnBackgroundThread2() {
        
        Thread.detachNewThread {
            for _ in (0..<1000) {
            print("😈")
            }
        }
                
        for _ in (0..<1000) {
            print("😇")
        }
    }
    
    func syncTaskOnMainThread() {
        
        for _ in (0..<100) {
          print("😈")
        }
                
        for _ in (0..<100) {
            print("😇")
        }
    }
    
    func asyncTaskWithTimer() {
        
        Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) { timer in
            print(Date())
        }
    }
    
    func fixMemoryLeakWithAutoreleasepool() {
        
        print("start test")
        for index in 0...UInt.max {
            
            autoreleasepool {
                let string = NSString(format: "test + %d", index)
                print(string)
            }
        }
        print("end test")
    }
    
    func memoryLeak() {
        
        print("start test")
        for index in 0...UInt.max {
            let string = NSString(format: "test + %d", index)
            print(string)
        }
        print("end test")
        
    }


}

