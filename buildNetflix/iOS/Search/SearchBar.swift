//
//  SearchBar.swift
//  buildNetflix
//
//  Created by Gabriel dos Santos on 30/12/22.
//

import SwiftUI

struct SearchBar: View {
    
    @State private var isEditing = false
    
    @Binding var text: String
    
    @Binding var isLoading: Bool
    
    var body: some View {
        ZStack(alignment: .leading) {
            Color.graySearchBackground
                .frame(width: 280, height: 36)
                .cornerRadius(8)
                
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.graySearchText)
                    .padding(.leading, 10)
                
                TextField("Search", text: $text)
                    .padding(7)
                    .padding(.leading, -7)
                    .padding(.horizontal, 10)
                    .background(Color.graySearchBackground)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .onTapGesture(perform: {
                        isEditing = true
                    })
                    .animation(.default)
                    .previewDisplayName("Search")
                
                if !text.isEmpty {
                    Button(action: {
                        text = ""
                    }, label: {
                        if isLoading {
                            ActivityIndicator(style: .medium, animate: .constant(true))
                                .configure {
                                    $0.color = .white
                                }
                                .frame(width: 35, height: 35)
                        } else {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.graySearchText)
                                .frame(width: 35, height: 35)
                        }
                    })
                    .padding(.trailing, 12)
                }
                
                if isEditing {
                    Button(action: {
                        text = ""
                        isEditing = false
                        hideKeyboard()
                    }, label: {
                        Text("Cancel")
                            .foregroundColor(.white)
                    })
                    .padding(.trailing, 10)
                    .transition(.move(edge: .trailing))
                    .animation(.default)
                }
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            SearchBar(
                text: .constant(""),
                isLoading: .constant(false)
            )
            .padding()
        }
    }
}
