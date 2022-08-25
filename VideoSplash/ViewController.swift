//
//  ViewController.swift
//  VideoSplash
//
//  Created by 최민한 on 2022/08/25.
//

import UIKit
import AVKit
import AVFoundation

final class ViewController: UIViewController {
  
  // MARK: Properties
  
  private let playerController = AVPlayerViewController()
  
  // MARK: LifeCycle

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    view.backgroundColor = .systemBlue
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    playVideo()
  }
  
  // MARK: Method
  
  private func playVideo() {
    guard let path = Bundle.main.path(forResource: "라일락", ofType: "mp4") else {
      print("DEBUG: 영상이 없다네")
      return
    }
    
    let player = AVPlayer(url: URL(fileURLWithPath: path))
    
    playerController.showsPlaybackControls = false
    playerController.player = player
    playerController.videoGravity = .resizeAspectFill
    
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(playerDidFinishPlaying),
      name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
      object: playerController.player?.currentItem
    )
    
    self.present(playerController, animated: false) {
      player.play()
    }
  }
  
  @objc func playerDidFinishPlaying(note: NSNotification) {
    print("DEBUG: 123123")
    playerController.dismiss(animated: false)
  }


}

  
