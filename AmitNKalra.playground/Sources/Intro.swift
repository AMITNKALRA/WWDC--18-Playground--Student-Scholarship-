import Foundation
import UIKit
import PlaygroundSupport
import AVFoundation


public class IntroView: UIView {
    
    var thisView = UIView()
    
    let heyText = UILabel()
    let imText = UILabel()
    let myName = UILabel()
    
    let continueButton = UIButton()
    let textButton = UILabel()
    let continueTextButton = UIButton()
    
    let meFalling = UIImageView()
    let meLeaning = UIImageView()
    let meLeaningTwo = UIImageView()
    let me = UIImageView()
    
    public init(scene: UIView) { // Basically the viewDidLoad
        super.init(frame:CGRect(x: 0, y: 390, width: 1000, height: 520))
        
        setupUI()
        animation()
        
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
            
            let audioURL = Bundle.main.url(forResource: "MapsBackground", withExtension: "m4v"),
            let player = try? AVAudioPlayer(contentsOf: audioURL)
            
            else {
                
                fatalError("Unable to create the player")
                
        }
        
        self.audioURL = player
        player.play()
        
    }
    
    func setupUI() {
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor(red: 255.0, green: (129.0/255.0), blue: (133.0/255.0), alpha: 1.0)
        
        me.frame = CGRect(x: 555, y: 200, width: 210, height: 310)
        me.image = #imageLiteral(resourceName: "MeBitmoji.png")
        self.addSubview(me)
        me.isHidden = true
        
        meLeaning.frame = CGRect(x: 555, y: 200, width: 163, height: 330)
        meLeaning.image = #imageLiteral(resourceName: "MeLeaning.png")
        self.addSubview(meLeaning)
        meLeaning.isHidden = true
        
        meLeaningTwo.frame = CGRect(x: 590, y: 200, width: 124, height: 327)
        meLeaningTwo.image = #imageLiteral(resourceName: "MeLeaningTwo.png")
        self.addSubview(meLeaningTwo)
        meLeaningTwo.isHidden = true
        
        meFalling.frame = CGRect(x: 555, y: 0, width: 198, height: 243)
        meFalling.image = #imageLiteral(resourceName: "MeFalling.png")
        self.addSubview(meFalling)
        meFalling.isHidden = true
        
        heyText.text = "Heey!"
        heyText.frame = CGRect(x: 0, y: 0, width: 500, height: 150)
        heyText.font = UIFont.boldSystemFont(ofSize: 137)
        heyText.textColor = UIColor.white
        heyText.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        self.addSubview(heyText)
        
        imText.text = "I'm"
        imText.frame = CGRect(x: 150, y: 132.5, width: 500, height: 200)
        imText.font = UIFont.boldSystemFont(ofSize: 90)
        imText.textColor = UIColor.white
        self.addSubview(imText)
        imText.isHidden = true
        
        myName.text = "Amit."
        myName.frame = CGRect(x: 245, y: 250, width: 500, height: 200)
        myName.font = UIFont.boldSystemFont(ofSize: 100)
        myName.textColor = UIColor.white
        self.addSubview(myName)
        myName.isHidden = true
        
        continueButton.backgroundColor = UIColor.white
        continueButton.frame = CGRect(x: 25, y: 425, width: 240, height: 65)
        continueButton.layer.cornerRadius = 26.5
        continueButton.clipsToBounds = true
        self.addSubview(continueButton)
        continueButton.isHidden = true
        
        textButton.text = "Continue"
        textButton.frame = CGRect(x: 25, y: 425, width: 240, height: 65)
        textButton.font = UIFont.boldSystemFont(ofSize: 32)
        textButton.textAlignment = .center
        textButton.textColor = UIColor(red: 255.0, green: (129.0/255.0), blue: (133.0/255.0), alpha: 1.0)
        self.addSubview(textButton)
        

        continueTextButton.titleLabel?.textAlignment = .center
        continueTextButton.frame = CGRect(x: 25, y: 425, width: 240, height: 65)
        self.addSubview(continueTextButton)
        
        continueTextButton.addTarget(self, action: #selector(pressed), for: .touchUpInside)
    
        Timer.scheduledTimer(timeInterval: 2.02, target: self, selector: #selector(hideImLabel), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 2.502, target: self, selector: #selector(hideNameLabel), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 2.02, target: self, selector: #selector(hideMeFalling), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 2.502, target: self, selector: #selector(actuallyHideMeFalling), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 2.502, target: self, selector: #selector(hideMeLeaning), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 3.02, target: self, selector: #selector(actuallyHideMeLeaning), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 3.02, target: self, selector: #selector(hideMeLeaningTwo), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 3.502, target: self, selector: #selector(actuallyHideMeLeaningTwo), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 3.502, target: self, selector: #selector(hideMe), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 2.502, target: self, selector: #selector(hideContinue), userInfo: nil, repeats: false)
        
    }
    
    @objc func hideImLabel() {
        
        self.imText.isHidden = false
        print("There should be animations here... but playgrounds doesn't want to show it for some reason 🤪")
        //playBackgroundMusic()
    }
    
    @objc func hideNameLabel() {
        
        self.myName.isHidden = false
    }
    
    @objc func hideMe() {
        
        self.me.isHidden = false
    }
    
    @objc func actuallyHideMe() {
        
        self.me.isHidden = true
    }
    
    @objc func hideMeFalling() {
        
        self.meFalling.isHidden = false
    }
    
    @objc func actuallyHideMeFalling() {
        
        self.meFalling.isHidden = true
    }
    
    @objc func hideMeLeaning() {
        
        self.meLeaning.isHidden = false
    }
    
    @objc func actuallyHideMeLeaning() {
        
        self.meLeaning.isHidden = true
    }
    
    @objc func hideMeLeaningTwo() {
        
        self.meLeaningTwo.isHidden = false
    }
    
    @objc func actuallyHideMeLeaningTwo() {
        
        self.meLeaningTwo.isHidden = true
    }
    
    @objc func hideContinue() {
        
        self.continueButton.isHidden = false
        
    }
    
     func animation() {
    
        UIView.animate(withDuration: 1.0, delay: 0.5, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIViewAnimationOptions.curveEaseIn, animations: ({
        
            self.heyText.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 2)
            self.heyText.center.x = self.frame.width / 3.9
        }), completion: nil)
        
        UIView.animate(withDuration: 1.0, delay: 1, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIViewAnimationOptions.curveEaseIn, animations: ({
            
            self.imText.center.x = self.frame.height / 0.98
        }), completion: nil)
        
        
        UIView.animate(withDuration: 1.0, delay: 1.5, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIViewAnimationOptions.curveEaseIn, animations: ({
            
            self.myName.center.x = self.frame.height / 0.815 // smaller number for x, further out it is.
        }), completion: nil)
        
        UIView.animate(withDuration: 1.0, delay: 1.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIViewAnimationOptions.curveEaseIn, animations: ({
            
            self.meFalling.frame.origin.y += 250
        }), completion: nil)
        
        UIView.animate(withDuration: 1.0, delay: 1.5, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIViewAnimationOptions.curveEaseIn, animations: ({

            self.meLeaning.center.x = self.frame.height / 0.79
        }), completion: nil)
        
        UIView.animate(withDuration: 1.0, delay: 2.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIViewAnimationOptions.curveEaseIn, animations: ({
            
            self.meLeaningTwo.center.x = self.frame.height / 0.79
        }), completion: nil)
        
        UIView.animate(withDuration: 1.0, delay: 2.5, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIViewAnimationOptions.curveEaseIn, animations: ({

            self.me.center.x = self.frame.height / 0.79
        }), completion: nil)
        
        
        UIView.animate(withDuration: 1.0, delay: 2.5, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIViewAnimationOptions.curveEaseIn, animations: ({
            
            self.continueButton.center.y = self.frame.height / 1.13
        }), completion: nil)
        
    }

    @objc func pressed(sender: UIButton) {
        
        self.removeFromSuperview()
            
        let welcomeView = Welcome(scene: self)
        PlaygroundPage.current.liveView = welcomeView
        
    }
}
