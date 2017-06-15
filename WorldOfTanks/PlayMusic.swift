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
    static var s_player:PlayMusic?
    static func Get() -> PlayMusic {
        if s_player == nil {
            s_player = PlayMusic()
        }
        
        return s_player!
    }
    
    private init() {
        if let url = Bundle.main.url(forResource: "musicIntro", withExtension: "mp3") {
            _player = try? AVAudioPlayer(contentsOf: url)
        }
    }
    
    private var _player : AVAudioPlayer?
    
    func playSound() {
        if let player = _player {
            player.prepareToPlay()
            player.play()
        }
        
    }
    
    func pauseSound() {
        if let player = _player {
            player.pause()
        }
    }
    
    func stopSound() {
        if let player = _player {
            player.stop()
        }
    }
    
}
