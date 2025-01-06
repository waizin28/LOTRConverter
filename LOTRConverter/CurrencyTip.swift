//
//  CurrencyTip.swift
//  LOTRConverter
//
//  Created by Wai Zin Linn on 1/6/25.
//

import TipKit

struct CurrencyTip: Tip {
    var title = Text("Change Currency")
    
    var message: Text? = Text("You can tap left or right currency to bring up the Select Currency screen.")
    
    var image: Image? = Image(systemName: "hand.tap.fill")
}
