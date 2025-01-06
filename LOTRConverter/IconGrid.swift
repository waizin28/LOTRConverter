//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Wai Zin Linn on 1/3/25.
//

import SwiftUI

struct IconGrid: View {
    @Binding var currencySelected: Currency
   
    var body: some View {
        // Currency icons
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]){
            ForEach(Currency.allCases){ currency in
                if currency == currencySelected {
                    CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
                        .shadow(color: .black, radius: 10)
                        .overlay{
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(lineWidth: 3)
                                .opacity(0.5)
                        }
                }else{
                    CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
                        .onTapGesture {
                            currencySelected = currency
                        }
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var currency: Currency = .silverPenny
    IconGrid(currencySelected: $currency)
}
