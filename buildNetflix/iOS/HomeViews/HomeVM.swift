//
//  HomeVM.swift
//  buildNetflix
//
//  Created by Gabriel dos Santos on 19/12/22.
//

import Foundation

class HomeVM: ObservableObject {
    
    @Published var movies: [String: [Movie]] = [:]
    
    public var allCategories: [String] {
        movies.keys.map({ String($0) })
    }
    
    init() {
        setupMovies()
    }
    
    func setupMovies() {
        movies["Trending Now"] = exampleMovies
        movies["Stand-Up Commedy"] = exampleMovies.shuffled()
        movies["New Releases"] = exampleMovies.shuffled()
        movies["Watch It Again"] = exampleMovies.shuffled()
        movies["Sci-fi"] = exampleMovies.shuffled()
    }
    
    func getMovie(forCat category: String, andHomeRow homeRow: HomeTopRow, andGenre genre: HomeGenre) -> [Movie] {
        var filteredMovies = (movies[category] ?? [])
        
        if genre != .AllGenres {
            filteredMovies = filteredMovies.filter({ $0.genre == genre })
        }
        
        if homeRow == .movies {
            return filteredMovies.filter({ $0.movieType == .movie })
        }
        
        if homeRow == .tvShows {
            return filteredMovies.filter({ $0.movieType == .tvShow })
        }
        
        return filteredMovies
    }
}
