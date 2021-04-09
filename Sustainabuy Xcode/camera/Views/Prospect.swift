//
//  Prospect.swift
//  Sustainabuy
//
//  Created by EllaCaySmith on 4/11/20.
//  Copyright © 2020 EllaCaySmith. All rights reserved.
//

import Foundation
import Combine

struct HistoryItem: Identifiable, Codable {
    var id = UUID()
    let product: String
    let stars: Int
    let image: String
    

}

class History: ObservableObject {

    @Published var items = [HistoryItem]()
    
  
init() {
    if let data = UserDefaults.standard.data(forKey: "SavedData") {
        if let decoded = try? JSONDecoder().decode([HistoryItem].self, from: data) {
            self.items = decoded

            return
        }
    }
    self.score = UserDefaults.standard.object(forKey: "score") as? Int ?? 0

    self.items = []
    self.score = 0
}
    
    
    @Published var score = 0
        
        
     


    let defaults = UserDefaults.standard
    func save() {
        if let encoded = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encoded, forKey: "SavedData")
        }
    }
    
    func toggle(_ prospect: History) {
        objectWillChange.send()
        save()
    }
    func didSet() {
        UserDefaults.standard.set(score, forKey: "score")
    }

    func userDefaultsRemove() {
        defaults.removeObject(forKey: "SavedData")
       }


}
