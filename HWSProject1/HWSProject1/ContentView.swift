//
//  ContentView.swift
//  HWSProject1
//
//  Created by Venkat on 10/26/22.
//

import SwiftUI



struct ContentView: View {
    
    @State private var noOfPeople = 1;
    @State private var totalBill = 0.0;
    @State private var percentSelected = 0;
    
    let tipPercentages = [0,5,10,15,20,25,30,35,40,50];
    
    var tipAmount: Double {
        (totalBill * Double(percentSelected)) / 100;
    }
    
    var totalAmount: Double {
        totalBill + tipAmount;
    }

    var perPersonSplit: Double {
        totalAmount == 0 || noOfPeople == 0 ? 0 : totalAmount / Double(noOfPeople);
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Calculated tip: \(tipAmount)")
                        .bold()
                        .foregroundColor(.accentColor)
                    Text("Total: \(totalAmount)")
                        .bold()
                        .foregroundColor(.accentColor)
                    Text("Per person split: \(perPersonSplit)")
                        .bold()
                        .foregroundColor(.accentColor)
                }
                Section {
                    Text("Enter Bill total")
                        .navigationTitle("WeSplit");
                    TextField("Bill total", value: $totalBill, format: .currency(code: "USD"))
                        .keyboardType(.decimalPad);
                }
                Section {
                    Text("Enter no of people")
                    TextField("No of people", value: $noOfPeople, format: .number)
                        .keyboardType(.numberPad)
                }
                Section {
                    Text("Select tip percentage")
                    Picker("Select tip percentage",  selection: $percentSelected) {
                        ForEach (tipPercentages,id: \.self) {
                            Text("\($0) %")
                        }
                    }
                    .pickerStyle(.menu)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 14","iPhone XS", "iPad", "iPhone SE (3rd generation)"], id: \.self) { deviceName in
                       ContentView()
                            .previewDevice(PreviewDevice(rawValue: deviceName))
                            .previewDisplayName(deviceName)
                  }
    }
}
