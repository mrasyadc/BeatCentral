//
//  AudioManager.swift
//  BeatCentral
//
//  Created by Muhammad Rasyad Caesarardhi on 16/05/24.
//

import AVFoundation

final class AudioManager {
    private var audioPlayer: AVAudioPlayer?
    private var audioQueue: DispatchQueue? = DispatchQueue.global()
    private var isSoundPlaying: Bool = false
    
    init?(audioFileName: String, fileType: String) {
            guard let fileURL = Bundle.main.url(forResource: audioFileName, withExtension: fileType) else {
                print("Audio file not found")
                return nil
            }
            
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: fileURL)
                audioPlayer?.prepareToPlay()
            } catch {
                print("Error initializing audio player: \(error)")
                return nil
            }
        }

    func playSound() {
        isSoundPlaying = true

        audioQueue?.async {
            self.audioPlayer?.play()
        }
                    
    }

    func stopSound() {
        isSoundPlaying = false
        audioPlayer?.stop()
    }
    
    func isPlaying()->Bool {
        return isSoundPlaying
    }
}
