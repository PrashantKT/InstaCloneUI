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

    @State private var topHeaderOffset :CGFloat = 0
    
    static let header_ScrollTopPadding:CGFloat = 12
    
    var body: some View {
        VStack(spacing:0) {
            
            HeaderViewCommonView(handler: { (action) in
                
                switch action {
                case .back:
                    presentationMode.wrappedValue.dismiss()
                    break
                default :
                    break
                }
                
            }, title: "Prashant", rightImage1: "bell", rightImage2: "circle.grid.2x2")
           
            .padding([.horizontal])
            .overlay(
                GeometryReader { proxy -> Color in
                    let width = proxy.frame(in: .global).minY
                    print(width)
                    
                    DispatchQueue.main.async {
                        if topHeaderOffset == 0 {
                            topHeaderOffset = width
                        }
                    }
                   return Color.clear
                }
                .frame(height: 0,alignment: .bottom)
                ,alignment: .bottom
            
            )
            
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
                    .padding([.horizontal])

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
                    .padding([.horizontal])

                    FollowingMessageView
                    .padding(.top,30)
                        .padding([.horizontal])

                    suggestedForView
                        .frame(height:isSuggestedExpanded ? 220 : 0)
                        .opacity(isSuggestedExpanded ? 1: 0)
                        .padding(.top,20)
                        .padding([.horizontal])
                    
                    
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
                    .padding([.horizontal])
                    
                    
                    ProfileImageContainerView(topHeaderOffset: $topHeaderOffset)
                        .padding(.top,20)
                    
                    

                }
                                
            }
            .padding(.top,ProfileView.header_ScrollTopPadding)
            // SCROLL
 
 
        }// MAIN V STACK
        .padding([.vertical])
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
                withAnimation {
                    self.arraySuggestedUsers.removeAll(where: {$0 == name})
                    
                    if arraySuggestedUsers.isEmpty  {
                        isSuggestedExpanded = false
                    }
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

struct ProfileImageContainerView : View {
    @State private var selectedIndex = 0
    @State private var segmentOffset:CGFloat = 0
    @Binding var topHeaderOffset:CGFloat
    var body: some View {
        VStack(spacing:0) {
            
            GeometryReader { scrollOffset -> AnyView in
                let offset = scrollOffset.frame(in:.global).minY
                DispatchQueue.main.async {
                    let diff =  offset - topHeaderOffset - ProfileView.header_ScrollTopPadding / 2
                    
                    self.segmentOffset = max(-diff,0)
                }
                
               return AnyView(
                    topSegmentControlView
                        .frame(height:50)
                        .background(Color.white)
                        .offset(y:self.segmentOffset)

                )
            }
            .frame(height:50)
            .zIndex(4)
            
            
            
            ZStack {
                imageGalleryView
            }
        }
    }
    
    var imageGalleryView : some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible(),spacing: 2), count: 3), alignment: .leading, spacing: 2) {
            
            ForEach(1..<80) { i in
                GeometryReader {proxy in
                    let width = proxy.frame(in: .global).width
                    Image("sample\(4)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: width, height: 120)
                        .cornerRadius(0)
                    //                            .frame(height:120)
                }
                .frame(height:120)
            }
            
        }
    }
    
    var topSegmentControlView : some View {
        GeometryReader { proxy in
            
            HStack(spacing:0) {
                
                Group {
                    Button(action: {
                        withAnimation {
                            selectedIndex = 0
                        }
                    }, label: {
                        
                        Image(systemName: "rectangle.split.3x3")
                    })
                    Button(action: {
                        withAnimation {
                            selectedIndex = 1
                        }
                    }, label: {
                        Image(systemName: "play.rectangle")
                        
                    })
                    
                    Button(action: {
                        withAnimation {
                            selectedIndex = 2
                        }
                    }, label: {
                        Image(systemName: "bolt.circle")
                        
                    })
                    
                    Button(action: {
                        withAnimation {
                            selectedIndex = 3
                        }
                    }, label: {
                        Image(systemName: "person.crop.square")
                        
                    })
                    
                }
                .frame(height:40)
                .frame(maxWidth:.infinity)
                .font(.title2)
                .foregroundColor(.primary)
                .padding(.bottom,4)
                
                
            }
            .frame(maxWidth:.infinity,alignment: .leading)
            .background(
                
                RoundedRectangle(cornerRadius: 2)
                    .fill(Color.primary)
                    
                    .frame(height:3)
                    .frame(width:                        proxy.frame(in: .local).width / 4,alignment: .leading)
                    .offset(x:getOffset(totalWidth: proxy.frame(in: .local).width))
                    
                
                ,alignment: .bottomLeading
            )
            
        }

    }
    
    func getOffset(totalWidth:CGFloat) -> CGFloat  {
        return (totalWidth / 4)  * CGFloat(selectedIndex)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}




