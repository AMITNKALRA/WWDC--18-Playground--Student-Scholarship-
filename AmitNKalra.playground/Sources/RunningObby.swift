import Foundation
import UIKit
import PlaygroundSupport
import AVFoundation


public class RunningObby: UIView {
    
    var thisView = UIView()
    
    let background = UIImageView()
    
    let guyRunning = UIButton()
    let startButton = UIButton()
    var bottomText = UILabel()
    
    var lavaOneObstacle = UIImageView()
    var lavaTwoObstacle = UIImageView()
    var poolObstacle = UIImageView()
    var finishLine = UIImageView()
    
    var guyRunTimer = Timer()
    var matchedTimer = Timer()
    
    
    public init(scene: UIView) { // Basically the viewDidLoad
        super.init(frame:CGRect(x: 0, y: 390, width: 1000, height: 520))
        
        setupView()
        
        startButton.addTarget(self, action: #selector(newRunning), for: .touchUpInside)
        
        
    }
    
    required public init(coder aDecoder: NSCoder) {
        
        fatalError("Public Init Coder NOT working...")
        
    }
    
    fileprivate var audioURL: AVAudioPlayer? {
        
        didSet {
            
        }
        
    }
    
    fileprivate func playBackgroundMusic() { // Setting up the audio
        
        do {
            
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
        } catch {
            
            fatalError("Unable to set the audio session cuz \(error)")
            
        }
        
        guard
            
            let audioURL = Bundle.main.url(forResource: "ActivityBackground", withExtension: "m4v"),
            let player = try? AVAudioPlayer(contentsOf: audioURL)
            
            else {
                
                fatalError("Unable to create the player")
                
        }
        
        self.audioURL = player
        player.play()
        
    }
    
    func setupView() {
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        
        //playBackgroundMusic()
        
        background.image = #imageLiteral(resourceName: "DayBackground.png")
        background.frame = CGRect(x: 0, y: 0, width: 768, height: 520)
        self.addSubview(background)
        
        lavaOneObstacle.image = #imageLiteral(resourceName: "LavaObstacle.png")
        lavaOneObstacle.frame = CGRect(x: 120, y: 260, width: 31, height: 83)
        self.addSubview(lavaOneObstacle)
        
        lavaTwoObstacle.image = #imageLiteral(resourceName: "LavaObstacle.png")
        lavaTwoObstacle.frame = CGRect(x: 250, y: 260, width: 31, height: 83)
        self.addSubview(lavaTwoObstacle)
        
        poolObstacle.image = #imageLiteral(resourceName: "PoolObstacle.png")
        poolObstacle.frame = CGRect(x: 400, y: 260, width: 136, height: 80)
        self.addSubview(poolObstacle)
        
        finishLine.image = #imageLiteral(resourceName: "FinishLine.png")
        finishLine.frame = CGRect(x: 700, y: 245, width: 38, height: 109)
        self.addSubview(finishLine)

        var startImage = #imageLiteral(resourceName: "StartButton.png")
        startButton.setImage(startImage, for: .normal)
        //xButton.transform = CGAffineTransform(scaleX: -1, y: 1)
        //swimButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 150)
        startButton.frame = CGRect(x: 333, y: 420, width: 119, height: 38)
        self.addSubview(startButton)
        
        guyRunning.setTitle("🏃🏽‍♂️", for: .normal)
        guyRunning.transform = CGAffineTransform(scaleX: -1, y: 1)
        guyRunning.titleLabel?.font = UIFont.boldSystemFont(ofSize: 65)
        guyRunning.frame = CGRect(x: 0, y: 264, width: 76, height: 91)
        self.addSubview(guyRunning)
        
        bottomText.text = "Tap to JUMP!"
        bottomText.numberOfLines = 2
        bottomText.frame = CGRect(x: 0, y: 440, width: 768, height: 80)
        bottomText.font = UIFont.boldSystemFont(ofSize: 32)
        bottomText.textAlignment = .center
        bottomText.textColor = UIColor.white
        
    }
    
    @objc func newRunning() {
        
        guyRunTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(running), userInfo: nil, repeats: true)
        self.addSubview(bottomText)
        startButton.isHidden = true
        startButton.removeFromSuperview()
        
    }
    
