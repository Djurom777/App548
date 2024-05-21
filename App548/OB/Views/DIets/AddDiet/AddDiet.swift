//
//  AddDiet.swift
//  App548
//
//  Created by DJUROM on 20/05/2024.
//

import SwiftUI

struct AddDiet: View {
    
    @Environment(\.presentationMode) var router
    @StateObject var viewModel: DietsViewModel

    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Add a meal")
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

                    }
                }
                
                Rectangle()
                    .fill(.white.opacity(0.1))
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        Menu(content: {
                            
                            ForEach(viewModel.days, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.selDay = index
                                    
                                }, label: {
                                    
                                    Text(index)
                                })
                            }
                            
                        }, label: {
                            
                            if viewModel.selDay.isEmpty {
                                
                                HStack {
                                    
                                    Image(systemName: "calendar")
                                        .foregroundColor(Color("p"))
                                        .font(.system(size: 20, weight: .regular))
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.up.chevron.down")
                                        .foregroundColor(.white.opacity(0.7))
                                }
                                
                            } else {
                                
                                HStack {
                                    
                                    Image(systemName: "calendar")
                                        .foregroundColor(Color("p"))
                                        .font(.system(size: 20, weight: .regular))
                                    
                                    Text(viewModel.selDay)
                                        .foregroundColor(.white)
                                        .font(.system(size: 15, weight: .regular))
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.up.chevron.down")
                                        .foregroundColor(.white.opacity(0.7))
                                }
                            }
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        
                        Menu(content: {
                            
                            ForEach(viewModel.eats, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.selectedEat = index
                                    
                                }, label: {
                                    
                                    Text(index)
                                })
                            }
                            
                        }, label: {
                                                            
                                HStack {

                                    Text(viewModel.selectedEat)
                                        .foregroundColor(Color("p"))
                                        .font(.system(size: 15, weight: .regular))
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.up.chevron.down")
                                        .foregroundColor(.white.opacity(0.7))
                                }
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Name of the dish")
                                .foregroundColor(.white.opacity(0.3))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.dName.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.dName)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        .padding(.bottom)

                        ZStack(alignment: .leading, content: {
                            
                            Text("Enter protein")
                                .foregroundColor(.white.opacity(0.3))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.dProtein.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.dProtein)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Enter fat")
                                .foregroundColor(.white.opacity(0.3))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.dFat.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.dFat)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Enter carb")
                                .foregroundColor(.white.opacity(0.3))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.dCarb.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.dCarb)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Enter calories")
                                .foregroundColor(.white.opacity(0.3))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.dCalories.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.dCalories)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                    }
                }
                
                Button(action: {
                    
                    viewModel.dDay = viewModel.selDay
                    viewModel.dEat = viewModel.selectedEat
                    
                    viewModel.addDiet()
                    
                    viewModel.dCalories = ""
                    viewModel.selDay = ""
                    viewModel.dName = ""
                    viewModel.dFat = ""
                    viewModel.dCarb = ""
                    viewModel.dProtein = ""
                    
                    viewModel.fetchDiets()
                    
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
                .opacity(viewModel.selDay.isEmpty || viewModel.dName.isEmpty || viewModel.dProtein.isEmpty || viewModel.dFat.isEmpty || viewModel.dCarb.isEmpty || viewModel.dCalories.isEmpty ? 0.5 : 1)
                .disabled(viewModel.selDay.isEmpty || viewModel.dName.isEmpty || viewModel.dProtein.isEmpty || viewModel.dFat.isEmpty || viewModel.dCarb.isEmpty || viewModel.dCalories.isEmpty ? true : false)
            }
            .padding()
        }
    }
}

#Preview {
    AddDiet(viewModel: DietsViewModel())
}
