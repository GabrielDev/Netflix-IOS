//
//  PreviewList.swift
//  buildNetflix
//
//  Created by Gabriel dos Santos on 05/01/23.
//

import SwiftUI

struct PreviewList: View {
    var movies: [Movie]
    
    @Binding var currentSelection: Int
    
    @Binding var isVisible: Bool
    
    @State private var currentTransition: CGFloat = .zero
    
    let externalDragGesture: _EndedGesture<_ChangedGesture<DragGesture>>
    
    let screen = UIScreen.main.bounds
    
    func shouldPlayVideo(index: Int) -> Bool {
        return isVisible ? index == currentSelection : false
    }
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            PagerView(
                pageCount: movies.count,
                currentIndex: $currentSelection,
                translation: $currentTransition,
                externalDragGesture: externalDragGesture
            ) {
                    ForEach(0..<movies.count) { index in
                        let movie = movies[index]
                        
                        PreviewView(
                            vm: PreviewVM(movie: movie),
                            playVideo: shouldPlayVideo(index: index)
                        )
                        .frame(width: screen.width)
                    }
                }
                .frame(width: screen.width)
        }
    }
}

struct ExamplePreviewList: View {
    @State private var currentSelection = 0
    @State private var isVisible = true

    var body: some View {
        let externalDragGesture = DragGesture()
            .onChanged { value in }
            .onEnded { value in }
        
        PreviewList(
            movies: exampleMovies,
            currentSelection: $currentSelection,
            isVisible: $isVisible,
            externalDragGesture: externalDragGesture
        )
    }
}

struct PreviewList_Previews: PreviewProvider {
    static var previews: some View {
        ExamplePreviewList()
    }
}
