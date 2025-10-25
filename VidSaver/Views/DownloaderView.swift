//
//  DownloaderView.swift
//  VidSaver
//
//  Created by Kazi Mashry on 25/10/25.
//

import SwiftUI
import Combine

struct DownloaderView: View {
    enum Segment: String, CaseIterable, Identifiable {
        case video = "Video"
        case audio = "Audio"
        
        var id: String { self.rawValue }
    }
    enum Platform: String, CaseIterable, Identifiable  {
        case facebook
        case youtube
        case instagram
        case tiktok
        
        var id: String { self.rawValue }
        
        func getImage() -> Text {
            switch self {
            case .facebook:
                return Text("Facebook")
            case .youtube:
                return Text("Youtube")
            case .instagram:
                return Text("Instagram")
            case .tiktok:
                return Text("TikTok")
            }
        }
    }
    
    @State private var selectedSegment: Segment = .video
    @State private var fileName: String = ""
    @State private var link: String = ""
    @State private var currentPlatform: Platform?
    
    let segments: [Segment] = [.video, .audio]
    static let platforms: [Platform] = [.facebook, .youtube]
    let platformViewModels: [PlatformCardView.ViewModel] = platforms.map { .init(platform: $0) }
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 0) {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 110), spacing: 16)], spacing: 16) {
                    ForEach(platformViewModels) { viewModel in
                        PlatformCardView(viewModel: viewModel) { viewModel in
                            withAnimation {
                                self.platformViewModels.forEach { $0.isSelected = ($0.platform == viewModel.platform) }
                            } completion: {
                                currentPlatform = viewModel.platform
                            }
                        }
                    }
                }
                .padding()
                
                VStack(spacing: 16) {
                    TextField("", text: $fileName, prompt: Text("Enter filename").foregroundColor(.gray))
                        .padding()
                        .background(Color(white: 0.15))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.never)

                    TextField("", text: $link, prompt: Text("Paste video link").foregroundColor(.gray))
                        .padding()
                        .background(Color(white: 0.15))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .keyboardType(.URL)
                        .textInputAutocapitalization(.never)

                }
                .padding(.horizontal)
                
                HStack(spacing: 4) {
                    ForEach(segments, id: \.self) { segment in
                        Button {
                            selectedSegment = segment
                        } label: {
                            Text(segment.rawValue)
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(selectedSegment == segment ? .white : .gray)
                                .padding(.vertical, 8)
                                .frame(maxWidth: 120)
                                .background(selectedSegment == segment ? Color.indigo : Color(white: 0.1))
                                .cornerRadius(10)
                                .shadow(color: selectedSegment == segment ? .indigo.opacity(0.4) : .clear, radius: 6)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                Spacer()
            }
        }
    }
}


#Preview {
    DownloaderView()
}

struct PlatformCardView: View {
    @ObservedObject var viewModel: PlatformCardView.ViewModel
    var onSelect: ((_ viewModel: PlatformCardView.ViewModel) -> Void)
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Button {
                onSelect(viewModel)
            } label: {
                viewModel.platform.getImage()
                    .font(Font.system(size: 18).bold())
                    .foregroundStyle(.white)
                    .frame(width: 120, height: 100)
                    .background(viewModel.isSelected ? .indigo : Color(.systemGray))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .overlay(
                        LinearGradient(colors: [.black.opacity(0.4), .clear], startPoint: .bottom, endPoint: .top)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    )
            }
        }
        .frame(height: 100)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 6)
    }
}

extension PlatformCardView {
    class ViewModel: ObservableObject, Identifiable {
        let platform: DownloaderView.Platform
        @Published var isSelected: Bool = false
        
        init(platform: DownloaderView.Platform) {
            self.platform = platform
            self.isSelected = isSelected
        }
    }
}
