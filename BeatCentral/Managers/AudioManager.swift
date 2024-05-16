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
    private var audioFileName: String
    private var audioFileType: String
    
    init?(audioFileName: String, fileType: String) {
        self.audioFileName = audioFileName
        self.audioFileType = fileType
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

        DispatchQueue.global().async {
            guard let fileURL = Bundle.main.url(forResource: self.audioFileName, withExtension: self.audioFileType) else {
                print("Audio file not found")
//                return nil
            }
            
            do {
                self.audioPlayer = try AVAudioPlayer(contentsOf: fileURL)
                self.audioPlayer?.prepareToPlay()
            } catch {
                print("Error initializing audio player: \(error)")
//                return nil
            }
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
