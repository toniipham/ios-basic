//
//  VCPlaylist.swift
//  MyMusicPlayer
//
//  Created by Cam Loan on 11/10/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import UIKit
import AVFoundation

class VCPlaylist: UIViewController {
    
    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var lblLyrics: UILabel!
    @IBOutlet weak var sldVolume: UISlider!
    @IBOutlet weak var btnVolume: UIButton!
    @IBOutlet weak var lblStartTime: UILabel!
    @IBOutlet weak var lblEndTime: UILabel!
    @IBOutlet weak var sldDuration: UISlider!
    @IBOutlet weak var btnPlayPause: UIButton!
    @IBOutlet weak var btnRepeat: UIButton!
    
    @IBAction func asldVolume(_ sender: Any) {
        let vol = sldVolume.value
        if vol == 0{
            let img = UIImage(named: "mute")
            btnVolume.setImage(img, for: .normal)
            player.volume = vol
            isMuted = false
            sldVolume.isEnabled = false
        }else if vol > 0 && vol <= 0.5{
            let img = UIImage(named: "speaker-1v")
            btnVolume.setImage(img, for: .normal)
            player.volume = vol
            isMuted = true
        }else if vol > 0.5 && vol < 1{
            let img = UIImage(named: "speaker-2v")
            btnVolume.setImage(img, for: .normal)
            player.volume = vol
            isMuted = true
        }
        else{
            let img = UIImage(named: "speaker-3v")
            btnVolume.setImage(img, for: .normal)
            player.volume = vol
            isMuted = true
        }
    }
    @IBAction func abtnVolume(_ sender: Any) {
        // doi man hinh tat hay mo volume
        if isMuted{
            let img = UIImage(named: "mute")
            btnVolume.setImage(img, for: .normal)
            sldVolume.isEnabled = false
            player.volume = 0
            isMuted = false
        }else{
            let img = UIImage(named: "speaker")
            btnVolume.setImage(img, for: .normal)
            sldVolume.isEnabled = true
            player.volume = sldVolume.value
            isMuted = true
        }
    }
    @IBAction func asldDuration(_ sender: Any) {
        player.currentTime = Double(sldDuration.value)
    }
    @IBAction func abtnReplay(_ sender: Any) {
        isRepeated = !isRepeated
        if isRepeated == true{
            let img = UIImage(named: "repeat")
            btnRepeat.setImage(img, for: .normal)
        }else{
            let img = UIImage(named: "repeat-2")
            btnRepeat.setImage(img, for: .normal)
        }
    }
    @IBAction func abtnBack(_ sender: Any) {
        index = index - 1
        if index == -1 {
            index = 0
            return
        }
      
        if player.isPlaying == true{
            print(arrPlaylist[index])
            playMusic(named: arrPlaylist[index])
            player.play()
            //setupTimer()
            //setupVolume()
            
        }
    }
    @IBAction func abtnPlayPause(_ sender: Any) {
        let img = UIImage(named: arrPlayPauseImage[indexImage])
        btnPlayPause.setImage(img, for: .normal)
        
        if (indexImage == 0)
        {
            indexImage = 1
            player.play()
            timerAvatar = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.rotateAlbumCD), userInfo: nil, repeats: true)
        }
        else{
            indexImage = 0
            player.pause()
            timerAvatar.invalidate()
        }
    }
    @IBAction func abtnNext(_ sender: Any) {
        index = index + 1
        
        if index == arrPlaylist.count{
           index = arrPlaylist.count - 1
            return
        }
        if player.isPlaying == true{
            print(arrPlaylist[index])
            playMusic(named: arrPlaylist[index])
            player.play()
            //setupTimer()
            //setupVolume()
        }
    }
    @IBAction func abtnShuffle(_ sender: Any) {
    }

    var player: AVAudioPlayer = AVAudioPlayer()
    let arrPlaylist: Array<String> = ["Happy New Year - ABBA.mp3","mama mia.mp3","man in the middle.mp3","idontwannamissathing.mp3"]
    var index: Int = 0
    var timerDuration: Timer = Timer()
    var timerAvatar: Timer = Timer()
    var isMuted: Bool = true
    var isRepeated: Bool = false
    var whichButton: Bool = false
    var arrPlayPauseImage: Array<String> = ["pause-2","play-button-2"]
    var indexImage: Int = 0
   
    func circleAvatar(){
        imgAvatar.contentMode = .scaleAspectFill
        imgAvatar.layer.masksToBounds = true
        imgAvatar.clipsToBounds = true
        imgAvatar.layer.cornerRadius = imgAvatar.frame.size.width/2
    }
    
    func rotateVolumeControl(){
        let xoayVolume = CATransform3DRotate(CATransform3DIdentity, CGFloat(3*M_PI/2), 0, 0, 1)
        let dichVolume = CATransform3DTranslate(CATransform3DIdentity, 23, -sldVolume.frame.size.width/2 + 20, 0)
        let transformConcat = CATransform3DConcat(xoayVolume, dichVolume)
        sldVolume.layer.transform = transformConcat
    }
    
    func playMusic(named: String){
        let arrMusicName: Array<String> = named.components(separatedBy: ".")
        let musicPath: String = Bundle.main.path(forResource: arrMusicName[0], ofType: arrMusicName[1])!
        let urlMusic: URL = URL(fileURLWithPath: musicPath)
        do{
            player = try AVAudioPlayer(contentsOf: urlMusic)
            player.prepareToPlay()
        }catch{
        
        }
    }
    
    func updateTime() {
        sldDuration.value = Float(player.currentTime)
        lblStartTime.text = player.currentTime.convertTimer2String()
        lblEndTime.text = (player.duration - player.currentTime).convertTimer2String()
        if player.currentTime == 0 && isRepeated == false && indexImage == 1{
            btnPlayPause.setImage(UIImage(named: arrPlayPauseImage[1]), for: .normal)
            timerAvatar.invalidate()
            indexImage = 0
        }
        if player.currentTime == 0 && isRepeated == true && indexImage == 1{
            player.play()
            //player.numberOfLoops = -1
        }
    }
    
    func setupTimer() {
        sldDuration.minimumValue = 0
        sldDuration.maximumValue = Float(player.duration)
        sldDuration.value = 0
        lblStartTime.text = "00:00"
        lblEndTime.text = player.duration.convertTimer2String()
        timerDuration = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateTime), userInfo: nil, repeats: true)
        
    }
    
    func rotateAlbumCD(){
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveLinear, animations: {
            self.imgAvatar.transform = self.imgAvatar.transform.rotated(by: CGFloat(M_PI))
        }, completion: {
            (true) in
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveLinear, animations: {
                self.imgAvatar.layer.transform = CATransform3DIdentity
            }, completion: nil)
        })
    }
    
    func setupVolume(){
        sldVolume.minimumValue = 0
        sldVolume.maximumValue = 1
        sldVolume.value = 0.5
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // khoi tao avatar
        imgAvatar.image = UIImage(named: "abba")
        
        playMusic(named: arrPlaylist[index])
        setupTimer()
        setupVolume()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        circleAvatar()
        // xoay volume control
        rotateVolumeControl()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension TimeInterval{
    func convertTimer2String() -> String{
        let mn: Int = Int(self) / 60
        let sec: Int = Int(self) % 60
        var ret: String = ""
        if mn < 10 && sec < 10{
            ret = "0\(mn):0\(sec)"
        }
        if mn < 10 && sec >= 10{
            ret = "0\(mn):\(sec)"
        }
        if mn >= 10 && sec < 10{
            ret = "\(mn):0\(sec)"
        }
        if mn > 10 && sec > 10{
            ret = "\(mn):\(sec)"
        }
        return ret
    }
}
