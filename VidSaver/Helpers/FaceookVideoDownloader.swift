//
//  FaceookVideoDownloader.swift
//  VidSaver
//
//  Created by Kazi Mashry on 25/10/25.
//

import Foundation

protocol AnyDownloader {
    func download(url: URL) -> Void
}

final class FacebookVideoDownloader: AnyDownloader {
    func download(url: URL) {
        //
    }
}
