//
//  EditProfile.swift
//  App548
//
//  Created by DJUROM on 18/05/2024.
//

import SwiftUI

struct EditProfile: View {

    @StateObject var viewModel: ProfileViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Edit")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .medium))
                        .padding()
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(Color.gray.opacity(0.7))
                                .font(.system(size: 18, weight: .regular))
                            
                            Text("Back")
                                .foregroundColor(Color.gray.opacity(0.7))
                                .font(.system(size: 16, weight: .regular))
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            
                            viewModel.userName = viewModel.UName
                            
                            viewModel.breast = viewModel.UBreast
                            viewModel.waist = viewModel.UWaist
                            viewModel.hips = viewModel.UHips
                            
                            viewModel.UBreast = ""
                            viewModel.UWaist = ""
                            viewModel.UHips = ""
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isEditProfile = false
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(Color("p"))
                                .font(.system(size: 16, weight: .regular))
                        })
                    }
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                
                VStack {
                    
                    Menu(content: {
                        
                        ForEach(viewModel.photos, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.UPhoto = index
                                viewModel.userPhoto = viewModel.UPhoto
                                
                            }, label: {
                                
                                Image(index)
                            })
                            
                        }
                        
                    }, label: {
                        
                        if viewModel.userPhoto.isEmpty {
                            
                            Image("emptyPhoto")
                            
                        } else {
                            
                            Image(viewModel.userPhoto)
                        }
                        
                    })
                    .padding(.top, 30)
                    
                    ZStack(content: {
                        
                        if viewModel.userName.isEmpty {
                            
                            HStack {
                                
                                Text("Username")
                                    .foregroundColor(.white)
                                    .font(.system(size: 20, weight: .semibold))
                                    .opacity(viewModel.UName.isEmpty ? 1 : 0)
                             
                                Image("redac")
                                    .opacity(viewModel.UName.isEmpty ? 1 : 0)

                            }
                            
                        } else {
                            
                            Text(viewModel.userName)
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .semibold))
                                .opacity(viewModel.UName.isEmpty ? 1 : 0)
                        }
                        
                        TextField("", text: $viewModel.UName)
                            .foregroundColor(Color.white)
                            .font(.system(size: 16, weight: .semibold))
                            .padding(.leading, 113)
                        
                    })
                    .padding()
                    
                }
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                    
                    VStack(spacing: 10) {
                        
                        Text("Body measurements")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .semibold))
                        
                        Text("Breast")
                            .foregroundColor(Color("p"))
                            .font(.system(size: 14, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("0")
                                .foregroundColor(.white.opacity(0.3))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.UBreast.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.UBreast)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        
                        Text("Waist")
                            .foregroundColor(Color("p"))
                            .font(.system(size: 14, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("0")
                                .foregroundColor(.white.opacity(0.3))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.UWaist.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.UWaist)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        
                        Text("Hips")
                            .foregroundColor(Color("p"))
                            .font(.system(size: 14, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("0")
                                .foregroundColor(.white.opacity(0.3))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.UHips.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.UHips)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
          

                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                    .padding(.top)
                }
            }
            .padding()
        }
    }
}

#Preview {
    EditProfile(viewModel: ProfileViewModel())
}
