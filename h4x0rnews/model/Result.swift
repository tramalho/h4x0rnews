//
//  Result.swift
//  h4x0rnews
//
//  Created by Thiago Antonio Ramalho on 12/10/21.
//

import Foundation

struct ResultData:Codable {
    
    let hits: [Post]
}

struct Post: Codable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let title: String
    let url: String?
    let points:Int
}