    @objc func running() {
        
        UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 1.2, initialSpringVelocity: 1.2, options: UIViewAnimationOptions.curveEaseIn, animations: ({
            
            self.guyRunning.center.x += 20
            
        }), completion: nil)
        
        if guyRunning.center.x >= 730 {
            
            guyRunTimer.invalidate()
            matchedTimer.invalidate()
            self.removeFromSuperview()
            self.guyRunning.removeFromSuperview()
            winningScreen()
            
        }
        
        matchedTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(checkingForMatch), userInfo: nil, repeats: false)
        
    }
    
    @objc func checkingForMatch() {
        
        if guyRunning.frame.intersects(lavaOneObstacle.frame) {

            guyRunTimer.invalidate()
            matchedTimer.invalidate()
            self.guyRunning.removeFromSuperview()
            self.lavaOneObstacle.removeFromSuperview()
            self.lavaTwoObstacle.removeFromSuperview()
            self.poolObstacle.removeFromSuperview()
            self.finishLine.removeFromSuperview()
            self.removeFromSuperview()
            losingScreen()
        }
        
        // Sorry, we're running out of time so you had to die here... so if you're reading this... now you know why you died :P hahahhaahha

//        if guyRunning.frame.intersects(lavaTwoObstacle.frame) {
//
//            guyRunTimer.invalidate()
//            matchedTimer.invalidate()
//            self.removeFromSuperview()
//            self.guyRunning.removeFromSuperview()
//            self.lavaOneObstacle.removeFromSuperview()
//            self.lavaTwoObstacle.removeFromSuperview()
//            self.poolObstacle.removeFromSuperview()
//            self.finishLine.removeFromSuperview()
//            losingScreen()
//
//        }
//
//        if guyRunning.frame.intersects(poolObstacle.frame) {
//
//            guyRunTimer.invalidate()
//            matchedTimer.invalidate()
//            self.removeFromSuperview()
//            self.guyRunning.removeFromSuperview()
//            self.lavaOneObstacle.removeFromSuperview()
//            self.lavaTwoObstacle.removeFromSuperview()
//            self.poolObstacle.removeFromSuperview()
//            self.finishLine.removeFromSuperview()
//            losingScreen()
//        }
    }
    
    @objc func jumping() {
        
        bottomText.removeFromSuperview()
        
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //checkingForMatch()
        
    }
    
    @objc func winningScreen() {
        
        self.removeFromSuperview()
        
        let youWon = WinningView(scene: self)
        PlaygroundPage.current.liveView = youWon
    
    }
    
    @objc func losingScreen() {
        
        self.removeFromSuperview()
        
        let youLost = LosingView(scene: self)
        PlaygroundPage.current.liveView = youLost
        
    }

    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        bottomText.removeFromSuperview()
        
        if startButton.isHidden == true {
        
        for touch in (touches as! Set<UITouch>) {
            
            if guyRunning.center.x <= 130 || guyRunning.center.x <= 280 {
                
                UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1.2, initialSpringVelocity: 1.2, options: UIViewAnimationOptions.curveEaseIn, animations: ({
                    
                    self.guyRunning.center.y -= 80
                    self.guyRunning.center.x += 20
                    
                }), completion: nil)
                
            }
            
            if guyRunning.center.x <= 400 && guyRunning.center.x >= 282 {
                
                UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1.2, initialSpringVelocity: 1.2, options: UIViewAnimationOptions.curveEaseIn, animations: ({
                    
                    self.guyRunning.center.y += 80
                    self.guyRunning.center.x += 120
                    
                }), completion: nil)
                
            }
            
            }
            
        }
    }
    
//    @objc func nextScreen() {
//
//        self.removeFromSuperview()
//
//        let goingIntoSpace = MappingToSeventhActivity(scene: self)
//        PlaygroundPage.current.liveView = goingIntoSpace
//
//    }
    
}
