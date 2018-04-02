import Foundation
import UIKit
import PlaygroundSupport
import AVFoundation


public class RocketScene: UIView {
    
    let backgroundImage = UIImageView()
    let rocket = UIImageView()
    let newRocket = UIImageView()
    let newerRocket = UIImageView()
    let lastRocket = UIImageView()
    let brandNewRocket = UIImageView()
    
    var rocketPos = CGRect()
    var newRocketPos = CGRect()
    var newerRocketPos = CGRect()
    
    public init(scene: UIView) { // Basically the viewDidLoad
        super.init(frame:CGRect(x: 0, y: 390, width: 1000, height: 520))
        
        setupView()
        
        Timer.scheduledTimer(timeInterval: 2.6, target: self, selector: #selector(addPlanets), userInfo: nil, repeats: false)
        
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
        
        backgroundImage.frame = CGRect(x: 0, y: 0, width: 768, height: 520)
        backgroundImage.image = #imageLiteral(resourceName: "SpaceBackground.png")
        self.addSubview(backgroundImage)
        
        rocket.frame = CGRect(x: 334, y: 400, width: 95, height: 172)
        rocket.image = #imageLiteral(resourceName: "Rocket.png")
        self.addSubview(rocket)
        
        UIView.animate(withDuration: 3.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIViewAnimationOptions.curveEaseIn, animations: ({
            
            self.rocket.frame.origin.y -= 520
        }), completion: nil)
        
    }
    
    @objc func addPlanets() {
        
        backgroundImage.image = #imageLiteral(resourceName: "PlanetsSpace.png")
        rocket.frame = CGRect(x: 484, y: 200, width: 27, height: 49) // can go upto 634
        
        moveRocketStraight()
        
    }
    
    @objc func moveRocketStraight() {
        
        UIView.animate(withDuration: 3.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIViewAnimationOptions.curveEaseIn, animations: ({
            
            self.rocket.frame.origin.y -= 120
            self.rocket.frame.origin.x += 60
            self.rocket.rotate(degrees: 41)
            
        }), completion: nil)
        
       Timer.scheduledTimer(timeInterval: 1.2, target: self, selector: #selector(moveRocketAround), userInfo: nil, repeats: false)
        
       rocketPos = rocket.frame
        
    }
    
    @objc func moveRocketAround() {
        
        self.rocket.removeFromSuperview()
        
        newRocket.image = #imageLiteral(resourceName: "Rocket.png")
        self.newRocket.frame = CGRect(x: rocketPos.origin.x, y: rocketPos.origin.y, width: 27, height: 49)
        self.addSubview(newRocket)
        
        UIView.animate(withDuration: 3.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIViewAnimationOptions.curveEaseIn, animations: ({
            
            self.newRocket.rotate(degrees: 100)
            
        }), completion: nil)
        
        Timer.scheduledTimer(timeInterval: 1.2, target: self, selector: #selector(moveRocketDown), userInfo: nil, repeats: false)
        
        newRocketPos = newRocket.frame
        
    }
    
    @objc func moveRocketDown() {
        
        self.newRocket.removeFromSuperview()
        
        newerRocket.image = #imageLiteral(resourceName: "Rocket.png")
        self.newerRocket.frame = CGRect(x: newRocketPos.origin.x, y: newRocketPos.origin.y, width: 27, height: 49)
        self.addSubview(newerRocket)
        
        UIView.animate(withDuration: 3.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIViewAnimationOptions.curveEaseIn, animations: ({
            
            self.newerRocket.rotate(degrees: -145)
            
        }), completion: nil)
        
        newerRocketPos = newerRocket.frame
        
        Timer.scheduledTimer(timeInterval: 1.2, target: self, selector: #selector(movingRocketDown), userInfo: nil, repeats: false)
        
    }
    
    @objc func movingRocketDown() {
        
        self.newerRocket.removeFromSuperview()
        
        lastRocket.image = #imageLiteral(resourceName: "Rocket.png")
        self.lastRocket.frame = CGRect(x: newerRocketPos.origin.x, y: newerRocketPos.origin.y, width: 27, height: 49)
        self.addSubview(lastRocket)
        
        UIView.animate(withDuration: 3.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIViewAnimationOptions.curveEaseIn, animations: ({
            
            self.lastRocket.frame.origin.y += 120
            self.lastRocket.frame.origin.x -= 60
            self.lastRocket.rotate(degrees: -145)
           
        }), completion: nil)
        
        Timer.scheduledTimer(timeInterval: 1.2, target: self, selector: #selector(goingBackToSurface), userInfo: nil, repeats: false)
        
    }
    
    @objc func goingBackToSurface() {
        
        lastRocket.removeFromSuperview()
        
        backgroundImage.frame = CGRect(x: 0, y: 0, width: 768, height: 520)
        backgroundImage.image = #imageLiteral(resourceName: "SpaceBackground.png")
        self.addSubview(backgroundImage)
        
        brandNewRocket.frame = CGRect(x: 334, y: 0, width: 95, height: 172)
        brandNewRocket.image = #imageLiteral(resourceName: "Rocket.png")
        brandNewRocket.rotate(degrees: 0)
        brandNewRocket.transform = CGAffineTransform(scaleX: 1, y: -1)
        self.addSubview(brandNewRocket)
        
        
        UIView.animate(withDuration: 3.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIViewAnimationOptions.curveEaseIn, animations: ({
            
            self.brandNewRocket.frame.origin.y += 520
            
        }), completion: nil)
        
        Timer.scheduledTimer(timeInterval: 1.2, target: self, selector: #selector(anotherMoveToNextScreen), userInfo: nil, repeats: false)
        
    }
    
    @objc func anotherMoveToNextScreen() {
        
            self.removeFromSuperview()
        
            let falling = MappingToEighthActivity(scene: self)
            PlaygroundPage.current.liveView = falling
        
    }

}
