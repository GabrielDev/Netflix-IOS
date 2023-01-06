//
//  CommingSoonRow.swift
//  buildNetflix
//
//  Created by Gabriel dos Santos on 04/01/23.
//

import SwiftUI
import Kingfisher
import AVKit

struct CommingSoonRow: View {
    var movie: Movie
    
    @Binding var movieDetailToShow: Movie?
    
    let screen = UIScreen.main.bounds
    
    var player: AVPlayer {
        AVPlayer(url: exampleVideoURL)
    }
    
    var body: some View {
        VStack {
            VideoPlayer(player: player)
                .frame(height: 200)
            
            VStack {
                HStack {
                    KFImage(movie.thumbnailURL)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: screen.size.width / 3, height: 75)
                        .clipped()
                        
                    Spacer()
                    
                    Button(action: {}, label: {
                        VStack(spacing: 6) {
                            Image(systemName: "bell")
                                .font(.title3)
                            
                            Text("Remind Me")
                        }
                    })
                    .padding(.horizontal)
                    
                    Button(action: {
                        movieDetailToShow = movie
                    }, label: {
                        VStack(spacing: 6) {
                            Image(systemName: "info.circle")
                                .font(.title3)
                            
                            Text("Info")
                        }
                    })
                    .padding(.trailing, 24)
                }
                .font(.caption)
                
                VStack(alignment: .leading) {
                    Text(movie.name)
                        .font(.title2)
                        .bold()
                    
                    Text(movie.episodeDescriptionDisplay)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                }
            }
            .foregroundColor(.white)
            .padding(.horizontal)
        }
    }
}

struct CommingSoonRow_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            CommingSoonRow(movie: exampleMovie1, movieDetailToShow: .constant(nil))
        }
    }
}
