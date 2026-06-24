//
//  CurrencyInput.swift
//  MoexCalculator
//
//  Created by Irina Muravyeva on 24.06.2026.
//

import SwiftUI

    struct CurrencyInput: View {
        var currency: Currency
        var amount: Double
        var calculator: (Double) -> Void
        var tapHandler: () -> Void
        
        var numberFormatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.usesGroupingSeparator = false
            formatter.maximumFractionDigits = 2
            return formatter
        }()
        
        var body: some View {
            HStack {
                VStack {
                    Text(currency.flag)
                        .font(.system(size: 200))
                        .minimumScaleFactor(0.01)
                        .aspectRatio(1, contentMode: .fit)
                    
                    Text(currency.rawValue)
                        .font(.title2)
                }
                .frame(height: 100)
                .onTapGesture(perform: tapHandler)
                
                let topBinding = Binding<Double>(
                   get: {
                       amount
                   },
                   set: {
                       calculator($0)
                   }
                )
                
                TextField("", value: topBinding, formatter: numberFormatter)
                    .font(.largeTitle)
                    .multilineTextAlignment(.trailing)
                    .minimumScaleFactor(0.5)
                    .keyboardType(.numberPad)
            }
        }
    }

#Preview {
    CurrencyInput(
        currency: .RUB,
        amount: 100,
        calculator: { _ in },
        tapHandler: {}
    )
}
