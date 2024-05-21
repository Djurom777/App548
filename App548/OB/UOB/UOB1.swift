//
//  UOB1.swift
//  App548
//
//  Created by DJUROM on 18/05/2024.
//

import SwiftUI

struct UOB1: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                Image("UOB1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .ignoresSafeArea()
            
            VStack {
                
                Text("Explore your results in awesome way!")
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding(.top)
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    UOB2()
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
    UOB1()
}
