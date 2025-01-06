//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Wai Zin Linn on 1/3/25.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dimissExchangeInfo
   
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
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]){
                    ForEach(Currency.allCases){ currency in
                        CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
                    }
                }
                
                // Text
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                    
                
                // Currency icons
                
                
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
        }
    }
}

#Preview {
    SelectCurrency()
}
