//
//  Currency.swift
//  LOTRConverter
//
//  Created by Wai Zin Linn on 1/5/25.
//

import SwiftUI

enum Currency: Double, CaseIterable, Identifiable {
    var id: Currency { self } //can either have double -> rawvalue or Currency -> self those 5 cases
    
    case copperPenny = 6400
    case silverPenny = 64
    case silverPiece = 16
    case goldPenny = 4
    case goldPiece = 1
    
    // computed property -> compute every single time
    var image: ImageResource {
        switch self{
            case .copperPenny:
                    .copperpenny
            case .silverPenny:
                    .silverpenny
            case .silverPiece:
                    .silverpiece
            case .goldPenny:
                    .goldpenny
            case .goldPiece:
                    .goldpiece
        }
            
    }
    
    var name: String {
        switch self {
            case .copperPenny:
                "Copper Penny"
            case .silverPenny:
                "Silver Penny"
            case .silverPiece:
                "Silver Piece"
            case .goldPenny:
                "Gold Penny"
            case .goldPiece:
                "Gold Piece"
        }
    }
}
