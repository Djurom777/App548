//
//  AddTraining.swift
//  App548
//
//  Created by DJUROM on 20/05/2024.
//

import SwiftUI

struct AddTraining: View {

    @Environment(\.presentationMode) var router
    @StateObject var viewModel: TrainingViewModel

    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Add a training")
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
                    
                        ZStack(alignment: .leading, content: {
                            
                            Text("Name of the dish")
                                .foregroundColor(.white.opacity(0.3))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.tName.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.tName)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        .padding(.bottom)

                        ZStack(alignment: .leading, content: {
                            
                            Text("Enter repetitions")
                                .foregroundColor(.white.opacity(0.3))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.tRep.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.tRep)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Enter approaches")
                                .foregroundColor(.white.opacity(0.3))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.tApp.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.tApp)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        
                        HStack {
                            
                            Image(systemName: "timer")
                                .foregroundColor(Color("p"))
                                .font(.system(size: 18, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Time")
                                    .foregroundColor(.white.opacity(0.3))
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.tTime.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.tTime)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .semibold))
                                
                            })
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                       
                    }
                }
                
                Button(action: {
                    
                    viewModel.addTraining()
                    
                    viewModel.tName = ""
                    viewModel.tRep = ""
                    viewModel.tApp = ""
                    viewModel.tTime = ""
                    
                    viewModel.fetchTrainings()
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAdd = false
                    }
                    
                }, label: {
                    
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("p")))
                })
                .opacity(viewModel.tName.isEmpty || viewModel.tRep.isEmpty || viewModel.tApp.isEmpty || viewModel.tTime.isEmpty ? 0.5 : 1)
                .disabled(viewModel.tName.isEmpty || viewModel.tRep.isEmpty || viewModel.tApp.isEmpty || viewModel.tTime.isEmpty ? true : false)
            }
            .padding()
        }
    }
}

#Preview {
    AddTraining(viewModel: TrainingViewModel())
}
