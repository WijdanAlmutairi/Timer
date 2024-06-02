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
    
    // @State var countDownTimer = 5
    @Binding var isTimerRunning: Bool
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        VStack {
            Text("\(selectedSecond)")
                .onReceive(timer) { _ in
                    if(selectedSecond > 0 && isTimerRunning){
                        selectedSecond -= 1
                    } else {
                        isTimerRunning = false
                    }
                }.font(.system(size: 80, weight: .bold))
                .opacity(0.8)
        }
        
        HStack{
            Button("Pause") {
                isTimerRunning = true
            }
            
            Button("Cancel") {
                //countDownTimer = 5
            }
        }
    }
}

//#Preview {
//    TimerView(selectedHour: <#Binding<Int>#>, selectedMinute: <#Binding<Int>#>, selectedSecond: <#Binding<Int>#>, label: <#Binding<String>#>)
//}
