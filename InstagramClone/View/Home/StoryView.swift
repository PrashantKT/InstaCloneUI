//
//  StoryView.swift
//  InstagramClone
//
//  Created by Prashant Tukadiya on 21/03/21.
//

import SwiftUI


struct StoryView : View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            
            HStack(spacing:12) {
                VStack {
                    ZStack(alignment:.bottomTrailing ){
                        Button(action: {}, label: {
                            Image("sample1").resizable()
                                .frame(width: 70, height: 70)
                                .scaledToFill()
                                .clipShape(Circle())
                            
                        })
                        Image(systemName: "plus.circle")
                            .font(.title2)
                            .background(Color.blue)
                            .clipShape(Circle())
                            .foregroundColor(.white)
                            .offset(x: 2, y: 2)
                        
                    }
                    Text("You")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                ForEach(0..<5) { i in
                    Button(action: {}, label: {
                        VStack {
                            Image("sample1").resizable()
                                .frame(width: 66, height: 66)
                                .scaledToFill()
                                .clipShape(Circle())
                                .overlay(Circle().stroke(LinearGradient([.red,.yellow]),lineWidth: 2))
                            Text("User")
                                .font(.caption)
                            
                            
                        }.foregroundColor(.primary)
                        
                    })
                }
            }
            
        })
        .padding()
    }
}

struct StoryViewPreview:PreviewProvider {
    
    
    static var previews: some View {
        Group {
            Home(selectedIndex: .constant(0))
            
            StoryView()
        }
    }
}
