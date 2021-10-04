//
//  PromisePatternViewController.swift
//  performance-1436
//
//  Created by Artur Igberdin on 04.10.2021.
//

//import UIKit
//
//struct Weather {}
//
//class PromisePatternViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        
//        //1
////        let promise = fetchWeatherData()
////        promise.add { result in
////
////            switch result {
////            case .success(let data): print(data)
////            case .failure(let error): print(error.localizedDescription)
////            }
////        }
//        
//        //2
//        authorize(with: "test@test.com", password: "qwerty1234556")
//            .flatMap { token -> Future<Data> in
//                return self.fetchWeather(city: "Kazan", token: token)
//            }
//            .map { data -> [Weather] in
//                return self.parse(data)
//            }
//            .add { result in
//                switch result {
//                case .success(let weathers): print(weathers)
//                    //UI
//                case .failure(let error): print(error)
//                }
//            }
//        
//        
//    }
//    
//    func authorize(with email: String, password: String) -> Promise<String> {
//
//        let promise = Promise<String>()
//        
//        //Запрос -> Токен
//        DispatchQueue.global().async {
//            promise.fulfill(with: "234sdfw34234sdfsdf32r2342sdfsdf")
//        }
//        return promise
//    }
//    
//    func fetchWeather(city: String, token: String) -> Promise<Data> {
//
//        let promise = Promise<Data>()
//        DispatchQueue.global().async {
//            promise.fulfill(with: Data())
//        }
//        return promise
//    }
//    
//    func parse(_ data: Data) -> [Weather] {
//        return [Weather(), Weather()]
//    }
//    
//    
//    
////    //1
////    func fetchWeatherData() -> Promise<Data> {
////           // Создаем исходный промис, который будет возвращать
////           // Future<Data>, содержащую информацию о прогнозах погоды
////
////           let promise = Promise<Data>()
////
////           let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?q=Moscow&units=metric&appId=8b32f5f2dc7dbd5254ac73d984baf944")!
////
////           // Выполняем стандартный сетевой запрос
////           URLSession.shared.dataTask(with: url) { data, _, error in
////               // И в completion выполняем или нарушаем обещание
////               if let error = error {
////                   promise.reject(with: error)
////               } else {
////                   promise.fulfill(with: data ?? Data())
////               }
////           }.resume()
////           return promise
////       }


//}
