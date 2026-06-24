//
//  CalculatorView.swift
//  MoexCalculator
//
//  Created by Irina Muravyeva on 23.06.2026.
//

import SwiftUI
import Combine

struct CalculatorView: View {
    @EnvironmentObject var viewModel: CalculatorViewModel
    @State private var isPickerPresented = false
    
    var body: some View {
        List {
            CurrencyInput(
                currency: viewModel.topCurrency,
                amount: viewModel.topAmount,
                calculator: viewModel.setTopAmount,
                tapHandler: { isPickerPresented.toggle()
                })
            CurrencyInput(
                currency: viewModel.bottomCurrency,
                amount: viewModel.bottomAmount,
                calculator: viewModel.setBottomAmount,
                tapHandler: { isPickerPresented.toggle()
                })
        }
        .foregroundColor(.accentColor)
        .sheet(isPresented: $isPickerPresented) {
            VStack(spacing: 16) {
                Spacer()
                
                RoundedRectangle(cornerRadius: 3)
                    .fill(.secondary)
                    .frame(width: 60, height: 6)
                    .onTapGesture {
                        isPickerPresented = false
                    }
                
                HStack {
                    CurrencyPicker(currency: $viewModel.topCurrency, onChange: { _ in  topCurrencyDidChanged()})
                    CurrencyPicker(currency: $viewModel.bottomCurrency, onChange: { _ in bottomCurrencyDidChanged()})
                }
                .presentationDetents([.fraction(0.3)])
            }
        }
    }
    
    private func topCurrencyDidChanged() {
        viewModel.updateTopAmount()
    }
    
    private func bottomCurrencyDidChanged() {
        viewModel.updateBottomAmount()
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
            .environmentObject(CalculatorViewModel())
    }
}
