import Foundation
import UIKit
import AVFoundation
import PlaygroundSupport

public class BikerDrags: UIView {
    
    var biker = UILabel()
    var nameOnTop = UILabel()
    
    var bottomBar = UIImageView()
    var backgroundImage = UIImageView()
    var bottomText = UILabel()
    
    var name = UIImageView()
    var age = UIImageView()
    var time = UIImageView()
    var speed = UIImageView()
    
    var emptyBoxName = UIImageView()
    var emptyBoxAge = UIImageView()
    var emptyBoxTime = UIImageView()
    var emptyBoxSpeed = UIImageView()
    
    var answerBoxName = UIImageView()
    var answerBoxAge = UIImageView()
    var answerBoxTime = UIImageView()
    var answerBoxSpeed = UIImageView()
    
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
        
        backgroundImage.frame = CGRect(x: 0, y: 0, width: 768, height: 520)
        backgroundImage.image = #imageLiteral(resourceName: "DayBackground.png")
        self.addSubview(backgroundImage)
        
        bottomBar.frame = CGRect(x: 0, y: 270, width: 768, height: 250)
        bottomBar.image = #imageLiteral(resourceName: "BackgroundCodeBike.png")
        self.addSubview(bottomBar)
        
        bottomText.text = "Drag and Drop things that'll match!"
        bottomText.textColor = UIColor.white
        bottomText.font = UIFont.boldSystemFont(ofSize: 30)
        bottomText.textAlignment = .center
        bottomText.frame = CGRect(x: 0, y: 472, width: 768, height: 48)
        self.addSubview(bottomText)
        
        biker.text = "🚴🏼‍♂️"
        biker.font = UIFont.boldSystemFont(ofSize: 33)
        biker.textAlignment = .center
        biker.frame = CGRect(x: 5, y: 230, width: 76, height: 40)
        biker.transform = CGAffineTransform(scaleX: -1, y: 1)
        self.addSubview(biker)
        
        nameOnTop.text = "Amit"
        nameOnTop.font = UIFont.boldSystemFont(ofSize: 30)
        nameOnTop.textAlignment = .center
        nameOnTop.textColor = UIColor.white
        nameOnTop.frame = CGRect(x: 5, y: 200, width: 76, height: 40)
        
        continueButton.setTitle("Next", for: .normal)
        continueButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        continueButton.setTitleColor(UIColor.white, for: .normal)
        continueButton.frame = CGRect(x: 658, y: 485, width: 105, height: 34)
        self.addSubview(continueButton)
        
        name.frame = CGRect(x: 5, y: 280, width: 186, height: 22)
        name.image = #imageLiteral(resourceName: "name.png")
        self.addSubview(name)
        
        age.frame = CGRect(x: 5, y: 330, width: 143, height: 22)
        age.image = #imageLiteral(resourceName: "age.png")
        self.addSubview(age)
        
        time.frame = CGRect(x: 5, y: 380, width: 238, height: 22)
        time.image = #imageLiteral(resourceName: "dayString.png")
        self.addSubview(time)
        
        speed.frame = CGRect(x: 5, y: 430, width: 205, height: 22)
        speed.image = #imageLiteral(resourceName: "speed.png")
        self.addSubview(speed)
        
        
        emptyBoxName.frame = CGRect(x: 200, y: 272, width: 104, height: 34)
        emptyBoxName.image = #imageLiteral(resourceName: "nameBoxEmpty.png")
        self.addSubview(emptyBoxName)

        emptyBoxAge.frame = CGRect(x: 160, y: 322, width: 104, height: 34)
        emptyBoxAge.image = #imageLiteral(resourceName: "ageEmptyBox.png")
        self.addSubview(emptyBoxAge)

        emptyBoxTime.frame = CGRect(x: 250, y: 372, width: 104, height: 34)
        emptyBoxTime.image = #imageLiteral(resourceName: "dayEmptyBox.png")
        self.addSubview(emptyBoxTime)

        emptyBoxSpeed.frame = CGRect(x: 215, y: 422, width: 104, height: 34)
        emptyBoxSpeed.image = #imageLiteral(resourceName: "speedEmptyBox.png")
        self.addSubview(emptyBoxSpeed)

        answerBoxName.frame = CGRect(x: 500, y: 300, width: 104, height: 34)
        answerBoxName.image = #imageLiteral(resourceName: "AmitBox.png")
        answerBoxName.isUserInteractionEnabled = true
        self.addSubview(answerBoxName)

        answerBoxAge.frame = CGRect(x: 640, y: 300, width: 104, height: 34)
        answerBoxAge.image = #imageLiteral(resourceName: "18Box.png")
        answerBoxAge.isUserInteractionEnabled = true
        self.addSubview(answerBoxAge)

