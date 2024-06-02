//
//  PickerView.swift
//  Timer
//
//  Created by Wijdan Almutairi on 06/02/2024.
//

import SwiftUI

struct PickerView: View {
    let hours = Array(0...23)
    let minutes = Array(0...59)
    let seconds = Array(0...59)
    
    @State private var selectedHour: Int = 0
    @State private var selectedMinute: Int = 0
    @State private var selectedSecond: Int = 0
    @State private var label: String = ""
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("")) {
                        HStack {
                            //picker one
                            Picker(selection: $selectedHour, label: Text("hours")) {
                                    ForEach (hours, id: \.self) { hour in
                                        Text("\(hour)")
                                    }
                                    
                            }.pickerStyle(.wheel)
                            Text("hours")
                                .bold()
                            
                            //picker two
                            Picker(selection: $selectedMinute, label: Text("hours")) {
                                    ForEach (minutes, id: \.self) { minute in
                                        Text("\(minute)")
                                    }
                                    
                            }.pickerStyle(.wheel)
                            Text("min")
                                .bold()
                            
                            //picker three
                            Picker(selection: $selectedSecond, label: Text("hours")) {
                                    ForEach (seconds, id: \.self) { second in
                                        Text("\(second)")
                                    }
                                    
                            }.pickerStyle(.wheel)
                            Text("sec")
                                .bold()
                        }
                    }
                    Section(header: Text("")){
                        TextField("Label", text: $label)
                    }
                    
                }
                
                
                Button(action: {
                            // Add your action here
                            print("h \(selectedHour) ")
                            print("m \(selectedMinute)")
                            print("s \(selectedSecond)")
                            print("label \(label)")
                    
                        }) {
                            Text("Start")
                                .padding(100)
                                .background(Color.clear)
                                .font(.largeTitle)
                                .bold()
                        }
            }
           
        .navigationTitle("Timer")
        }
    }
}

#Preview {
    PickerView()
}
