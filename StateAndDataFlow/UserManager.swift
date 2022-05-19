//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 18.05.2022.
//

import Foundation

final class UserManager: ObservableObject {
    @Published var isRegistered = UserDefaults.standard.bool(forKey: "isRegistered")
    var name = UserDefaults.standard.string(forKey: "name")
}
