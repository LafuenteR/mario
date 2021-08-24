//
//  GlobalVariable.swift
//  mario
//
//  Created by Ruel Lafuente on 8/23/21.
//

import Foundation

struct GlobalVariable {
    static var apiUrl = "https://www.amiiboapi.com/api/amiibo/"
    static var googleUrl = "https://www.google.com/search?q="
    static var webControllerTitle = "Series Description"
    static var fullImage = "Full Image"
}

struct GameList: Codable {
    var amiibo = [Game]()
}

struct Game: Codable {
    var name: String
    var gameSeries: String
    var image: String
}
