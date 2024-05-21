//
//  DietsViewModel.swift
//  App548
//
//  Created by DJUROM on 18/05/2024.
//

import SwiftUI
import CoreData

final class DietsViewModel: ObservableObject {
    
    @Published var days: [String] = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    @Published var selDay = ""
    
    @Published var eats: [String] = ["Breakfast", "Lunch", "Dinner"]
    @Published var selectedEat = "Breakfast"

    @Published var isAdd: Bool = false
    @Published var isDelete: Bool = false
    @Published var isReset: Bool = false
    @Published var isDetail: Bool = false
    
    @AppStorage("userPhoto") var userPhoto = ""
    @AppStorage("userName") var userName = ""
    
    @Published var dDay = ""
    @Published var dEat = ""
    @Published var dName = ""
    @Published var dProtein = ""
    @Published var dFat = ""
    @Published var dCarb = ""
    @Published var dCalories = ""
    
    @Published var diets: [DietModel] = []
    @Published var selectedDiet: DietModel?
    
    func fetchDietSunday() -> [DietModel] {
        
        return diets.filter{($0.dDay ?? "") == "Sunday"}
    }
    
    func fetchDietMonday() -> [DietModel] {
        
        return diets.filter{($0.dDay ?? "") == "Monday"}
    }
    
    func fetchDietWednesday() -> [DietModel] {
        
        return diets.filter{($0.dDay ?? "") == "Wednesday"}
    }
    
    func fetchDietThursday() -> [DietModel] {
        
        return diets.filter{($0.dDay ?? "") == "Thursday"}
    }
    
    func fetchDietFriday() -> [DietModel] {
        
        return diets.filter{($0.dDay ?? "") == "Friday"}
    }
    
    func fetchDietTuesday() -> [DietModel] {
        
        return diets.filter{($0.dDay ?? "") == "Tuesday"}
    }
    
    func fetchDietSaturday() -> [DietModel] {
        
        return diets.filter{($0.dDay ?? "") == "Saturday"}
    }
    
    func addDiet() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "DietModel", into: context) as! DietModel
        
        loan.dDay = dDay
        loan.dEat = dEat
        loan.dName = dName
        loan.dProtein = dProtein
        loan.dFat = dFat
        loan.dCarb = dCarb
        loan.dCalories = dCalories
        
        CoreDataStack.shared.saveContext()
    }
    
    func fetchDiets() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<DietModel>(entityName: "DietModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.diets = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.diets = []
        }
    }
}
