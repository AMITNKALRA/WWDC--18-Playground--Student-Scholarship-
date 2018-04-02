import Foundation
import UIKit
import AVFoundation
import PlaygroundSupport

public class Welcome: UIView {
    
    let firstWord = UILabel()
    
    public init(scene: UIView) { // Basically the viewDidLoad
        super.init(frame:CGRect(x: 0, y: 390, width: 1000, height: 520))
        
        showFirstWord()

    }
    
    required public init(coder aDecoder: NSCoder) {
        
        fatalError("Public Init Coder NOT working...")
        
    }
    
    fileprivate var audioURL: AVAudioPlayer? {
        
        didSet {
            
        }
        
    }

    fileprivate func playCricketNoise() { // Setting up the audio
        
        do {
            
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
        } catch {
            
            fatalError("Unable to set the audio session cuz \(error)")
            
        }
        
        guard
        
            let audioURL = Bundle.main.url(forResource: "Crickets", withExtension: "m4v"),
            let player = try? AVAudioPlayer(contentsOf: audioURL)
        
        else {
            
            fatalError("Unable to create the player")
            
        }
        
        self.audioURL = player
        player.play()
        
    }
    
    func showFirstWord() {
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor(red:0.55, green:0.71, blue:0.89, alpha:1.0)
        
        firstWord.text = "THE"
        firstWord.textColor = UIColor.white
        firstWord.font = UIFont.boldSystemFont(ofSize: 120)
        firstWord.textAlignment = .center
        firstWord.frame = CGRect(x: 0, y: 0, width: 755, height: 480)
        self.addSubview(firstWord)
        
        Timer.scheduledTimer(timeInterval: 0.55, target: self, selector: #selector(showSecondWord), userInfo: nil, repeats: false)
        
    }
    
    @objc func showSecondWord() {
        
        firstWord.removeFromSuperview()
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor(red:0.65, green:0.84, blue:0.44, alpha:1.0)
        
        firstWord.text = "WORLD"
        firstWord.textColor = UIColor.white
        firstWord.font = UIFont.boldSystemFont(ofSize: 120)
        firstWord.textAlignment = .center
        firstWord.frame = CGRect(x: 0, y: 0, width: 755, height: 480)
        self.addSubview(firstWord)
        
        Timer.scheduledTimer(timeInterval: 0.55, target: self, selector: #selector(showThirdWord), userInfo: nil, repeats: false)
        
    }
    
    @objc func showThirdWord() {
        
        firstWord.removeFromSuperview()
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor(red:1.00, green:0.80, blue:0.76, alpha:1.0)
        
        firstWord.text = "IS"
        firstWord.textColor = UIColor.white
        firstWord.font = UIFont.boldSystemFont(ofSize: 120)
        firstWord.textAlignment = .center
        firstWord.frame = CGRect(x: 0, y: 0, width: 755, height: 480)
        self.addSubview(firstWord)
        
        Timer.scheduledTimer(timeInterval: 0.55, target: self, selector: #selector(showFourthWord), userInfo: nil, repeats: false)
        
    }
    
    @objc func showFourthWord() {
        
        firstWord.removeFromSuperview()
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor(red:1.00, green:0.93, blue:0.00, alpha:1.0)
        
        firstWord.text = "OUR"
        firstWord.textColor = UIColor.white
        firstWord.font = UIFont.boldSystemFont(ofSize: 120)
        firstWord.textAlignment = .center
        firstWord.frame = CGRect(x: 0, y: 0, width: 755, height: 480)
        self.addSubview(firstWord)
        
        Timer.scheduledTimer(timeInterval: 0.55, target: self, selector: #selector(showFourtHalfhWord), userInfo: nil, repeats: false)
        
    }
    
    @objc func showFourtHalfhWord() {
        
        firstWord.removeFromSuperview()
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor(red:1.00, green:0.93, blue:0.00, alpha:1.0)
        
        firstWord.text = "PLAYGROUND"
        firstWord.textColor = UIColor.white
        firstWord.font = UIFont.boldSystemFont(ofSize: 110)
        firstWord.textAlignment = .center
        firstWord.frame = CGRect(x: 0, y: 0, width: 755, height: 480)
        self.addSubview(firstWord)
        
        Timer.scheduledTimer(timeInterval: 0.55, target: self, selector: #selector(showParkScene), userInfo: nil, repeats: false)
        
    }
    
    let parkImage = UIImageView()
    
    @objc func showParkScene() {
        
        firstWord.removeFromSuperview()
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        parkImage.image = #imageLiteral(resourceName: "Park.png")
        parkImage.frame = CGRect(x: 0, y: 0, width:768, height: 520)
        self.addSubview(parkImage)
        
        playCricketNoise()
        
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(showFifthWord), userInfo: nil, repeats: false)
        
    }
    
    @objc func showFifthWord() {
        
        parkImage.removeFromSuperview()
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor(red:0.58, green:0.82, blue:0.31, alpha:1.0)
        
        firstWord.text = "AND"
        firstWord.numberOfLines = 2
        firstWord.textColor = UIColor.white
        firstWord.font = UIFont.boldSystemFont(ofSize: 120)
        firstWord.textAlignment = .center
        firstWord.frame = CGRect(x: 0, y: 0, width: 755, height: 480)
        self.addSubview(firstWord)
        
        Timer.scheduledTimer(timeInterval: 0.55, target: self, selector: #selector(showSixthWord), userInfo: nil, repeats: false)
        
    }
    
    @objc func showSixthWord() {
        
        firstWord.removeFromSuperview()
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor(red:0.99, green:0.53, blue:0.44, alpha:1.0)
        
        firstWord.text = "TODAY,"
        firstWord.textColor = UIColor.white
        firstWord.font = UIFont.boldSystemFont(ofSize: 120)
        firstWord.textAlignment = .center
        firstWord.frame = CGRect(x: 0, y: 0, width: 755, height: 480)
        self.addSubview(firstWord)
        
        Timer.scheduledTimer(timeInterval: 0.55, target: self, selector: #selector(showSeventhWord), userInfo: nil, repeats: false)
        
    }
    
    @objc func showSeventhWord() {
        
        firstWord.removeFromSuperview()
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor(red:0.78, green:0.78, blue:0.78, alpha:1.0)
        
        firstWord.text = "YOU'LL"
        firstWord.textColor = UIColor.white
        firstWord.font = UIFont.boldSystemFont(ofSize: 120)
        firstWord.textAlignment = .center
        firstWord.frame = CGRect(x: 0, y: 0, width: 755, height: 480)
        self.addSubview(firstWord)
        
        Timer.scheduledTimer(timeInterval: 0.55, target: self, selector: #selector(showEighthWord), userInfo: nil, repeats: false)
        
    }
    
    @objc func showEighthWord() {
        
        firstWord.removeFromSuperview()
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor(red:0.94, green:0.73, blue:0.38, alpha:1.0)
        
        firstWord.text = "EXPERIENCE"
        firstWord.textColor = UIColor.white
        firstWord.font = UIFont.boldSystemFont(ofSize: 102)
        firstWord.textAlignment = .center
        firstWord.frame = CGRect(x: 0, y: 0, width: 765, height: 480)
        self.addSubview(firstWord)
        
        Timer.scheduledTimer(timeInterval: 0.55, target: self, selector: #selector(showNinthWord), userInfo: nil, repeats: false)
        
    }
    
    @objc func showNinthWord() {
        
        firstWord.removeFromSuperview()
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor(red:0.29, green:0.84, blue:0.89, alpha:1.0)
        
        firstWord.text = "MY"
        firstWord.textColor = UIColor.white
        firstWord.font = UIFont.boldSystemFont(ofSize: 120)
        firstWord.textAlignment = .center
        firstWord.frame = CGRect(x: 0, y: 0, width: 755, height: 480)
        self.addSubview(firstWord)
        
        Timer.scheduledTimer(timeInterval: 0.55, target: self, selector: #selector(showTenthWord), userInfo: nil, repeats: false)
        
    }
    
    @objc func showTenthWord() {
        
        firstWord.removeFromSuperview()
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor(red:0.51, green:0.94, blue:0.00, alpha:1.0)
        
        firstWord.text = "WWDC"
        firstWord.textColor = UIColor.white
        firstWord.font = UIFont.boldSystemFont(ofSize: 120)
        firstWord.textAlignment = .center
        firstWord.frame = CGRect(x: 0, y: 0, width: 755, height: 480)
        self.addSubview(firstWord)
        
        Timer.scheduledTimer(timeInterval: 0.55, target: self, selector: #selector(showEleventhWord), userInfo: nil, repeats: false)
        
    }
    
    @objc func showEleventhWord() {
        
        firstWord.removeFromSuperview()
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor(red:0.84, green:0.56, blue:0.89, alpha:1.0)
        
        firstWord.text = "PLAYGROUND."
        firstWord.textColor = UIColor.white
        firstWord.font = UIFont.boldSystemFont(ofSize: 110)
        firstWord.textAlignment = .center
        firstWord.frame = CGRect(x: 0, y: 0, width: 755, height: 480)
        self.addSubview(firstWord)
        
        Timer.scheduledTimer(timeInterval: 0.55, target: self, selector: #selector(showTwelvethWord), userInfo: nil, repeats: false)
        
    }
    
    @objc func showTwelvethWord() {
        
        firstWord.removeFromSuperview()
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor(red:0.84, green:0.56, blue:0.89, alpha:1.0)
        
        firstWord.text = "😄"
        firstWord.textColor = UIColor.white
        firstWord.font = UIFont.boldSystemFont(ofSize: 180)
        firstWord.textAlignment = .center
        firstWord.frame = CGRect(x: 0, y: 0, width: 765, height: 480)
        self.addSubview(firstWord)
        
        Timer.scheduledTimer(timeInterval: 0.55, target: self, selector: #selector(nextScreen), userInfo: nil, repeats: false)
        
    }
    
    @objc func nextScreen() {
        
        self.removeFromSuperview()
        
        let gettingMap = FindingMap(scene: self)
        PlaygroundPage.current.liveView = gettingMap
        
    }
}
