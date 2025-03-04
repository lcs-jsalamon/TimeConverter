import Cocoa

var greeting = "Hello, playground"


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


let exampleOne = HourConversion(timeInHours: 4.54)
exampleOne.timeInMinutes
exampleOne.timeInSeconds

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


let viewModel = HourConversionViewModel()
viewModel.providedHours = "-4"
viewModel.recoverySuggestion
viewModel.conversionResult?.timeInMinutes
viewModel.conversionResult?.timeInSeconds
