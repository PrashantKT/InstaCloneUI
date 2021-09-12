//
//  LoginViewModel.swift
//  InstagramClone
//
//  Created by Prashant Tukadiya on 24/03/21.
//

import Combine
import SwiftUI




class LoginViewModel:ObservableObject {
    
    enum InputValidations:Error{
        case invalidEmailAddress
        case passwordLengthError
        case emptyField(message:String)
    }
    
    @Published var loginEmail:String = ""
    @Published var loginPassword:String = ""
    
    @Published var isShowHomeScreen = false
    
    @Published var needToShowAlert = false
    @Published var alertMessage = ""
    @Published var isShowSheet = false // LOGIN SHEET

    @AppStorage("isLoggedIn") var isLoggedIn = false

    
    func checkValidationsLoginWithEmailPasword() -> Result<Bool,InputValidations>{
        
        
        if loginEmail.isEmpty  {
            return .failure(.emptyField(message: "Email can not be empty"))
        }
        
        if loginPassword.isEmpty {
            return .failure(.emptyField(message: "Please enter password to login"))
        }
    
        return.success(true)
        
        
    }
    
    func clean() {
        loginEmail = ""
        loginPassword = ""
    }
    
    
    func loginTapped()  {
        
        if loginEmail == "prashant@iosdev.com" && loginPassword == "1234" {
            withAnimation(.easeOut) {
                isShowSheet = false
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
                withAnimation(.spring()) {
                    isShowHomeScreen = true
                    isLoggedIn = true
                }
            }
        } else {
            isShowHomeScreen = false
            alertMessage = "Login Failed !!"
            needToShowAlert = true
        }
    }
}
