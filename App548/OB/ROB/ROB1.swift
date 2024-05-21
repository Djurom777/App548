//
//  ROB1.swift
//  App548
//
//  Created by DJUROM on 18/05/2024.
//

import SwiftUI

struct ROB1: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                Image("ROB1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .ignoresSafeArea()
            
            VStack {
                
                Text("Track your results in one App")
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding(.top)
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    ROB2()
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Next")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("p")))
                })
                
            }
            .padding()
        }
    }
}

#Preview {
    ROB1()
}
