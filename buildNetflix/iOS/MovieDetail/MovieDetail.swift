//
//  MovieDetail.swift
//  buildNetflix
//
//  Created by Gabriel dos Santos on 26/12/22.
//

import SwiftUI

struct MovieDetail: View {
    var movie: Movie
    
    let screen = UIScreen.main.bounds
    
    @State private var showSeasonPicker = false
    @State private var selectedSeason = 1
    @Binding var movieDetailToShow: Movie?
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Spacer()
                    
                    Button(action: {
                        movieDetailToShow = nil
                    }, label: {
                        Image(systemName: "xmark.circle")
                            .font(.system(size: 28))
                    })
                }.padding(.horizontal, 22)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        StandardHomeMovie(movie: movie)
                            .frame(width: screen.width / 2.5)
                        
                        MovieInfoSubheadline(movie: movie)
                        
                        if movie.promotionHeadline != nil {
                            Text(movie.promotionHeadline!)
                                .bold()
                                .font(.headline)
                        }
                        
                        PlayButton(text: "Play", imageName: "play.fill", backgroundColor: .red) {
                            
                        }
                        
                        CurrentEpisodeInformation(movie: movie)
                        
                        CastInfo(movie: movie)
                        
                        HStack(spacing: 60) {
                            SmallVerticalButton(text: "My List", isOnImage: "checkmark", isOffImage: "plus", isOn: true) {
                                
                            }
                            
                            SmallVerticalButton(text: "Rate", isOnImage: "hand.thumbsup.fill", isOffImage: "hand.thumbsup", isOn: true) {
                                
                            }
                            
                            SmallVerticalButton(text: "Share", isOnImage: "square.and.arrow.up", isOffImage: "square.and.arrow.up", isOn: true) {
                                
                            }
                            
                            Spacer()
                        }
                        .padding(.leading, 20)
                        .padding(.bottom, 20)
                        
                        CustomTabSwitcher(
                            showSeasonPicker: $showSeasonPicker,
                            selectedSeason: $selectedSeason,
                            tabs: [.episodes, .trailers, .more],
                            movie: movie
                        )
                    }
                    .padding(.horizontal, 10)
                }
                
                Spacer()
            }
            .foregroundColor(.white)
            
            if showSeasonPicker {
                Group {
                    Color.black.opacity(0.9)
                    
                    VStack(spacing: 40) {
                        Spacer()
                        
                        ForEach(0..<(movie.numberOfSeasons ?? 0)) {
                            index in
                            
                            let season = 1 + index
                            Button(action: {
                                self.selectedSeason = season
                                self.showSeasonPicker = false
                            }, label: {
                                Text("Season \(season)")
                                    .bold()
                                    .font(selectedSeason == season ? .title: .title2)
                                    .foregroundColor(selectedSeason == season ? .white: .gray)
                            })
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            self.showSeasonPicker = false
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 40))
                        })
                    }
                    .foregroundColor(.white)
                }
                .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail(movie: exampleMovie4, movieDetailToShow: .constant(nil))
    }
}

struct MovieInfoSubheadline: View {
    var movie: Movie
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "hand.thumbsup.fill")
                .foregroundColor(.white)
            
            Text(String(movie.year))
            
            RatingView(rating: movie.rating)
            
            Text(movie.numberOfSeasonsDisplay)
        }
        .foregroundColor(.gray)
        .padding(.vertical, 6)
    }
}

struct RatingView: View {
    var rating: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white.opacity(0.3))
            
            Text(rating)
                .foregroundColor(.white)
                .font(.system(size: 12))
                .bold()
        }
        .frame(width: 50, height: 20)
    }
}

struct CastInfo: View {
    var movie: Movie
    
    var body: some View {
        VStack(spacing: 3) {
            HStack {
                Text("Cast: \(movie.cast)")
                Spacer()
            }
            
            HStack {
                Text("Creators: \(movie.creators)")
                Spacer()
            }
        }
        .font(.caption)
        .foregroundColor(.gray)
        .padding(.vertical, 8)
    }
}

struct CurrentEpisodeInformation: View {
    var movie: Movie
    
    var body: some View {
        Group {
            HStack {
                Text(movie.episodeInfoDisplay)
                    .bold()
                
                Spacer()
            }
            .padding(.vertical, 4)
            
            HStack {
                Text(movie.episodeDescriptionDisplay)
                    .font(.subheadline)
                
                Spacer()
            }
        }
    }
}
