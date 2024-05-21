//
//  DietInfo.swift
//  App548
//
//  Created by DJUROM on 20/05/2024.
//

import SwiftUI

struct DietInfo: View {

    @Environment(\.presentationMode) var router
    @StateObject var viewModel: DietsViewModel

    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text(viewModel.selectedDiet?.dName ?? "")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .medium))
                        .padding()
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(Color("p"))
                                .font(.system(size: 18, weight: .regular))
                            
                            Text("Back")
                                .foregroundColor(Color("p"))
                                .font(.system(size: 16, weight: .regular))
                        })
                        
                        Spacer()
                        
                    }
                }
                
                Rectangle()
                    .fill(.white.opacity(0.1))
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        Text("Name")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .medium))
                            .padding(.vertical)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text(viewModel.selectedDiet?.dName ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 55)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        
                        Text("Status")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .medium))
                            .padding(.top)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text(viewModel.selectedDiet?.dEat ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 55)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        
                        Text("Information")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .medium))
                            .padding(.top)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack {
                            
                            Text("Protein")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .regular))
                            
                            Spacer()
                            
                            Text(viewModel.selectedDiet?.dProtein ?? "")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .medium))
                            
                        }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 55)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        
                        HStack {
                            
                            Text("ProFattein")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .regular))
                            
                            Spacer()
                            
                            Text(viewModel.selectedDiet?.dFat ?? "")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .medium))
                            
                        }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 55)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        
                        HStack {
                            
                            Text("Carb")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .regular))
                            
                            Spacer()
                            
                            Text(viewModel.selectedDiet?.dCarb ?? "")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .medium))
                            
                        }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 55)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        
                        HStack {
                            
                            Text("Calories")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .regular))
                            
                            Spacer()
                            
                            Text(viewModel.selectedDiet?.dCalories ?? "")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .medium))
                            
                        }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 55)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    DietInfo(viewModel: DietsViewModel())
}
