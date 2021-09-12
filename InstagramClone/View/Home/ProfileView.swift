//
//  ProfileView.swift
//  InstagramClone
//
//  Created by Prashant  on 05/09/21.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var isSuggestedExpanded = false
    
    @State private var arraySuggestedUsers = ["Paul","Vimal" ,"Strewert" , "Mahendra" , "Seggy" ,"Bhupat B"]
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            
            HeaderViewCommonView(handler: { (action) in
                
                switch action {
                case .back:
                    presentationMode.wrappedValue.dismiss()
                    break
                default :
                    break
                }
                
            }, title: "Prashant", rightImage1: "bell", rightImage2: "circle.grid.2x2")
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(alignment: .leading){
                    
                    HStack(spacing:5) {
                        
                        Button(action: {}, label: {
                            Image("sample2")
                                .resizable()
                                .frame(width: 70, height: 70)
                                .clipShape(Circle())
                                .overlay(
                                    
                                    Image(systemName: "plus")
                                        .foregroundColor(.white)
                                        .padding(6)
                                        .background(Color.blue)
                                        .clipShape(Circle())
                                        .background(Color.white)
                                        .padding(2)
                                        .clipShape(Circle())
                                        .offset(x: 5, y: 8)
                                    
                                    ,alignment: .bottomTrailing
                                )
                            
                        })
                        
                        
                        VStack(alignment:.leading) {
                            Text("20.2k")
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                                .font(.title2)
                            Text("Posts")
                                .foregroundColor(.gray)
                        }
                        .frame(maxWidth:.infinity)
                        
                        VStack(alignment:.leading) {
                            Text("1.2k")
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                                .font(.title2)
                            Text("Followers")
                                .foregroundColor(.gray)
                        }
                        .frame(maxWidth:.infinity)
                        
                        VStack(alignment:.leading) {
                            Text("23.2k")
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                                .font(.title2)
                            Text("Following")
                                .foregroundColor(.gray)
                        }
                        .frame(maxWidth:.infinity)
                        
                    }
                    
                    VStack(alignment: .leading,spacing:4) {
                        Text("Prashant Tukadiya , iOS and Swift Dev")
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        
                        Text("Developer")
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                        
                        Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text")
                            .foregroundColor(.primary)
                        
                        Link(destination: URL(string: "https://stackoverflow.com/users/4601900/prashant-tukadiya")!, label: {
                            Text("Stackoverflow")
                        })
                        
                    }
                    .padding(.top,20)
                    
                    FollowingMessageView
                    .padding(.top,30)
                    
                    suggestedForView
                        .frame(height:isSuggestedExpanded ? 220 : 0)
                        .opacity(isSuggestedExpanded ? 1: 0)
                        .padding(.top,20)

                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            Button(action: {}, label: {
                                ZStack(alignment:.bottomTrailing) {
                                    
                                    Image("sample1")
                                        .resizable()
                                        .frame(width: 60, height: 60)
                                        .aspectRatio(contentMode: .fill)
                                        .clipShape(Circle())
                                    
                                    Image(systemName: "plus.circle")
                                        .font(.title2)
                                        .background(Color.blue)
                                        .foregroundColor(Color.white)
                                        .clipShape(Circle())

                                        .offset(x: 0, y: 0)

                                }
                            })
                        }
                    }
                }
                                
            }// SCROLL
        }// MAIN V STACK
        .padding()
        .navigationBarHidden(true)
    }
    
    
    
    var suggestedForView: some View {
        
        VStack(spacing:0) {
            HStack {
                Text("Suggested For you")
                    .fontWeight(.semibold)
                    .font(.headline)
                
                Spacer()
                
                Button(action: {}, label: {
                    Text("See All")
                        .fontWeight(.semibold)
                        .font(.headline)
                })
                
                
            }.frame(height:30)
            
            ScrollView(.horizontal, showsIndicators: true) {
                LazyHStack {
                    ForEach(arraySuggestedUsers,id:\.self) { i in
                        suggestedForViewCardView(name: i)
                            .frame(width: 140, height: 190)
                            .background(

                                RoundedRectangle(cornerRadius: 6)
                                    .strokeBorder(Color.primary.opacity(0.5), lineWidth: 1)

                            )
                        
                    }
                }
            }
            
        }
        
    }
    
    
    func suggestedForViewCardView (name:String) ->  some View {
        
         ZStack(alignment: .topTrailing) {
            
            
            Button(action: {
                
                self.arraySuggestedUsers.removeAll(where: {$0 == name})
                
                if arraySuggestedUsers.isEmpty  {
                    isSuggestedExpanded = false
                }
                
                
            }, label: {
                Image(systemName: "xmark")
                    
            })
            .foregroundColor(.primary)
            .padding(5)
            
            VStack {
                VStack {
                    
                    Image("sample1")
                        .resizable()
                        .frame(width:60,height: 60)
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                    
                    HStack(spacing:0) {
                        Text(name)
                            .font(.system(size: 14, weight: Font.Weight.medium))
                            .foregroundColor(.primary)
                            .fontWeight(.medium)
                        
                        Image(systemName: "checkmark.seal.fill")
                            .foregroundColor(.blue)
                    }
                    
                    Text("iOS Dev")
                        .fontWeight(.light)
                        .font(.system(size: 14, weight: Font.Weight.medium))
                        
                        .foregroundColor(.secondary)
                    
                    
                    Spacer()
                    
                    
                }
                
                Spacer()
                
                Button(action: {}, label: {
                    Text("Follow")
                        .foregroundColor(.white)
                })
                .frame(maxWidth:.infinity)
                .frame(height:27)
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color.blue)
                )
                .padding(.horizontal)

                .padding(.bottom)
            }
            .frame(maxWidth:.infinity)
            .padding(.top,12)
 
        }
        
    }
    
    var FollowingMessageView : some View {
        HStack(spacing:2) {
            Button(action: {}, label: {
                HStack(alignment:.center ,spacing:5) {
                    Text("Following")
                        .fontWeight(.semibold)
                    Image(systemName: "chevron.down")
                        .font(Font.caption.bold())
                        

                }
                .font(.title3)

            })
            .foregroundColor(.primary)
            .frame(maxWidth:.infinity)
            .frame(height:40)

            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .strokeBorder(Color.primary, lineWidth: 1)
                    
            )
            Spacer()
            
            Button(action: {}, label: {
                Text("Message")
                    .font(.title3)
                    .fontWeight(.semibold)
            })
            //.padding(.vertical,5)
            .foregroundColor(.primary)
            .frame(maxWidth:.infinity)
            .frame(height:40)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .strokeBorder(Color.primary, lineWidth: 1)
                    
            )
            
            Button(action: {
                
                withAnimation {
                    self.isSuggestedExpanded.toggle()
                }
            }, label: {
                Image(systemName: "chevron.down")

                    .font(.title2)
                    
            })
            .padding(.horizontal,6)
            .foregroundColor(.primary)
            .frame(height:40)

            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .strokeBorder(Color.primary, lineWidth: 1)
                    
            )
            .padding(.leading,6)

        }

    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}




