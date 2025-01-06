//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Wai Zin Linn on 1/3/25.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dimissExchangeInfo
    // bind value to Content View property so we share same value
    @Binding var topCurrency: Currency
    @Binding var bottomCurrency: Currency
   
    var body: some View {
        ZStack {
            
            // Parchment Background Image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            VStack {
                
                // Text
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                
                // Currency icons
                IconGrid(currencySelected: $topCurrency)
                
                // Text
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                    .padding(.top)
                    
                // Currency icons
                IconGrid(currencySelected: $bottomCurrency)
                
                // Done Button
                Button("Done"){
                    dimissExchangeInfo()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
            }
            .padding()
            .multilineTextAlignment(.center)
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    
    @Previewable @State var topCurrency: Currency = .silverPenny
    @Previewable @State var bottomCurrency: Currency = .goldPenny
    
    SelectCurrency(topCurrency: $topCurrency, bottomCurrency: $bottomCurrency)
}
