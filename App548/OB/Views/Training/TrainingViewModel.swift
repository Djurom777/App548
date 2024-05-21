//
//  TrainingViewModel.swift
//  App548
//
//  Created by DJUROM on 20/05/2024.
//

import SwiftUI
import CoreData

final class TrainingViewModel: ObservableObject {
    
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
    
    @Published var tTime = ""
    @Published var tApp = ""
    @Published var tName = ""
    @Published var tRep = ""
    
    @Published var trainings: [TrainingModel] = []
    @Published var selectedTraining: TrainingModel?
    
    func addTraining() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "TrainingModel", into: context) as! TrainingModel
        
        loan.tTime = tTime
        loan.tApp = tApp
        loan.tName = tName
        loan.tRep = tRep
        
        CoreDataStack.shared.saveContext()
    }
    
    func fetchTrainings() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<TrainingModel>(entityName: "TrainingModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.trainings = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.trainings = []
        }
    }
}
