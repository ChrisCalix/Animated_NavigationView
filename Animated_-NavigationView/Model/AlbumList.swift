//
//  AlbumList.swift
//  Animated_-NavigationView
//
//  Created by Sonic on 30/4/23.
//

import Foundation

struct AlbumList: Decodable {
    
    let albums: [Album]
}

struct Album: Decodable {
    
    typealias Year = Int
    
    let name: String
    let songs: [Song]
    let releaseYear: Year
    let coverImage: String
}
