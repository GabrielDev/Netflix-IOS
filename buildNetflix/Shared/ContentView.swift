//
//  ContentView.swift
//  buildNetflix
//
//  Created by Gabriel dos Santos on 19/12/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showPreviewFullScreen: Bool = false
    
    @State private var previewStartingIndex: Int = 0
    
    @State private var previewCurrentPos: CGFloat = 1000
    
    @State private var previewNewPos: CGFloat = 1000
    
    @State private var previewHorizontalDragActive: Bool = false
    
    let screen = UIScreen.main.bounds
    
    init() {
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = .black
    }
    
    var body: some View {
        
        let previewDragGesture = DragGesture(minimumDistance: 20)
            .onChanged { value in
                if previewHorizontalDragActive {
                    return
                }
                
                if previewCurrentPos == .zero {
                    if abs(value.translation.width) > abs(value.translation.height) {
                        previewHorizontalDragActive = true
                        return
                    }
                }
                
                let shouldBePosition = value.translation.height + self.previewNewPos
                
                if shouldBePosition >= 0 {
                    self.previewCurrentPos = shouldBePosition
                }
            }
            .onEnded { value in
                if previewHorizontalDragActive {
                    previewHorizontalDragActive = false
                    return
                }
                
                let shouldBePosition = value.translation.height + self.previewNewPos
                let closingPoint = screen.size.height * 0.2
                
                withAnimation {
                    if shouldBePosition > closingPoint {
                        self.previewCurrentPos = screen.height + 20
                        self.previewNewPos = screen.height + 20
                        self.showPreviewFullScreen = false
                    } else {
                        self.previewCurrentPos = .zero
                        self.previewNewPos = .zero
                    }
                }
                
                previewHorizontalDragActive = false
            }
        
        ZStack {
            TabView {
                HomeView(
                    showPreviewFullScreen: $showPreviewFullScreen,
                    previewStartingIndex: $previewStartingIndex
                )
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                    .tag(0)
                
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                    .tag(1)
                
                CommingSoon()
                    .tabItem {
                        Image(systemName: "play.rectangle")
                        Text("Comming Soon")
                    }
                    .tag(2)
                
                DownloadsView()
                    .tabItem {
                        Image(systemName: "arrow.down.to.line.alt")
                        Text("Donwloads")
                    }
                    .tag(3)
            }
            .accentColor(.white)
            
            PreviewList(
                movies: exampleMovies,
                currentSelection: $previewStartingIndex,
                isVisible: $showPreviewFullScreen,
                externalDragGesture: previewDragGesture
            )
            .offset(y: previewCurrentPos)
            .isHidden(!showPreviewFullScreen)
            .animation(.easeIn)
            .transition(.move(edge: .bottom))
        }
        .onChange(of: showPreviewFullScreen, perform: { value in
            withAnimation {
                if value {
                    previewCurrentPos = .zero
                    previewNewPos = .zero
                } else {
                    self.previewCurrentPos = screen.height + 20
                    self.previewNewPos = screen.height + 20
                }
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            ContentView()
        }
    }
}
