//
//  CustomTabSwitcher.swift
//  buildNetflix
//
//  Created by Gabriel dos Santos on 26/12/22.
//

import SwiftUI

struct CustomTabSwitcher: View {
    
    @State private var currentTab: CustomTab = .episodes
    
    @Binding var showSeasonPicker: Bool
    
    @Binding var selectedSeason: Int
    
    var tabs: [CustomTab]
    var movie: Movie
    
    func widthForTab(_ tab: CustomTab) -> CGFloat {
        return tab.rawValue.widthOfString(usingFont: .systemFont(ofSize: 16, weight: .bold))
    }
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30) {
                    ForEach(tabs, id: \.self) { tab in
                        VStack {
                            Rectangle()
                                .foregroundColor(tab == currentTab ? .red: .clear)
                                .frame(width: widthForTab(tab), height: 4)
                            
                            
                            Button(action: {
                                currentTab = tab
                            }, label: {
                                Text(tab.rawValue)
                                    .foregroundColor(tab == currentTab ? .white: .gray)
                                    .font(.system(size: 16, weight: .bold))
                            })
                            .buttonStyle(PlainButtonStyle())
                            .frame(height: 30)
                        }
                    }
                }
            }
            
            switch currentTab {
                case .episodes:
                    Episodes(
                        episodes: movie.episodes ?? [],
                        showSeasonPicker: $showSeasonPicker,
                        selectedSeason: $selectedSeason
                    )
                case .trailers:
                    TrailerList(trailers: movie.trailers)
                case .more:
                    MoreLikeThis(movies: movie.moreLikeThis)
            }
        }
        .foregroundColor(.white)
    }
}

enum CustomTab: String {
    case episodes = "EPISODES"
    case trailers = "TRAILERS & MORE"
    case more = "MORE LIKE THIS"
}

struct CustomTabSwitcher_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            CustomTabSwitcher(
                showSeasonPicker: .constant(false),
                selectedSeason: .constant(1),
                tabs: [.episodes, .trailers, .more],
                movie: exampleMovie1
            )
        }
    }
}
