import Foundation
import UIKit
import AVFoundation
import PlaygroundSupport

public class SandboxView: UIView {
    
    var bottomBar = UIImageView()
    var backgroundImage = UIImageView()
    var bottomText = UILabel()
    var topText = UILabel()
    var notiText = UILabel()
    
    var name = UIImageView()
    var location = UIImageView()
    var speed = UIImageView()
    var colors = UIImageView()
    
    var emptyBoxName = UIImageView()
    var emptyBoxLocation = UIImageView()
    var emptyBoxSpeed = UIImageView()
    var emptyBoxColors = UIImageView()
    
    var answerBoxName = UIImageView() // name, age, time, speed
    var answerBoxLocation = UIImageView()
    var answerBoxSpeed = UIImageView()
    var answerBoxColors = UIImageView()
    
    var bottomMessage = UILabel()
    
    var continueButton = UIButton()
    
    
    public init(scene: UIView) { // Basically the viewDidLoad
        super.init(frame:CGRect(x: 0, y: 390, width: 1000, height: 520))
        
        setupView()
        
        continueButton.addTarget(self, action: #selector(nextScreen), for: .touchUpInside)
        
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
        self.backgroundColor = UIColor.white
        
        backgroundImage.frame = CGRect(x: 0, y: 0, width: 768, height: 520)
        backgroundImage.image = #imageLiteral(resourceName: "BlurredBackground.png")
        self.addSubview(backgroundImage)
        
        bottomBar.frame = CGRect(x: 20, y: 270, width: 733, height: 239)
        bottomBar.image = #imageLiteral(resourceName: "BottomBarBackground.png")
        self.addSubview(bottomBar)
        
        topText.text = "Let's code a rocket launch!"
        topText.textColor = UIColor.white
        topText.textAlignment = .center
        topText.numberOfLines = 5
        topText.font = UIFont.boldSystemFont(ofSize: 70)
        topText.frame = CGRect(x: 0, y: 10, width: 768, height: 172)
        self.addSubview(topText)
        
        notiText.text = "*you'll see the results later!"
        notiText.textColor = UIColor.white
        notiText.textAlignment = .center
        notiText.numberOfLines = 5
        notiText.font = UIFont.boldSystemFont(ofSize: 20)
        notiText.frame = CGRect(x: 0, y: 170, width: 768, height: 50)
        self.addSubview(notiText)
        
        bottomText.text = "Drag and Drop things that'll match!"
        bottomText.textColor = UIColor.white
        bottomText.font = UIFont.boldSystemFont(ofSize: 30)
        bottomText.textAlignment = .center
        bottomText.frame = CGRect(x: 0, y: 462, width: 768, height: 48)
        self.addSubview(bottomText)
        
        continueButton.setTitle("Next", for: .normal)
        continueButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        continueButton.setTitleColor(UIColor.white, for: .normal)
        continueButton.frame = CGRect(x: 658, y: 475, width: 105, height: 34)
        self.addSubview(continueButton)
        
        name.frame = CGRect(x: 30, y: 280, width: 186, height: 22)
        name.image = #imageLiteral(resourceName: "name.png")
        self.addSubview(name)
        
        location.frame = CGRect(x: 30, y: 330, width: 205, height: 22)
        location.image = #imageLiteral(resourceName: "location.png")
        self.addSubview(location)
        
        speed.frame = CGRect(x: 30, y: 380, width: 269, height: 22)
        speed.image = #imageLiteral(resourceName: "rocketSpeed.png")
        self.addSubview(speed)
        
        colors.frame = CGRect(x: 30, y: 430, width: 260, height: 22)
        colors.image = #imageLiteral(resourceName: "rocketColor.png")
        self.addSubview(colors)
        
        
        emptyBoxName.frame = CGRect(x: 230, y: 272, width: 104, height: 34)
        emptyBoxName.image = #imageLiteral(resourceName: "nameBoxEmpty.png")
        self.addSubview(emptyBoxName)
        
        emptyBoxLocation.frame = CGRect(x: 240, y: 322, width: 104, height: 34)
        emptyBoxLocation.image = #imageLiteral(resourceName: "ageEmptyBox.png")
        self.addSubview(emptyBoxLocation)
        
        emptyBoxSpeed.frame = CGRect(x: 305, y: 372, width: 104, height: 34)
        emptyBoxSpeed.image = #imageLiteral(resourceName: "speedEmptyBox.png")
        self.addSubview(emptyBoxSpeed)
        
        emptyBoxColors.frame = CGRect(x: 295, y: 422, width: 104, height: 34)
        emptyBoxColors.image = #imageLiteral(resourceName: "dayEmptyBox.png")
        self.addSubview(emptyBoxColors)
        
        answerBoxName.frame = CGRect(x: 500, y: 300, width: 104, height: 34)
        answerBoxName.image = #imageLiteral(resourceName: "rocketName.png")
        answerBoxName.isUserInteractionEnabled = true
        self.addSubview(answerBoxName)
        
        answerBoxLocation.frame = CGRect(x: 640, y: 300, width: 104, height: 34)
        answerBoxLocation.image = #imageLiteral(resourceName: "outerSpace.png")
        answerBoxLocation.isUserInteractionEnabled = true
        self.addSubview(answerBoxLocation)
        
        answerBoxSpeed.frame = CGRect(x: 500, y: 370, width: 104, height: 34)
        answerBoxSpeed.image = #imageLiteral(resourceName: "rockSpeedAnswer.png")
        answerBoxSpeed.isUserInteractionEnabled = true
        self.addSubview(answerBoxSpeed)
        
        answerBoxColors.frame = CGRect(x: 640, y: 370, width: 104, height: 34)
        answerBoxColors.image = #imageLiteral(resourceName: "colorAnswer.png")
        answerBoxColors.isUserInteractionEnabled = true
        self.addSubview(answerBoxColors)
        
        //playBackgroundMusic()
        
        
    }
    
    @objc func checkingForMatch() {
        
        
        if answerBoxName.frame.intersects(emptyBoxName.frame) {
            
            answerBoxName.frame = emptyBoxName.frame
            answerBoxName.image = #imageLiteral(resourceName: "rocketName.png")
            answerBoxName.isUserInteractionEnabled = false
            
        } else {
            
            answerBoxName.frame = CGRect(x: 500, y: 300, width: 104, height: 34)
            
        }
        
        if answerBoxLocation.frame.intersects(emptyBoxLocation.frame) {
            
            answerBoxLocation.frame = emptyBoxLocation.frame
            answerBoxLocation.image = #imageLiteral(resourceName: "outerSpace.png")
            answerBoxLocation.isUserInteractionEnabled = false
            
        } else {
            
            answerBoxLocation.frame = CGRect(x: 640, y: 300, width: 104, height: 34)
            
        }
        
        if answerBoxSpeed.frame.intersects(emptyBoxSpeed.frame) {
            
            answerBoxSpeed.frame = emptyBoxSpeed.frame
            answerBoxSpeed.image = #imageLiteral(resourceName: "rockSpeedAnswer.png")
            answerBoxSpeed.isUserInteractionEnabled = false
            
            
        } else {
            
            answerBoxSpeed.frame = CGRect(x: 500, y: 370, width: 104, height: 34)
            
        }
        
        if answerBoxColors.frame.intersects(emptyBoxColors.frame) {
            
            answerBoxColors.frame = emptyBoxColors.frame
            answerBoxColors.image = #imageLiteral(resourceName: "colorAnswer.png")
            answerBoxColors.isUserInteractionEnabled = false
            
        } else {
            
            answerBoxColors.frame = CGRect(x: 640, y: 370, width: 104, height: 34)
            
        }
    }
    
    @objc func nextScreen() {
        
        self.removeFromSuperview()
        
        let sixthActivity = MappingToSixthActivity(scene: self)
        PlaygroundPage.current.liveView = sixthActivity
        
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in (touches as! Set<UITouch>) {
            
            let location = touch.location(in: self)
            
            if answerBoxName.frame.contains(location) {
                
                answerBoxName.center = location
                
            }
            
            if answerBoxLocation.frame.contains(location) {
                
                answerBoxLocation.center = location
                
            }
            
            if answerBoxSpeed.frame.contains(location) {
                
                answerBoxSpeed.center = location
                
            }
            
            if answerBoxColors.frame.contains(location) {
                
                answerBoxColors.center = location
                
            }
            
        }
        
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in (touches as! Set<UITouch>) {
            
            let location = touch.location(in: self)
            
            if answerBoxName.frame.contains(location) {
                
                answerBoxName.center = location
                
            }
            
            if answerBoxLocation.frame.contains(location) {
                
                answerBoxLocation.center = location
                
            }
            
            if answerBoxSpeed.frame.contains(location) {
                
                answerBoxSpeed.center = location
                
            }
            
            if answerBoxColors.frame.contains(location) {
                
                answerBoxColors.center = location
                
            }
            
        }
        
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        checkingForMatch()
        
    }
    
}
