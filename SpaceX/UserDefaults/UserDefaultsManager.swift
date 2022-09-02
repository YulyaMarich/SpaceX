//
//  UserDefaultsManager.swift
//  SpaceX
//
//  Created by Julia on 25.08.2022.
//

import Foundation
import Apollo

class DataManager {
    
    static let shared = DataManager()
    
    private let userDefaults = UserDefaults()
    
    private var savedLaunchesDefaultsKey: String {
        return "savedLaunches"
    }
    
    func saveLaunch(data: LaunchesQuery.Data.Launch?, completion: (Bool) -> Void) {
        guard let launch = data else { return }
        do {
            let encodedLaunch = try NSKeyedArchiver.archivedData(withRootObject: launch.jsonObject, requiringSecureCoding: false)
            
            if var previousSavedLaunches = UserDefaults.standard.array(forKey: savedLaunchesDefaultsKey) as? [Data] {
                
                previousSavedLaunches = try previousSavedLaunches.filter { data in
                    let decodedLaunch = try decodedLaunch(for: data)
                    
                    if decodedLaunch?.missionName == launch.missionName {
                        return false
                    }

                    return true
                }
                
                previousSavedLaunches.append(encodedLaunch)
                
                UserDefaults.standard.set(previousSavedLaunches, forKey: savedLaunchesDefaultsKey)
            } else {
                UserDefaults.standard.set([encodedLaunch], forKey: savedLaunchesDefaultsKey)
            }

            completion(true)
            
        } catch {
            print("Unable to Encode Array of Launches (\(error))")
        }
    }
    
    func checkSavedStatus(data: LaunchesQuery.Data.Launch?, completion: (Bool) -> Void) {
        guard let launch = data else { return }
        
        do {
            guard let previousSavedLaunches = UserDefaults.standard.array(forKey: savedLaunchesDefaultsKey) as? [Data] else {
                return
            }
            try previousSavedLaunches.forEach { data in
                guard let jsonObject = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? JSONObject else {
                    return
                }
                if try LaunchesQuery.Data.Launch(jsonObject: jsonObject).missionName == launch.missionName {
                    completion(true)
                }
            }
            
        } catch {
            completion(false)
        }
    }
    
    func unsaveLaunch(data: LaunchesQuery.Data.Launch?, completion: (Bool) -> Void) {
        guard let launch = data else { return }
        
        do {
            guard let previousSavedLaunches = UserDefaults.standard.array(forKey: savedLaunchesDefaultsKey) as? [Data] else {
                return
            }
            
            let savedLaunches = try previousSavedLaunches.filter { data in
                let decodedLaunch = try decodedLaunch(for: data)
                
                if decodedLaunch?.missionName == launch.missionName {
                    return false
                }
                
                return true
            }
            UserDefaults.standard.set(savedLaunches, forKey: savedLaunchesDefaultsKey)
            completion(false)
            
        } catch {
            print(error)
        }
    }
    
    private func decodedLaunch(for data: Data) throws -> LaunchesQuery.Data.Launch? {
        guard let jsonObject = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? JSONObject else {
            return nil
        }
        return try LaunchesQuery.Data.Launch(jsonObject: jsonObject)
    }
    
    func getSavedLaunches(completion: ([LaunchesQuery.Data.Launch]) -> Void) {
        do {
            guard let previousSavedLaunches = UserDefaults.standard.array(forKey: savedLaunchesDefaultsKey) as? [Data] else {
                return
            }
            let savedItems = try previousSavedLaunches.compactMap { data -> LaunchesQuery.Data.Launch? in
                guard let jsonObject = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? JSONObject else {
                    return nil
                }
                
                return try LaunchesQuery.Data.Launch(jsonObject: jsonObject)
            }
            
            completion(savedItems)
            
        } catch {
            print("Unable to Decode Launches (\(error))")
            
        }
    }
}
