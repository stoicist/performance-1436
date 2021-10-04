//
//  PromiseKitViewController.swift
//  performance-1436
//
//  Created by Artur Igberdin on 04.10.2021.
//

import UIKit
import Alamofire
import PromiseKit



class PromiseKitViewController: UIViewController {

    let postService = PostService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        postService.getAllUsers()
            .then { [weak self] users -> Promise<[Post]> in

                let user = users.first
                return self!.postService.getPosts(for: user?.id ?? 0)
             }
            .then { [weak self] posts -> Promise<[Post]> in

                return self!.postService.getPosts(for: 3)
            }
            .done { posts in
                print("done = ", posts)
                //UI
            }
            .catch { error in
                print(error)
            }
     
    }
}


