//
//  ROB3.swift
//  App548
//
//  Created by DJUROM on 18/05/2024.
//

import SwiftUI

struct ROB3: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                Image("ROB3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .ignoresSafeArea()
            
            VStack {
                
                Text("Achieve sporting results")
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding(.top)
                    .padding(.horizontal, 30)
                
                Spacer()
                
                Button(action: {
                    
                    status = true
                    
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
    ROB3()
}
