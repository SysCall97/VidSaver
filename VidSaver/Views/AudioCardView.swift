//
//  AudioCardView.swift
//  VidSaver
//
//  Created by Kazi Mashry on 25/10/25.
//

import SwiftUI
import Combine

struct AudioCardView: View {
    var viewModel: AudioCardView.ViewModel
    
    var body: some View {
        ZStack {
            viewModel.isPlaying ? Color.black : Color.gray.opacity(0.2)
            
            HStack {
                Button {
                    //
                } label: {
                    if viewModel.isPlaying {
                        Image(systemName: "pause.circle.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                            .opacity(1.0)
                    } else {
                        Image(systemName: "play.circle.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                            .opacity(1.0)
                    }
                }
                .padding(.leading, 20)
                
                Text(viewModel.title)
                    .lineLimit(1)
                    .truncationMode(.tail)
                    .foregroundStyle(viewModel.isPlaying ? .blue.opacity(0.9) : .white.opacity(0.9))
                
                Spacer()
                
                Button {
                    //
                } label: {
                    Image(systemName: "ellipsis")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .opacity(1.0)
                }
                .padding(.trailing, 20)
                .padding(.leading, 10)


            }
        }
        .frame(height: 60)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 6)
    }
}

extension AudioCardView {
    class ViewModel: ObservableObject {
        @Published var isPlaying: Bool = false
        let title: String
        let duration: TimeInterval
        
        init(title: String, duration: TimeInterval) {
            self.title = title
            self.duration = duration
        }
    }
}

#Preview {
    AudioCardView(viewModel: .init(title: "Mew Mew Mew", duration: 156))
}
