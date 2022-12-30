//
//  RecipeDetailView.swift
//  AVOCADO
//
//  Created by Vijay Parmar on 29/12/22.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    @State private var pulsate:Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        ScrollView(.vertical,showsIndicators: false) {
            VStack(alignment: .center,spacing: 0){
                Image(recipe.image)
                    .resizable()
                    .scaledToFit()
                
                Group{
                    //Title
                    Text(recipe.title)
                        .font(.system(.largeTitle,design: .serif))
                        .fontWeight(.bold)
                        .foregroundColor(Color("ColorGreenAdaptive"))
                        .multilineTextAlignment(.center)
                        .padding(.top, 10.0)
                    
                    //Rating
                    RecipeRatingView(recipe: recipe)
                    //Cooking
                    RecipeCookingView(recipe: recipe)
                    //Ingredients
                    Text("Ingredients")
                        .modifier(TitleModifier())
                        .fontWeight(.bold)
                    
                    VStack(alignment: .leading,spacing: 5){
                        ForEach(recipe.ingredients,id:\.self) { item in
                            VStack(alignment: .leading,spacing: 5){
                                Text(item)
                                    .font(.footnote)
                                    .multilineTextAlignment(.leading)
                                Divider()
                            }
                        }
                    }
                    
                    
                    //Instructions
                    Text("Instructions")
                        .modifier(TitleModifier())
                        .fontWeight(.bold)
                    
                    ForEach(recipe.instructions,id:\.self) { item in
                        VStack(alignment: .center,spacing: 5){
                            
                            Image(systemName: "chevron.down.circle")
                                .resizable()
                                .frame(width: 42, height: 42, alignment: .center)
                                .imageScale(.large)
                                .font(Font.title.weight(.ultraLight))
                                .foregroundColor(Color("ColorGreenAdaptive"))
                            
                            Text(item)
                                .lineLimit(nil)
                                .font(.system(.body,design: .serif))
                                .multilineTextAlignment(.center)
                                .frame(minHeight:100)
                            
                        }
                    }
                }
                .padding(.horizontal,24)
                .padding(.vertical,12)
            }
            
        }
        .edgesIgnoringSafeArea(.all)
        .overlay {
            HStack {
                Spacer()
                VStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.down.circle.fill")
                            .font(.title)
                            .foregroundColor(.white)
                            .shadow(radius: 4)
                            .opacity(self.pulsate ? 1 : 0.6)
                            .scaleEffect(self.pulsate ? 1.2 : 0.8, anchor:.center)
                            .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true),value:pulsate)
                        
                    }).padding(.trailing,20)
                        .padding(.top,24)
                    
                    Spacer()
                }
            }.onAppear(){
                self.pulsate.toggle()
            }
            
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: recipesData[0])
    }
}
