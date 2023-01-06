//
//  Episode.swift
//  buildNetflix
//
//  Created by Gabriel dos Santos on 26/12/22.
//

import Foundation

struct Episode: Identifiable {
    var id = UUID().uuidString
    var name: String
    var season: Int
    var episodeNumber: Int
    var description: String
    var length: Int
    var thumbnailImageURL: String
    var videoURL: URL
    
    var thumbnailURL: URL {
        return URL(string: thumbnailImageURL)!
    }
}
