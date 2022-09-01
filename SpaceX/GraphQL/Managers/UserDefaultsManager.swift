//
//  UserDefaultsManager.swift
//  SpaceX
//
//  Created by Julia on 25.08.2022.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    private let userDefaults = UserDefaults()
    
    private init() {}
    
    func saveSavedStatus(for missionName: String, with status: Bool) {
        userDefaults.set(status, forKey: missionName)
    }
    
    func loadSavedStatus(for missionName: String) -> Bool {
        userDefaults.bool(forKey: missionName)
    }
}
