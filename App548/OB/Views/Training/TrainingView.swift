//
//  TrainingView.swift
//  App548
//
//  Created by DJUROM on 18/05/2024.
//

import SwiftUI

struct TrainingView: View {
    
    @StateObject var viewModel = TrainingViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Text("Training")
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                Rectangle()
                    .fill(.white.opacity(0.2))
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                
                if viewModel.trainings.isEmpty {
                    
                    VStack(spacing: 20) {
                        
                        Image(systemName: "doc.text.fill")
                            .foregroundColor(Color("p"))
                            .font(.system(size: 30, weight: .regular))
                        
                        Text("Empty")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .medium))
                        
                        Text("Add training")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 30)
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                    
                    Spacer()
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack(spacing: 15) {
                            
                            ForEach(viewModel.trainings, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.selectedTraining = index
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isDelete = true
                                }
                                
                            }, label: {
                                
                                VStack(spacing: 12) {
                                    
                                    HStack {
                                        
                                        Text(index.tName ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 16, weight: .medium))
                                        
                                        Spacer()
                                        
                                        HStack {
                                            
                                           Image(systemName: "timer")
                                                .foregroundColor(Color("p"))
                                                .font(.system(size: 14, weight: .regular))
                                            
                                            Text(index.tTime ?? "")
                                                .foregroundColor(Color("p"))
                                                .font(.system(size: 13, weight: .regular))
                                       
                                        }
                                        .padding(3)
                                        .padding(.horizontal, 3)
                                        .background(RoundedRectangle(cornerRadius: 4).fill(.black))
                                    }
                                    
                                    Rectangle()
                                        .fill(.white.opacity(0.2))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 1)
                                    
                                    HStack {
                                        
                                        Image(systemName: "arrow.triangle.2.circlepath")
                                            .foregroundColor(Color("p"))
                                            .font(.system(size: 18, weight: .regular))
                                        
                                        Text("\(index.tRep ?? "")")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .regular))
                                        
                                        Spacer()
                                        
                                        Image(systemName: "figure.run.square.stack")
                                            .foregroundColor(Color("p"))
                                            .font(.system(size: 18, weight: .regular))
                                        
                                        Text("\(index.tApp ?? "")")
                                            .foregroundColor(.white)
                                            .font(.system(size: 14, weight: .regular))
                                    }
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 12).fill(Color("bg2")))
                            })
                        }
                        }
                    }
                }
            }
            .padding()
            
            VStack {
                
                Spacer()
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAdd = true
                    }
                    
                }, label: {
                    
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .padding(20)
                        .background(Circle().fill(Color("p")))
                })
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchTrainings()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddTraining(viewModel: viewModel)
        })
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Delete")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    Text("Are you sure you want to delete?")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        
                        CoreDataStack.shared.deleteTraining(withTrainingName: viewModel.selectedTraining?.tName ?? "", completion: {
                            
                            viewModel.fetchTrainings()
                        })
          
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                            
                        }
                                
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(.red)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                    .padding(.top, 25)
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                        
                    }, label: {
                        
                        Text("Cancel")
                            .foregroundColor(.blue)
                            .font(.system(size: 18, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                .padding()
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    TrainingView()
}
