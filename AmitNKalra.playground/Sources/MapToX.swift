import Foundation
import UIKit
import PlaygroundSupport
import AVFoundation

public class MappingToEighthActivity: UIView {
        
    let backgroundImage = UIImageView()
    let swiftBird = UIImageView()
    
    let oldFirstPath = UIImageView()
    let oldSecondPath = UIImageView()
    let oldThirdPath = UIImageView()
    let oldFourthPath = UIImageView()
    
    let oldNewFirstPath = UIImageView()
    let oldNewSecondPath = UIImageView()
    let oldNewThirdPath = UIImageView()
    let oldNewFourthPath = UIImageView()
    let oldNewFifthPath = UIImageView()
    let oldNewSixthPath = UIImageView()
    
    let olderFirstPath = UIImageView()
    let olderSecondPath = UIImageView()
    let olderThirdPath = UIImageView()
    let olderFourthPath = UIImageView()
    let olderFifthPath = UIImageView()
    
    let newOlderFirstPath = UIImageView()
    
    let evenOlderFirstPath = UIImageView()
    let evenOlderSecondPath = UIImageView()
    let evenOlderThirdPath = UIImageView()
    let evenOlderFourthPath = UIImageView()
    let evenOlderFifthPath = UIImageView()
    
    let newEvenOlderFirstPath = UIImageView()
    let newEvenOlderSecondPath = UIImageView()
    let newEvenOlderThirdPath = UIImageView()
    
    let newFirstPath = UIImageView()
    let newSecondPath = UIImageView()
    let newThirdPart = UIImageView()
    let newFourthPath = UIImageView()
    let newFifthPath = UIImageView()
    let newSixthPath = UIImageView()
    let newSeventhPath = UIImageView()
    
    let biker = UIButton()
    let studioSpeakers = UIButton()
    let basketballHoop = UIButton()
    let swimmerOne = UIButton()
    let swimmerTwo = UIButton()
    let sandbox = UIButton()
    var runner = UIButton()
    var xButton = UIButton()
    
    let firstPath = UIImageView()
    let secondPath = UIImageView()
    let thirdPath = UIImageView()
    let fourthPath = UIImageView()
    let fifthPath = UIImageView()
    let sixthPath = UIImageView()
    let seventhPath = UIImageView()
    let eighthPath = UIImageView()
    let ninthPath = UIImageView()
    let tenthPath = UIImageView()
    let eleventhPath = UIImageView()
    let twelvethPath = UIImageView()
    let thirteenthPath = UIImageView()
    let fourteenthPath = UIImageView()
    let fifteenthPath = UIImageView()
    let sixteenthPath = UIImageView()
    let seventeenthPath = UIImageView()
    let eighteenthPath = UIImageView()
    let nineteenthPath = UIImageView()
    let twentythPath = UIImageView()
    let twentyFirstPath = UIImageView()
    let twentySecondPath = UIImageView()
    let twentyThirdPath = UIImageView()
    let twentyFourthPath = UIImageView()
    
