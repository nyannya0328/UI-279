//
//  ContentView.swift
//  UI-279
//
//  Created by nyannyan0328 on 2021/08/03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View{
    
    var body: some View{
        
        ZStack{
            
            LinearGradient(colors: [
                
                Color("BG1"),
                Color("BG2"),
            
            
            ], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            
            GeometryReader{proxy in
                
                let size = proxy.size
                
                Color.black.opacity(0.3).blur(radius: 200).ignoresSafeArea()
                
                
                Circle()
                    .fill(Color("LightBlue"))
                    .padding(50)
                    .blur(radius: 120)
                    .offset(x: -size.width / 1.7, y: -size.height / 1.8)
                
                Circle()
                    .fill(Color("LightBlue"))
                    .padding(50)
                    .blur(radius: 90)
                    .offset(x: size.width / 1.7, y: -size.height / 1.8)
                
                Circle()
                    .fill(Color.red.opacity(0.3))
                    .padding(50)
                    .blur(radius: 90)
                    .offset(x: size.width / 1.7, y: size.height / 1.8)
                
                Circle()
                    .fill(Color.red.opacity(0.3))
                    .padding(50)
                    .blur(radius: 120)
                    .offset(x: size.width / 1.7, y: size.height / 1.8)
                
                Circle()
                    .fill(Color("LightBlue"))
                    .padding(50)
                    .blur(radius: 90)
                    .offset(x: -size.width / 1.7, y: size.height / 1.8)
                
            }
            
            VStack{
                
                Spacer(minLength: 10)
                
                ZStack{
                    
                    Circle()
                        .fill(Color("Purple"))
                        .blur(radius: 50)
                        .frame(width: 100, height: 100)
                        .offset(x:divice() == .ipad ? 280 :80, y:divice() == .ipad ? -250 : -120)
                    
                    Circle()
                        .fill(Color("LightBlue"))
                        .blur(radius: 50)
                        .frame(width: 100, height: 100)
                        .offset(x:divice() == .ipad ? -280 :-75, y:divice() == .ipad ? 250 : 120)
                    
                    GrassMorphickCard()
                }
                .frame(width: divice() == .ipad ? 500 : 0, height: divice() == .ipad ? 500 : 0)
                
                
                Spacer(minLength: 10)
                
           
                
                
                Text("Know Everything\nabout the weather")
                    .font(.system(size: UIScreen.main.bounds.height < 750 ? 20 : 30, weight: .bold))
                
                Text(getAttribute())
                    .font(.system(size: 30))
                    .fontWeight(.semibold)
                    .kerning(1.3)
                    .padding(.top,5)
                
                
                Button {
                    
                } label: {
                    
                    Text("Get Started")
                        .font(.title.italic())
                        .padding(.vertical,18)
                        .frame(maxWidth:.infinity)
                        .background(
                        
                        LinearGradient(colors: [
                        
                            .red,
                            .green
                        
                        ], startPoint: .leading, endPoint: .trailing)
                        
                        ,in: RoundedRectangle(cornerRadius: 10)
                        
                        )
                    
                }
                .padding(.horizontal,50)
                .padding(.vertical,10)
                
                Button {
                    
                } label: {
                    Text("Alredy have an Account?")
                        .font(.title3.italic())
                        .foregroundColor(.gray)
                        .underline()
                }


                
                    
            }
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .padding()
            
            
        }
    }
    
    func getAttribute()->AttributedString{
        
        var atR = AttributedString("The most beautiful Image for unsplash")
        atR.foregroundColor = .gray
        
        if let range = atR.range(of: "unsplash"){
            
            
            atR[range].foregroundColor = .purple
            atR[range].link = URL(string: "https://unsplash.com")
            
            
          
            
            
            
        }
        return atR
    }
}

struct GrassMorphickCard : View{
    
    var body: some View{
        
        let widht = UIScreen.main.bounds.width
        
        ZStack{
            
            RoundedRectangle(cornerRadius: 10)
                .fill(.white.opacity(0.1))
                .frame(width:widht / 1.7, height: divice() == .ipad ? 500 : 270)
                .background(
                
                    Color.white.opacity(0.08)
                        .blur(radius: 10)
                        
                
                )
                .background(
                
                
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(
                        
                        
                        LinearGradient(colors: [
                        
                            
                            Color("Purple"),
                            
                            Color("Purple").opacity(0.3),
                            .clear,
                            .clear,
                            Color("LightBlue")
                        
                        
                        ], startPoint: .topLeading, endPoint: .bottomTrailing)
                        ,lineWidth: 2.5
                        
                        
                        
                        )
                        .padding(2)
                        
                
                )
            
                .shadow(color: .black.opacity(0.2), radius: 5, x: -5, y: -5)
                .shadow(color: .black.opacity(0.2), radius: 5, x: 5, y: 5)
            
            VStack{
                
                Image(systemName: "sun.min")
                    .font(.system(size: 90, weight: .ultraLight))
                    .foregroundColor(.red)
                
                
                Text("35")
                    .font(.system(size: 60, weight: .bold))
                    .foregroundColor(.white)
                    .overlay(
                        
                        
                    Text("°C")
                        .font(.title2.bold())
                        .padding(5)
                        .foregroundColor(.purple)
                        .background(
                        
                        Circle()
                            .stroke(.black,lineWidth: 3)
                            
                        
                        )
                        .offset(x: 35, y: -10)
                    
                    
                    ,alignment: .topTrailing
                    
                    )
                    .offset(x: -5)
                    
                
                
            }
           
            
            
        }
       
    }
}

extension View{
    
    func divice() -> getDevice{
        
        
#if os(iOS)
        
        if UIDevice.current.model.contains("iPad"){
        
        return .ipad
    }
        else{
            
           return .iphone
        }
        
        #endif
    }
}

enum getDevice{
    
    case iphone
    case ipad
}
