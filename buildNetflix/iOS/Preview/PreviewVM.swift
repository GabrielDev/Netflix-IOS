//
//  PreviewVM.swift
//  buildNetflix
//
//  Created by Gabriel dos Santos on 05/01/23.
//

import Foundation

class PreviewVM: ObservableObject {
    
    var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
}
