//
//  TimerView.swift
//  Timer
//
//  Created by Wijdan Almutairi on 02/06/2024.
//

import SwiftUI

struct TimerView: View {
    @State var countDownTimer = 5
    @State var timerRunning = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        VStack {
            Text("\(countDownTimer)")
                .onReceive(timer) { _ in
                    if(countDownTimer > 0 && timerRunning){
                        countDownTimer -= 1
                    } else {
                        timerRunning = false
                    }
                }.font(.system(size: 80, weight: .bold))
                .opacity(0.8)
        }
        
        HStack{
            Button("Satrt") {
                timerRunning = true
            }
            
            Button("Reset") {
                countDownTimer = 5
            }
        }
    }
}

#Preview {
    TimerView()
}
