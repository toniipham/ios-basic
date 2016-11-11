//
//  ViewController.swift
//  MyMusicPlayer
//
//  Created by Cam Loan on 11/8/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view1: UIView!
    let lblStartTime: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 60, height: 30))
    let lblEndTime: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 60, height: 30))
    //let lbl: UILabel = UILabel(frame: CGRect(x: 300, y: 600, width: 60, height: 30))
    let lblStartTime1: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 60, height: 30))
    let lblEndTime1: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 60, height: 30))
    let slider1: UISlider = UISlider(frame: CGRect(x: 0, y: 0, width: 230, height: 30))
    let slider2: UISlider = UISlider(frame: CGRect(x: 0, y: 0, width: 230, height: 30))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // hien thi hinh anh theo album
        imgAlbumCD.image = UIImage(named: "ae1")
        // tu tao label hien thi thoi gian dong
        view1.addSubview(lblStartTime)
        view2.addSubview(lblEndTime)
        view3.addSubview(slider1)
        //self.view.addSubview(lbl)
    }
    override func viewDidAppear(_ animated: Bool) {
        // bo tron album cd
        let imgHeight = imgAlbumCD.frame.size.height
        imgAlbumCD.clipsToBounds = true
        imgAlbumCD.layer.masksToBounds = true
        imgAlbumCD.contentMode = .scaleAspectFill
        imgAlbumCD.layer.borderWidth = 2
        imgAlbumCD.layer.borderColor = UIColor.white.cgColor
        imgAlbumCD.layer.cornerRadius = imgHeight/2
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var imgAlbumCD: UIImageView!
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var tvLyrics: UITextView!
    
    var player: AVAudioPlayer = AVAudioPlayer()
    var isPlayed = false
    var isStop = false
    var timerXoayAlbum = Timer()
    var timerUpdateTime = Timer()
    var timerSlider = Timer()
    var durationTime: Float?
    var currentTime: Float?
    var curTimer: Float?
    var remainedTimer: Float?
    
    func playMusic(){
        
        let strMusicPath = Bundle.main.path(forResource: "idontwannamissathing", ofType: "mp3")!
        let urlMusic: URL = URL(fileURLWithPath: strMusicPath)
        do{
            player = try AVAudioPlayer(contentsOf: urlMusic)
            //lblStartTime.text = "0:0"
            durationTime = Float(player.duration)
            lblStartTime.text = "00:00"
            lblEndTime.text = formatTime(fTime: Float(player.duration))
            slider1.maximumValue = Float(self.player.duration)
            //print(durationFormat(duration: Float(player.currentTime)))
            if isPlayed && isStop == false{
                player.prepareToPlay()
                player.play()
                player.volume = 0.5
                currentTime = Float(player.currentTime)
               
                // cap nhat thoi gian bat dau bang currenttime, thoi gian ket thuc bang duration-currenttime
                timerUpdateTime = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateDuration), userInfo: nil, repeats: true)
                // xoay album cd cho den het thoi gian cua ban nhac
                // tam thoi su dung timer
                timerXoayAlbum = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.xoayAlbumCD), userInfo: nil, repeats: true)
                timerSlider = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateSlider), userInfo: nil, repeats: true)
            }else if isPlayed == false && isStop == true{
                player.stop()
            } else {
                player.pause()
                
            }
        }catch{}
    }
    func durationFormat(duration: Float) -> String
    {
        let minutes = lroundf(duration/60)
        let seconds = lroundf(duration)-(minutes*60)

        //return String(format: "%02d:%02d", minutes, seconds)
        return String(format: "\(minutes):\(seconds)")
    }
    func xoayAlbumCD(){
        
        UIView.animate(withDuration: 1, delay: 0.0, options: .curveLinear, animations: {
            self.imgAlbumCD.transform = self.imgAlbumCD.transform.rotated(by: CGFloat(M_PI))
        }, completion: {
            (true) in
            UIView.animate(withDuration: 1, delay: 0.0, options: .curveLinear, animations: {
                self.imgAlbumCD.layer.transform = CATransform3DIdentity
            }, completion: nil)
        })
    }
    func formatTime(fTime: Float) -> String
    {
        let mn = lroundf(fTime)/60
        let snd = lroundf(fTime) - (mn*60)
        return String(format: "%02d:%02d", mn, snd)
    }
    func updateDuration(){
        let curTime = Float(player.currentTime)
        //print(formatTime(fTime: curTime))
        //self.lblStartTime.text = durationFormat(duration: curTime)
        let remainedTime = durationTime! - curTime
        //self.lblEndTime.text = durationFormat(duration: remainedTime)
        //print("CurTime: \(durationFormat(duration: curTime)) and remain time: \(durationFormat(duration: remainedTime))")
        lblStartTime.text = formatTime(fTime: curTime)
        lblEndTime.text = formatTime(fTime: remainedTime)
        if remainedTime == 0 {
            timerXoayAlbum.invalidate()
            timerUpdateTime.invalidate()
            timerSlider.invalidate()
        }
    }
    func updatePausedTime()
    {
        lblStartTime.removeFromSuperview()
        lblEndTime.removeFromSuperview()
        slider1.removeFromSuperview()
        view1.addSubview(lblStartTime1)
        view2.addSubview(lblEndTime1)
        view3.addSubview(slider2)
        //print(self.formatTime(fTime: self.curTimer!))
        lblStartTime1.text = formatTime(fTime: curTimer!)
        lblEndTime1.text = formatTime(fTime: remainedTimer!)
        slider2.value = Float(curTimer!)
        
    }
    func updateSlider()
    {
        slider1.value = Float(player.currentTime)
    }
    
    @IBAction func abtnStop(_ sender: Any) {
        isStop = true
        btnPlay.setImage(UIImage(named: "play"), for: .normal)
        isPlayed = false
        playMusic()
        timerXoayAlbum.invalidate()
        timerUpdateTime.invalidate()
        timerSlider.invalidate()
    }
    @IBAction func btnPlay(_ sender: Any) {
                if !isPlayed{
                    btnPlay.setImage(UIImage(named: "pause"), for: .normal)
                    isPlayed = true
                    isStop = false
                }else{
                    curTimer = Float(player.currentTime)//lblStartTime.text
                    remainedTimer = durationTime! - curTimer!//lblEndTime.text
                    updatePausedTime()
                    btnPlay.setImage(UIImage(named: "play"), for: .normal)
                    isPlayed = false
                    timerXoayAlbum.invalidate()
                }
        playMusic()
    }
}
