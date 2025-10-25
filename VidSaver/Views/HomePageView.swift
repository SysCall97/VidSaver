//
//  HomePageView.swift
//  VidSaver
//
//  Created by Kazi Mashry on 25/10/25.
//

import SwiftUI

enum Segment: String, CaseIterable, Identifiable {
    case allVideos = "All Videos"
    case audioFiles = "Audio Files"
    
    var id: String { self.rawValue }
}

struct HomePageView: View {
    @State private var selectedSegment: Segment = .allVideos
    let segments: [Segment] = [.allVideos, .audioFiles]
    
    
    
    var body: some View {
        ZStack { 
            Color.black.ignoresSafeArea()
            
            
            VStack(spacing: 0) {
                HStack {
                    Text("VidSave Studio")
                        .font(.title2.bold())
                        .foregroundColor(.white)
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top)
                
                HStack(spacing: 4) {
                    ForEach(segments, id: \.self) { segment in
                        Button {
                            selectedSegment = segment
                        } label: {
                            Text(segment.rawValue)
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(selectedSegment == segment ? .white : .gray)
                                .padding(.vertical, 8)
                                .frame(maxWidth: .infinity)
                                .background(selectedSegment == segment ? Color.indigo : Color(white: 0.1))
                                .cornerRadius(10)
                                .shadow(color: selectedSegment == segment ? .indigo.opacity(0.4) : .clear, radius: 6)
                        }
                    }
                }
                .padding()
                if selectedSegment == .allVideos {
                    ScrollView {
                        VideoListView()
                    }
                } else if selectedSegment == .audioFiles {
                    AudioListView()
                }
            }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        
                    } label: {
                        ZStack {
                            LinearGradient(colors: [.indigo, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                            Image(systemName: "plus")
                                .font(.system(size: 32, weight: .bold))
                                .foregroundColor(.white)
                        }
                        .frame(width: 64, height: 64)
                        .clipShape(Circle())
                        .shadow(color: .indigo.opacity(0.5), radius: 15, x: 0, y: 6)
                    }
                    .padding(24)
                }
            }
        }
    }
}


#Preview {
    HomePageView()
}
