//
//  DietsView.swift
//  App548
//
//  Created by DJUROM on 18/05/2024.
//

import SwiftUI

struct DietsView: View {
    
    @StateObject var viewModel = DietsViewModel()
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Text("Diet")
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                Rectangle()
                    .fill(.white.opacity(0.2))
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                
                if viewModel.diets.isEmpty {
                    
                    VStack(spacing: 20) {
                        
                        Image(systemName: "doc.text.fill")
                            .foregroundColor(Color("p"))
                            .font(.system(size: 30, weight: .regular))
                        
                        Text("Create a personal weekly meal plan")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .medium))
                        
                        Text("Fill out the calendar and follow the KBJU")
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
                            
                            Text("Sunday")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .medium))
                                .padding(.vertical)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            ForEach(viewModel.fetchDietSunday(), id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.selectedDiet = index
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDetail = true
                                    }
                                    
                                }, label: {
                                    
                                    VStack {
                                        
                                        HStack {
                                            
                                            Text(index.dName ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 16, weight: .medium))
                                            
                                            Spacer()
                                            
                                            Text(index.dEat ?? "")
                                                .foregroundColor(Color("p"))
                                                .font(.system(size: 11, weight: .regular))
                                                .padding(3)
                                                .padding(.horizontal, 3)
                                                .background(RoundedRectangle(cornerRadius: 4).fill(.black))
                                        }
                                        
                                        Rectangle()
                                            .fill(.white.opacity(0.2))
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 1)
                                        
                                        HStack {
                                            
                                            Text("PROTEIN: \(index.dProtein ?? "")")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14, weight: .regular))
                                            
                                            Text("FAT: \(index.dFat ?? "")")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14, weight: .regular))
                                                .frame(maxWidth: .infinity)
                                            
                                            Text("CARB: \(index.dCarb ?? "")")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14, weight: .regular))
                                                .frame(maxWidth: .infinity)
                                            
                                            Text("\(index.dCalories ?? "")")
                                                .foregroundColor(.white)
                                                .font(.system(size: 14, weight: .regular))
                                        }
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 12).fill(Color("bg2")))
                                })
                            }
                            
                            Rectangle()
                                .fill(.white.opacity(0.2))
                                .frame(maxWidth: .infinity)
                                .frame(height: 1)
                            
                            Text("Monday")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .medium))
                                .padding(.vertical)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            ForEach(viewModel.fetchDietMonday(), id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.selectedDiet = index
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDetail = true
                                    }
                                    
                                }, label: {
                                    
                                    VStack {
                                        
                                        HStack {
                                            
                                            Text(index.dName ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 16, weight: .medium))
                                            
                                            Spacer()
                                            
                                            Text(index.dEat ?? "")
                                                .foregroundColor(Color("p"))
                                                .font(.system(size: 11, weight: .regular))
                                                .padding(3)
                                                .padding(.horizontal, 3)
                                                .background(RoundedRectangle(cornerRadius: 4).fill(.black))
                                        }
                                        
                                        Rectangle()
                                            .fill(.white.opacity(0.2))
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 1)
                                        
                                        HStack {
                                            
                                            Text("PROTEIN: \(index.dProtein ?? "")")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14, weight: .regular))
                                            
                                            Text("FAT: \(index.dFat ?? "")")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14, weight: .regular))
                                                .frame(maxWidth: .infinity)
                                            
                                            Text("CARB: \(index.dCarb ?? "")")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14, weight: .regular))
                                                .frame(maxWidth: .infinity)
                                            
                                            Text("\(index.dCalories ?? "")")
                                                .foregroundColor(.white)
                                                .font(.system(size: 14, weight: .regular))
                                        }
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 12).fill(Color("bg2")))
                                })
                            }
                            
                            Rectangle()
                                .fill(.white.opacity(0.2))
                                .frame(maxWidth: .infinity)
                                .frame(height: 1)
                            
                            Text("Tuesday")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .medium))
                                .padding(.vertical)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            ForEach(viewModel.fetchDietTuesday(), id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.selectedDiet = index
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDetail = true
                                    }
                                    
                                }, label: {
                                    
                                    VStack {
                                        
                                        HStack {
                                            
                                            Text(index.dName ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 16, weight: .medium))
                                            
                                            Spacer()
                                            
                                            Text(index.dEat ?? "")
                                                .foregroundColor(Color("p"))
                                                .font(.system(size: 11, weight: .regular))
                                                .padding(3)
                                                .padding(.horizontal, 3)
                                                .background(RoundedRectangle(cornerRadius: 4).fill(.black))
                                        }
                                        
                                        Rectangle()
                                            .fill(.white.opacity(0.2))
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 1)
                                        
                                        HStack {
                                            
                                            Text("PROTEIN: \(index.dProtein ?? "")")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14, weight: .regular))
                                            
                                            Text("FAT: \(index.dFat ?? "")")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14, weight: .regular))
                                                .frame(maxWidth: .infinity)
                                            
                                            Text("CARB: \(index.dCarb ?? "")")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14, weight: .regular))
                                                .frame(maxWidth: .infinity)
                                            
                                            Text("\(index.dCalories ?? "")")
                                                .foregroundColor(.white)
                                                .font(.system(size: 14, weight: .regular))
                                        }
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 12).fill(Color("bg2")))
                                })
                            }
                            
                            Rectangle()
                                .fill(.white.opacity(0.2))
                                .frame(maxWidth: .infinity)
                                .frame(height: 1)
                            
                            Text("Wednesday")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .medium))
                                .padding(.vertical)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            ForEach(viewModel.fetchDietWednesday(), id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.selectedDiet = index
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDetail = true
                                    }
                                    
                                }, label: {
                                    
                                    VStack {
                                        
                                        HStack {
                                            
                                            Text(index.dName ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 16, weight: .medium))
                                            
                                            Spacer()
                                            
                                            Text(index.dEat ?? "")
                                                .foregroundColor(Color("p"))
                                                .font(.system(size: 11, weight: .regular))
                                                .padding(3)
                                                .padding(.horizontal, 3)
                                                .background(RoundedRectangle(cornerRadius: 4).fill(.black))
                                        }
                                        
                                        Rectangle()
                                            .fill(.white.opacity(0.2))
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 1)
                                        
                                        HStack {
                                            
                                            Text("PROTEIN: \(index.dProtein ?? "")")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14, weight: .regular))
                                            
                                            Text("FAT: \(index.dFat ?? "")")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14, weight: .regular))
                                                .frame(maxWidth: .infinity)
                                            
                                            Text("CARB: \(index.dCarb ?? "")")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14, weight: .regular))
                                                .frame(maxWidth: .infinity)
                                            
                                            Text("\(index.dCalories ?? "")")
                                                .foregroundColor(.white)
                                                .font(.system(size: 14, weight: .regular))
                                        }
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 12).fill(Color("bg2")))
                                })
                            }
                            
                            Rectangle()
                                .fill(.white.opacity(0.2))
                                .frame(maxWidth: .infinity)
                                .frame(height: 1)
                            
                            Text("Thursday")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .medium))
                                .padding(.vertical)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            ForEach(viewModel.fetchDietThursday(), id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.selectedDiet = index
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDetail = true
                                    }
                                    
                                }, label: {
                                    
                                    VStack {
                                        
                                        HStack {
                                            
                                            Text(index.dName ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 16, weight: .medium))
                                            
                                            Spacer()
                                            
                                            Text(index.dEat ?? "")
                                                .foregroundColor(Color("p"))
                                                .font(.system(size: 11, weight: .regular))
                                                .padding(3)
                                                .padding(.horizontal, 3)
                                                .background(RoundedRectangle(cornerRadius: 4).fill(.black))
                                        }
                                        
                                        Rectangle()
                                            .fill(.white.opacity(0.2))
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 1)
                                        
                                        HStack {
                                            
                                            Text("PROTEIN: \(index.dProtein ?? "")")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14, weight: .regular))
                                            
                                            Text("FAT: \(index.dFat ?? "")")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14, weight: .regular))
                                                .frame(maxWidth: .infinity)
                                            
                                            Text("CARB: \(index.dCarb ?? "")")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14, weight: .regular))
                                                .frame(maxWidth: .infinity)
                                            
                                            Text("\(index.dCalories ?? "")")
                                                .foregroundColor(.white)
                                                .font(.system(size: 14, weight: .regular))
                                        }
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 12).fill(Color("bg2")))
                                })
                            }
                            
                            Rectangle()
                                .fill(.white.opacity(0.2))
                                .frame(maxWidth: .infinity)
                                .frame(height: 1)
                            
                            Text("Friday")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .medium))
                                .padding(.vertical)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            ForEach(viewModel.fetchDietFriday(), id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.selectedDiet = index
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDetail = true
                                    }
                                    
                                }, label: {
                                    
                                    VStack {
                                        
                                        HStack {
                                            
                                            Text(index.dName ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 16, weight: .medium))
                                            
                                            Spacer()
                                            
                                            Text(index.dEat ?? "")
                                                .foregroundColor(Color("p"))
                                                .font(.system(size: 11, weight: .regular))
                                                .padding(3)
                                                .padding(.horizontal, 3)
                                                .background(RoundedRectangle(cornerRadius: 4).fill(.black))
                                        }
                                        
                                        Rectangle()
                                            .fill(.white.opacity(0.2))
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 1)
                                        
                                        HStack {
                                            
                                            Text("PROTEIN: \(index.dProtein ?? "")")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14, weight: .regular))
                                            
                                            Text("FAT: \(index.dFat ?? "")")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14, weight: .regular))
                                                .frame(maxWidth: .infinity)
                                            
                                            Text("CARB: \(index.dCarb ?? "")")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14, weight: .regular))
                                                .frame(maxWidth: .infinity)
                                            
                                            Text("\(index.dCalories ?? "")")
                                                .foregroundColor(.white)
                                                .font(.system(size: 14, weight: .regular))
                                        }
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 12).fill(Color("bg2")))
                                })
                            }
                            
                            Rectangle()
                                .fill(.white.opacity(0.2))
                                .frame(maxWidth: .infinity)
                                .frame(height: 1)
                            
                            Text("Saturday")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .medium))
                                .padding(.vertical)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            ForEach(viewModel.fetchDietSaturday(), id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.selectedDiet = index
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDetail = true
                                    }
                                    
                                }, label: {
                                    
                                    VStack {
                                        
                                        HStack {
                                            
                                            Text(index.dName ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 16, weight: .medium))
                                            
                                            Spacer()
                                            
                                            Text(index.dEat ?? "")
                                                .foregroundColor(Color("p"))
                                                .font(.system(size: 11, weight: .regular))
                                                .padding(3)
                                                .padding(.horizontal, 3)
                                                .background(RoundedRectangle(cornerRadius: 4).fill(.black))
                                        }
                                        
                                        Rectangle()
                                            .fill(.white.opacity(0.2))
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 1)
                                        
                                        HStack {
                                            
                                            Text("PROTEIN: \(index.dProtein ?? "")")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14, weight: .regular))
                                            
                                            Text("FAT: \(index.dFat ?? "")")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14, weight: .regular))
                                                .frame(maxWidth: .infinity)
                                            
                                            Text("CARB: \(index.dCarb ?? "")")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14, weight: .regular))
                                                .frame(maxWidth: .infinity)
                                            
                                            Text("\(index.dCalories ?? "")")
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
            
            viewModel.fetchDiets()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddDiet(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            DietInfo(viewModel: viewModel)
        })
    }
}

#Preview {
    DietsView()
}
