//
//  LandScapeManager.swift
//  Leep
//
//  Created by Владимир Данилович on 6.05.22.
//

import Foundation

final class LandscapeManager {
    
    static let shared = LandscapeManager()
    
    private init() {}
    
    var isFirstLaunch: Bool {
        get {
 !UserDefaults.standard.bool(forKey: #function)
} set {
 UserDefaults.standard.setValue(newValue, forKey: #function)
 }
 }
}
