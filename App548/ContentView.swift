//
//  ContentView.swift
//  App548
//
//  Created by DJUROM on 18/05/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var current_tab: Tab = Tab.Profile

    @AppStorage("status") var status: Bool = false
    
    init() {
        
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            if status {
                
                VStack(spacing: 0, content: {
                    
                    TabView(selection: $current_tab, content: {
                        
                        ProfileView()
                            .tag(Tab.Profile)
                        
                        TrainingView()
                            .tag(Tab.Training)
                        
                        DietsView()
                            .tag(Tab.Diets)
                        
                        SettingsView()
                            .tag(Tab.Settings)
                        
                    })
                    
                    TabBar(selectedTab: $current_tab)
                })
                .ignoresSafeArea(.all, edges: .bottom)
                .onAppear {
                    
                    
                }
                
            } else {
                
                ROB1()
            }
        }
    }
}

#Preview {
    ContentView()
}
