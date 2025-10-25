//
//  VideoCard.swift
//  VidSaver
//
//  Created by Kazi Mashry on 25/10/25.
//

import SwiftUI

struct VideoCard: View {
    let video: VideoItem
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            AsyncImage(url: URL(string: video.image)) { image in
                image.resizable().scaledToFill()
            } placeholder: {
                Color.gray
            }
            .frame(height: 100)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .overlay(
                LinearGradient(colors: [.black.opacity(0.4), .clear], startPoint: .bottom, endPoint: .top)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            )
            .overlay(
                VStack {
                    Spacer()
                    HStack {
                        Text(video.duration)
                            .font(.caption.bold())
                            .foregroundColor(.white)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 2)
                            .background(Color.black.opacity(0.5))
                            .clipShape(RoundedRectangle(cornerRadius: 6))
                        
                        Spacer()
                        
                        Image(systemName: "ellipsis")
                            .foregroundColor(.white)
                    }
                    .padding(8)
                }
            )
        }
        .frame(height: 100)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 6)
        .overlay(
            Button {
                
            } label: {
                Image(systemName: "play.circle.fill")
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                    .opacity(0.0)
            }
        )
    }
}

#Preview {
    VideoCard(video: .init(image: "https://lh3.googleusercontent.com/aida-public/AB6AXuBXTS6wV6nWxC2nATe3VAw_x9jdkINlAXYayhXKC7GjD9j5LQeNS9an0kuaYq6ROCPxNscrIPf8U278w_l4t_przghF5B2q9bwQ-o1FK9L0ZdIQinuBADS0C_hWAWoedM-uAVsfaMc1IQ3x03yZBfyXEPpgOo4-nJ0hJwTfE4VOkMsgICziGnLSCax8ZRqHRc2BN1QiqxU_GGGi8cbXG-gPFO-hSO6PfqTirum2vfpeoskKbAR2hIrAOF3-cgdpjd70P2pbqMmUaI8", duration: "12:34"))
}
