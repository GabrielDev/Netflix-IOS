//
//  VideoView.swift
//  buildNetflix
//
//  Created by Gabriel dos Santos on 27/12/22.
//

import SwiftUI
import AVKit

struct VideoView: View {
    var url: URL
    
    private var player: AVPlayer {
        AVPlayer(url: url)
    }
    
    var body: some View {
        VideoPlayer(player: player)
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView(url: exampleVideoURL)
    }
}
