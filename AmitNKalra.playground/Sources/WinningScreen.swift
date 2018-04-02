import Foundation
import UIKit
import AVFoundation
import PlaygroundSupport

public class WinningView: UIView {
    
    let firstWord = UILabel()
    let secondWord = UILabel()
    let continueButton = UIButton()
    
    public init(scene: UIView) { // Basically the viewDidLoad
        super.init(frame:CGRect(x: 0, y: 390, width: 1000, height: 520))
        
        showFirstWord()
        
        continueButton.addTarget(self, action: #selector(nextScreen), for: .touchUpInside)
        
    }
    
    required public init(coder aDecoder: NSCoder) {
        
        fatalError("Public Init Coder NOT working...")
        
    }
    
    fileprivate var audioURL: AVAudioPlayer? {
        
        didSet {
            
        }
        
    }
    
    fileprivate func playWinningNoise() { // Setting up the audio
        
        do {
            
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
        } catch {
            
            fatalError("Unable to set the audio session cuz \(error)")
            
        }
        
        guard
            
            let audioURL = Bundle.main.url(forResource: "Winning", withExtension: "mp3"), // game winning noise
            let player = try? AVAudioPlayer(contentsOf: audioURL)
            
            else {
                
                fatalError("Unable to create the player")
                
        }
        
        self.audioURL = player
        player.play()
        
    }
    
    func showFirstWord() {
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor(red:1.00, green:0.88, blue:0.00, alpha:1.0)
        
        playWinningNoise()
        
        firstWord.text = "CONGRATS!"
        firstWord.textColor = UIColor.white
        firstWord.font = UIFont.boldSystemFont(ofSize: 80)
        firstWord.textAlignment = .center
        firstWord.frame = CGRect(x: 0, y: 0, width: 768, height: 200)
        self.addSubview(firstWord)
        
        secondWord.text = "YOU TOOK THE DUB! 🏆"
        secondWord.textColor = UIColor.white
        secondWord.numberOfLines = 2
        secondWord.font = UIFont.boldSystemFont(ofSize: 60)
        secondWord.textAlignment = .center
        secondWord.frame = CGRect(x: 0, y: 0, width: 768, height: 380)
        self.addSubview(secondWord)
        
        var proceedImage = #imageLiteral(resourceName: "ProceedButton.png")
        continueButton.setImage(proceedImage, for: .normal)
        //mapButton.transform = CGAffineTransform(scaleX: -1, y: 1)
        //stopButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 150)
        continueButton.frame = CGRect(x: 170, y: 340, width: 427, height: 123)
        self.addSubview(continueButton)
        
        
    }

    @objc func nextScreen() {
        
        self.removeFromSuperview()
        
        let goingIntoSpace = MappingToSeventhActivity(scene: self)
        PlaygroundPage.current.liveView = goingIntoSpace
        
    }
}
