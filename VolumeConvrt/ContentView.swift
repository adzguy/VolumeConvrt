//
//  ContentView.swift
//  VolumeConvrt
//
//  Created by Davron on 11/25/19.
//  Copyright © 2019 Davron. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var amount = ""
    @State private var selectionFrom = 0
    @State private var selectionTo = 0
    
    let volumes = ["mlliters", "liters", "cups", "pints", "gallons"]
    
    var convertedVolume: Double {
        let volumeAmount = Double(amount) ?? 0
        let selectedVolFrom = volumes[selectionFrom]
        let selectedVolTo = volumes[selectionTo]
        
        var returnVol = volumeAmount
        let lToMl = volumeAmount * 1000
        let cupsToMl = volumeAmount * 284.131
        let pintsToMl = volumeAmount * 568.261
        let galToMl = volumeAmount * 4546.09
        
        if selectedVolFrom == "mlliters" && selectedVolTo == "liters" {
            returnVol = volumeAmount / 1000
        }else if selectedVolFrom == "mlliters" && selectedVolTo == "cups" {
            returnVol = volumeAmount / 284.131
        }else if selectedVolFrom == "mlliters" && selectedVolTo == "pins" {
            returnVol = volumeAmount / 558.261
        }else if selectedVolFrom == "mlliters" && selectedVolTo == "gallons" {
            returnVol = volumeAmount / 4546.09
        }else if selectedVolFrom == "liters" && selectedVolTo == "mlliters" {
            returnVol = lToMl
        }else if selectedVolFrom == "liters" && selectedVolTo == "cups" {
            returnVol = lToMl / 284.131
        }else if selectedVolFrom == "liters" && selectedVolTo == "pints" {
            returnVol = lToMl / 568.261
        }else if selectedVolFrom == "liters" && selectedVolTo == "gallons" {
            returnVol = lToMl / 4546.09
        }else if selectedVolFrom == "cups" && selectedVolTo == "mlliters" {
            returnVol = cupsToMl
        }else if selectedVolFrom == "cups" && selectedVolTo == "liters" {
            returnVol = cupsToMl / 1000
        }else if selectedVolFrom == "cups" && selectedVolTo == "pints" {
            returnVol = cupsToMl / 568.261
        }else if selectedVolFrom == "cups" && selectedVolTo == "gallons" {
            returnVol = cupsToMl / 4546.09
        }else if selectedVolFrom == "pints" && selectedVolTo == "mlliters" {
            returnVol = pintsToMl
        }else if selectedVolFrom == "pints" && selectedVolTo == "liters" {
            returnVol = pintsToMl / 1000
        }else if selectedVolFrom == "pints" && selectedVolTo == "cups" {
            returnVol = pintsToMl / 284.131
        }else if selectedVolFrom == "pints" && selectedVolTo == "gallons" {
            returnVol = pintsToMl / 4546.09
        }else if selectedVolFrom == "gallons" && selectedVolTo == "mlliters" {
            returnVol = galToMl
        }else if selectedVolFrom == "gallons" && selectedVolTo == "liters" {
            returnVol = galToMl / 1000
        }else if selectedVolFrom == "gallons" && selectedVolTo == "cups" {
            returnVol = galToMl / 284.131
        }else if selectedVolFrom == "gallons" && selectedVolTo == "pints" {
            returnVol = galToMl / 568.261
        }else {
            returnVol = volumeAmount
        }
        return returnVol
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $amount)
                    Picker(selection: $selectionFrom, label: Text("Pick")) {
                        ForEach(0..<volumes.count) {
                            Text(self.volumes[$0])
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Convert To:")) {
                    Picker(selection: $selectionTo, label: Text("Pick")) {
                        ForEach(0..<volumes.count){
                            Text(self.volumes[$0])
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                    Text("\(convertedVolume, specifier: "%.2f")")
                }
            }.navigationBarTitle(Text("Volume Convert"), displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
