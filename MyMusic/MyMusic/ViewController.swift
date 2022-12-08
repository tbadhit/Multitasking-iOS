//
//  ViewController.swift
//  MyMusic
//
//  Created by Tubagus Adhitya Permana on 20/10/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    private var player: AVAudioPlayer?
    
    
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var stopButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Memastikan bahwa URL dari asset tidak null
        guard let url = Bundle.main.url(forResource: "kodok", withExtension: "wav") else {
            return
        }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            
            // kode untuk iOS 11 keatas
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)

            // kode untuk iOS 10 kebawah
            // player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3)

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        isPlaying(state: false)
    }

    @IBAction func playMusic(_ sender: UIButton) {
        guard let audioPlayer = player else {return}
        audioPlayer.play()
        isPlaying(state: true)
    }
    
    @IBAction func stopMusic(_ sender: UIButton) {
        guard let audioPlayer = player else {return}
        audioPlayer.stop()
        isPlaying(state: false)
    }
    
    private func isPlaying(state: Bool) {
        stopButton.isEnabled = state
        playButton.isEnabled = !state
      }
    
}

