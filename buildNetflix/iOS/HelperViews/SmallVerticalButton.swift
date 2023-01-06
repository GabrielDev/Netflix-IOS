//
//  SmallVerticalButton.swift
//  buildNetflix
//
//  Created by Gabriel dos Santos on 22/12/22.
//

import SwiftUI

struct SmallVerticalButton: View {
    var text: String
    var isOnImage: String
    var isOffImage: String
    var color: Color? = Color.white
    var isOn: Bool
    
    var imageName: String {
        return isOn ? isOnImage : isOffImage
    }
    
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            VStack {
                Image(systemName: imageName)
                    .foregroundColor(color)
                    .font(.system(size: 20))
                    .padding(.bottom, 3)
                
                Text(text)
                    .foregroundColor(color)
                    .font(.system(size: 12))
                    .bold()
                    
            }
        })
    }

}

struct SmallVerticalButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            SmallVerticalButton(text: "My List",
                                isOnImage: "checkmark",
                                isOffImage: "plus",
                                isOn: true) {
                
                print("Tapped")
            }
        }
    }
}
