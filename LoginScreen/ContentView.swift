//
//  ContentView.swift
//  LoginScreen
//
//  Created by rkedlor on 5/26/20.
//  Copyright © 2020 rkedlor. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @State var user = ""
  @State var pass = ""
  @State var login = false
  @State var signup = false
  var body: some View {
    ZStack{
      
      LinearGradient(gradient: .init(colors: [Color("1"),Color("2")]),startPoint: .leading, endPoint: .trailing).edgesIgnoringSafeArea(.all)
      Login(login: $login, signup: $signup, user: $user, pass: $pass)

    }/**ZstackEnd**/
      .alert(isPresented: $login) {
        return Alert(title: Text(self.user), message: Text(self.pass), dismissButton: .none)
      }
    .sheet(isPresented: $signup){
      signUp(signup: self.$signup)
    }
    /**ZStackStyleEnd**/
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Login : View {
  @Binding var login : Bool
  @Binding var signup : Bool
  @Binding var user : String
  @Binding var pass : String
  var body : some View{
    VStack(alignment: .center, spacing: 22, content: {
      
      Image("twitter").resizable().frame(width: 80, height: 80).padding(.bottom,15)
      HStack{
        
        Image(systemName:"person.fill").resizable().frame(width:20,height:20)
        TextField("Username",text:$user).padding(.leading,12).font(.system(size:20))
        
      }/**HStackEnd**/
        .padding(12)
        .background(Color("3"))
        .cornerRadius(20)
      /**HStackStyleEnd**/
      
      HStack{
        Image(systemName:"lock.fill").resizable().frame(width:15,height:15).padding(.leading,3)
        SecureField("Password",text:$pass).padding(.leading,12).font(.system(size:20))
      }/**HStackEnd**/
        .padding(12)
        .background(Color("3"))
        .cornerRadius(20)
      /**HStackStyleEnd**/
      
      Button(action: {
        self.login.toggle()
      }){
        Text("Login").foregroundColor(.white).padding()
          .frame(width:150)
      }/**ButtonEnd**/
        .background(
          LinearGradient(gradient: .init(colors: [Color("1"),Color("2")]),startPoint: .leading, endPoint: .trailing)
            .cornerRadius(20))
        .shadow(radius:25)
      /**ButtonStyleEnd**/
      
      Button(action: {
        
      }){
        return Text("Forget password?").foregroundColor(.white)
      }
      
      VStack{
        Text("Dont have account yet").foregroundColor(.white)
        Button(action: {
          self.signup.toggle()
        }){
          Text("SignUp").foregroundColor(.white).padding()
            .frame(width:150)
        }/**ButtonEnd**/
          .background(
            LinearGradient(gradient: .init(colors: [Color("1"),Color("2")]),startPoint: .leading, endPoint: .trailing)
              .cornerRadius(20))
          .shadow(radius:25)
        /**ButtonStyleEnd**/
        
        
      }/**VStackEnd**/
        .padding(.top,35)
      /**VStackStyleEnd**/
      
      
    })/**VstackEnd*/
      .padding(.horizontal,18)
    /**VStackStyleEnd**/
    
  }
}

struct signUp : View {
  @Binding var signup : Bool
  @State var user : String = ""
  @State var pass : String = ""
  @State var repass : String = ""
  var body : some View {
    ZStack{
      LinearGradient(gradient: .init(colors: [Color("1"),Color("2")]),startPoint: .leading, endPoint: .trailing).edgesIgnoringSafeArea(.all)
      VStack(alignment: .center, spacing: 22, content: {
        
        Image("twitter").resizable().frame(width: 80, height: 80).padding(.bottom,15)
        HStack{
          
          Image(systemName:"person.fill").resizable().frame(width:20,height:20)
          TextField("Username",text:$user).padding(.leading,12).font(.system(size:20))
          
        }/**HStackEnd**/
          .padding(12)
          .background(Color("3"))
          .cornerRadius(20)
        /**HStackStyleEnd**/
        
        HStack{
          Image(systemName:"lock.fill").resizable().frame(width:15,height:15).padding(.leading,3)
          SecureField("Password",text:$pass).padding(.leading,12).font(.system(size:20))
        }/**HStackEnd**/
          .padding(12)
          .background(Color("3"))
          .cornerRadius(20)
        /**HStackStyleEnd**/
        
        HStack{
          Image(systemName:"lock.fill").resizable().frame(width:15,height:15).padding(.leading,3)
          SecureField("Re-Password",text:$repass).padding(.leading,12).font(.system(size:20))
        }/**HStackEnd**/
          .padding(12)
          .background(Color("3"))
          .cornerRadius(20)
        /**HStackStyleEnd**/
        
        Button(action: {
          self.signup.toggle()
        }){
          Text("SignUp").foregroundColor(.white).padding()
            .frame(width:150)
        }/**ButtonEnd**/
          .background(
            LinearGradient(gradient: .init(colors: [Color("1"),Color("2")]),startPoint: .leading, endPoint: .trailing)
              .cornerRadius(20))
          .shadow(radius:25)
        /**ButtonStyleEnd**/
        
        
      })/**VstackEnd*/
        .padding(.horizontal,18)
      /**VStackStyleEnd**/
    }
  }
}
