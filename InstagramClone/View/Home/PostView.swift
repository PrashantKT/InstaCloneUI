//
//  SwiftUIView.swift
//  InstagramClone
//
//  Created by Prashant Tukadiya on 21/03/21.
//

import SwiftUI

struct PostView:View {
    var index:Int
    
    var body: some View {
        VStack {
            PostHeaderView()
            Image("sample\(index)")
                .resizable()
                .frame(height: 350)
            PostActionButtonsView()
            PostCommentLikeView()
            
        }
    }
}

struct PostHeaderView:View {
    
    @State private var showProfileView:Bool = false
    
    var body: some View {
        
        HStack(spacing:12) {
            
            NavigationLink("", destination: ProfileView(), isActive: $showProfileView)
            
            Button(action: {
                showProfileView.toggle()
            }, label: {
                
                HStack(spacing:12) {
                    Image("sample1")
                        .resizable()
                        .frame(width: 44, height: 44)
                        .clipShape(Circle())
                        .overlay(
                            Circle().stroke(LinearGradient([.red,.yellow]),lineWidth: 2)
                        )
                    
                    VStack(alignment: .leading){
                        Text("Prashant Tukadiya")
                            .font(.headline)
                        Text("Porbandar, India")
                            .font(.caption)
                            .padding(.leading,2)

                    }

                }
                .foregroundColor(.primary)
                
                
                
            })
  
            Spacer()
            
            Button(action: {}, label: {
                Image(systemName: "circle.grid.2x2")
                    .foregroundColor(.primary)
            })
        }
        .frame(maxWidth:.infinity)
        .padding([.leading,.trailing])
        
    }
}
struct PostActionButtonsView:View {
    
    @Environment(\.colorScheme) var colorSchme
    
    var body: some View {
        HStack(spacing:22) {
            Button(action: {
                print("LIKE")
            }, label: {
                Image(systemName: "suit.heart")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
            })        .buttonStyle(BorderlessButtonStyle())

            
            Button(action: {
                print("message")

            }, label: {
                Image(systemName: "message")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                
            })        .buttonStyle(BorderlessButtonStyle())

            Button(action: {
                print("paperplane")

            }, label: {
                Image(systemName: "paperplane")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                
            })        .buttonStyle(BorderlessButtonStyle())

            
            Spacer()
            
            Button(action: {
                print("bookmark")

            }, label: {
                Image(systemName: "bookmark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                
            })        .buttonStyle(BorderlessButtonStyle())

            
            
            
        }
        .foregroundColor(colorSchme == .dark ? Color.white  : Color.black.opacity(0.6) )
        .padding()

    }
}

struct PostCommentLikeView :View {
    @Environment(\.colorScheme) var colorScheme
    @State private var comment = ""
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Text("25 likes")
                    .font(.caption)
                    .bold()
                Spacer()
            }
            .padding(.bottom,2)
            HStack {
                Text("Prashant Tukadiya")
                    .font(.caption)
                    .bold()
                
               Text("Learning swiftUI")
                .font(.caption)
            }
            .padding(.bottom,2)
            Button(action: {}, label: {
                Text("View all 20 comments")
                    .font(.caption2)
                    .bold()
            })
            
            HStack {
                Image("sample1").resizable()
                    .frame(width: 30, height: 30)
                    .scaledToFill()
                    .clipShape(Circle())
                
                TextField("Add a comment", text: $comment)
                    .font(.caption2)
                
            }
            Text("1 Day ago")
             .font(.caption2)
                .foregroundColor(colorScheme == .dark ? .white :  .gray)

            
        }
        .padding([.leading,.trailing,.bottom])
    }
}

struct PostViewPreview:PreviewProvider {
    static var previews: some View {
        PostView(index: 2)
    }
}
