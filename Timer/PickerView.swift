//
//  PickerView.swift
//  Timer
//
//  Created by Wijdan Almutairi on 06/02/2024.
//

import SwiftUI

struct PickerView: View {
    //MARK: Declarations
    let hours = Array(0...23)
    let minutes = Array(0...59)
    let seconds = Array(0...59)
    
    @State private var selectedHour: Int = 0
    @State private var selectedMinute: Int = 0
    @State private var selectedSecond: Int = 0
    @State private var label: String = ""
    @State var isTimerRunning = false
    
    var body: some View {
        NavigationView {
            VStack {
                //MARK: Picker
                Form {
                    Section(header: Text("")) {
                        HStack {
                            //MARK: Picker One
                            Picker(selection: $selectedHour, label: Text("hours")) {
                                ForEach (hours, id: \.self) { hour in
                                    Text("\(hour)")
                                }
                                
                            }.pickerStyle(.wheel)
                            Text("hours")
                                .bold()
                            
                            //MARK: Picker Two
                            Picker(selection: $selectedMinute, label: Text("hours")) {
                                ForEach (minutes, id: \.self) { minute in
                                    Text("\(minute)")
                                }
                                
                            }.pickerStyle(.wheel)
                            Text("min")
                                .bold()
                            
                            //MARK: Picker Three
                            Picker(selection: $selectedSecond, label: Text("hours")) {
                                ForEach (seconds, id: \.self) { second in
                                    Text("\(second)")
                                }
                                
                            }.pickerStyle(.wheel)
                            Text("sec")
                                .bold()
                        }
                    }
                    //MARK: Label
                    Section(header: Text("")){
                        TextField("Label", text: $label)
                    }
                    
                }
                //MARK: Navigation Link and Start Button
                NavigationLink(destination:TimerView(selectedHour: $selectedHour, selectedMinute: $selectedMinute, selectedSecond: $selectedSecond, label: $label, isTimerRunning: $isTimerRunning), isActive: $isTimerRunning){
                    
                    Button(action: {
                        self.isTimerRunning = true
                        
                    }) {
                        
                        Text("Start")
                            .padding(100)
                            .background(Color.clear)
                            .font(.largeTitle)
                    }
                }
            }
            
            .navigationTitle("Timer")
        }
    }
}

#Preview {
    PickerView()
}
