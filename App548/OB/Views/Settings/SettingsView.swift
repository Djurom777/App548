//
//  SettingsView.swift
//  App548
//
//  Created by DJUROM on 18/05/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Text("Settings")
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                Rectangle()
                    .fill(.white.opacity(0.2))
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 20) {
                        
                        Button(action: {
                            
                            guard let url = URL(string: "https://docs.google.com/document/d/1c0ehnDepVRJFRv3T92vSffnehrZr-gF9QagCptxcyDU/edit?usp=sharing") else { return }
                            
                            UIApplication.shared.open(url)
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "doc.text")
                                    .foregroundColor(Color("p"))
                                    .font(.system(size: 20, weight: .regular))
                                
                                Text("Usage Policy")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .medium))
                            }
                        })
                        
                        Rectangle()
                            .fill(.white.opacity(0.2))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        Button(action: {
                            
                            SKStoreReviewController.requestReview()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "star")
                                    .foregroundColor(Color("p"))
                                    .font(.system(size: 20, weight: .regular))
                                
                                Text("Rate Us")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .medium))
                            }
                        })
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color("bg2")))
                }
                
            }
            .padding()
        }
    }
}

#Preview {
    SettingsView()
}
