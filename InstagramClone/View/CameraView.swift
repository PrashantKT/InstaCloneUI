//
//  CameraView.swift
//  InstagramClone
//
//  Created by Prashant Tukadiya on 21/03/21.
//

import SwiftUI

struct CameraView: View {
    
    @Binding var selectedIndex:Int
    
    var body: some View {
        ZStack {
            Color.black
            
            VStack {
                HStack {
                    Button(action: {}, label: {
                        Image(systemName: "slider.horizontal.3")
                            .foregroundColor(.white)
                            .font(.title2)
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        self.selectedIndex = 1
                    }, label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .font(.title2)
                    })
                    
                    
                }
                //50 will be replace with safearea height
                .padding(.top,50)
                .padding()
                
                Spacer()
            }
            
        }.ignoresSafeArea()
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView(selectedIndex: .constant(1))
    }
}
