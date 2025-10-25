//
//  AudioListView.swift
//  VidSaver
//
//  Created by Kazi Mashry on 25/10/25.
//

import SwiftUI

//struct AudioListView: View {
//    var body: some View {
//        ScrollView {
//            LazyVStack(spacing: 20) {
//                ForEach(0..<10) { _ in
//                    AudioCardView()
//                }
//            }
//            .padding()
//        }
//        .scrollIndicators(.hidden)
//    }
//}

//struct AudioListView: View {
//    let audioViewModels: [AudioCardView.ViewModel] = [
//        .init(title: "Title-1", duration: 120),
//        .init(title: "Title-2", duration: 128),
//        .init(title: "Title-3", duration: 124),
//        .init(title: "Title-4", duration: 132),
//        .init(title: "Title-5", duration: 187),
//        .init(title: "Title-6", duration: 270),
//    ]
//    var body: some View {
//        ScrollView {
//            LazyVStack(spacing: 40, pinnedViews: [.sectionHeaders]) {
//                
//                ForEach(0..<2) { _ in
//                    AudioCardView(viewModel: <#AudioCardView.ViewModel#>)
//                }
//
//                Section {
//                    ForEach(3..<10) { _ in
//                        AudioCardView()
//                    }
//                } header: {
//                    AudioCardView()
//                }
//            }
//            .padding()
//        }
//    }
//}

struct AudioListView: View {
    @State private var playingIndex: Int? = nil
    
    @State private var audioViewModels: [AudioCardView.ViewModel] = [
        .init(title: "Title-1", duration: 120),
        .init(title: "Title-2", duration: 128),
        .init(title: "Title-3", duration: 124),
        .init(title: "Title-4", duration: 132),
        .init(title: "Title-5", duration: 187),
        .init(title: "Title-6", duration: 270),
        .init(title: "Title-7", duration: 120),
        .init(title: "Title-8", duration: 128),
        .init(title: "Title-9", duration: 124),
        .init(title: "Title-10", duration: 132),
        .init(title: "Title-11", duration: 187),
        .init(title: "Title-12", duration: 270),
    ]
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20, pinnedViews: [.sectionHeaders]) {
                // Sticky pinned section
                if let pinnedIndex = playingIndex {
                    Section {
                        // The rest of the cards
                        ForEach(audioViewModels.indices, id: \.self) { index in
                            if index != pinnedIndex {
                                AudioCardView(viewModel: audioViewModels[index])
                                    .onTapGesture {
                                        togglePlay(for: index)
                                    }
                            }
                        }
                    } header: {
                        AudioCardView(viewModel: audioViewModels[pinnedIndex])
                            .onTapGesture {
                                togglePlay(for: pinnedIndex)
                            }
                    }
                } else {
                    ForEach(audioViewModels.indices, id: \.self) { index in
                        AudioCardView(viewModel: audioViewModels[index])
                            .onTapGesture {
                                togglePlay(for: index)
                            }
                    }
                }
            }
            .padding()
        }
    }
    
    private func togglePlay(for index: Int) {
        for i in audioViewModels.indices {
            audioViewModels[i].isPlaying = (i == index && !audioViewModels[i].isPlaying)
        }
        playingIndex = audioViewModels[index].isPlaying ? index : nil
    }
}


//struct AudioListView: View {
//    @State private var playingIndex: Int? = nil
//
//    var body: some View {
//        ZStack(alignment: .top) {
//            ScrollView {
//                LazyVStack(spacing: 20) {
//                    ForEach(0..<10) { index in
//                        AudioCardView(isPlaying: playingIndex == index)
//                            .onTapGesture {
//                                withAnimation(.spring()) {
//                                    playingIndex = playingIndex == index ? nil : index
//                                }
//                            }
//                    }
//                }
//                .padding(.top, playingIndex != nil ? 80 : 0)
//                .padding(.horizontal)
//            }
//
//            if let _ = playingIndex {
//                AudioCardView(isPlaying: true)
//                    .shadow(radius: 6)
//                    .transition(.move(edge: .top))
//                    .animation(.spring(), value: playingIndex)
//            }
//        }
//    }
//}





#Preview {
    AudioListView()
}