        answerBoxTime.frame = CGRect(x: 500, y: 370, width: 104, height: 34)
        answerBoxTime.image = #imageLiteral(resourceName: "SunsetBox.png")
        answerBoxTime.isUserInteractionEnabled = true
        self.addSubview(answerBoxTime)

        answerBoxSpeed.frame = CGRect(x: 640, y: 370, width: 104, height: 34)
        answerBoxSpeed.image = #imageLiteral(resourceName: "SpeedBox.png")
        answerBoxSpeed.isUserInteractionEnabled = true
        self.addSubview(answerBoxSpeed)
        
        //playBackgroundMusic()
        
    }
    
    @objc func checkingForMatch() {
        
        
        if answerBoxName.frame.intersects(emptyBoxName.frame) {
            
            answerBoxName.frame = emptyBoxName.frame
            answerBoxName.image = #imageLiteral(resourceName: "AmitBox.png")
            answerBoxName.isUserInteractionEnabled = false
            self.addSubview(nameOnTop)
                
        } else {
            
            answerBoxName.frame = CGRect(x: 500, y: 300, width: 104, height: 34)
            
        }
        
        if answerBoxAge.frame.intersects(emptyBoxAge.frame) {
            
            answerBoxAge.frame = emptyBoxAge.frame
            answerBoxAge.image = #imageLiteral(resourceName: "18Box.png")
            answerBoxAge.isUserInteractionEnabled = false
         
        } else {
            
            answerBoxAge.frame = CGRect(x: 640, y: 300, width: 104, height: 34)
            
        }
        
        if answerBoxTime.frame.intersects(emptyBoxTime.frame) {
            
            answerBoxTime.frame = emptyBoxTime.frame
            answerBoxTime.image = #imageLiteral(resourceName: "SunsetBox.png")
            answerBoxTime.isUserInteractionEnabled = false
            
            backgroundImage.image = #imageLiteral(resourceName: "SunsetBackground.png")
            
        } else {
            
            answerBoxTime.frame = CGRect(x: 500, y: 370, width: 104, height: 34)
            backgroundImage.image = #imageLiteral(resourceName: "DayBackground.png")
            
        }
        
        if answerBoxSpeed.frame.intersects(emptyBoxSpeed.frame) {
            
            answerBoxSpeed.frame = emptyBoxSpeed.frame
            answerBoxSpeed.image = #imageLiteral(resourceName: "SpeedBox.png")
            answerBoxSpeed.isUserInteractionEnabled = false
            
            Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(movingBike), userInfo: nil, repeats: false)
            
        } else {
            
            answerBoxSpeed.frame = CGRect(x: 640, y: 370, width: 104, height: 34)
            
        }
        
        
    }
    
    @objc func movingBike() {
        
        if biker.center.x >= 550 {
            
            biker.transform = CGAffineTransform(scaleX: 1, y: 1)
            
            UIView.animate(withDuration: 6.0, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIViewAnimationOptions.curveEaseIn, animations: ({
                
                self.biker.center.x -= 600
                self.nameOnTop.center.x -= 600
            }), completion: nil)
            
        } else {
        
            biker.transform = CGAffineTransform(scaleX: -1, y: 1)
            
        UIView.animate(withDuration: 6.0, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIViewAnimationOptions.curveEaseIn, animations: ({
            
            self.biker.center.x += 600
            self.nameOnTop.center.x += 600
        }), completion: nil)
            
        }
        
    }
    
    @objc func nextScreen() {
        
        self.removeFromSuperview()
        
        let thirdActivity = MapToThirdActivity(scene: self)
        PlaygroundPage.current.liveView = thirdActivity
        
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in (touches as! Set<UITouch>) {
            
            let location = touch.location(in: self)
            
            if answerBoxName.frame.contains(location) {
                
                answerBoxName.center = location
                
            }
            
            if answerBoxSpeed.frame.contains(location) {
                
                answerBoxSpeed.center = location
                
            }
            
            if answerBoxTime.frame.contains(location) {
                
                answerBoxTime.center = location
                
            }
            
            if answerBoxAge.frame.contains(location) {
                
                answerBoxAge.center = location
                
            }
            
        }
        
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in (touches as! Set<UITouch>) {
            
            let location = touch.location(in: self)
            
            if answerBoxName.frame.contains(location) {
                
                answerBoxName.center = location
                
            }
            
            if answerBoxSpeed.frame.contains(location) {
                
                answerBoxSpeed.center = location
                
            }
            
            if answerBoxTime.frame.contains(location) {
                
                answerBoxTime.center = location
                
            }
            
            if answerBoxAge.frame.contains(location) {
                
                answerBoxAge.center = location
                
            }
            
        }
        
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        checkingForMatch()
        
    }
    
}
