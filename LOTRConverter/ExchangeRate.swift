//
//  ExchangeRate.swift
//  LOTRConverter
//
//  Created by Wai Zin Linn on 1/3/25.
//

import SwiftUI

struct ExchangeRate: View {
    
    // don't need state because the image don't change
    let leftImage: ImageResource
    let text: String
    let rightImage: ImageResource
    
    var body: some View {
        HStack{
            // Left currency Image
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
            // Exchange rate
            // "1 Gold Piece = 4 Gold Pennies"
            Text(text)
            
            // Right currency Image
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

#Preview {
    ExchangeRate(leftImage: .silverpiece, text: "1 Silver Piece = 4 Silver Pennies", rightImage: .silverpenny)
}
