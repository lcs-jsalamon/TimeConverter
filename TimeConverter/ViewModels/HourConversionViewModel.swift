//
//  HourConversionViewModel.swift
//  TimeConverter
//
//  Created by Russell Gordon on 2025-02-24.
//

import SwiftUI

@Observable
class HourConversionViewModel {
    
    // MARK: Stored properties
    var resultHistory: [HourConversion] = []
    var providedHours: String
    var recoverySuggestion: String = ""
    
    // MARK: Computed properties
    var conversionResult: HourConversion? {
        
        // Verify that the input is numeric
        guard let hours = Double(providedHours) else {
            
            recoverySuggestion = "Please provide a numeric value."
            return nil
            
        }
        
        // Verify that the given number of hours is more than or equal to 0
        guard hours > 0 else {
            
            recoverySuggestion = "Please ensure the number of hours is more than or equal to 0."
            return nil
            
        }
        
        // Return the correct value
        recoverySuggestion = ""
        return HourConversion(timeInHours: hours)
        
    }
        
    // MARK: Initializer(s)
    init(
        providedHours: String = "",
        recoverySuggestion: String = ""
    ) {
        self.providedHours = providedHours
        self.recoverySuggestion = recoverySuggestion
    }
    
    // MARK: Function(s)
    func saveResult() {
        
        if let conversionResult = self.conversionResult {
            
            self.resultHistory.insert(conversionResult, at: 0)
            
        }
        
    }
    
}
