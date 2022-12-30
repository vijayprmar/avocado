//
//  AppView.swift
//  AVOCADO
//
//  Created by Vijay Parmar on 27/12/22.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView{
            AvocadoView()
                .tabItem({
                    Image("tabicon-branch")
                    Text("Avocados")
                })
            
            ContentView()
                .tabItem({
                    Image("tabicon-book")
                    Text("Recipes")
                })
            
            RipeningStagesView()
                .tabItem({
                    Image("tabicon-avocado")
                    Text("Ripening")
                })
            SettingsView()
                .tabItem({
                    Image("tabicon-settings")
                    Text("Settings")
                })
            
        }
        .accentColor(Color.primary)
        
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
