//
//  Content.swift
//  FoodStore
//
//  Created by Maxik on 25.06.2022.
//

import Foundation

struct ContentUniq: Decodable {
    var uniq: String
    var value: String
}

struct ContentImage: Decodable {
    var url: String
}

struct Content: Decodable, Identifiable {
    var id: String { _id }
    var slug: String {
        uniq?.first(
            where: { uniq in uniq.uniq == "SLUG" }
        )?.value ?? ""
    }
    var name: String {
        property?["DEF"]?["NAME"] ?? ""
    }
    var previewImage: String {
        image?["PREVIEW"]?[0].url ?? ""
    }
    
    
    var _id: String
    var tiemstamp: String
    var created: String
    var uniq: [ContentUniq]? = nil
    var image: Dictionary<String, [ContentImage]>? = nil
    var property: Dictionary<String, Dictionary<String, String>>? = nil
}
