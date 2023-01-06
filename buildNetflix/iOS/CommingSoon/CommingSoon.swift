//
//  CommingSoon.swift
//  buildNetflix
//
//  Created by Gabriel dos Santos on 04/01/23.
//

import SwiftUI

struct CommingSoon: View {
    
    @State private var showNotificationList = false
    
    @State private var movieDetailToShow: Movie?
    
    @State private var navBarHidden = true
    
    @State private var scrollOffset: CGFloat = 0.0
    
    @State private var activeIndex = 0
    
    @ObservedObject var vm = CommingSoonVM()
    
    func updateActiveIndex(fromScroll scroll: CGFloat) {
        let NOTIFICATION_HEIGHT: CGFloat = 105
        
        if scroll < NOTIFICATION_HEIGHT {
            activeIndex = 0
        } else {
            let scrollArea = scroll - NOTIFICATION_HEIGHT
            
            let active = Int(scrollArea / 420) + 1
            activeIndex = Int(active)
        }
    }
    
    var body: some View {
        let movies = vm.movies.enumerated().map({ $0 })
        
        let scrollTrackingBinding = Binding {
            return scrollOffset
        } set: { newValue in
            scrollOffset = newValue
            updateActiveIndex(fromScroll: newValue)
        }
        
        //        NavigationView {
        return Group {
            ZStack {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                
                TrackableScrollView(.vertical, showIndicators: false, contentOffset: scrollTrackingBinding) {
                    LazyVStack {
                        NotificationBar(showNotificationList: $showNotificationList)
                        
                        ForEach(Array(movies), id: \.offset) { index, movie in
                            CommingSoonRow(
                                movie: movie,
                                movieDetailToShow: $movieDetailToShow
                            )
                            .frame(height: 400)
                            .overlay(
                                Group {
                                    index == activeIndex ? Color.clear: .black.opacity(0.8)
                                }
                                .animation(.easeInOut)
                            )
                        }
                    }
                }
                .foregroundColor(.white)
                
                
                NavigationLink(
                    destination: Text("Notification List"),
                    isActive: $showNotificationList,
                    label: {
                        EmptyView()
                    })
                .navigationTitle("")
                .navigationBarHidden(navBarHidden)
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification), perform: { _ in self.navBarHidden = true
                })
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification), perform: { _ in self.navBarHidden = false
                })
                
            }
        }
        //        }
    }
}

struct CommingSoon_Previews: PreviewProvider {
    static var previews: some View {
        CommingSoon(vm: CommingSoonVM())
    }
}
