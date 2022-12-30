//
//  AvocadoView.swift
//  AVOCADO
//
//  Created by Vijay Parmar on 27/12/22.
//

import SwiftUI

struct AvocadoView: View {
    
    
    @State private var pulsateAnimation : Bool = false
    
    var body: some View {
        VStack{
            Spacer()
             Image("avocado")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 240,height: 240,alignment: .center)
                .shadow(color:Color("ColorBlackTransparentDark") , radius: 12,x: 0,y: 8)
                .scaleEffect(self.pulsateAnimation ? 1 : 0.9)
                .opacity(self.pulsateAnimation ? 1 : 0.9)
                .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: pulsateAnimation)
            
            VStack {
                Text("Avocado".uppercased())
                    .font(.system(size: 42,weight: .bold,design: .serif))
                    .foregroundColor(.white)
                    .padding()
                    .shadow(color:Color("ColorBlackTransparentDark"),radius: 4,x: 0,y: 4)
                
                Text("It’s little wonder there are so many health benefits when a single serve of avocado (1/4 or 50g) boasts healthy fats, fibre, folate, niacin, vitamins C, B5, E & K, potassium and antioxidants")
                    .lineLimit(nil)
                    .font(.system(.headline,design: .serif))
                    .foregroundColor(Color("ColorGreenLight"))
                    .multilineTextAlignment(.center)
                    .lineSpacing(8)
                    .frame(maxWidth: 640,minHeight: 120)
            }
            .padding()
            
            Spacer()
        }
        .background(
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
        )
        .edgesIgnoringSafeArea(.all)
        .onAppear(
        perform: {
            self.pulsateAnimation.toggle()
        }
        )
    }
}

struct AvocadoView_Previews: PreviewProvider {
    static var previews: some View {
        AvocadoView()
            .previewDevice("iPhone 11 Pro")
            .environment(\.colorScheme, .dark)
    }
}
