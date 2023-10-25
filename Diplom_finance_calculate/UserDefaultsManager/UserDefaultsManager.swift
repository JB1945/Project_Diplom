//
//  UserDefaultsManager.swift
//  Diplom_finance_calculate
//
//  Created by Sergei Otoka on 11.10.23.
//

import Foundation

// MARK: - CRUD
protocol UserDefaultsManagerProtocol {
    func set(_ object: Any?, forKey key: UserDefaultsManager.Keys)
    func data(forKey key: UserDefaultsManager.Keys) -> Data?
}

final class UserDefaultsManager {

    public enum Keys: String {
        case finances
        case dataSource
        case homeImage
    }

    private let userDefaults = UserDefaults.standard

    private func store(_ object: Any?, key: String) {
        userDefaults.setValue(object, forKey: key)
    }

    private func restore(forKey key: String) -> Any? {
        userDefaults.object(forKey: key)
    }
}

// MARK: - UserDefaultsManagerProtocol
extension UserDefaultsManager: UserDefaultsManagerProtocol {
    func data(forKey key: Keys) -> Data? {
        restore(forKey: key.rawValue) as? Data
    }

    func set(_ object: Any?, forKey key: Keys) {
        store(object, key: key.rawValue)
    }

    func updateSet(_ newValue: Any?, forKey key: Keys) {
        store(newValue, key: key.rawValue)
    }

    func remove(forKey key: Keys) {
        userDefaults.removeObject(forKey: key.rawValue)
    }
}
