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
    @State var leftCurrencyAmount = ""
    @State var rightCurrencyAmount = ""
    
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
                            Image(.silverpiece)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            // Currency Text
                            Text("Silver Piece")
                                .font(.headline)
                                .foregroundStyle(.white)
                        }.padding(.bottom,-5)
                        
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
                            Text("Gold Piece")
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            // Currency Image
                            Image(.goldpiece)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                        }.padding(.bottom,-5)
                        
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
                        showExchangeInfo.toggle()
                        
                    } label : {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }.padding(.trailing)
                }
                
                    
            }
        }
    }
}

#Preview {
    ContentView()
}
