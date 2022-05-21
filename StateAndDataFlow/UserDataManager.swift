//
//  UserDataManager.swift
//  StateAndDataFlow
//
//  Created by Тимур on 20.05.2022.
//

import Foundation

class UserDataManager {
    static let shared = UserDataManager()
    
    let name = "name"
    let isRegistered = "isRegistered"
    
    private let userDefaults = UserDefaults.standard
    
    private init() {}
    
    func fetchName() -> String {
        userDefaults.string(forKey: name) ?? ""
    }
    func fetchDataRegistered() -> Bool {
        userDefaults.bool(forKey: isRegistered)
    }
}
