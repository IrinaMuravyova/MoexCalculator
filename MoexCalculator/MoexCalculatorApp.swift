//
//  MoexCalculatorApp.swift
//  MoexCalculator
//
//  Created by Irina Muravyeva on 23.06.2026.
//

import SwiftUI

@main
struct MoexCalculatorApp: App {
    @StateObject var viewModel = CalculatorViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(viewModel)
        }
    }
}

