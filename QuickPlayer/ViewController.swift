//
//  ViewController.swift
//  QuickPlayer
//
//  Created by Hoàng Minh Thành on 8/23/16.
//  Copyright © 2016 Hoàng Minh Thành. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {

    @IBOutlet weak var btn_play: UIButton!
    var audio = AVAudioPlayer()
    
    @IBOutlet weak var zinglogo: UIImageView!
    @IBOutlet weak var slider_volume: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        audio = try! AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("music", ofType: ".mp3")!))
        audio.prepareToPlay()
        addThumImgForSllider()
    }
    var state:Bool = false
    @IBAction func action_play(sender: UIButton) {
        if state == false
        {
            audio.play()
            btn_play.setBackgroundImage(UIImage(named: "pause.png"), forState: .Normal)
            state = true
        }
        else
        {
            audio.pause()
            btn_play.setBackgroundImage(UIImage(named: "play.png"), forState: .Normal)
            state = false
        }
    }
    
    @IBAction func volumeSlider(sender: UISlider) {
        audio.volume = sender.value
    }
    func addThumImgForSllider() {
        slider_volume.setThumbImage(UIImage(named: "thumb.png"), forState: .Normal)
        slider_volume.setThumbImage(UIImage(named: "thumbHightLight.png"), forState: .Highlighted)
    }
}

