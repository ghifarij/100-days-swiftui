//
//  ContentView.swift
//  UnitConverter
//
//  Created by Afga Ghifari on 01/04/26.
//

import SwiftUI

struct ContentView: View {
    @State private var conversionType: String = "Length"
    let conversionTypes = ["Length", "Time", "Temperature"]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Picker("Type of Conversion", selection: $conversionType) {
                    ForEach(conversionTypes, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                
                switch conversionType {
                case "Length":
                    LengthConverterView()
                case "Time":
                    TimeConverterView()
                case "Temperature":
                    TemperatureConverterView()
                default:
                    EmptyView()
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Unit Converter")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}

struct LengthConverterView: View {
    @State private var length: String = ""
    @State private var fromUnit: String = "Meters"
    @State private var toUnit: String = "Kilometers"
    
    let lengthUnits: [String] = ["Meters", "Kilometers", "Miles", "Yards", "Feet", "Inches", "Centimeters"]
    
    var convertedValue: Double {
        guard let input = Double(length) else { return 0}
        
        let inMeters: Double
        
        switch fromUnit {
        case "Kilometers": inMeters = input * 1000
        case "Miles":       inMeters = input * 1609.344
        case "Yards":       inMeters = input * 0.9144
        case "Feet":        inMeters = input * 0.3048
        case "Inches":      inMeters = input * 0.0254
        case "Centimeters": inMeters = input * 0.01
        default:            inMeters = input
        }
        
        switch toUnit {
        case "Kilometers": return inMeters / 1000
        case "Miles":       return inMeters / 1609.344
        case "Yards":       return inMeters / 0.9144
        case "Feet":        return inMeters / 0.3048
        case "Inches":      return inMeters / 0.0254
        case "Centimeters": return inMeters / 0.01
        default: return inMeters
        }
    }
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                TextField("Value", text: $length)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(maxWidth: 200)
                
                Spacer()
                
                Picker("From", selection: $fromUnit) {
                    ForEach(lengthUnits, id: \.self) {
                        Text($0)
                    }
                }
            }
            .padding(.horizontal)
            
            HStack {
                TextField("Result", value: .constant(convertedValue), format: .number)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(maxWidth: 200)
                
                Spacer()
                
                Picker("To", selection: $toUnit) {
                    ForEach(lengthUnits, id: \.self) {
                        Text($0)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct TimeConverterView: View {
    @State private var time: String = ""
    @State private var fromUnit: String = "Seconds"
    @State private var toUnit: String = "Hours"
    
    let timeUnits: [String] = ["Seconds", "Minutes", "Hours", "Days"]
    
    var convertedValue: Double {
        guard let input = Double(time) else { return 0 }
        
        let inputInSeconds: Double
        
        switch fromUnit {
        case "Minutes":
            inputInSeconds = input * 60
        case "Hours":
            inputInSeconds = input * 3600
        case "Days":
            inputInSeconds = input * 86400
        default:
            inputInSeconds = input
        }
        
        switch toUnit {
        case "Minutes":
            return inputInSeconds / 60
        case "Hours":
            return inputInSeconds / 3600
        case "Days":
            return inputInSeconds / 86400
        default:
            return inputInSeconds
        }
    }
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                TextField("Value", text: $time)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(maxWidth: 200)
                
                Spacer()
                
                Picker("From", selection: $fromUnit) {
                    ForEach(timeUnits, id: \.self) {
                        Text($0)
                    }
                }
            }
            .padding(.horizontal)
            
            HStack {
                TextField("Result", value: .constant(convertedValue), format: .number)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(maxWidth: 200)
                
                Spacer()
                
                Picker("To", selection: $toUnit) {
                    ForEach(timeUnits, id: \.self) {
                        Text($0)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct TemperatureConverterView: View {
    @State private var temperature: String = ""
    @State private var fromScale: String = "Celsius"
    @State private var toScale: String = "Fahrenheit"
    
    let temperatures: [String] = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var convertedValue: Double {
        guard let input = Double(temperature) else { return 0 }
        
        let inputInCelsius: Double
        
        switch fromScale {
        case "Fahrenheit":
            inputInCelsius = (input - 32) * 5/9
        case "Kelvin":
            inputInCelsius = input - 273.15
        default:
            inputInCelsius = input
        }
        
        switch toScale {
        case "Fahrenheit":
            return inputInCelsius * 9/5 + 32
        case "Kelvin":
            return inputInCelsius + 273.15
        default:
            return inputInCelsius
        }
    }
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                TextField("Temperature", text: $temperature)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(maxWidth: 200)
                
                Spacer()
                
                Picker("From", selection: $fromScale) {
                    ForEach(temperatures, id: \.self) {
                        Text($0)
                    }
                }
            }
            .padding(.horizontal)
            
            HStack {
                TextField("Temperature", value: .constant(convertedValue), format: .number)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(maxWidth: 200)
                
                Spacer()
                
                Picker("From", selection: $toScale) {
                    ForEach(temperatures, id: \.self) {
                        Text($0)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}
