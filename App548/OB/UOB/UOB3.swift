//
//  UOB3.swift
//  App548
//
//  Created by DJUROM on 18/05/2024.
//

import SwiftUI

struct UOB3: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                Image("UOB3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .ignoresSafeArea()
            
            VStack {
                
                Text("Don’t miss anything")
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding(.top)
                
                Spacer()
                
                Button(action: {
                    
                    
                    
                }, label: {
                    
                    Text("Enable notifications")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("p")))
                })
                
            }
            .padding()
            
            VStack {
                
                Button(action: {
                    
                    
                    
                }, label: {
                    
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                        .font(.system(size: 12, weight: .regular))
                        .padding(5)
                        .background(Circle().fill(.white))
                })
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
                Spacer()
            }
        }
    }
}

#Preview {
    UOB3()
}
