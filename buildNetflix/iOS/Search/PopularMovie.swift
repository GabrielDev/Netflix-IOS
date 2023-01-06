//
//  PopularMovie.swift
//  buildNetflix
//
//  Created by Gabriel dos Santos on 04/01/23.
//

import SwiftUI
import Kingfisher

struct PopularMovie: View {
    var movie: Movie
    
    @Binding var movieDetailToShow: Movie?
    
    var body: some View {
        GeometryReader { proxy in
            HStack {
                KFImage(movie.thumbnailURL)
                    .resizable()
                    .frame(width: proxy.size.width / 3)
                    .padding(.leading, 3)
                
                Text(movie.name)
                
                Spacer()
                
                Button(action: {}, label: {
                    Image(systemName: "arrowtriangle.right.fill")
                })
                .padding(.trailing, 20)
            }
            .foregroundColor(.white)
            .onTapGesture(perform: {
                self.movieDetailToShow = movie
            })
        }
    }
}

struct PopularMovie_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            PopularMovie(movie: exampleMovie1, movieDetailToShow: .constant(nil))
                .frame(height: 75)
        }
    }
}