    public init(scene: UIView) { // Basically the viewDidLoad
        super.init(frame:CGRect(x: 0, y: 390, width: 1000, height: 520))
        
        setupView()
                
        Timer.scheduledTimer(timeInterval: 8.02, target: self, selector: #selector(birdAnimations), userInfo: nil, repeats: true)
        
        xButton.addTarget(self, action: #selector(movingOn), for: .touchUpInside)
        
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
    
    func setupView() {
        
        backgroundImage.image = #imageLiteral(resourceName: "NightBackground.png")
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
        
        Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(loadFirstStep), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(loadSecondStep), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(loadThirdStep), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(loadFourthStep), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 3.5, target: self, selector: #selector(loadFifthStep), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(loadSixthStep), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 4.5, target: self, selector: #selector(loadSeventhStep), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(loadEighthStep), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 5.5, target: self, selector: #selector(loadNinthStep), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 6.0, target: self, selector: #selector(loadTenthStep), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 6.5, target: self, selector: #selector(loadEleventhStep), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 7.0, target: self, selector: #selector(loadTwelvethStep), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 7.5, target: self, selector: #selector(loadThirteenthStep), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 8.0, target: self, selector: #selector(loadFourteenthStep), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 8.5, target: self, selector: #selector(loadFifteenthStep), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 9.0, target: self, selector: #selector(loadSixteenthStep), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 9.5, target: self, selector: #selector(loadTwentyFourthStep), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 10.0, target: self, selector: #selector(loadSeventeenthStep), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 10.5, target: self, selector: #selector(loadEighteenthStep), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 11.0, target: self, selector: #selector(loadNineteenthStep), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 11.5, target: self, selector: #selector(loadTwentythStep), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 12.0, target: self, selector: #selector(loadTwentyFirstStep), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 12.5, target: self, selector: #selector(loadTwentySecondStep), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 13.0, target: self, selector: #selector(loadTwentyThirdStep), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 13.5, target: self, selector: #selector(loadXButton), userInfo: nil, repeats: false)
        
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
        
        oldNewFirstPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        oldNewFirstPath.frame = CGRect(x: 79, y: 369, width: 21, height: 9)
        oldNewFirstPath.rotate(degrees: -96)
        
        self.addSubview(oldNewFirstPath)
        
        oldNewSecondPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        oldNewSecondPath.frame = CGRect(x: 75, y: 341, width: 21, height: 9)
        oldNewSecondPath.rotate(degrees: -107)
        
        self.addSubview(oldNewSecondPath)
        
        oldNewThirdPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        oldNewThirdPath.frame = CGRect(x: 66, y: 314, width: 21, height: 9)
        oldNewThirdPath.rotate(degrees: -112)
        
        self.addSubview(oldNewThirdPath)
        
        oldNewFourthPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        oldNewFourthPath.frame = CGRect(x: 55, y: 289, width: 21, height: 9)
        oldNewFourthPath.rotate(degrees: -120)
        
        self.addSubview(oldNewFourthPath)
        
        olderFirstPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        olderFirstPath.frame = CGRect(x: 50, y: 240, width: 21, height: 9)
        olderFirstPath.rotate(degrees: -60)
        self.addSubview(olderFirstPath)
        
        olderSecondPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        olderSecondPath.frame = CGRect(x: 72, y: 225, width: 21, height: 9)
        olderSecondPath.rotate(degrees: -25)
        self.addSubview(olderSecondPath)
        
        olderThirdPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        olderThirdPath.frame = CGRect(x: 96, y: 235, width: 21, height: 9)
        olderThirdPath.rotate(degrees: -132)
        self.addSubview(olderThirdPath)
        
        olderFourthPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        olderFourthPath.frame = CGRect(x: 110, y: 260, width: 21, height: 9)
        olderFourthPath.rotate(degrees: -114)
        self.addSubview(olderFourthPath)
        
        olderFifthPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        olderFifthPath.frame = CGRect(x: 120, y: 285, width: 21, height: 9)
        olderFifthPath.rotate(degrees: -114)
        self.addSubview(olderFifthPath)
        
        newOlderFirstPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        newOlderFirstPath.frame = CGRect(x: 150, y: 352, width: 21, height: 9)
        newOlderFirstPath.rotate(degrees: -114)
        self.addSubview(newOlderFirstPath)
        
        evenOlderFirstPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        evenOlderFirstPath.frame = CGRect(x: 280, y: 350, width: 21, height: 9)
        evenOlderFirstPath.rotate(degrees: -33)
        self.addSubview(evenOlderFirstPath)
        
        evenOlderSecondPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        evenOlderSecondPath.frame = CGRect(x: 330, y: 325, width: 21, height: 9)
        evenOlderSecondPath.rotate(degrees: -20)
        self.addSubview(evenOlderSecondPath)
        
        evenOlderThirdPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        evenOlderThirdPath.frame = CGRect(x: 360, y: 320, width: 21, height: 9)
        evenOlderThirdPath.rotate(degrees: 0)
        self.addSubview(evenOlderThirdPath)
        
        evenOlderFourthPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        evenOlderFourthPath.frame = CGRect(x: 390, y: 320, width: 21, height: 9)
        evenOlderFourthPath.rotate(degrees: 0)
        self.addSubview(evenOlderFourthPath)
        
        evenOlderFifthPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        evenOlderFifthPath.frame = CGRect(x: 420, y: 320, width: 21, height: 9)
        evenOlderFifthPath.rotate(degrees: 0)
        self.addSubview(evenOlderFifthPath)
        
        newEvenOlderFirstPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        newEvenOlderFirstPath.frame = CGRect(x: 480, y: 260, width: 21, height: 9)
        newEvenOlderFirstPath.rotate(degrees: -98)
        self.addSubview(newEvenOlderFirstPath)
        
        newEvenOlderSecondPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        newEvenOlderSecondPath.frame = CGRect(x: 475, y: 232, width: 21, height: 9)
        newEvenOlderSecondPath.rotate(degrees: -115)
        self.addSubview(newEvenOlderSecondPath)
        
        newEvenOlderThirdPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        newEvenOlderThirdPath.frame = CGRect(x: 460, y: 210, width: 21, height: 9)
        newEvenOlderThirdPath.rotate(degrees: -165)
        self.addSubview(newEvenOlderThirdPath)

        newFirstPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        newFirstPath.frame = CGRect(x: 410, y: 185, width: 21, height: 9)
        newFirstPath.rotate(degrees: -65)
        self.addSubview(newFirstPath)
        
        newSecondPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        newSecondPath.frame = CGRect(x: 425, y: 158, width: 21, height: 9)
        newSecondPath.rotate(degrees: -65)
        self.addSubview(newSecondPath)
        
        newThirdPart.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        newThirdPart.frame = CGRect(x: 437, y: 133, width: 21, height: 9)
        newThirdPart.rotate(degrees: -73)
        self.addSubview(newThirdPart)
        
        newFourthPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        newFourthPath.frame = CGRect(x: 440, y: 103, width: 21, height: 9)
        newFourthPath.rotate(degrees: -86)
        self.addSubview(newFourthPath)
        
        newFifthPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        newFifthPath.frame = CGRect(x: 440, y: 73, width: 21, height: 9)
        newFifthPath.rotate(degrees: -88)
        self.addSubview(newFifthPath)
        
        newSixthPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        newSixthPath.frame = CGRect(x: 440, y: 43, width: 21, height: 9)
        newSixthPath.rotate(degrees: -90)
        self.addSubview(newSixthPath)
        
        newSeventhPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        newSeventhPath.frame = CGRect(x: 440, y: 13, width: 21, height: 9)
        newSeventhPath.rotate(degrees: -90)
        self.addSubview(newSeventhPath)
        
        let speakerImage = #imageLiteral(resourceName: "Studio.png")
        studioSpeakers.setImage(speakerImage, for: .normal)
        studioSpeakers.frame = CGRect(x: 58, y: 393, width: 62, height: 39)
        self.addSubview(studioSpeakers)
        
        biker.setTitle("🚴🏼‍♂️", for: .normal)
        biker.transform = CGAffineTransform(scaleX: -1, y: 1)
        biker.titleLabel?.font = UIFont.boldSystemFont(ofSize: 45)
        biker.frame = CGRect(x: 2, y: 240, width: 50, height: 50)
        self.addSubview(biker)
        
        let basketballHoopImage = #imageLiteral(resourceName: "Court.png")
        basketballHoop.setImage(basketballHoopImage, for: .normal)
        basketballHoop.frame = CGRect(x: 120, y: 280, width: 60, height: 75)
        self.addSubview(basketballHoop)
        
        swimmerOne.setTitle("🏊🏼‍♂️", for: .normal)
        swimmerOne.transform = CGAffineTransform(scaleX: -1, y: 1)
        swimmerOne.setTitleColor(UIColor.white, for: .normal)
        swimmerOne.titleLabel?.font = UIFont.boldSystemFont(ofSize: 45)
        swimmerOne.frame = CGRect(x: 150, y: 353, width: 50, height: 50)
        
        swimmerTwo.setTitle("🏊🏼‍♀️", for: .normal)
        swimmerTwo.transform = CGAffineTransform(scaleX: -1, y: 1)
        swimmerTwo.setTitleColor(UIColor.white, for: .normal)
        swimmerTwo.titleLabel?.font = UIFont.boldSystemFont(ofSize: 45)
        swimmerTwo.frame = CGRect(x: 220, y: 340, width: 50, height: 50)
        
        self.addSubview(swimmerOne)
        self.addSubview(swimmerTwo)
        
        let sandboxImage = #imageLiteral(resourceName: "Sandbox.png")
        sandbox.setImage(sandboxImage, for: .normal)
        sandbox.frame = CGRect(x: 450, y: 280, width: 95, height: 64)
        self.addSubview(sandbox)
        
        runner.setTitle("🏃🏽‍♂️", for: .normal)
        runner.transform = CGAffineTransform(scaleX: -1, y: 1)
        runner.transform = CGAffineTransform(rotationAngle: 5.75959)
        //runner.setTitleColor(UIColor.white, for: .normal)
        runner.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        runner.frame = CGRect(x: 335, y: 120, width: 200, height: 200)
        self.addSubview(runner)
        
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
        firstPath.frame = CGRect(x: 700, y: 13, width: 21, height: 9)
        firstPath.rotate(degrees: 90)
        self.addSubview(firstPath)
                
    }
    
    @objc func loadSecondStep() {
        
        secondPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        secondPath.frame = CGRect(x: 700, y: 43, width: 21, height: 9)
        secondPath.rotate(degrees: 90)
        self.addSubview(secondPath)
        
    }
    
    @objc func loadThirdStep() {
        
        thirdPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        thirdPath.frame = CGRect(x: 700, y: 73, width: 21, height: 9)
        thirdPath.rotate(degrees: 90)
        self.addSubview(thirdPath)
        
    }
    
    @objc func loadFourthStep() {
        
        fourthPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        fourthPath.frame = CGRect(x: 700, y: 103, width: 21, height: 9)
        fourthPath.rotate(degrees: 90)
        self.addSubview(fourthPath)
        
    }
    
    @objc func loadFifthStep() {
        
        fifthPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        fifthPath.frame = CGRect(x: 700, y: 133, width: 21, height: 9)
        fifthPath.rotate(degrees: 90)
        self.addSubview(fifthPath)
        
    }
    
    @objc func loadSixthStep() {
        
        sixthPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        sixthPath.frame = CGRect(x: 700, y: 163, width: 21, height: 9)
        sixthPath.rotate(degrees: 90)
        self.addSubview(sixthPath)
        
    }
    
    @objc func loadSeventhStep() {
        
        seventhPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        seventhPath.frame = CGRect(x: 700, y: 193, width: 21, height: 9)
        seventhPath.rotate(degrees: 90)
        self.addSubview(seventhPath)
        
    }
    
    @objc func loadEighthStep() {
        
        eighthPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        eighthPath.frame = CGRect(x: 695, y: 223, width: 21, height: 9)
        eighthPath.rotate(degrees: -77)
        self.addSubview(eighthPath)
        
    }
    
    @objc func loadNinthStep() {
        
        ninthPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        ninthPath.frame = CGRect(x: 680, y: 253, width: 21, height: 9)
        ninthPath.rotate(degrees: -75)
        self.addSubview(ninthPath)
        
    }
    
    @objc func loadTenthStep() {
        
        tenthPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        tenthPath.frame = CGRect(x: 670, y: 283, width: 21, height: 9)
        tenthPath.rotate(degrees: -70)
        self.addSubview(tenthPath)
        
    }
    
    @objc func loadEleventhStep() {
        
        eleventhPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        eleventhPath.frame = CGRect(x: 660, y: 313, width: 21, height: 9)
        eleventhPath.rotate(degrees: -75)
        self.addSubview(eleventhPath)
        
    }
    
    @objc func loadTwelvethStep() {
        
        twelvethPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        twelvethPath.frame = CGRect(x: 660, y: 343, width: 21, height: 9)
        twelvethPath.rotate(degrees: -90)
        self.addSubview(twelvethPath)
        
    }
    
    @objc func loadThirteenthStep() {
        
        thirteenthPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        thirteenthPath.frame = CGRect(x: 670, y: 373, width: 21, height: 9)
        thirteenthPath.rotate(degrees: -100)
        self.addSubview(thirteenthPath)
        
    }
    
    @objc func loadFourteenthStep() {
        
        fourteenthPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        fourteenthPath.frame = CGRect(x: 680, y: 403, width: 21, height: 9)
        fourteenthPath.rotate(degrees: -110)
        self.addSubview(fourteenthPath)
        
    }

    
    @objc func loadFifteenthStep() {
        
        fifteenthPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        fifteenthPath.frame = CGRect(x: 680, y: 433, width: 21, height: 9)
        fifteenthPath.rotate(degrees: -60)
        self.addSubview(fifteenthPath)
        
    }
    
    @objc func loadSixteenthStep() {
        
        sixteenthPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        sixteenthPath.frame = CGRect(x: 660, y: 463, width: 21, height: 9)
        sixteenthPath.rotate(degrees: -60)
        self.addSubview(sixteenthPath)
        
    }
    
    @objc func loadSeventeenthStep() {
        
        seventeenthPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        seventeenthPath.frame = CGRect(x: 630, y: 463, width: 21, height: 9)
        seventeenthPath.rotate(degrees: -120)
        self.addSubview(seventeenthPath)
        
    }
    
    @objc func loadEighteenthStep() {
        
        eighteenthPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        eighteenthPath.frame = CGRect(x: 615, y: 439, width: 21, height: 9)
        eighteenthPath.rotate(degrees: -120)
        self.addSubview(eighteenthPath)
        
    }
    
    @objc func loadNineteenthStep() {
        
        nineteenthPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        nineteenthPath.frame = CGRect(x: 614, y: 409, width: 21, height: 9)
        nineteenthPath.rotate(degrees: 120)
        self.addSubview(nineteenthPath)
        
    }
    
    @objc func loadTwentythStep() {
        
        twentythPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        twentythPath.frame = CGRect(x: 637, y: 385, width: 21, height: 9)
        twentythPath.rotate(degrees: 135)
        self.addSubview(twentythPath)
        
    }
    
    @objc func loadTwentyFirstStep() {
        
        twentyFirstPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        twentyFirstPath.frame = CGRect(x: 660, y: 365, width: 21, height: 9)
        twentyFirstPath.rotate(degrees: 150)
        self.addSubview(twentyFirstPath)
        
    }
    
    @objc func loadTwentySecondStep() {
        
        twentySecondPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        twentySecondPath.frame = CGRect(x: 690, y: 345, width: 21, height: 9)
        twentySecondPath.rotate(degrees: 135)
        self.addSubview(twentySecondPath)
        
    }
    
    @objc func loadTwentyThirdStep() {
        
        twentyThirdPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        twentyThirdPath.frame = CGRect(x: 710, y: 320, width: 21, height: 9)
        twentyThirdPath.rotate(degrees: 135)
        self.addSubview(twentyThirdPath)
        
    }
    
    @objc func loadTwentyFourthStep() { // this is 18
        
        twentyFourthPath.image = #imageLiteral(resourceName: "firstBlockAd1.png")
        twentyFourthPath.frame = CGRect(x: 645, y: 483, width: 21, height: 9)
        twentyFourthPath.rotate(degrees: 0)
        self.addSubview(twentyFourthPath)
        
    }
    
    @objc func loadXButton() {
        
        var xImage = #imageLiteral(resourceName: "XMap.png")
        xButton.setImage(xImage, for: .normal)
        xButton.frame = CGRect(x: 732, y: 280, width: 36, height: 36)
        self.addSubview(xButton)
        
    }
    
    @objc func movingOn() {
        
        self.removeFromSuperview()
        
        let theEnd = EndingView(scene: self)
        PlaygroundPage.current.liveView = theEnd
        
    }
    
}
