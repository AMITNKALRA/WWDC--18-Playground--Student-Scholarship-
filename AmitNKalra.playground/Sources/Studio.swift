import Foundation
import UIKit
import PlaygroundSupport
import AVFoundation

public class InTheStudio: UIView, AVAudioPlayerDelegate {
    
    var backgroundBeats = AVAudioPlayer()
    
    let unpressed = #imageLiteral(resourceName: "UntappedBeat.png")
    let pressed = #imageLiteral(resourceName: "TappedBeat.png")
    
    var playButton = UIButton()
    var pauseButton = UIButton()
    let continueButton = UIButton()
    
    var beatOneSelected = Bool()
    var beatTwoSelected = Bool()
    var beatThreeSelected = Bool()
    var beatFourSelected = Bool()
    var beatFiveSelected = Bool()
    var beatSixSelected = Bool()
    
    var audioPlayerOne = AVAudioPlayer()
    var audioPlayerTwo = AVAudioPlayer()
    var audioPlayerThree = AVAudioPlayer()
    var audioPlayerFour = AVAudioPlayer()
    var audioPlayerFive = AVAudioPlayer()
    var audioPlayerSix = AVAudioPlayer()
    
    var playSoundOne: URL!
    var playSoundTwo: URL!
    var playSoundThree: URL!
    var playSoundFour: URL!
    var playSoundFive: URL!
    var playSoundSix: URL!
    
    var beatTimerOne = Timer()
    var beatTimerTwo = Timer()
    var beatTimerThree = Timer()
    var beatTimerFour = Timer()
    var beatTimerFive = Timer()
    var beatTimerSix = Timer()
    
    var darkOneTimer = Timer()
    var darkTwoTimer = Timer()
    var darkThreeTimer = Timer()
    var darkFourTimer = Timer()
    var darkFiveTimer = Timer()
    var darkSixTimer = Timer()
    
    var oneDarkBlueCurrently = false
    var twoDarkBlueCurrently = false
    var threeDarkBlueCurrently = false
    var fourDarkBlueCurrently = false
    var fiveDarkBlueCurrently = false
    var sixDarkBlueCurrently = false
    
    var bottomBar = UIView()
    var bottomText = UILabel()
    
    let firstBeat = UIButton()
    let secondBeat = UIButton()
    let thirdBeat = UIButton()
    let fourthBeat = UIButton()
    let fifthBeat = UIButton()
    let sixthBeat = UIButton()

    var clickedOne = false
    var clickedTwo = false
    var clickedThree = false
    var clickedFour = false
    var clickedFive = false
    var clickedSix = false
    var clickedSeven = false
    var clickedEight = false
    var clickedNine = false
    
