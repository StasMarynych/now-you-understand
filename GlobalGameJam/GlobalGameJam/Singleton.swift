//
//  Singleton.swift
//  GlobalGameJam
//
//  Created by Стас on 1/26/19.
//  Copyright © 2019 Стас. All rights reserved.
//

import Foundation

class Singleton {
    private init() {}
    
    static let shared = Singleton()
    
    public func launch() {
        firstLaunch()
    }
    
    private func firstLaunch() {
        if !UserDefaults.standard.bool(forKey: "isFirstLaunch") {
            
            print("This is our first launch")
            
            UserDefaults.standard.set(true, forKey: "isFirstLaunch")
            UserDefaults.standard.synchronize()
        }
    }
    
    public func changeTexture() {
    
        
        
    }
}
