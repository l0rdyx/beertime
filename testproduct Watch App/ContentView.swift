//
//  ContentView.swift
//  beertime Watch App
//
//  Created by Gleb Krasnopolin on 2025-07-15.
//

import SwiftUI

struct GIFView: View {
    let frameCount = 33
    @State private var currentFrame = 1
    let timer = Timer.publish(every: 0.05, on: .main, in: .common).autoconnect()

    var body: some View {
        Image("\(currentFrame)")
            .resizable()
            .scaledToFit()
            .onReceive(timer) { _ in
                currentFrame = (currentFrame %  frameCount) + 1
            }
    }
}

struct ContentView: View {
    
    @State private var currentTime = Date()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
            VStack(spacing: 1) {
                Text("It's already")
                    .font(.custom("Pirata One", size: 20))
                    .bold()
                
                Text("\(formattedTime)")
                    .font(.custom("Pirata One", size: 50))
                
                Text("time to drink:")
                    .font(.custom("Pirata One", size: 20))
                    .foregroundColor(.yellow)
                
                GIFView()
            }._statusBarHidden()
            .onReceive(timer) { time in
                currentTime = time
            }
    }
        
    
    var formattedTime: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: currentTime)
    }
}


#Preview {
    ContentView()
}
