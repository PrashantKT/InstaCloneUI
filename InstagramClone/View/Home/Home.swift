//
//  Home.swift
//  InstagramClone
//
//  Created by Prashant Tukadiya on 21/03/21.
//

import SwiftUI

struct Home: View {
    @Binding var selectedIndex:Int

    var body: some View {
        NavigationView {
            VStack {
                TopBarHome(selectedIndex: $selectedIndex)
                Divider()
                StoryView()
                ScrollView {
                    LazyVStack {
                        ForEach(1..<9,id:\.self) { index in
                            PostView(index: index)
                                .buttonStyle(PlainButtonStyle()) // TO STOP Highlight on cell tap
                        }
                    }
                }
                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
}

struct TopBarHome:View{
    @Binding var selectedIndex:Int

    var body: some View {
        HStack {
            Button(action: {
                self.selectedIndex = 0
            }, label: {
                Image(systemName: "plus.app")
                    .font(.title2)
                
            })
            Spacer()
            Button(action: {
                self.selectedIndex = 2

            }, label: {
                Image(systemName: "paperplane.fill")
                    .font(.title2)
            })
        }
        .padding()
        .foregroundColor(.primary)
        .overlay(
            Text("Instagram")
                .font(.title2)
                .bold()
        )
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home(selectedIndex: .constant(1))
           // .preferredColorScheme(.dark)
    }
}

extension LinearGradient {
    init (_ colors:[Color]) {
        self.init(gradient: Gradient(colors: colors), startPoint: .leading, endPoint: .trailing)
    }
}
