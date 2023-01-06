//
//  CommingSoonVM.swift
//  buildNetflix
//
//  Created by Gabriel dos Santos on 04/01/23.
//

import Foundation


class CommingSoonVM: ObservableObject {
    @Published var movies: [Movie] = []
    
    init() {
        self.movies = generateMovies(20)
    }
}
