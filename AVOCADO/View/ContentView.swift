//
//  ContentView.swift
//  AVOCADO
//
//  Created by Vijay Parmar on 26/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
            
            VStack(alignment: .center,spacing: 20) {
                ScrollView(.horizontal,showsIndicators: false) {
                    HStack(alignment: .top, spacing: 0) {
                        ForEach(headersData){item in
                            HeaderView(header: item)
                        }
                    }
                }
            
                Text("Avocado Dishes")
                    .fontWeight(.bold)
                    .modifier(TitleModifier())
                DishesView()
                    .frame(maxWidth: 640)
        
                Text("Avocado Facts")
                    .fontWeight(.bold)
                    .modifier(TitleModifier())
                
                ScrollView(.horizontal,showsIndicators: false){
                    HStack(alignment: .top, spacing: 60) {
                        ForEach(factsData){ item in
                            FactsView(fact: item)
                        }
                    }.padding(.vertical)
                        .padding(.leading,60)
                        .padding(.trailing,20)
                }
                
                Text("Avocados Recipes")
                    .modifier(TitleModifier())
                    .fontWeight(.bold)
                
                VStack(alignment: .center, spacing: 20) {
                    ForEach(recipesData) { item in
                        RecipeCardView(recipe: item)
                    }
                }.frame(maxWidth: 640)
                    .padding(.horizontal)
                
                //FooterView
                VStack(alignment: .center,spacing: 20) {
                    Text("All About Avocados")
                        .modifier(TitleModifier())
                        .fontWeight(.bold)
                    
                    Text("Everything you wanted to know about avocados but were too afraid to ask.")
                        .font(.system(.body,design: .serif))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .frame(minHeight: 60)
                }
                .frame(maxWidth: 640)
                .padding()
                .padding(.bottom,85)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .padding(0)
    }
}

struct TitleModifier:ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.system(.title,design: .serif))
           
            .foregroundColor(Color("ColorGreenAdaptive"))
            .padding(8)
    }
    
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
