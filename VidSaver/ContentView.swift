//
//  ContentView.swift
//  VidSaver
//
//  Created by Kazi Mashry on 25/10/25.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("hasStarted") private var hasStarted: Bool = false
    @State private var showHome: Bool = false
    
    var body: some View {
        ZStack {
            if hasStarted || showHome {
                HomePageView()
                    .transition(.move(edge: .trailing))
            }
            
            if !hasStarted && !showHome {
                WelcomeScreen {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        showHome = true
                    } completion: {
                        hasStarted = true
                    }
                    
                }
            }
        }
        .animation(.easeInOut(duration: 0.3), value: showHome)
    }
}

#Preview {
    ContentView()
}
