//
//  TopMoviePreview.swift
//  buildNetflix
//
//  Created by Gabriel dos Santos on 20/12/22.
//

import SwiftUI
import Kingfisher

struct TopMoviePreview: View {
    var movie: Movie
    
    @Binding var movieDetailToShow: Movie?
    
    func isFirstCategory(_ cat: String) -> Bool {
        let index = movie.categories.firstIndex(of: cat)
        return index == 0
    }
    
    var body: some View {
        ZStack {
            KFImage(movie.thumbnailURL)
                .resizable()
                .scaledToFill()
                .clipped()
                
            
            VStack {
                Spacer()
                
                HStack(alignment: .center) {
                    Image(movie.previewImageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 80)
                        .padding(.horizontal, 20)
                }
                
                HStack {
                    ForEach(movie.categories, id: \.self) {
                        category in HStack {
                            if !isFirstCategory(category) {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(movie.accentColor)
                                    .font(.system(size: 3))
                            }
                            Text(category)
                                .font(.footnote)
                        }
                    }
                }

                HStack {
                    Spacer()
                    
                    SmallVerticalButton(text: "My List", isOnImage: "checkmark", isOffImage: "plus", isOn: true) {}
                    
                    Spacer()
                    
                    PlayButton(text: "Play", imageName: "play.fill") {
                        movieDetailToShow = movie
                    }
                    .frame(width: 120)
                    
                    Spacer()
                    
                    SmallVerticalButton(text: "Info", isOnImage: "info.circle", isOffImage: "info.circle", isOn: true) {}
                    
                    Spacer()
                }
                .padding(.vertical, 14)
            }
            .background(
                LinearGradient.blackOpacityGradient
                    .padding(.top, 250)
            )
        }
        .foregroundColor(.white)
    }
}

struct TopMoviePreview_Previews: PreviewProvider {
    static var previews: some View {
        TopMoviePreview(movie: exampleMovie1, movieDetailToShow: .constant(nil))
    }
}
