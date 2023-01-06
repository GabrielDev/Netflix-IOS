//
//  WhiteButton.swift
//  buildNetflix
//
//  Created by Gabriel dos Santos on 22/12/22.
//

import SwiftUI

struct PlayButton: View {
    var text: String
    var imageName: String
    var action: () -> Void
    var backgroundColor: Color = Color.white
    
    var body: some View {
        
        Button(action: action, label: {
            HStack {
                Spacer()
                
                Image(systemName: imageName)
                    .font(.headline)
                
                Text(text)
                    .bold()
                    .font(.system(size: 16))
                
                Spacer()
            }
            .padding(.vertical, 6)
            .foregroundColor(backgroundColor == .white ? .black: .white)
            .background(backgroundColor)
            .cornerRadius(3.0)
        })
    }
}

struct WhiteButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            PlayButton(text: "Play", imageName: "play.fill") {
                
            }
        }
    }
}
