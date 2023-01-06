//
//  SearchVM.swift
//  buildNetflix
//
//  Created by Gabriel dos Santos on 04/01/23.
//

import Foundation
import SwiftUI

class SearchVM: ObservableObject {
    
    @Published var isLoading: Bool = false
    
    @Published var viewState: ViewState = .ready
    
    @Published var popularMovies: [Movie] = []
    
    @Published var searchResult: [Movie] = []
    
    @Published var isShowingPopularMovies = true
    
    init() {
        getPopularMovies()
    }
    
    public func updateSearchText(with text: String) {
        setViewState(to: .loading)
        
        if text.count > 0 {
            isShowingPopularMovies = false
            getSearchResults(forText: text)
        } else {
            isShowingPopularMovies = true
        }
    }
    
    public func setViewState(to state: ViewState) {
        DispatchQueue.main.async {
            self.viewState = state
            self.isLoading = state == .loading
        }
    }
    
    private func getPopularMovies() {
        self.popularMovies = generateMovies(40)
    }
    
    private func getSearchResults(forText text: String) {
        let haveResult = Int.random(in: 0...3)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            if haveResult == 0 {
                self.searchResult = []
                self.setViewState(to: .empty)
            } else {
                let movies = generateMovies(21)
                self.searchResult = movies
                self.setViewState(to: .ready)
            }
        }
    }
}


enum ViewState {
    case empty
    case loading
    case ready
    case error
}
