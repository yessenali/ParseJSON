//
//  Model.swift
//  ParsingJSON
//
//  Created by Yessenali Zhanaidar on 16.05.2022.
//

import Foundation

struct Model: Decodable {
    let id: Int
    let name: String
    let date: Date
    let link: String
    let myImage: String?
    let comments: [Comment]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case date
        case link
        case comments
        case myImage = "image"
    }
}

struct Comment: Decodable {
    let id: Int
    let text: String
    let date: Date
    let user: User
}

struct User: Decodable {
    let id: Int
    let name: String
    let gender: Gender
}

enum Gender: String, Decodable {
    case male
    case female
}
