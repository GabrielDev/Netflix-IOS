//
//  NotificationBar.swift
//  buildNetflix
//
//  Created by Gabriel dos Santos on 04/01/23.
//

import SwiftUI

struct NotificationBar: View {
    
    @Binding var showNotificationList: Bool
    
    var body: some View {
        Button(action: {
            showNotificationList = true
        }, label: {
            HStack {
                Image(systemName: "bell")
                
                Text("Notifications")
                    .bold()
                    .foregroundColor(.white)
                
                Spacer()
                
                Image(systemName: "chevron.right")
            }
            .font(.system(size: 18, weight: .bold))
        })
        .foregroundColor(.white)
        .padding()
    }
}

struct NotificationBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            NotificationBar(showNotificationList: .constant(true))
        }
    }
}
