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
    
    @State var timeRemaining: TimeInterval = 0
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var isPaused = false
    @State var totalTime: TimeInterval = 0
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(lineWidth: 15)
                    .opacity(0.3)
                
                Circle()
                    .trim(from: 0, to: CGFloat(1 - (timeRemaining / totalTime)))
                    .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color.accentColor)
                    .rotationEffect(Angle(degrees: -90))
                    
                Text("\(convertSecondsToTime(timeInSeconds: Int(timeRemaining)))")
                    .onReceive(timer) { _ in
                        
                        
                        if(timeRemaining > 0 && isTimerRunning){
                            timeRemaining -= 1
                        }
                        
                        else {
                            isTimerRunning = false
                        }
                    }.font(.largeTitle)
                    .fontWeight(.bold)
            }.frame(maxWidth: 320)
            
            HStack{
                Button("Cancel") {
                    cancelTimer()
                }
                
                if (isPaused){
                    Button("Resume") {
                        timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                        isPaused = false
                    }
                    
                } else {
                    Button("Pause") {
                        timer.upstream.connect().cancel()
                        isPaused = true
                        
                    }
                    
                }
                
                
                
            }
        }.onAppear(){
            // calculate time
            timeRemaining = calculateTimeInSeconds(hours: selectedHour, minutes: selectedMinute, seconds: selectedSecond)
            totalTime = timeRemaining
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
    
    private func calculateTimeInSeconds(hours: Int, minutes: Int, seconds: Int) -> TimeInterval {
        var totalSeconds = 0
        
        if(hours > 0 || minutes > 0 || seconds > 0){
            let hourTotal = hours * 3600
            let minuteTotal = minutes * 60
            totalSeconds = hourTotal + minuteTotal +  seconds
        }
        
        return TimeInterval(totalSeconds)
    }
    
    // Pause, Cancel Button Functions
    
    private func cancelTimer() {
        isTimerRunning = false
        timeRemaining = 0
    }
}
