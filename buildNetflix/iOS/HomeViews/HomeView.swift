//
//  HomeView.swift
//  buildNetflix
//
//  Created by Gabriel dos Santos on 19/12/22.
//

import SwiftUI

struct HomeView: View {
    var vm = HomeVM()
    
    let screen = UIScreen.main.bounds
    
    @State private var movieDetailToShow: Movie? = nil
    
    @State private var topRowSelection: HomeTopRow = .home
    
    @State private var homeGenre: HomeGenre = .AllGenres
    
    @State private var showGenreSelection = false
    
    @State private var showTopRowSelection = false
    
    @Binding var showPreviewFullScreen: Bool
    
    @Binding var previewStartingIndex: Int
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    TopRowButtons(
                        topRowSelection: $topRowSelection,
                        homeGenre: $homeGenre,
                        showGenreSelection: $showGenreSelection,
                        showTopRowSelection: $showTopRowSelection
                    )
                        
                    TopMoviePreview(
                        movie: exampleMovies.randomElement()!,
                        movieDetailToShow: $movieDetailToShow)
                        .frame(width: screen.width)
                        .padding(.top, -110)
                        .zIndex(-1)
                    
                    MoviePreviewRow(
                        movies: exampleMovies,
                        showPreviewFullScreen: $showPreviewFullScreen,
                        previewStartingIndex: $previewStartingIndex
                    )

                    HomeStack(
                        vm: vm,
                        topRowSelection: topRowSelection,
                        selectedGenre: homeGenre,
                        movieDetailToShow: $movieDetailToShow
                    )
                }
            }
            
            if movieDetailToShow != nil {
                MovieDetail(
                    movie: movieDetailToShow!,
                    movieDetailToShow: $movieDetailToShow
                )
                .animation(.easeIn)
                .transition(.opacity)
            }
            
            if showTopRowSelection || showGenreSelection {
                Group {
                    Color.black
                        .opacity(0.9)
                    
                    VStack(spacing: 40) {
                        Spacer()

                        if showTopRowSelection {
                            ForEach(HomeTopRow.allCases, id: \.self) {
                                topRow in
                                Button(action: {
                                    topRowSelection = topRow
                                    showTopRowSelection = false
                                }, label: {
                                    Text("\(topRow.rawValue)")
                                        .bold(topRow == topRowSelection)
                                        .foregroundColor(topRow == topRowSelection ? .white : .gray)
                                })
                                .padding(.bottom, 40)
                            }
                        }
                        
                        if showGenreSelection {
                            ScrollView(showsIndicators: false) {
                                ForEach(HomeGenre.allCases, id: \.self) {
                                    genre in
                                    Button(action: {
                                        homeGenre = genre
                                        showGenreSelection = false
                                    }, label: {
                                        Text("\(genre.rawValue)")
                                            .bold(genre == homeGenre)
                                            .foregroundColor(genre == homeGenre ? .white : .gray)
                                    })
                                    .padding(.top, 40)
                                }
                            }
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            showGenreSelection = false
                            showTopRowSelection = false
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 40))
                        })
                        .padding(.bottom, 30)
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .font(.title2)
            }
        }
        .foregroundColor(.white)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(
            showPreviewFullScreen: .constant(false),
            previewStartingIndex: .constant(0)
        )
    }
}

struct TopRowButtons: View {
    
    @Binding var topRowSelection: HomeTopRow
    
    @Binding var homeGenre: HomeGenre
    
    @Binding var showGenreSelection: Bool
    
    @Binding var showTopRowSelection: Bool
    
    var body: some View {

        HStack {
            Button(action: {
                topRowSelection = .home
            }, label: {
                Image("netflix_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
            })
            .buttonStyle(PlainButtonStyle())
            
            HStack(spacing: 20) {
                switch topRowSelection {
                case .home:
                    ForEach(HomeTopRow.allCases[1...], id: \.rawValue) { menu in
                        Button(action: {
                            topRowSelection = menu
                        }, label: {
                            Text(menu.rawValue)
                        })
                        .buttonStyle(PlainButtonStyle())
                    }
                    
                case .myList, .movies, .tvShows:
                    Button(action: {
                        showTopRowSelection = true
                    }, label: {
                        HStack {
                            Text(topRowSelection.rawValue)
                                .font(.system(size: 18))
                            
                            Image(systemName: "triangle.fill")
                                .rotationEffect(.degrees(180))
                                .font(.system(size: 6))
                        }
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Button(action: {
                        showGenreSelection = true
                    }, label: {
                        HStack {
                            Text(homeGenre.rawValue)
                                .font(.system(size: 12))
                            
                            Image(systemName: "triangle.fill")
                                .rotationEffect(.degrees(180))
                                .font(.system(size: 6))
                        }
                    })
                    .buttonStyle(PlainButtonStyle())
                }
            }
            
            Spacer()
        }
        .padding(.leading, 10)
        .padding(.trailing, 30)
    }
}

enum HomeTopRow: String, CaseIterable {
    case home = "Home"
    case tvShows = "TV Shows"
    case movies = "Movies"
    case myList = "My List"
}

enum HomeGenre: String, CaseIterable {
    case AllGenres = "All Genres"
    case Action = "Action"
    case Comedy = "Comedy"
    case Horror = "Horror"
    case Thriller = "Thriller"
}
