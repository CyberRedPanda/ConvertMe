//
//  ContentView.swift
//  convert_me
//
//  Created by User23198271 on 6/4/20.
//  Copyright © 2020 Bryan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var units_of_temp = ["Celcius", "Farenheit", "Kelvin"]
    @State private var amount = "100"
    @State private var initial_selection = 0
    @State private var second_selection = 1
    @State private var isANumber = false
    
    var convert: Double {
        let amount_int = Double(amount) ?? 0
        switch initial_selection {
        case 0:
            switch second_selection {
            case 0:
                return amount_int
            case 1:
                return (amount_int * (9/5)) + 32
            case 2:
                return amount_int + 273.15
            default:
                return amount_int
            }
        case 1:
            switch second_selection {
            case 0:
                return (amount_int - 32) * (5/9)
            case 1:
                return amount_int
            case 2:
                return ((amount_int * (9/5)) + 32) + 273.15
            default:
                return amount_int
            }
        case 2:
            switch second_selection {
            case 0:
                return amount_int - 273.15
            case 1:
                return (amount_int - 273.15) * (9/5) + 32
            case 2:
                return amount_int
            default:
                return amount_int
            }
        default:
            return amount_int
        }
    }

    
    var body: some View {
        NavigationView() {
            VStack {
                Text("")
                    .padding(10)
            Form {
                Section(header: Text("What temperature do you want to convert?")) {
                    TextField("Please enter a number", text: $amount)
                }
                Section(header: Text("Please Select a Unit of Temperature to convert from")) {
                    Picker("Unit", selection: $initial_selection) {
                        ForEach(0 ..< units_of_temp.count) {
                            Text(self.units_of_temp[$0])
                        }
                    }
            .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Please Select a Unit of Temperature to convert to")) {
                    Picker("Unit", selection: $second_selection) {
                        ForEach(0 ..< units_of_temp.count) {
                            Text(self.units_of_temp[$0])
                        }
                    }
            .pickerStyle(SegmentedPickerStyle())
                    }
                Section {
//                    if amount == "" || isANumber == false {
//                        Text("Please enter a number")
//                    } else {
                        if let _ = Int(amount) {
                    Text("\(amount) \(units_of_temp[initial_selection]) is \n\(convert, specifier: "%.2f") \(units_of_temp[second_selection])!")
                        .keyboardType(.decimalPad)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: false)
                        .layoutPriority(1)
                        } else {
                            Text("Please enter a number")
//                        }
                        }
                    }
                }
            }
            .navigationBarTitle("Convert Temperatures!").font(.largeTitle)
        }
    }
}



