//
//  HourConversion.swift
//  TimeConverter
//
//  Created by Russell Gordon on 2025-02-24.
//

import Foundation

struct HourConversion: Identifiable {
    
    // MARK: Stored properties
    let id = UUID()
    let timeInHours: Double
    
    // MARK: Computed properties
    var timeInMinutes: Double {
        return (timeInHours * 60).rounded(.down)
    }
    
    var timeInSeconds: Double {
        return ((timeInHours * 60 - timeInMinutes) * 60).rounded(.up)
    }
    
}

