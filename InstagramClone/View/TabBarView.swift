//
//  TabBarView.swift
//  InstagramClone
//
//  Created by Prashant Tukadiya on 21/03/21.
//

import SwiftUI


struct TabBarView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State private var tabSelected = 0
    @Binding var selectedIndex:Int
    var body: some View {
        TabView(selection:$tabSelected) {
            Home(selectedIndex: $selectedIndex)
                .tag(0)
                .tabItem {
                    Image(systemName: "house.fill")
                        .foregroundColor(.black)
                }
            Text("SEARCH")
                .tag(1)
                .tabItem {
                    Image(systemName: tabSelected == 1 ? "magnifyingglass.circle.fill" :  "magnifyingglass")
                }
            Text("VIDEO")
                .tag(2)
                .tabItem {
                    Image(systemName: "film")
                }

            Text("HEART")
                .tag(3)
                .tabItem {
                    Image(systemName: tabSelected == 3 ?"suit.heart.fill" : "suit.heart")
                }

            Text("PERSON")
                .tag(4)
                .tabItem {
                    Image(systemName: tabSelected == 4 ?"person.fill" : "person")
                }

            
        }.accentColor(colorScheme == .dark ? .white :  Color.black)
        .tabViewStyle(DefaultTabViewStyle())
        
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView( selectedIndex: .constant(1))
    }
}
