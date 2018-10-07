//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController
{
  private lazy var playerNotes = [AVAudioPlayer?]()

  override func viewDidLoad()
  {
    super.viewDidLoad()

    for index in 1...7
    {
      let url = Bundle.main.url(forResource: "note" + String(index), withExtension: "wav")!
      do
      {
        let player = try AVAudioPlayer(contentsOf: url)
        playerNotes.append(player)
      }
      catch let error
      {
        print(error.localizedDescription + " error loading \(url)")
        playerNotes.append(nil)
      }
    }
  }

  @IBAction func notePressed(_ sender: UIButton)
  {
    guard let player = playerNotes[sender.tag - 1]
    else
    {
      return
    }

    player.prepareToPlay()
    player.play()
  }
}

