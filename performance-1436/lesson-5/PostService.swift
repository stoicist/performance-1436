//
//  PostService.swift
//  performance-1436
//
//  Created by Artur Igberdin on 04.10.2021.
//

import Foundation
import PromiseKit
import Alamofire

class PostService {
    
    
    func getAllUsers() -> Promise<[User]> {
        
        let (promise, resolver) = Promise<[User]>.pending()
        
        let url = "https://jsonplaceholder.typicode.com/users"
        
        AF.request(url).responseJSON { response in
            
            if let error = response.error {
                resolver.reject(error)
            }
            
            if let data = response.data {
                do {
                    let users = try JSONDecoder().decode([User].self, from: data)
                    resolver.fulfill(users)
                } catch {
                    resolver.reject(ApplicationError.noUsers)
                }
            }
        }
        return promise
    }

    func getPosts(for userId: Int) -> Promise<[Post]> {
        
        let (promise, resolver) = Promise<[Post]>.pending()
        
        let url = "https://jsonplaceholder.typicode.com/posts"
        
        AF.request(url).responseJSON { response in
            
            if let error = response.error {
                resolver.reject(error)
            }
            
            if let data = response.data {
                do {
                    let posts = try JSONDecoder().decode([Post].self, from: data)
                    resolver.fulfill(posts)
                    
                } catch {
                    resolver.reject(ApplicationError.noPosts)
                }
            }
        }
        return promise
    }
    
}
