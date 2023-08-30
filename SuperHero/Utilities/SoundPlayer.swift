//
//  SoundPlayer.swift
//  SuperHero
//
//  Created by Inconnu on 8/30/23.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String?){
    if let path = Bundle.main.path(forResource: sound, ofType: type){
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(filePath: path))
            audioPlayer?.play()
        }catch{
            print("Erro when playing sound")
        }
    }
}
