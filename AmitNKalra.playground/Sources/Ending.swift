import Foundation
import UIKit
import AVFoundation
import PlaygroundSupport

public class EndingView: UIView {
    
    let firstWord = UILabel()
    var secondWord = UILabel()
    var imageForChestAndLetter = UIImageView()
    
    public init(scene: UIView) { // Basically the viewDidLoad
        super.init(frame:CGRect(x: 0, y: 390, width: 1000, height: 520))
        
        showTreasureChest()
        
        var tappedOnLetter = UITapGestureRecognizer(target: self, action: #selector(showFirstWord))
        tappedOnLetter.numberOfTapsRequired = 3
        self.addGestureRecognizer(tappedOnLetter)
        
        var swipeUpGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipingUp))
        swipeUpGesture.direction = UISwipeGestureRecognizerDirection.up
        self.addGestureRecognizer(swipeUpGesture)
        
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
    
    func showTreasureChest() {
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor(red:0.04, green:0.18, blue:0.33, alpha:1.0)
        
        firstWord.text = "OMG YOU FOUND A CHEST!"
        firstWord.textColor = UIColor.white
        firstWord.font = UIFont.boldSystemFont(ofSize: 55)
        firstWord.textAlignment = .center
        firstWord.frame = CGRect(x: 0, y: 0, width: 768, height: 90)
        self.addSubview(firstWord)
        
        secondWord.text = "Swipe up on the lock to open up the chest!"
        secondWord.textColor = UIColor.white
        secondWord.font = UIFont.boldSystemFont(ofSize: 33)
        secondWord.textAlignment = .center
        secondWord.frame = CGRect(x: 0, y: 430, width: 768, height: 90)
        self.addSubview(secondWord)
        
        imageForChestAndLetter.image = #imageLiteral(resourceName: "TreasureChest.png")
        imageForChestAndLetter.frame = CGRect(x: 185, y: 110, width: 393, height: 328)
        self.addSubview(imageForChestAndLetter)
        
    }
    
    @objc func showLetter() {
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor(red:0.04, green:0.18, blue:0.33, alpha:1.0)
        
        firstWord.text = "WOW YOU FOUND A LETTER"
        firstWord.textColor = UIColor.white
        firstWord.font = UIFont.boldSystemFont(ofSize: 55)
        firstWord.textAlignment = .center
        firstWord.frame = CGRect(x: 0, y: 0, width: 768, height: 90)
        self.addSubview(firstWord)
        
        secondWord.text = "CLICK THE PAPER 3 TIMES TO READ IT!"
        secondWord.textColor = UIColor.white
        secondWord.font = UIFont.boldSystemFont(ofSize: 33)
        secondWord.textAlignment = .center
        secondWord.frame = CGRect(x: 0, y: 430, width: 768, height: 90)
        self.addSubview(secondWord)
        
        imageForChestAndLetter.image = #imageLiteral(resourceName: "CofeeLetter.png")
        imageForChestAndLetter.frame = CGRect(x: 185, y: 110, width: 393, height: 328)
        self.addSubview(imageForChestAndLetter)
        
    }
    
    @objc func showFirstWord() {
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor(red:0.66, green:0.81, blue:0.85, alpha:1.0)
        
        firstWord.removeFromSuperview()
        secondWord.removeFromSuperview()
        imageForChestAndLetter.removeFromSuperview()
        
        firstWord.text = "THANK YOU FOR VIEWING MY WWDC PLAYGROUND!"
        firstWord.numberOfLines = 4
        firstWord.textColor = UIColor.white
        firstWord.font = UIFont.boldSystemFont(ofSize: 100)
        firstWord.textAlignment = .center
        firstWord.frame = CGRect(x: 0, y: 0, width: 755, height: 480)
        self.addSubview(firstWord)
        
        Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(showSecondWord), userInfo: nil, repeats: false)
        
    }
    
    @objc func showSecondWord() {
        
        firstWord.removeFromSuperview()
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor(red:0.66, green:0.81, blue:0.85, alpha:1.0)
        
        firstWord.text = "HOPE YOU ENJOYED AND"
        firstWord.numberOfLines = 3
        firstWord.textColor = UIColor.white
        firstWord.font = UIFont.boldSystemFont(ofSize: 120)
        firstWord.textAlignment = .center
        firstWord.frame = CGRect(x: 0, y: 0, width: 755, height: 480)
        self.addSubview(firstWord)
        
        Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(showThirdWord), userInfo: nil, repeats: false)
        
    }
    
    @objc func showThirdWord() {
        
        firstWord.removeFromSuperview()
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor(red:0.66, green:0.81, blue:0.85, alpha:1.0)
        
        firstWord.text = "HOPE TO SEE YOU AT"
        firstWord.numberOfLines = 3
        firstWord.textColor = UIColor.white
        firstWord.font = UIFont.boldSystemFont(ofSize: 120)
        firstWord.textAlignment = .center
        firstWord.frame = CGRect(x: 0, y: 0, width: 755, height: 480)
        self.addSubview(firstWord)
        
        Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(showImageScene), userInfo: nil, repeats: false)
        
    }
    
    let wwdcImage = UIImageView()
    
    @objc func showImageScene() {
        
        firstWord.removeFromSuperview()
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor.white
        wwdcImage.image = #imageLiteral(resourceName: "WWDCBackground.png")
        wwdcImage.frame = CGRect(x: 0, y: 0, width:768, height: 520)
        self.addSubview(wwdcImage)
        
    }
    
    @objc func swipingUp(gesture: UIGestureRecognizer) {
        
        if let swipingGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipingGesture.direction {
                
            case UISwipeGestureRecognizerDirection.up:
                showLetter()
            case UISwipeGestureRecognizerDirection.down:
                print("Your other up lol")
            case UISwipeGestureRecognizerDirection.left:
                print("I guess up and left sound familiar lol")
            case UISwipeGestureRecognizerDirection.right:
                print("back to elementary school")
            default:
                break
                
            }
            
        }
    }
    
}
