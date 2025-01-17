//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Wai Zin Linn on 1/2/25.
//

import SwiftUI
import TipKit

struct ContentView: View {
    
    // Store property
    // let = this value will be constant
    // var = property can change
    // Property Wrapper -> allow this poperty to change state of view
    @State var showExchangeInfo = false
    @State var showSelectCurrency = false
    @State var leftCurrencyAmount = ""
    @State var rightCurrencyAmount = ""
    
    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece
    
    let currencyTip = CurrencyTip()
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    var body: some View {
        ZStack{
            // Background Image
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            
            // Hold Everything else
            VStack{
                // Prancing pony image
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                // Currency Exchange Text (Title)
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                // Conversion Section
                HStack{
                    // Left conversion section
                    VStack{
                        // Currency
                        HStack{
                            
                            // Currency Image
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            // Currency Text
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                        }
                        .padding(.bottom,-5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                            currencyTip.invalidate(reason: .actionPerformed) //once user tap, don't show tip anymore
                        }
                        .popoverTip(currencyTip, arrowEdge: .bottom)
                        
                        // Text Field, 2 way data bindining
                        TextField("Amount", text: $leftCurrencyAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($leftTyping) //when user typing, leftTyping will be true
                    }
                    
                    // Equal Sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    // Right conversion section
                    VStack{
                        // Currency
                        HStack{
                            // Currency Text
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            // Currency Image
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                        }
                        .padding(.bottom,-5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                            currencyTip.invalidate(reason: .actionPerformed) //once user tap, don't show tip anymore
                        }
                        
                        // Text Field
                        TextField("Amount", text: $rightCurrencyAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                            .focused($rightTyping)
                        
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                .keyboardType(.decimalPad)
                
                Spacer()
                
                // Conversion Info button
                HStack {
                    Spacer()
                    Button {
                        // true ExchangeInfo Screen active
                        showExchangeInfo.toggle()
                        
                    } label : {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing)
                    
                }
                
                    
            }
        }
        .task{
            // run code in background
            // code that configure tipkit
            // try -> can throw error (if error don't do anything)
            try? Tips.configure()
        }
        .onChange(of: leftCurrencyAmount) {
            if leftTyping == true{
                rightCurrencyAmount = leftCurrency.convert( leftCurrencyAmount, to: rightCurrency)
            } //if user is typing in left field,
            // update right text field
        }
        .onChange(of: rightCurrencyAmount) {
            if rightTyping {
                leftCurrencyAmount = rightCurrency.convert( rightCurrencyAmount, to: leftCurrency)
            } // if user typing on right text field,
            // update left text field
        }
        .onChange(of: leftCurrency){
            // when left leftCurrency changes -> update left amount
            // property
            leftCurrencyAmount = rightCurrency.convert( rightCurrencyAmount, to: leftCurrency)
        }
        .onChange(of: rightCurrency){
            // changes right currency amount
            rightCurrencyAmount = leftCurrency.convert( leftCurrencyAmount, to: rightCurrency)
        }
        .sheet(isPresented: $showExchangeInfo){
            // this sheet modifier can be attach anywhere
            // sheet modifier watches the showEchangeInfo property
            // and when true, show ExchangeInfo sheet
            ExchangeInfo()
        }
        .sheet(isPresented: $showSelectCurrency){
            SelectCurrency(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
        }
    }
}

#Preview {
    ContentView()
}
