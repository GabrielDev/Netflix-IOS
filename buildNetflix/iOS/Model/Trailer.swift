//
//  Trailer.swift
//  buildNetflix
//
//  Created by Gabriel dos Santos on 27/12/22.
//

import Foundation

struct Trailer: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var name: String
    var videoURL: URL
    var thumbnailImageURL: URL
}
