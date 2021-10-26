//
//  PushupViewModel.swift
//  PushupTracker
//
//  Created by Katie Bankhead on 10/26/21.
//

import Foundation

class PushupViewModel: ObservableObject {
    private struct Key {
        static let tallies = "tallies"
    }
    
    @Published var pushupTallies: [PushupTally] = []
    
    init() {
        if let jsonData = UserDefaults.standard.object(forKey: Key.tallies) as? Data {
            let decoder = JSONDecoder()
            
            if let tallies = try? decoder.decode([PushupTally].self, from: jsonData) {
                pushupTallies = tallies.sorted { $0.date < $1.date }
            }
        }
    }
    
    // MARK: - User intents
    
    func append(_ pushupTally: PushupTally) {
        pushupTallies.append(pushupTally)
        save()
    }
    
    // MARK: - Helpers
    
    func save() {
        let encoder = JSONEncoder()
        
        if let jsonData = try? encoder.encode(pushupTallies) {
            UserDefaults.standard.set(jsonData, forKey: Key.tallies)
        }
    }
}
