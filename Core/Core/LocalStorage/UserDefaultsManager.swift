//
//  UserDefaultsManager.swift
//  Core
//
//  Created by Umurcan Kocaman on 31.01.2021.
//

import Foundation
import UIKit

public class UserDefaultsManager {
    
    public static let shared = UserDefaultsManager()
    
    let userDefault = UserDefaults.standard
    
    public func storeObject(key: String, value: Any) {
        userDefault.set(value, forKey: key)
    }
    
    public func storeBool(key: String, value: Bool) {
        userDefault.set(value, forKey: key)
    }
    
    public func storeString(key: String, value: String) {
        userDefault.set(value, forKey: key)
    }
    
    public func storeInt(key: String, value: Int) {
        userDefault.set(value, forKey: key)
    }
    
    public func storeDouble(key: String, value: Double) {
        userDefault.set(value, forKey: key)
    }
    
    public func storeDate(key: String, value: Date) {
        userDefault.set(value, forKey: key)
    }
    
    public func storeFloat(key: String, value: CGFloat) {
        userDefault.set(value, forKey: key)
    }
    
    //if key is not found returns false
    public func getBool(key: String) -> Bool {
        return userDefault.bool(forKey: key)
    }
    
    public func getString(key: String) -> String? {
        return userDefault.string(forKey: key)
    }
    
    public func getInt(key: String) -> Int? {
        return userDefault.integer(forKey: key)
    }
    
    public func getDouble(key: String) -> Double? {
        return userDefault.double(forKey: key)
    }
    
    public func getDate(key: String) -> Date? {
        return getObject(key: key) as? Date
    }
    
    public func getFloat(key: String) -> CGFloat? {
        return getObject(key: key) as? CGFloat
    }
    
    public func getObject(key: String) -> Any? {
        return userDefault.object(forKey: key)
    }
    
    public func remove(key: String) {
        userDefault.removeObject(forKey: key)
    }
    
    public func clear() {
        if let bundleID = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: bundleID)
        }
    }
}
