//
//  MessageView.swift
//  InstagramClone
//
//  Created by Prashant Tukadiya on 21/03/21.
//

import SwiftUI

struct MessageView: View {
    
    @Binding var selectedIndex:Int
    @State private var search = ""
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        
        VStack(alignment:.leading) {
            HeaderViewCommonView(handler: { (action) in
                switch action {
                    
                case .back:
                    self.selectedIndex = 1
                case .right1:
                    break
                case .right2:
                    break
                }
            }, title: "Chat", rightImage1: "video", rightImage2: "square.and.pencil")
            .padding()
            
            HStack {
                Image(systemName: "magnifyingglass")
                
                TextField("Search", text: $search)
            }
            .padding()
            .background(
                colorScheme == .dark ?
                    Color.black.opacity(0.5)
                    : Color(UIColor.quaternaryLabel) .opacity(0.8)
            )
            .clipShape(Capsule())
            
            Text("Messages")
                .bold()
                .font(.title3)
                .padding()
                .foregroundColor(.primary)
            
            ScrollView {
                LazyVStack {
                    ForEach(0 ..< 24) { i in
                        MessaageCell()
                    }
                }
            }
            
            
            Spacer()
        }
        
    }
}

struct MessaageCell : View {
    var body: some View {
        
        
        HStack(spacing:12) {
            Button(action: {}, label: {
                
                Image("sample1").resizable()
                    .frame(width: 44, height: 44)
                    .scaledToFill()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(LinearGradient([.red,.yellow]),lineWidth: 2))
            })
            VStack(alignment:.leading,spacing:5) {
                Text("Prashant Tukadiya")
                    .font(.headline)
                Text("You shared a post - 1h")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
            
            Button(action: {}, label: {
                Image(systemName: "camera")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.primary)
                    .frame(width: 30, height: 30)
            })
        }
        .frame(maxWidth:.infinity)
        .padding()
        
        
        
    }
}

struct HeaderViewCommonView :View {
    internal init(handler: @escaping HeaderViewCommonView.HeaderViewCommonAction, title: String, rightImage1: String, rightImage2: String) {
        self.handler = handler
        self.title = title
        self.rightImage1 = rightImage1
        self.rightImage2 = rightImage2
    }
 
    enum CommonHeaderAction {
        case back
        case right1
        case right2
    }

    typealias HeaderViewCommonAction = (_ action:CommonHeaderAction) -> Void
    
    let handler:HeaderViewCommonAction
    
    
    
    var title:String
    var rightImage1:String
    var rightImage2:String
    var body: some View {
        
        HStack {
            Button(action: {
                handler(.back)
            }, label: {
                Image(systemName: "arrow.backward")
                    .font(.title)
                    .foregroundColor(.primary)
            })
            
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .padding(.leading,8)
            
            Spacer()
            
            HStack(spacing:30) {
                
                Button(action: {
                    handler(.right1)

                }, label: {
                    Image(systemName: rightImage1)
                })
                
                Button(action: {
                    handler(.right2)

                }, label: {
                    Image(systemName: rightImage2)
                })
                
            }
            .font(.title)
            .foregroundColor(.primary)
            
        }
    }
}


struct HeaderViewCommonView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderViewCommonView(handler: { (action) in
            
        }, title: "Chat", rightImage1: "video", rightImage2: "square.and.pencil")
            .previewLayout(.sizeThatFits)
    }
}


struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(selectedIndex: .constant(2))
    }
}
