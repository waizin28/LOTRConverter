//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Wai Zin Linn on 1/2/25.
//

import SwiftUI

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
                        }
                        
                        // Text Field, 2 way data bindining
                        TextField("Amount", text: $leftCurrencyAmount)
                            .textFieldStyle(.roundedBorder)
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
                        }
                        
                        // Text Field
                        TextField("Amount", text: $rightCurrencyAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                
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
