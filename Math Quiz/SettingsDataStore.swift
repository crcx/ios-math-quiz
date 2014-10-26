//
//  SettingsDataStore.swift
//  Math Quiz
//
//  Created by Charles Childers on 10/26/14.
//  Copyright (c) 2014 Charles Childers. All rights reserved.
//

import Foundation

class SettingsDataStore {
    var lower: Int
    var upper: Int
    var gameMode: Int
    
    struct Static {
        static var instance: SettingsDataStore?
    }
    
    class var sharedInstance: SettingsDataStore {
        if !(Static.instance != nil) {
            Static.instance = SettingsDataStore()
        }
        return Static.instance!
    }
    
    func getUpper() -> (Int) {
        return self.upper
    }

    func getLower() -> (Int) {
        return self.lower
    }

    func getGameMode() -> (Int) {
        return self.gameMode
    }

    init() {
        self.lower = 0
        self.upper = 0
        self.gameMode = 2
    }
}