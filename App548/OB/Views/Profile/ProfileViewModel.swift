//
//  ProfileViewModel.swift
//  App548
//
//  Created by DJUROM on 18/05/2024.
//

import SwiftUI

final class ProfileViewModel: ObservableObject {
    
    @Published var photos: [String] = ["swimmen"]
    
    @Published var UPhoto = ""
    @Published var UName = ""
    @Published var UBreast = ""
    @Published var UWaist = ""
    @Published var UHips = ""

    @AppStorage("userPhoto") var userPhoto = ""
    @AppStorage("userName") var userName = ""
    @AppStorage("breast") var breast = ""
    @AppStorage("waist") var waist = ""
    @AppStorage("hips") var hips = ""


    @Published var isEditProfile: Bool = false
    @Published var isEditStatistics: Bool = false
}
