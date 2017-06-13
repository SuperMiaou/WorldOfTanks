//
//  PlayMusic.swift
//  WorldOfTanks
//
//  Created by Matthieu on 13/06/2017.
//  Copyright © 2017 Matthieu. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit

class PlayMusic {
    
    var backgroundMusicPlayer = AVAudioPlayer()
    
    func playBackgroundMusic(filename: String) {
        let url = Bundle.main.url(forResource: filename, withExtension: nil)
        guard let newURL = url else {
            print("Could not find file: \(filename)")
            return
        }
        do {
            backgroundMusicPlayer = try AVAudioPlayer(contentsOf: newURL)
            backgroundMusicPlayer.numberOfLoops = -1
            backgroundMusicPlayer.prepareToPlay()
            backgroundMusicPlayer.play()
        } catch let error as NSError {
            print(error.description)
        }
    }
    
}
