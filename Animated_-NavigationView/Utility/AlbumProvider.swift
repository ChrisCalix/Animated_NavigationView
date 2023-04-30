//
//  AlbumProvider.swift
//  Animated_-NavigationView
//
//  Created by Sonic on 30/4/23.
//

import Foundation

final class AlbumProvider {
    
    func getAllAlbums() -> [Album] {
        
        guard
            let url = Bundle.main.url(forResource: "Data", withExtension: "json"),
            let jsonData = try? Data(contentsOf: url),
            let albumList = try? JSONDecoder().decode(AlbumList.self, from: jsonData)
        else { return [] }
        
        return albumList.albums
    }
}
