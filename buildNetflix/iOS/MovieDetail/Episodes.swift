//
//  Episodes.swift
//  buildNetflix
//
//  Created by Gabriel dos Santos on 27/12/22.
//

import SwiftUI

struct Episodes: View {
    var episodes: [Episode]
    
    @Binding var showSeasonPicker: Bool
    @Binding var selectedSeason: Int
    
    func getEpisodes(forSeason season: Int) -> [Episode] {
        return episodes.filter({ $0.season == season })
    }
    
    var body: some View {
        VStack(spacing: 14) {
            HStack {
                Button(action: {
                    showSeasonPicker = true
                }, label: {
                    Group {
                        Text("Season \(selectedSeason)")
                        Image(systemName: "chevron.down")
                    }
                    .font(.system(size: 16))
                })
                
                Spacer()
            }
            
            ForEach(getEpisodes(forSeason: selectedSeason)) { episode in
                VStack(alignment: .leading) {
                    HStack {
                        VideoPreviewImage(imageURL: episode.thumbnailURL, videoURL: episode.videoURL)
                            .frame(width: 120, height: 70)
                            .clipped()
                        
                        VStack(alignment: .leading) {
                            Text("\(episode.episodeNumber). \(episode.name)")
                                .font(.system(size: 16))
                            
                            Text("\(episode.length)m")
                                .font(.system(size: 12))
                                .foregroundColor(.gray)
                        }
                        .padding(.horizontal, 10)
                        
                        Spacer()
                        
                        Button(action: {}, label: {
                            Image(systemName: "arrow.down.to.line.alt")
                                .font(.system(size: 20))
                        })
                    }
                    
                    Text(episode.description)
                        .font(.system(size: 13))
                        .lineLimit(3)
                }
                .padding(.bottom, 20)
            }
            
            Spacer()
        }
        .foregroundColor(.white)
        .padding(.horizontal, 10)
    }
}

struct Episodes_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            Episodes(episodes: [episode1, episode2, episode3], showSeasonPicker: .constant(false), selectedSeason: .constant(1))
        }
    }
}
