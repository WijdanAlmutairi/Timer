//
//  TimerView.swift
//  Timer
//
//  Created by Wijdan Almutairi on 02/06/2024.
//

import SwiftUI

struct TimerView: View {
    @Binding var selectedHour: Int
    @Binding var selectedMinute: Int
    @Binding var selectedSecond: Int
    @Binding var label: String
    @Binding var isTimerRunning: Bool
    
    @State var timeRemaining = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Text("\(convertSecondsToTime(timeInSeconds: timeRemaining))")
                .onReceive(timer) { _ in
                    
                    
                    if(timeRemaining > 0 && isTimerRunning){
                        timeRemaining -= 1
                    }
                    
                    else {
                        isTimerRunning = false
                    }
                }.font(.system(size: 80, weight: .bold))
                .opacity(0.8)
            
            
            HStack{
                Button("Cancel") {
                    cancelTimer()
                }
                
                Button("Pause") {
                    //isTimerRunning = true
                }
            }
        }.onAppear(){
            // calculate time
            timeRemaining = calculateTimeInSeconds(hours: selectedHour, minutes: selectedMinute, seconds: selectedSecond)
        }
    }
    // Time Functions
    private func convertSecondsToTime(timeInSeconds: Int) -> String{
        var hours = 0
        var minutes = 0
        var seconds = 0
        
        hours = timeInSeconds / 3600
        minutes = (timeInSeconds % 3600) / 60
        seconds = (timeInSeconds % 3600) % 60
        
        return String(format: "%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    private func calculateTimeInSeconds(hours: Int, minutes: Int, seconds: Int) -> Int {
        var totalSeconds = 0
        
        if(hours > 0 || minutes > 0 || seconds > 0){
            let hourTotal = hours * 3600
            let minuteTotal = minutes * 60
            totalSeconds = hourTotal + minuteTotal +  seconds
        }
        
        return totalSeconds
    }
    
    // Pause, Cancel Button Functions
    
    private func cancelTimer() {
        isTimerRunning = false
        timeRemaining = 0
    }
    
}

//#Preview {
//    TimerView(selectedHour: <#Binding<Int>#>, selectedMinute: <#Binding<Int>#>, selectedSecond: <#Binding<Int>#>, label: <#Binding<String>#>)
//}
