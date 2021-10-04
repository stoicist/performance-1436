//
//  Post.swift
//  performance-1436
//
//  Created by Artur Igberdin on 04.10.2021.
//

import Foundation

struct User: Codable {
    let id: Int
    let name: String
    let username: String
    let email: String
}

struct Post: Codable {
    let id: Int
    let userId: Int
    let title: String
    let body: String
}

enum ApplicationError: Error {
    case noUsers
    case noPosts
    case postsCouldNotBeParsed
}
