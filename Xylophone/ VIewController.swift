//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class XylophoneViewController: UIViewController, AVAudioPlayerDelegate
{
  private var audioPlayer = [AVAudioPlayer?]()
  private var soundArray = [URL?]()

  override func viewDidLoad()
  {
    super.viewDidLoad()

    for index in 1...7
    {
      let noteName = "note" + String(index)
      let url = Bundle.main.url(forResource: noteName, withExtension: "wav")
      soundArray.append(url)
    }
  }

  func clearSounds()
  {
    for player in audioPlayer
    {
      player?.stop()
    }
    audioPlayer.removeAll()
  }

  @IBAction func notePressed(_ sender: UIButton)
  {
    if let url = soundArray[sender.tag - 1]
    {
      do
      {
        let player = try AVAudioPlayer(contentsOf: url)
        audioPlayer.append(player)
        player.play()
      }
      catch let error
      {
        print(error.localizedDescription + " error loading \(url)")
      }
    }
  }

  func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool)
  {
    if let index = audioPlayer.index(of: player)
    {
      audioPlayer.remove(at: index)
    }
  }
}

