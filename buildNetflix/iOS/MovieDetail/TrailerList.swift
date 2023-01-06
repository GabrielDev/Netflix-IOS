//
//  TrailerList.swift
//  buildNetflix
//
//  Created by Gabriel dos Santos on 27/12/22.
//

import SwiftUI

struct TrailerList: View {
    
    var trailers: [Trailer]
    
    let screen = UIScreen.main.bounds
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach(trailers) { trailer in
                VStack(alignment: .leading) {
                    VideoPreviewImage(imageURL: trailer.thumbnailImageURL, videoURL: trailer.videoURL)
                        .frame(width: screen.width - 20, height: 250)
                        .clipped()
                    
                    Text(trailer.name)
                        .font(.headline)
                }
                .foregroundColor(.white)
            }
        }
    }
}

struct TrailerList_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            TrailerList(trailers: exampleTrailers)
        }
    }
}
