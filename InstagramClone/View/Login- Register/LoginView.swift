//
//  LoginView.swift
//  InstagramClone
//
//  Created by Prashant Tukadiya on 22/03/21.
//

import SwiftUI


let screenSize = UIScreen.main.bounds

enum SheetType {
    case loginSheet
    case signupSheet
}

struct LoginView: View {
    
    @State private var sheetType:SheetType = .loginSheet
    @EnvironmentObject  var loginViewModel:LoginViewModel
    @State private var alertLoginFB = false
    
    var body: some View {
        ZStack {
            LoginHomeScreenView(alertLoginFB: $alertLoginFB,sheetType: $sheetType, isShowSheet: $loginViewModel.isShowSheet)
                .fullScreenCover(isPresented: $loginViewModel.isShowSheet, content: {
                    switch self.sheetType{
                    case .loginSheet:
                        LoginEmailPasswordView( isShowEmailPasswordView: $loginViewModel.isShowSheet)
                            .environmentObject(loginViewModel)
                            .alert(isPresented: $loginViewModel.needToShowAlert, content: {
                               Alert(title: Text("Alert"), message: Text(loginViewModel.alertMessage), dismissButton:Alert.Button.default(Text("OK") ))
                           })
                        
                    case .signupSheet:
                        SignupWithEmailPasswordView(isShowSignupEmailPasswordView: $loginViewModel.isShowSheet)
                            .environmentObject(loginViewModel)
                            .alert(isPresented: $loginViewModel.needToShowAlert, content: {
                               Alert(title: Text("Alert"), message: Text(loginViewModel.alertMessage), dismissButton:Alert.Button.default(Text("OK") ))
                           })
                        
                    }
                })
        }
       
    }
}

struct LoginHomeScreenView:View {
    @Binding var alertLoginFB:Bool
    @Binding var  sheetType:SheetType
    @Binding  var isShowSheet: Bool
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.yellowLightInsta,.orangeLightInsta,.pinkLightInsta,.purpleLightInsta,.blueLightInsta]), startPoint: .top, endPoint: .bottom)
            
            VStack {
                VStack(spacing:16) {
                    Text("Instagram")
                        .font(.system(size: 44))
                        .fontWeight(.medium)
                    
                    Text("Signup to see photos and video \n from your friends ")
                        .font(.callout)
                }
                .padding(.top,screenSize.height * 0.18)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                
                VStack(spacing:20) {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(maxWidth:.infinity)
                        .frame(height: 70)
                        .foregroundColor(.white)
                        .overlay(
                            HStack(alignment: .center){
                                Image("fb").resizable()
                                    .frame(width: 30, height: 30)
                                Text("Login with Facebok")
                                    .foregroundColor(.blueLightInsta)
                                    .font(.title3)
                            }
                        )
                        .padding(.top,screenSize.height * 0.1)
                        .padding([.leading,.trailing],40)
                        .contentShape(Rectangle())
                        .shadow(color: Color.black.opacity(0.2), radius: 1, x: 1, y: 1)
                        .shadow(color: Color.white.opacity(0.2), radius: 1, x: -1, y: -1)
                        
                        .onTapGesture {
                            self.alertLoginFB.toggle()
                        }
                    
                    Text("or")
                        .foregroundColor(.white)
                        .font(.title3)
                    
                    Button(action: {
                        withAnimation {
                            self.sheetType = .signupSheet
                            isShowSheet.toggle()
                            
                        }
                    }, label: {
                        Text("Signup with email or Phone number")
                            .foregroundColor(.white)
                    })
                    
                }
                
                Spacer()
                
//
                Rectangle()
                    .frame(maxWidth:.infinity)
                    .frame(height:90)
                    .foregroundColor(Color.white.opacity(0.2))
                    .overlay(
                        VStack {
                            Divider()
                            Spacer()
                            Text("Already have an account? SignIn")
                                .font(.subheadline)
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            withAnimation {
                                self.sheetType = .loginSheet
                                isShowSheet.toggle()
                            }
                        }
                    )
                    .padding(.bottom,UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0)
//

                
                
            }.alert(isPresented: $alertLoginFB, content: {
                Alert(title: Text("Coming Soon"), message: Text("This feature is not availble right now"), dismissButton: .cancel())
                
            })
            
            
        }.edgesIgnoringSafeArea(.all)
    }
}


struct LoginEmailPasswordView: View {
    
    @EnvironmentObject  var loginViewModel:LoginViewModel
    