    public init(scene: UIView) { // Basically the viewDidLoad
        super.init(frame:CGRect(x: 0, y: 390, width: 1000, height: 520))
        
        setupView()
        firstBeat.addTarget(self, action: #selector(pressedOne), for: .touchUpInside)
        secondBeat.addTarget(self, action: #selector(pressedTwo), for: .touchUpInside)
        thirdBeat.addTarget(self, action: #selector(pressedThree), for: .touchUpInside)
        fourthBeat.addTarget(self, action: #selector(pressedFour), for: .touchUpInside)
        fifthBeat.addTarget(self, action: #selector(pressedFive), for: .touchUpInside)
        sixthBeat.addTarget(self, action: #selector(pressedSix), for: .touchUpInside)
        continueButton.addTarget(self, action: #selector(nextScreen), for: .touchUpInside)
        
        pauseButton.addTarget(self, action: #selector(stopIt), for: .touchUpInside)
        
    }
    
    required public init(coder aDecoder: NSCoder) {
        
        fatalError("Public Init Coder NOT working...")
        
    }
    
    fileprivate var audioURL: AVAudioPlayer? {
        
        didSet {
            
        }
        
    }
    
    func setupView() {
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor(red:0.34, green:0.34, blue:0.34, alpha:1.0)
        
        bottomBar.frame = CGRect(x: 0, y: 440, width: self.frame.width, height: 80)
        self.bottomBar.backgroundColor = UIColor(red:0.75, green:0.92, blue:0.98, alpha:1.0)
        self.addSubview(bottomBar)
        
        bottomText.text = "Create Your Anthem By \n Tapping On The Squares"
        bottomText.numberOfLines = 2
        bottomText.frame = CGRect(x: 0, y: 440, width: 768, height: 80)
        bottomText.font = UIFont.boldSystemFont(ofSize: 32)
        bottomText.textAlignment = .center
        bottomText.textColor = UIColor.white
        self.addSubview(bottomText)
        
        playButton.setImage(#imageLiteral(resourceName: "PlayButton.png"), for: .normal)
        playButton.frame = CGRect(x: (768/2) - 80, y: 455, width: 45, height: 45)
        
        pauseButton.setImage(#imageLiteral(resourceName: "PauseIcon.png"), for: .normal)
        pauseButton.frame = CGRect(x: (768/2) - 25, y: 460, width: 45, height: 45)
        
        continueButton.setImage(#imageLiteral(resourceName: "ContinueTriangle.png"), for: .normal)
        continueButton.frame = CGRect(x: 650, y: 455, width: 100, height: 50)
        
        firstBeat.frame = CGRect(x: 75, y: 15, width: 200, height: 200)
        firstBeat.setImage(unpressed, for: .normal)
        self.addSubview(firstBeat)
        
        secondBeat.frame = CGRect(x: (768/2) - 100, y: 15, width: 200, height: 200)
        secondBeat.setImage(unpressed, for: .normal)
        self.addSubview(secondBeat)
        
        thirdBeat.frame = CGRect(x: (768/2) + 109, y: 15, width: 200, height: 200)
        thirdBeat.setImage(unpressed, for: .normal)
        self.addSubview(thirdBeat)
        
        fourthBeat.frame = CGRect(x: 75, y: 225, width: 200, height: 200)
        fourthBeat.setImage(unpressed, for: .normal)
        self.addSubview(fourthBeat)
        
        fifthBeat.frame = CGRect(x: (768/2) - 100, y: 225, width: 200, height: 200)
        fifthBeat.setImage(unpressed, for: .normal)
        self.addSubview(fifthBeat)
        
        sixthBeat.frame = CGRect(x: (768/2) + 109, y: 225, width: 200, height: 200)
        sixthBeat.setImage(unpressed, for: .normal)
        self.addSubview(sixthBeat)
        
        bottomText.text = "Create Your Anthem by tapping on the squares!"

    }

    @objc fileprivate func playBeatOne() { // Setting up the audio
        
        do {
            
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
        } catch {
            
            fatalError("Unable to set the audio session cuz \(error)")
            
        }
        
        guard
            
            let audioURL = Bundle.main.url(forResource: "FirstBeat", withExtension: "mp3"),
            let player = try? AVAudioPlayer(contentsOf: audioURL)
            
            else {
                
                fatalError("Unable to create the player")
                
        }
        
        self.audioURL = player
        player.play()
        
    }
    
    @objc fileprivate func playBeatTwo() { // Setting up the audio
        
        do {
            
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
        } catch {
            
            fatalError("Unable to set the audio session cuz \(error)")
            
        }
        
        guard
            
            let audioURL = Bundle.main.url(forResource: "SecondBeat", withExtension: "mp3"),
            let player = try? AVAudioPlayer(contentsOf: audioURL)
            
            else {
                
                fatalError("Unable to create the player")
                
        }
        
        self.audioURL = player
        player.play()
        
    }
    
    @objc fileprivate func playBeatThree() { // Setting up the audio
        
        do {
            
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
        } catch {
            
            fatalError("Unable to set the audio session cuz \(error)")
            
        }
        
        guard
            
            let audioURL = Bundle.main.url(forResource: "ThirdBeat", withExtension: "mp3"),
            let player = try? AVAudioPlayer(contentsOf: audioURL)
            
            else {
                
                fatalError("Unable to create the player")
                
        }
        
        self.audioURL = player
        player.play()
        
    }
    
    @objc fileprivate func playBeatFour() { // Setting up the audio
        
        do {
            
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
        } catch {
            
            fatalError("Unable to set the audio session cuz \(error)")
            
        }
        
        guard
            
            let audioURL = Bundle.main.url(forResource: "FourthBeat", withExtension: "mp3"),
            let player = try? AVAudioPlayer(contentsOf: audioURL)
            
            else {
                
                fatalError("Unable to create the player")
                
        }
        
        self.audioURL = player
        player.play()
        
    }
    
    @objc fileprivate func playBeatFive() { // Setting up the audio
        
        do {
            
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
        } catch {
            
            fatalError("Unable to set the audio session cuz \(error)")
            
        }
        
        guard
            
            let audioURL = Bundle.main.url(forResource: "FifthBeat", withExtension: "mp3"),
            let player = try? AVAudioPlayer(contentsOf: audioURL)
            
            else {
                
                fatalError("Unable to create the player")
                
        }
        
        self.audioURL = player
        player.play()
        
    }
    
    
    @objc fileprivate func playBeatSix() { // Setting up the audio
        
        do {
            
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
        } catch {
            
            fatalError("Unable to set the audio session cuz \(error)")
            
        }
        
        guard
            
            let audioURL = Bundle.main.url(forResource: "SixthBeat", withExtension: "mp3"),
            let player = try? AVAudioPlayer(contentsOf: audioURL)
            
            else {
                
                fatalError("Unable to create the player")
                
        }
        
        self.audioURL = player
        player.play()
        
    }
    
    @objc func pressedOne() {
        
        removeBannerText()
        
        if clickedOne == true {
            
            firstBeat.setImage(unpressed, for: .normal)
            
            beatTimerOne.invalidate()

            clickedOne = false
            
        } else {

            firstBeat.setImage(pressed, for: .normal)
            
            beatTimerOne = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(playBeatOne), userInfo: nil, repeats: true)
            darkOneTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(getDarkerOne), userInfo: nil, repeats: true)

            clickedOne = true
            
        }
    }
    
    @objc func pressedTwo() {
        
        removeBannerText()
        
        if clickedTwo == true {
            
            secondBeat.setImage(unpressed, for: .normal)
            
            beatTimerTwo.invalidate()

            clickedTwo = false
            
        } else {
            
            secondBeat.setImage(pressed, for: .normal)
            
            beatTimerTwo = Timer.scheduledTimer(timeInterval: 1.2, target: self, selector: #selector(playBeatTwo), userInfo: nil, repeats: true)
            darkTwoTimer = Timer.scheduledTimer(timeInterval: 1.2, target: self, selector: #selector(getDarkerTwo), userInfo: nil, repeats: true)

            clickedTwo = true
            
        }
    }
    
    @objc func pressedThree() {
        
        removeBannerText()
        
        if clickedThree == true {
            
            thirdBeat.setImage(unpressed, for: .normal)
            
            beatTimerThree.invalidate()
            
            clickedThree = false
            
        } else {

            thirdBeat.setImage(pressed, for: .normal)
            
            beatTimerThree = Timer.scheduledTimer(timeInterval: 0.9, target: self, selector: #selector(playBeatThree), userInfo: nil, repeats: true)
            darkThreeTimer = Timer.scheduledTimer(timeInterval: 0.9, target: self, selector: #selector(getDarkerThree), userInfo: nil, repeats: true)
            
            clickedThree = true
            
        }
        
    }
    
    @objc func pressedFour() {
        
        removeBannerText()
        
        if clickedFour == true {
            
            fourthBeat.setImage(unpressed, for: .normal)
            
            beatTimerFour.invalidate()

            clickedFour = false
            
        } else {
            
            fourthBeat.setImage(pressed, for: .normal)
            
            beatTimerFour = Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(playBeatFour), userInfo: nil, repeats: true)
            darkFourTimer = Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(getDarkerFour), userInfo: nil, repeats: true)
            
            clickedFour = true
            
        }
    }
    
    @objc func pressedFive() {
        
        removeBannerText()
        
        if clickedFive == true {
            
            fifthBeat.setImage(unpressed, for: .normal)
            
            beatTimerFive.invalidate()
            
            clickedFive = false
            
        } else {
            
            fifthBeat.setImage(pressed, for: .normal)
            
            beatTimerFive = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(playBeatFive), userInfo: nil, repeats: true)
            darkFiveTimer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(getDarkerFive), userInfo: nil, repeats: true)
            
            clickedFive = true
            
        }
    }
    
    @objc func pressedSix() {
        
        removeBannerText()
        
        if clickedSix == true {
            
            sixthBeat.setImage(unpressed, for: .normal)
            
            beatTimerSix.invalidate()
            
            clickedSix = false
            
        } else {
            
            sixthBeat.setImage(pressed, for: .normal)
            
            beatTimerSix = Timer.scheduledTimer(timeInterval: 2.1, target: self, selector: #selector(playBeatSix), userInfo: nil, repeats: true)
            darkSixTimer = Timer.scheduledTimer(timeInterval: 2.1, target: self, selector: #selector(getDarkerSix), userInfo: nil, repeats: true)
            
            clickedSix = true
            
        }
        
    }
    
    @objc func getDarkerOne() {
        
        if oneDarkBlueCurrently == false {
            
            firstBeat.setImage(#imageLiteral(resourceName: "DarkerBlue.png"), for: .normal)
            oneDarkBlueCurrently = true
            
        } else {
            
            firstBeat.setImage(#imageLiteral(resourceName: "TappedBeat.png"), for: .normal)
            oneDarkBlueCurrently = false
        }
    }
    
    @objc func getDarkerTwo() {
        
        if twoDarkBlueCurrently == false {
            
            secondBeat.setImage(#imageLiteral(resourceName: "DarkerBlue.png"), for: .normal)
            twoDarkBlueCurrently = true
            
        } else {
            
            secondBeat.setImage(#imageLiteral(resourceName: "TappedBeat.png"), for: .normal)
            twoDarkBlueCurrently = false
        }
    }
    
    @objc func getDarkerThree() {
        
        if threeDarkBlueCurrently == false {
            
            thirdBeat.setImage(#imageLiteral(resourceName: "DarkerBlue.png"), for: .normal)
            threeDarkBlueCurrently = true
            
        } else {
            
            thirdBeat.setImage(#imageLiteral(resourceName: "TappedBeat.png"), for: .normal)
            threeDarkBlueCurrently = false

            
        }
    }
    
    @objc func getDarkerFour() {
        
        if fourDarkBlueCurrently == false {
            
            fourthBeat.setImage(#imageLiteral(resourceName: "DarkerBlue.png"), for: .normal)
            fourDarkBlueCurrently = true
            
        } else {
            
            fourthBeat.setImage(#imageLiteral(resourceName: "TappedBeat.png"), for: .normal)
            fourDarkBlueCurrently = false
        }
    }
    
    @objc func getDarkerFive() {
        
        if fiveDarkBlueCurrently == false {
            
            fifthBeat.setImage(#imageLiteral(resourceName: "DarkerBlue.png"), for: .normal)
            fiveDarkBlueCurrently = true
            
        } else {
            
            fifthBeat.setImage(#imageLiteral(resourceName: "TappedBeat.png"), for: .normal)
            fiveDarkBlueCurrently = false
        }
    }
    
    @objc func getDarkerSix() {
        
        if sixDarkBlueCurrently == false {
            
            sixthBeat.setImage(#imageLiteral(resourceName: "DarkerBlue.png"), for: .normal)
            sixDarkBlueCurrently = true
            
        } else {
            
            sixthBeat.setImage(#imageLiteral(resourceName: "TappedBeat.png"), for: .normal)
            sixDarkBlueCurrently = false
        }
    }
    
    func removeBannerText() {
        
        bottomText.removeFromSuperview()
        self.addSubview(pauseButton)
        self.addSubview(continueButton)
        
    }
    
    @objc func stopIt() {
        
        beatTimerOne.invalidate()
        beatTimerTwo.invalidate()
        beatTimerThree.invalidate()
        beatTimerFour.invalidate()
        beatTimerFive.invalidate()
        beatTimerSix.invalidate()
        
        darkOneTimer.invalidate()
        darkTwoTimer.invalidate()
        darkThreeTimer.invalidate()
        darkFourTimer.invalidate()
        darkFiveTimer.invalidate()
        darkSixTimer.invalidate()
        
        pauseButton.removeFromSuperview()
        bottomText.text = "Time To Move On!"
        self.addSubview(bottomText)
        
        firstBeat.setImage(unpressed, for: .normal)
        secondBeat.setImage(unpressed, for: .normal)
        thirdBeat.setImage(unpressed, for: .normal)
        fourthBeat.setImage(unpressed, for: .normal)
        fifthBeat.setImage(unpressed, for: .normal)
        sixthBeat.setImage(unpressed, for: .normal)
        
    }
    
    @objc func nextScreen() {
        
        beatTimerOne.invalidate()
        beatTimerTwo.invalidate()
        beatTimerThree.invalidate()
        beatTimerFour.invalidate()
        beatTimerFive.invalidate()
        beatTimerSix.invalidate()
        
        darkOneTimer.invalidate()
        darkTwoTimer.invalidate()
        darkThreeTimer.invalidate()
        darkFourTimer.invalidate()
        darkFiveTimer.invalidate()
        darkSixTimer.invalidate()
        
        self.removeFromSuperview()
        
        let bikeView = MapToSecondActivity(scene: self)
        PlaygroundPage.current.liveView = bikeView
    }
}
