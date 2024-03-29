//
//  ContentView.swift
//  LoginPage
//
//  Created by  Mr.Ki on 04.06.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var index = 0
    
    var body: some View {
        GeometryReader { _ in
            VStack {
                Spacer()
                Image("travel")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .shadow(color: Color("Color1").opacity(0.4), radius: 15, x: 5, y: -5)
                Spacer()
                ZStack {
                    SignUp(index: self.$index)
                        .zIndex(Double(self.index))
                    Login(index: self.$index)
                       // .zIndex(Double(self.index))
                }
                Spacer()
                HStack(spacing: 15) {
                    Rectangle()
                        .fill(Color("Color1"))
                        .frame(height: 1)
                    Text("OR")
                    Rectangle()
                        .fill(Color("Color1"))
                        .frame(height: 1)
                } .padding(.horizontal, 30)
                    .padding(.top, 50)
                
                HStack(spacing: 25) {
                    Button {
                        //
                    } label: {
                        Image("globe")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 50, height: 50)
                            .shadow(color: Color("Color1").opacity(0.2), radius: 15, x: 5, y: -5)
                    }
                    
                    Button {
                        //
                    } label: {
                        Image("balloon")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 50, height: 50)
                            .shadow(color: Color("Color1").opacity(0.2), radius: 15, x: 5, y: -5)
                    }
                    
                    Button {
                        //
                    } label: {
                        Image("navigation")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 50, height: 50)
                            .shadow(color: Color("Color1").opacity(0.2), radius: 15, x: 5, y: -5)
                    }
                    
                   
                }
              //  .padding(.top, 30)
              //  .padding(.bottom, 30)
            }
            .padding(.vertical)
        }
        .background(Color("Color"))
        .preferredColorScheme(.dark)
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CShape: Shape {
    func path(in rect: CGRect) -> Path {
        
        return Path {
            path in
            path.move(to: CGPoint(x: rect.width, y: 100))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: 0))
            
        }
    }
}

struct CShapeOne: Shape {
    func path(in rect: CGRect) -> Path {
        
        return Path {
            path in
            path.move(to: CGPoint(x: 0, y: 100))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            
        }
    }
}

struct Login: View {
    @State var email = ""
    @State var pass = ""
    @Binding var index: Int
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                HStack {
                    VStack(spacing: 10) {
                        Text("Login")
                            .foregroundColor(self.index == 0 ? .white : .gray)
                            .font(.title)
                            .fontWeight(.bold)
                        Capsule()
                            .fill(self.index == 0 ? Color("Color1") : Color.clear)
                            .frame(width: 100, height: 5)
                    }
                    
                    Spacer()
                    
                }.padding(.top, 30)
                
                VStack {
                    HStack(spacing: 15) {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color("Color1"))
                        TextField("Email", text: self.$email)
                    }
                    
                    Divider()
                        .background(Color.white.opacity(0.5))
                } .padding(.horizontal)
                    .padding(.top, 40)
                
                VStack {
                    HStack(spacing: 15) {
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color("Color1"))
                        SecureField("Password", text: self.$pass)
                    }
                    
                    Divider()
                        .background(Color.white.opacity(0.5))
                } .padding(.horizontal)
                    .padding(.top, 30)
                
                HStack {
                    Spacer(minLength: 0)
                    Button {
                        //
                    } label: {
                        Text("Forget password?")
                            .foregroundColor(Color.white.opacity(0.6))
                    }
                }.padding(.horizontal)
                    .padding(.top, 30)
                
                
            } .padding()
                .padding(.bottom, 65)
                .background(Color("Color2"))
                .clipShape(CShape())
                .contentShape(CShape())
                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
                .onTapGesture {
                    self.index = 0
                }
                .cornerRadius(35)
                .padding(.horizontal, 20)
            
            Button {
                //
            } label: {
                Text("Login")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color("Color1"))
                    .clipShape(Capsule())
                    .shadow(color: Color("Color1").opacity(0.4), radius: 15, x: 5, y: -5)
            }
            .offset(y: 35)
            .opacity(self.index == 0 ? 1 : 0)
        }
    }
}

struct SignUp: View {
    @State var email = ""
    @State var pass = ""
    @State var repass = ""
    @Binding var index: Int
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                HStack {
                    Spacer(minLength: 0)
                    
                    VStack(spacing: 10) {
                        Text("SignUp")
                            .foregroundColor(self.index == 1 ? .white : .gray)
                            .font(.title)
                            .fontWeight(.bold)
                        Capsule()
                            .fill(self.index == 1 ? Color("Color1") : Color.clear)
                            .frame(width: 100, height: 5)
                    }
                    
                }
                .padding(.top, 30)
                
                VStack {
                    HStack(spacing: 15) {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color("Color1"))
                        TextField("Email", text: self.$email)
                    }
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 40)
                
                VStack {
                    HStack(spacing: 15) {
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color("Color1"))
                        SecureField("Password", text: self.$pass)
                    }
                    Divider()
                        .background(Color.white.opacity(0.5))
                }.padding(.horizontal)
                    .padding(.top, 30)
                
                VStack {
                    HStack(spacing: 15) {
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color("Color1"))
                        SecureField("Password", text: self.$repass)
                    }
                    Divider().background(Color.white.opacity(0.5))
                }.padding(.horizontal)
                    .padding(.top, 30)
                
            }
            
            .padding()
            .padding(.bottom, 65)
            .background(Color("Color2"))
            .clipShape(CShapeOne())
            .contentShape(CShapeOne())
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
            .onTapGesture {
                self.index = 1
            }
            .cornerRadius(35)
            .padding(.horizontal, 20)
            Button {
                //
            } label: {
                Text("SignUp")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color("Color1"))
                    .clipShape(Capsule())
                    .shadow(color: Color("Color1").opacity(0.4), radius: 15, x: 5, y: -5)
            }
            .offset(y: 25)
            .opacity(self.index == 1 ? 1 : 0)
        }
    }
    
    
}
