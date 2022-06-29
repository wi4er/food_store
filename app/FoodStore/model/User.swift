//
//  User.swift
//  FoodStore
//
//  Created by Maxik on 27.03.2022.
//

import Foundation

struct User: Decodable {
    var _id: String
    
    var property: Dictionary<String, String>
    
    static func fromJson<T: Decodable>(_ json: String) -> T {
        guard let data = json.data(using: .utf8) else {
            fatalError("Couldn't parse json")
        }
        
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse json")
        }
    }
}