    @Environment(\.colorScheme) var colorScheme
    @State private var email = ""
    @State private var showPassword = false
    @Binding var isShowEmailPasswordView:Bool
    var body: some View {
        ZStack(alignment:.topLeading) {
            //  Color.white
            
            HStack {
                Button(action: {
                    withAnimation{
                        loginViewModel.clean()
                        isShowEmailPasswordView.toggle()
                    }
                }, label: {
                    Image(systemName: "chevron.backward")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 22, height: 22)
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                })
                Spacer()
            }
            .overlay(
                Text("Login")
                    .font(.title)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
            )
            .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top ?? 22)
            .padding()
            
            
            VStack(spacing:30) {
                
                Spacer()
                
                TextField("Email address", text: $loginViewModel.loginEmail)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .autocapitalization(.none)
                    .textContentType(.emailAddress)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(colorScheme == .dark ? Color.white : Color.black,lineWidth: 1))
                
                // .textFieldStyle(RoundedBorderTextFieldStyle())
                
                HStack {
                    if !showPassword {
                        SecureField("Password", text: $loginViewModel.loginPassword)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                        
                    } else {
                        TextField("Password", text: $loginViewModel.loginPassword)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                        
                    }
                    
                    Button(action: {
                        
                        showPassword.toggle()
                        
                    }, label: {
                        Image(systemName: !showPassword ?  "eye" : "eye.slash")
                            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                    })
                    
                }
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(colorScheme == .dark ? Color.white : Color.black,lineWidth: 1))
                
                
                
                Button(action: {
                    loginViewModel.loginTapped()
                    
                }, label: {
                    
                    Text("Login")
                        .foregroundColor(.white)
                        .font(.title3)
                        .bold()
                        .padding()
                        .frame(maxWidth:.infinity)
                        .background(
                            LinearGradient(gradient: Gradient(colors: [.yellowLightInsta,.orangeLightInsta,.purpleLightInsta,.blueLightInsta]), startPoint: .trailing, endPoint: .leading)
                                .cornerRadius(22)
                            
                        )
                    
                })
                
                Spacer()
                
            }
            .background(Color.clear)
            .padding()
            
            
            
        }
        .frame(maxHeight:.infinity)
        .edgesIgnoringSafeArea(.all)
    }
}


struct SignupWithEmailPasswordView: View {
    
    @EnvironmentObject  var loginViewModel:LoginViewModel
    
    @Environment(\.colorScheme) var colorScheme
    @State private var email = ""
    @State private var showPassword = false
    @Binding var isShowSignupEmailPasswordView:Bool
    
    @State private var confirmPassword = ""
    
    var body: some View {
        ZStack(alignment:.topLeading) {
            //  Color.white
            
            HStack {
                Button(action: {
                    withAnimation{
                        loginViewModel.clean()
                        isShowSignupEmailPasswordView.toggle()
                    }
                }, label: {
                    Image(systemName: "chevron.backward")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 22, height: 22)
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                })
                Spacer()
            }
            .overlay(
                Text("Signup")
                    .font(.title)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
            )
            .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top ?? 22)
            .padding()
            
            
            VStack(spacing:30) {
                
                Spacer()
                
                TextField("Email address", text: $loginViewModel.loginEmail)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .padding()
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(colorScheme == .dark ? Color.white : Color.black,lineWidth: 1))
                
                // .textFieldStyle(RoundedBorderTextFieldStyle())
                
                SecureField("New Password", text: $loginViewModel.loginPassword)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(colorScheme == .dark ? Color.white : Color.black,lineWidth: 1))
                
                
                SecureField("Confirm Password", text: $confirmPassword)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(colorScheme == .dark ? Color.white : Color.black,lineWidth: 1))
                
                Button(action: {}, label: {
                    
                    Text("Signup")
                        .foregroundColor(.white)
                        .font(.title3)
                        .bold()
                        .padding()
                        .frame(maxWidth:.infinity)
                        .background(
                            LinearGradient(gradient: Gradient(colors: [.yellowLightInsta,.orangeLightInsta,.purpleLightInsta,.blueLightInsta]), startPoint: .trailing, endPoint: .leading)
                                .cornerRadius(22)
                            
                        )
                    
                })
                
                Spacer()
                
            }
            .background(Color.clear)
            .padding()
            
            
            
        }
        .frame(maxHeight:.infinity)
        .edgesIgnoringSafeArea(.all)
    }
}



struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginView()
            LoginView()
                .previewDevice("iPhone 8")
            SignupWithEmailPasswordView( isShowSignupEmailPasswordView: .constant(true)).environmentObject(LoginViewModel())
        }
    }
}
