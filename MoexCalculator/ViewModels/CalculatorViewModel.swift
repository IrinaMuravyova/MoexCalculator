//
//  CalculatorViewModel.swift
//  MoexCalculator
//
//  Created by Irina Muravyeva on 23.06.2026.
//

import Foundation
import Combine

final class CalculatorViewModel: ObservableObject {

    private var model = CalculatorModel()

    @Published var topCurrency: Currency = .CNY
    @Published var bottomCurrency: Currency = .RUB
        
    @Published var topAmount: Double = 0
    @Published var bottomAmount: Double = 0
    
    func setTopAmount(_ amount: Double) {
        topAmount = amount
        updateBottomAmount()
    }
    
    func setBottomAmount(_ amount: Double) {
        bottomAmount = amount
        updateTopAmount()
    }
    
    func updateBottomAmount() {
        let topAmount = CurrencyAmount(currency: topCurrency, amount: topAmount)
        bottomAmount = model.convert(topAmount, to: bottomCurrency)
    }
    
    func updateTopAmount() {
        let bottomAmount = CurrencyAmount(currency: bottomCurrency, amount: bottomAmount)
        topAmount = model.convert(bottomAmount, to: topCurrency)
    }
}
