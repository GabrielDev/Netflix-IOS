//
//  TrailerPlayerView.swift
//  buildNetflix
//
//  Created by Gabriel dos Santos on 05/01/23.
//

import SwiftUI
import VideoPlayer

struct TrailerPlayerView: View {
    
    var videoUrl: URL?
    
    @Binding var playVideo: Bool
    
    var body: some View {
        if videoUrl != nil {
            VideoPlayer(url: videoUrl!, play: $playVideo)
        } else {
            ZStack {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                
                Text("Could not load video")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.white)
            }
        }
    }
}

struct TrailerPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        TrailerPlayerView(
            videoUrl: exampleVideoURL,
            playVideo: .constant(true)
        )
    }
}
