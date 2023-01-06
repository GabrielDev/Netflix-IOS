//
//  Movie.swift
//  buildNetflix
//
//  Created by Gabriel dos Santos on 19/12/22.
//

import Foundation
import SwiftUI

struct Movie: Identifiable {
    var id: String
    var name: String
    var thumbnailURL: URL
    var categories: [String]
    var genre: HomeGenre = .AllGenres
    var year: Int
    var rating: String
    var promotionHeadline: String?
    var currentEpisode: CurrentEpisodeInfomation?
    var accentColor: Color? = .white
    var defaultEpisodeInfo: CurrentEpisodeInfomation
    var creators: String
    var cast: String
    var previewImageName: String
    var previewVideoURL: URL?
    var trailers: [Trailer]
    var moreLikeThis: [Movie]
    var movieType: MovieType {
        return episodes == nil ? .movie : .tvShow
    }
    var episodes: [Episode]?
    var numberOfSeasons: Int?
    var numberOfSeasonsDisplay: String {
        if let num = numberOfSeasons {
            if num == 1 {
                return "1 season"
            } else {
                return "\(num) seasons"
            }
        }
        
        return ""
    }
    
    var episodeInfoDisplay: String {
        if let current = currentEpisode {
            return "S\(current.season):E\(current.episode) \(current.episodeName)"
        } else {
            return "S\(defaultEpisodeInfo.season):E\(defaultEpisodeInfo.episode) \(defaultEpisodeInfo.episodeName)"
        }
    }
    
    var episodeDescriptionDisplay: String {
        if let current = currentEpisode {
            return current.description
        } else {
            return defaultEpisodeInfo.description
        }
    }
}

struct CurrentEpisodeInfomation: Hashable, Equatable {
    var episodeName: String
    var description: String
    var season: Int
    var episode: Int
}

enum MovieType {
    case movie
    case tvShow
}
