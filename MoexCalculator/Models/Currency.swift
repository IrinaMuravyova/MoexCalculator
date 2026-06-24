//
//  Currency.swift
//  MoexCalculator
//
//  Created by Irina Muravyeva on 23.06.2026.
//

import Foundation

enum Currency: String, CaseIterable, Identifiable {
    case RUB
    case CNY
    case EUR
    case USD
    
    var id: Self { self }
    
    var flag: String {
        switch self {
        case .RUB: return "🇷🇺"
        case .CNY: return "🇨🇳"
        case .EUR: return "🇪🇺"
        case .USD: return "🇺🇸"
        }
    }
}

typealias CurrencyRates = [Currency: Double]

struct CurrencyAmount {
    let currency: Currency
    let amount: Double
}
