//
//  ContentView.swift
//  InstagramClone
//
//  Created by Prashant Tukadiya on 21/03/21.
//

import SwiftUI




struct ContentView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @StateObject var loginViewModel = LoginViewModel()
    @State private var tabSelected = 0

   
    var body: some View {
        if loginViewModel.isLoggedIn ||  loginViewModel.isShowHomeScreen {
            CustomPageViewController(controllers:[
                                        UIHostingController(rootView: CameraView(selectedIndex: $tabSelected)),
                                        UIHostingController(rootView: TabBarView( selectedIndex: $tabSelected).padding(.top, 0).padding(.bottom,0)),
                                        UIHostingController(rootView: MessageView(selectedIndex: self.$tabSelected))], currentSelectedIndex: $tabSelected)
                
                .edgesIgnoringSafeArea(.all)
                .onAppear{
                    self.tabSelected = 1
                }
        } else {
            LoginView()
                .environmentObject(loginViewModel)

        }

 
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


