//
//  WelcomeScreen.swift
//  VidSaver
//
//  Created by Kazi Mashry on 25/10/25.
//

import SwiftUI

struct WelcomeScreen: View {
    @State private var animateGradient = false
    var onGetStarted: () -> Void
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(hex: "#0E0E0E"),
                    Color(hex: "#6366F1").opacity(0.3),
                    Color(hex: "#0E0E0E")
                ]),
                startPoint: animateGradient ? .topLeading : .bottomTrailing,
                endPoint: animateGradient ? .bottomTrailing : .topLeading
            )
            .ignoresSafeArea()
            .onAppear {
                withAnimation(
                    .easeInOut(duration: 15)
                    .repeatForever(autoreverses: true)
                ) {
                    animateGradient.toggle()
                }
            }
            
            VStack(spacing: 0) {
                Spacer()
                
                VStack(spacing: 20) {
                    Image("logo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 96, height: 96)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .shadow(radius: 10)
                    
                    Text("Download. Organize. Create.")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 24)
                }
                
                Spacer()
                
                Button(action: onGetStarted) {
                    Text("Get Started")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, minHeight: 56)
                        .background(Color(hex: "#4F46E5"))
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .shadow(color: Color(hex: "#4F46E5").opacity(0.4), radius: 12)
                        .scaleEffect(1.0)
                }
                .padding(16)
                
                Button(action: {
                    
                }) {
                    Text("Privacy Policy")
                        .font(.system(size: 14))
                        .foregroundColor(Color.gray)
                        .underline()
                        .padding(.bottom, 32)
                }
                .buttonStyle(.plain)
                .hoverEffect(.highlight)
            }
            .padding(.horizontal, 16)
        }
        .background(Color(hex: "#0E0E0E"))
//        .navigationDestination(isPresented: hasStarted) {
//            HomePageView()
//                .transition(.move(edge: .trailing))
//                .toolbar(.hidden, for: .navigationBar)
//        }
    }
}

#Preview {
    WelcomeScreen(onGetStarted: {})
}

// MARK: - HEX Color Extension
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let r, g, b: UInt64
        switch hex.count {
        case 6:
            (r, g, b) = ((int >> 16) & 0xFF, (int >> 8) & 0xFF, int & 0xFF)
        default:
            (r, g, b) = (1, 1, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: 1
        )
    }
}
