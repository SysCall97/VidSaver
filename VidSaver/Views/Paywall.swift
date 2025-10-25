//
//  Paywall.swift
//  VidSaver
//
//  Created by Kazi Mashry on 25/10/25.
//

import SwiftUI

struct Paywall: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedPlan: String = "Monthly"
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color(hex: "#0E0E0E"), Color(hex: "#1a1a2e")],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Header
                HStack {
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark")
                            .font(.system(size: 20, weight: .medium))
                            .foregroundColor(.white)
                            .frame(width: 48, height: 48)
                    }
                    Spacer()
                    Text("Unlock VidSave Premium")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.trailing, 48)
                }
                .padding(.horizontal, 16)
                .padding(.top, 8)
                
                let rows = [GridItem(.flexible()), GridItem(.flexible())]

                LazyHGrid(rows: rows, spacing: 20) {
                    Feature(icon: "arrow.down.circle", text: "Unlimited Downloads")
                    Feature(icon: "waveform", text: "Audio Extraction")
                    Feature(icon: "nosign", text: "No Ads")
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 32)

                
                Spacer()
                
                VStack(spacing: 16) {
                    PlanOption(title: "Weekly", subtitle: "Billed weekly", price: "$1.99", isSelected: selectedPlan == "Weekly")
                        .onTapGesture { selectedPlan = "Weekly" }
                    
                    PlanOption(title: "Monthly", subtitle: "Billed monthly", price: "$5.99", isSelected: selectedPlan == "Monthly")
                        .onTapGesture { selectedPlan = "Monthly" }
                    
                    PlanOption(title: "Yearly", subtitle: "Billed annually", price: "$29.99", isSelected: selectedPlan == "Yearly")
                        .onTapGesture { selectedPlan = "Yearly" }
                }
                .padding(.horizontal, 16)
                .padding(.top, 12)
                
                Button(action: {}) {
                    Text("Upgrade Now")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, minHeight: 56)
                        .background(Color(hex: "#4F46E5"))
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .shadow(color: Color(hex: "#4F46E5").opacity(0.4), radius: 12)
                        .scaleEffect(1.0)
                }
                .padding(.horizontal, 16)
                .padding(.top, 16)
                
                Button(action: {}) {
                    Text("Restore Purchase")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(Color(hex: "#9CA3AF"))
                        .underline()
                        .padding(.vertical, 12)
                }
                .padding(.bottom, 16)
            }
        }
    }
}

struct Feature: View {
    let icon: String
    let text: String
    
    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(Color(hex: "#4F46E5").opacity(0.2))
                    .frame(width: 40, height: 40)
                Image(systemName: icon)
                    .foregroundColor(Color(hex: "#4F46E5"))
                    .font(.system(size: 20, weight: .medium))
            }
            Text(text)
                .foregroundColor(.white)
                .font(.system(size: 15, weight: .medium))
                .lineLimit(1)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct PlanOption: View {
    let title: String
    let subtitle: String
    let price: String
    let isSelected: Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .bold))
                Text(subtitle)
                    .foregroundColor(Color(hex: "#9CA3AF"))
                    .font(.system(size: 13))
            }
            Spacer()
            Text(price)
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .bold))
        }
        .padding(16)
        .background(
            ZStack {
                Color.white.opacity(0.05)
                if isSelected {
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color(hex: "#4F46E5"), lineWidth: 2)
                } else {
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.white.opacity(0.1), lineWidth: 1)
                }
            }
        )
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: isSelected ? Color(hex: "#4F46E5").opacity(0.3) : .clear, radius: 12)
    }
}



// MARK: - Preview
#Preview {
    Paywall()
}
