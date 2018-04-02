import Foundation
import UIKit
import PlaygroundSupport
import AVFoundation

public class MapToSecondActivity: UIView {
    
    let backgroundImage = UIImageView()
    let swiftBird = UIImageView()
    
    let oldFirstPath = UIImageView()
    let oldSecondPath = UIImageView()
    let oldThirdPath = UIImageView()
    let oldFourthPath = UIImageView()
    let studioSpeakers = UIButton()
    
    let firstPath = UIImageView()
    let secondPath = UIImageView()
    let thirdPath = UIImageView()
    let fourthPath = UIImageView()
    let fifthPath = UIImageView()
    let sixthPath = UIImageView()
    let biker = UIButton()

    public init(scene: UIView) { // Basically the viewDidLoad
        super.init(frame:CGRect(x: 0, y: 390, width: 1000, height: 520))
        
        setupView()
                
        Timer.scheduledTimer(timeInterval: 8.02, target: self, selector: #selector(birdAnimations), userInfo: nil, repeats: true)
        
        biker.addTarget(self, action: #selector(pressedBike), for: .touchUpInside)

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
        
        backgroundImage.image = #imageLiteral(resourceName: "DayBackground.png")
        backgroundImage.frame = CGRect(x: 0, y: 0, width: 768, height: 520)
        self.addSubview(backgroundImage)
        
        swiftBird.image = #imageLiteral(resourceName: "SwiftBird.png")
        swiftBird.frame = CGRect(x: 365, y: 87, width: 35, height: 32)
        
        moveBirdUpLeftFirst()
        oldPath()
        
        Timer.scheduledTimer(timeInterval: 1.02, target: self, selector: #selector(moveBirdDownLeftFirst), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 2.02, target: self, selector: #selector(moveBirdUpRightFirst), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 3.02, target: self, selector: #selector(moveBirdDownRightFirst), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 4.02, target: self, selector: #selector(moveBirdUpRightSecond), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 5.02, target: self, selector: #selector(moveBirdDownRightSecond), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 6.02, target: self, selector: #selector(moveBirdUpLeftSecond), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 7.02, target: self, selector: #selector(moveBirdDownLeftSecond), userInfo: nil, repeats: false)
        
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(loadFirstStep), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(loadSecondStep), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(loadThirdStep), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(loadFourthStep), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(loadBike), userInfo: nil, repeats: false)

    }
    
    func oldPath() {
        
        oldFirstPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        oldFirstPath.frame = CGRect(x: 10, y: 503, width: 21, height: 9)
        self.addSubview(oldFirstPath)
        
        oldSecondPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        oldSecondPath.frame = CGRect(x: 38, y: 495, width: 21, height: 9)
        oldSecondPath.rotate(degrees: -33)
        self.addSubview(oldSecondPath)

        oldThirdPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        oldThirdPath.frame = CGRect(x: 60, y: 474, width: 21, height: 9)
        oldThirdPath.rotate(degrees: -60)
        self.addSubview(oldThirdPath)

        oldFourthPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        oldFourthPath.frame = CGRect(x: 72, y: 446, width: 21, height: 9)
        oldFourthPath.rotate(degrees: -80)
        self.addSubview(oldFourthPath)

        let speakerImage = #imageLiteral(resourceName: "Studio.png")
        studioSpeakers.setImage(speakerImage, for: .normal)
        studioSpeakers.frame = CGRect(x: 58, y: 393, width: 62, height: 39)
        self.addSubview(studioSpeakers)
        
        //playBackgroundMusic()
        
    }
    
    @objc func birdAnimations() {
        
        moveBirdUpLeftFirst()
        
        Timer.scheduledTimer(timeInterval: 1.02, target: self, selector: #selector(moveBirdDownLeftFirst), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 2.02, target: self, selector: #selector(moveBirdUpRightFirst), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 3.02, target: self, selector: #selector(moveBirdDownRightFirst), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 4.02, target: self, selector: #selector(moveBirdUpRightSecond), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 5.02, target: self, selector: #selector(moveBirdDownRightSecond), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 6.02, target: self, selector: #selector(moveBirdUpLeftSecond), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 7.02, target: self, selector: #selector(moveBirdDownLeftSecond), userInfo: nil, repeats: false)
    }
    
    @objc func moveBirdUpLeftFirst() {
        
        UIView.animate(withDuration: 1.2, delay: 0.5, usingSpringWithDamping: 1.2, initialSpringVelocity: 1.2, options: UIViewAnimationOptions.curveEaseIn, animations: ({
            
            self.swiftBird.image = #imageLiteral(resourceName: "SwiftBird.png")
            self.swiftBird.center.x = self.swiftBird.center.x - 100
            self.swiftBird.center.y = self.swiftBird.center.y - 50
            
        }), completion: nil)
        
        self.addSubview(swiftBird)
        
    }
    
    @objc func moveBirdUpRightFirst() {
        
        self.swiftBird.image = #imageLiteral(resourceName: "SwiftBird.png")
        self.swiftBird.transform = CGAffineTransform(scaleX: -1, y: 1)
        
        UIView.animate(withDuration: 1.2, delay: 0.5, usingSpringWithDamping: 1.2, initialSpringVelocity: 1.2, options: UIViewAnimationOptions.curveEaseIn, animations: ({
            
            self.swiftBird.center.x = self.swiftBird.center.x + 100
            self.swiftBird.center.y = self.swiftBird.center.y - 50

        }), completion: nil)
        
    }
    
    @objc func moveBirdDownLeftFirst() {
        
        self.swiftBird.image = #imageLiteral(resourceName: "SwiftBirdDown.png")
        
        UIView.animate(withDuration: 1.2, delay: 0.5, usingSpringWithDamping: 1.2, initialSpringVelocity: 1.2, options: UIViewAnimationOptions.curveEaseIn, animations: ({
            
            self.swiftBird.center.x = self.swiftBird.center.x - 100
            self.swiftBird.center.y = self.swiftBird.center.y + 50

        }), completion: nil)
        
    }
    
    @objc func moveBirdDownRightFirst() {
        
        self.swiftBird.image = #imageLiteral(resourceName: "SwiftBirdDown.png")
        self.swiftBird.transform = CGAffineTransform(scaleX: -1, y: 1)
        
        UIView.animate(withDuration: 1.2, delay: 0.5, usingSpringWithDamping: 1.2, initialSpringVelocity: 1.2, options: UIViewAnimationOptions.curveEaseIn, animations: ({
            
            self.swiftBird.center.x = self.swiftBird.center.x + 100
            self.swiftBird.center.y = self.swiftBird.center.y + 50

        }), completion: nil)
        
    }
    
    @objc func moveBirdUpRightSecond() {
        
        self.swiftBird.image = #imageLiteral(resourceName: "SwiftBird.png")
        self.swiftBird.transform = CGAffineTransform(scaleX: -1, y: 1)
        
        UIView.animate(withDuration: 1.2, delay: 0.5, usingSpringWithDamping: 1.2, initialSpringVelocity: 1.2, options: UIViewAnimationOptions.curveEaseIn, animations: ({
            
            self.swiftBird.center.x = self.swiftBird.center.x + 100
            self.swiftBird.center.y = self.swiftBird.center.y - 50
 
        }), completion: nil)
        
    }
    
    @objc func moveBirdDownRightSecond() {
        
        self.swiftBird.image = #imageLiteral(resourceName: "SwiftBirdDown.png")
        self.swiftBird.transform = CGAffineTransform(scaleX: -1, y: 1)
        
        UIView.animate(withDuration: 1.2, delay: 0.5, usingSpringWithDamping: 1.2, initialSpringVelocity: 1.2, options: UIViewAnimationOptions.curveEaseIn, animations: ({
            
            self.swiftBird.center.x = self.swiftBird.center.x + 100
            self.swiftBird.center.y = self.swiftBird.center.y + 50

        }), completion: nil)
    }
    
    @objc func moveBirdUpLeftSecond() {
        
        self.swiftBird.image = #imageLiteral(resourceName: "SwiftBird.png")
        self.swiftBird.transform = CGAffineTransform(scaleX: 1, y: 1)
        
        UIView.animate(withDuration: 1.2, delay: 0.5, usingSpringWithDamping: 1.2, initialSpringVelocity: 1.2, options: UIViewAnimationOptions.curveEaseIn, animations: ({

            self.swiftBird.center.x = self.swiftBird.center.x - 100
            self.swiftBird.center.y = self.swiftBird.center.y - 50
            
        }), completion: nil)
        
    }
    
    @objc func moveBirdDownLeftSecond() {
        
        self.swiftBird.image = #imageLiteral(resourceName: "SwiftBirdDown.png")
        //self.swiftBird.transform = CGAffineTransform(scaleX: 1, y: -1)
        
        UIView.animate(withDuration: 1.2, delay: 0.5, usingSpringWithDamping: 1.2, initialSpringVelocity: 1.2, options: UIViewAnimationOptions.curveEaseIn, animations: ({
            
            self.swiftBird.center.x = self.swiftBird.center.x - 100
            self.swiftBird.center.y = self.swiftBird.center.y + 50
            
        }), completion: nil)

    }
    
    @objc func loadFirstStep() {
        
        firstPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        firstPath.frame = CGRect(x: 79, y: 369, width: 21, height: 9)
        firstPath.rotate(degrees: -96)
        
        self.addSubview(firstPath)

        playBackgroundMusic()
        Timer.scheduledTimer(timeInterval: 45.0, target: self, selector: #selector(playBackgroundMusic), userInfo: nil, repeats: true)
        
    }
    
    @objc func loadSecondStep() {
        
        secondPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        secondPath.frame = CGRect(x: 75, y: 341, width: 21, height: 9)
        secondPath.rotate(degrees: -107)

        self.addSubview(secondPath)
        
    }
    
    @objc func loadThirdStep() {
        
        thirdPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        thirdPath.frame = CGRect(x: 66, y: 314, width: 21, height: 9)
        thirdPath.rotate(degrees: -112)
        
        self.addSubview(thirdPath)
        
    }
    
    @objc func loadFourthStep() {
        
        fourthPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        fourthPath.frame = CGRect(x: 55, y: 289, width: 21, height: 9)
        fourthPath.rotate(degrees: -120)
        
        self.addSubview(fourthPath)
        
    }
    
    @objc func loadBike() {
        
        biker.setTitle("🚴🏼‍♂️", for: .normal)
        biker.transform = CGAffineTransform(scaleX: -1, y: 1)
        biker.titleLabel?.font = UIFont.boldSystemFont(ofSize: 45)
        biker.frame = CGRect(x: 2, y: 240, width: 50, height: 50)

        self.addSubview(biker)

    }
    
    @objc func pressedBike() {
        
        self.removeFromSuperview()
        
        let bikerDrag = BikerDrags(scene: self)
        PlaygroundPage.current.liveView = bikerDrag
        
    }

}
