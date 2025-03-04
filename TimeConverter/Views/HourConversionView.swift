//
//  HourConversionView.swift
//  TimeConverter
//
//  Created by Russell Gordon on 2025-02-24.
//

import SwiftUI

struct HourConversionView: View {
    
    //MARK: Stored Properties
    @State var viewModel = HourConversionViewModel()
    
    //MARK: Computed Properties
    var body: some View {
        VStack{
            //1. show our result if one exsits
            if let conversionResult = viewModel.conversionResult {
                
                Text("\(conversionResult.timeInHours)")
                Text("\(conversionResult.timeInSeconds)")
                Text("\(conversionResult.timeInMinutes)")
                
                
                
            } else {
                //2. show the content unavaible message
                ContentUnavailableView("Unable to convert", systemImage: "gear.badge.questionmark", description: Text("\(viewModel.recoverySuggestion)"))
                
            }
            
            // 3. allow for input to occur
            TextField("Enter the time in hours", text: $viewModel.providedHours)
        }
    }
}



#Preview {
    HourConversionView()
}
