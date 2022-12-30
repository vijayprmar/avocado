//
//  RecipeCardView.swift
//  AVOCADO
//
//  Created by Vijay Parmar on 28/12/22.
//

import SwiftUI

struct RecipeCardView: View {
    
    var recipe:Recipe
    
    @State private var showModel:Bool = false
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            
            Image(recipe.image)
                .resizable()
                .scaledToFit()
                .overlay {
                    HStack {
                        Spacer()
                        VStack (){
                            Image(systemName: "bookmark")
                                .font(Font.title.weight(.light))
                                .foregroundColor(.white)
                                .imageScale(.small)
                            .shadow(color: Color("ColorBlackTransparentLight"), radius: 2,x: 0,y: 0)
                            .padding(.top,20)
                            .padding(.trailing,20)
                            Spacer()
                            
                        }
                    }
                    
                }
            
            VStack(alignment: .leading, spacing: 12) {
                //Title
                Text(recipe.title)
                    .font(.system(.title,design: .serif))
                    .fontWeight(.bold)
                    .foregroundColor(Color("ColorGreenMedium"))
                    .lineLimit(1)
                    
                //Headline
                Text(recipe.headline)
                    .font(.system(.body,design: .serif))
                    .foregroundColor(.gray)
                    .italic()
               
                RecipeRatingView(recipe: recipe)
                //Cooking
                RecipeCookingView(recipe: recipe)
                
                
                
            }
            .padding()
            .padding(.bottom,12)
            
            
        }
        .background(.white)
        .cornerRadius(12)
        .shadow(color: Color("ColorBlackTransparentLight"), radius: 8,x: 0,y: 0)
        .onTapGesture {
            self.showModel = true
        }
        .sheet(isPresented: self.$showModel) {
            RecipeDetailView(recipe: self.recipe)
        }
        
    }
}

struct RecipeCardView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCardView(recipe: recipesData[0])
            .previewLayout(.sizeThatFits)
    }
}
