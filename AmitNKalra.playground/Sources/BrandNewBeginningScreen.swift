import Foundation
import UIKit
import AVFoundation
import PlaygroundSupport

public class TheRealIntro: UIView {
    
    let firstWord = UILabel()
    let continueButton = UIButton()
    
    public init(scene: UIView) { // Basically the viewDidLoad
        super.init(frame:CGRect(x: 0, y: 390, width: 1000, height: 520))
        
        showFirstWord()
        
        continueButton.addTarget(self, action: #selector(nextScreen), for: .touchUpInside)
        
    }
    
    required public init(coder aDecoder: NSCoder) {
        
        fatalError("Public Init Coder NOT working...")
        
    }
    
    func showFirstWord() {
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor.white
        
        firstWord.text = "ARE YOU READY?"
        firstWord.numberOfLines = 3
        firstWord.textColor = UIColor(red:0.96, green:0.78, blue:0.14, alpha:1.0)
        firstWord.font = UIFont.boldSystemFont(ofSize: 100)
        firstWord.textAlignment = .center
        firstWord.frame = CGRect(x: 0, y: 0, width: 768, height: 280)
        self.addSubview(firstWord)
        
        
        let startImage = #imageLiteral(resourceName: "YESButton.png")
        continueButton.setImage(startImage, for: .normal)
        continueButton.frame = CGRect(x: 250, y: 425, width: 240, height: 65)
        self.addSubview(continueButton)
        
    }
    
    @objc func nextScreen() {
        
        self.removeFromSuperview()
        
        let goingToMe = IntroView(scene: self)
        PlaygroundPage.current.liveView = goingToMe
        
    }
}
