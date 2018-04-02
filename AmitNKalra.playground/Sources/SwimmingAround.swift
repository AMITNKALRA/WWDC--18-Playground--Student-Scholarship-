import Foundation
import UIKit
import PlaygroundSupport
import AVFoundation


public class SwimmingView: UIView {
    
    var thisView = UIView()
    
    let background = UIImageView()
    
    let xButtonMessage = UIImageView()
    let mapButtonMessage = UIImageView()
    let guySwimming = UIButton()
    let girlSwimming = UIButton()
    
    let swimButton = UIButton()
    let stopButton = UIButton()
    let continueButton = UIButton()
    
    var swimmingTimer = Timer()
    
    
    public init(scene: UIView) { // Basically the viewDidLoad
        super.init(frame:CGRect(x: 0, y: 390, width: 1000, height: 520))
        
        setupView()
        
        swimButton.addTarget(self, action: #selector(swimmingForward), for: .touchUpInside)
        stopButton.addTarget(self, action: #selector(stopping), for: .touchUpInside)
        continueButton.addTarget(self, action: #selector(nextScreen), for: .touchUpInside)
        
    }
    
    required public init(coder aDecoder: NSCoder) {
        
        fatalError("Public Init Coder NOT working...")
        
    }
    
    fileprivate var audioURL: AVAudioPlayer? {
        
        didSet {
            
        }
        
    }
    
    @objc fileprivate func playBackgroundMusic() { // Setting up the audio
        
        do {
            
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
        } catch {
            
            fatalError("Unable to set the audio session cuz \(error)")
            
        }
        
        guard
            
            let audioURL = Bundle.main.url(forResource: "MapsBackground", withExtension: "m4v"),
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
        
        guySwimming.setTitle("🏊🏼‍♂️", for: .normal)
        //guyRunning.transform = CGAffineTransform(scaleX: -1, y: 1)
        guySwimming.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        guySwimming.frame = CGRect(x: 10, y: 340, width: 76, height: 33)
        self.addSubview(guySwimming)
        
        girlSwimming.setTitle("🏊🏼‍♀️", for: .normal)
        //girlSwimming.transform = CGAffineTransform(scaleX: -1, y: 1)
        girlSwimming.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        girlSwimming.frame = CGRect(x: 60, y: 350, width: 76, height: 33)
        self.addSubview(girlSwimming)
        
        continueButton.setTitle("Next", for: .normal)
        continueButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        continueButton.setTitleColor(UIColor.white, for: .normal)
        continueButton.frame = CGRect(x: 658, y: 475, width: 105, height: 34)
        self.addSubview(continueButton)
        
        var swimImage = #imageLiteral(resourceName: "SwimButton.png")
        swimButton.setImage(swimImage, for: .normal)
        //xButton.transform = CGAffineTransform(scaleX: -1, y: 1)
        //swimButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 150)
        swimButton.frame = CGRect(x: 150, y: 480, width: 119, height: 38)
        self.addSubview(swimButton)
        
        var stopImage = #imageLiteral(resourceName: "StopButton.png")
        stopButton.setImage(stopImage, for: .normal)
        //mapButton.transform = CGAffineTransform(scaleX: -1, y: 1)
        //stopButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 150)
        stopButton.frame = CGRect(x: 350, y: 480, width: 119, height: 38)
        self.addSubview(stopButton)
        
        
    }
    
    @objc func swimming() {
        
        swimmingTimer = Timer.scheduledTimer(timeInterval: 7.0, target: self, selector: #selector(swimmingForward), userInfo: nil, repeats: true)
        
    }
    
    @objc func swimmingForward() {
        
        guySwimming.transform = CGAffineTransform(scaleX: -1, y: 1)
        girlSwimming.transform = CGAffineTransform(scaleX: -1, y: 1)
        
        UIView.animate(withDuration: 3.5, delay: 0, usingSpringWithDamping: 1.2, initialSpringVelocity: 1.2, options: UIViewAnimationOptions.curveEaseIn, animations: ({
            
            self.guySwimming.center.x = self.guySwimming.center.x + 400
            self.girlSwimming.center.x = self.girlSwimming.center.y + 400
            
        }), completion: nil)
        
        Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(swimmingBackward), userInfo: nil, repeats: false)
    
        
    }
    
    @objc func swimmingBackward() {
        
        guySwimming.transform = CGAffineTransform(scaleX: 1, y: 1)
        girlSwimming.transform = CGAffineTransform(scaleX: 1, y: 1)
        
        UIView.animate(withDuration: 3.5, delay: 0, usingSpringWithDamping: 1.2, initialSpringVelocity: 1.2, options: UIViewAnimationOptions.curveEaseIn, animations: ({
            
            self.guySwimming.center.x = self.guySwimming.center.x - 400
            self.girlSwimming.center.x = self.girlSwimming.center.y - 400
            
        }), completion: nil)
        
    }
    
    @objc func stopping() {
        
        guySwimming.transform = CGAffineTransform(scaleX: -1, y: 1)
        girlSwimming.transform = CGAffineTransform(scaleX: -1, y: 1)
        guySwimming.frame = CGRect(x: 10, y: 340, width: 76, height: 33)
        girlSwimming.frame = CGRect(x: 60, y: 350, width: 76, height: 33)
        continueButton.frame = CGRect(x: 658, y: 475, width: 105, height: 34)
        
        swimmingTimer.invalidate()
    }
    
    
    @objc func nextScreen() {
        
        self.removeFromSuperview()
        
        let goingToSandbox = MappingToFifthActivity(scene: self)
        PlaygroundPage.current.liveView = goingToSandbox
        
    }
    
}
