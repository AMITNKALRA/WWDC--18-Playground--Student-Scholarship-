import Foundation
import UIKit
import AVFoundation
import PlaygroundSupport

public class MoreMessages: UIView {
    
    let firstWord = UILabel()
    
    public init(scene: UIView) { // Basically the viewDidLoad
        super.init(frame:CGRect(x: 0, y: 390, width: 1000, height: 520))
        
        showThirteenthWord()
        
    }
    
    required public init(coder aDecoder: NSCoder) {
        
        fatalError("Public Init Coder NOT working...")
        
    }

    
    @objc func showThirteenthWord() {
        
        firstWord.removeFromSuperview()
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor(red:0.55, green:0.71, blue:0.89, alpha:1.0)
        
        firstWord.text = "BECAUSE"
        firstWord.textColor = UIColor.white
        firstWord.font = UIFont.boldSystemFont(ofSize: 102)
        firstWord.textAlignment = .center
        firstWord.frame = CGRect(x: 0, y: 0, width: 765, height: 480)
        self.addSubview(firstWord)
        
        Timer.scheduledTimer(timeInterval: 0.55, target: self, selector: #selector(showFoureenthWord), userInfo: nil, repeats: false)
        
    }
    
    @objc func showFoureenthWord() {
        
        firstWord.removeFromSuperview()
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor(red:0.65, green:0.84, blue:0.44, alpha:1.0)
        
        firstWord.text = "WE"
        firstWord.textColor = UIColor.white
        firstWord.font = UIFont.boldSystemFont(ofSize: 102)
        firstWord.textAlignment = .center
        firstWord.frame = CGRect(x: 0, y: 0, width: 765, height: 480)
        self.addSubview(firstWord)
        
        Timer.scheduledTimer(timeInterval: 0.55, target: self, selector: #selector(showFifteenthWord), userInfo: nil, repeats: false)
        
    }
    
    @objc func showFifteenthWord() {
        
        firstWord.removeFromSuperview()
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor(red:1.00, green:0.80, blue:0.76, alpha:1.0)
        
        firstWord.text = "USUALLY"
        firstWord.textColor = UIColor.white
        firstWord.font = UIFont.boldSystemFont(ofSize: 102)
        firstWord.textAlignment = .center
        firstWord.frame = CGRect(x: 0, y: 0, width: 765, height: 480)
        self.addSubview(firstWord)
        
        Timer.scheduledTimer(timeInterval: 0.55, target: self, selector: #selector(showSixteenthWord), userInfo: nil, repeats: false)
        
    }
    
    @objc func showSixteenthWord() {
        
        firstWord.removeFromSuperview()
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor(red:1.00, green:0.93, blue:0.00, alpha:1.0)
        
        firstWord.text = "PLAY"
        firstWord.textColor = UIColor.white
        firstWord.font = UIFont.boldSystemFont(ofSize: 102)
        firstWord.textAlignment = .center
        firstWord.frame = CGRect(x: 0, y: 0, width: 765, height: 480)
        self.addSubview(firstWord)
        
        Timer.scheduledTimer(timeInterval: 0.55, target: self, selector: #selector(showSeventeenthWord), userInfo: nil, repeats: false)
        
    }
    
    @objc func showSeventeenthWord() {
        
        firstWord.removeFromSuperview()
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor(red:0.58, green:0.82, blue:0.31, alpha:1.0)
        
        firstWord.text = "GAMES"
        firstWord.textColor = UIColor.white
        firstWord.font = UIFont.boldSystemFont(ofSize: 102)
        firstWord.textAlignment = .center
        firstWord.frame = CGRect(x: 0, y: 0, width: 765, height: 480)
        self.addSubview(firstWord)
        
        Timer.scheduledTimer(timeInterval: 0.55, target: self, selector: #selector(showEighteenthWord), userInfo: nil, repeats: false)
        
    }
    
    @objc func showEighteenthWord() {
        
        firstWord.removeFromSuperview()
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor(red:0.99, green:0.53, blue:0.44, alpha:1.0)
        
        firstWord.text = "AT"
        firstWord.textColor = UIColor.white
        firstWord.font = UIFont.boldSystemFont(ofSize: 102)
        firstWord.textAlignment = .center
        firstWord.frame = CGRect(x: 0, y: 0, width: 765, height: 480)
        self.addSubview(firstWord)
        
        Timer.scheduledTimer(timeInterval: 0.55, target: self, selector: #selector(showNineteenthWord), userInfo: nil, repeats: false)
        
    }
    
    @objc func showNineteenthWord() {
        
        firstWord.removeFromSuperview()
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor(red:0.78, green:0.78, blue:0.78, alpha:1.0)
        
        firstWord.text = "THE"
        firstWord.textColor = UIColor.white
        firstWord.font = UIFont.boldSystemFont(ofSize: 102)
        firstWord.textAlignment = .center
        firstWord.frame = CGRect(x: 0, y: 0, width: 765, height: 480)
        self.addSubview(firstWord)
        
        Timer.scheduledTimer(timeInterval: 0.55, target: self, selector: #selector(showTwentythWord), userInfo: nil, repeats: false)
        
    }
    
    @objc func showTwentythWord() {
        
        firstWord.removeFromSuperview()
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor(red:0.94, green:0.73, blue:0.38, alpha:1.0)
        
        firstWord.text = "PLAYGROUND,"
        firstWord.textColor = UIColor.white
        firstWord.font = UIFont.boldSystemFont(ofSize: 102)
        firstWord.textAlignment = .center
        firstWord.frame = CGRect(x: 0, y: 0, width: 765, height: 480)
        self.addSubview(firstWord)
        
        Timer.scheduledTimer(timeInterval: 0.55, target: self, selector: #selector(showTwentyFirstWord), userInfo: nil, repeats: false)
        
    }
    
    @objc func showTwentyFirstWord() {
        
        firstWord.removeFromSuperview()
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor(red:0.29, green:0.84, blue:0.89, alpha:1.0)
        
        firstWord.text = "LETS"
        firstWord.textColor = UIColor.white
        firstWord.font = UIFont.boldSystemFont(ofSize: 102)
        firstWord.textAlignment = .center
        firstWord.frame = CGRect(x: 0, y: 0, width: 765, height: 480)
        self.addSubview(firstWord)
        
        Timer.scheduledTimer(timeInterval: 0.55, target: self, selector: #selector(showTwentySecondWord), userInfo: nil, repeats: false)
        
    }
    
    @objc func showTwentySecondWord() {
        
        firstWord.removeFromSuperview()
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor(red:0.51, green:0.94, blue:0.00, alpha:1.0)
        
        firstWord.text = "PLAY"
        firstWord.textColor = UIColor.white
        firstWord.font = UIFont.boldSystemFont(ofSize: 102)
        firstWord.textAlignment = .center
        firstWord.frame = CGRect(x: 0, y: 0, width: 765, height: 480)
        self.addSubview(firstWord)
        
        Timer.scheduledTimer(timeInterval: 0.55, target: self, selector: #selector(showTwentyThirdWord), userInfo: nil, repeats: false)
        
    }
    
    @objc func showTwentyThirdWord() {
        
        firstWord.removeFromSuperview()
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor(red:0.84, green:0.56, blue:0.89, alpha:1.0)
        
        firstWord.text = "A"
        firstWord.textColor = UIColor.white
        firstWord.font = UIFont.boldSystemFont(ofSize: 102)
        firstWord.textAlignment = .center
        firstWord.frame = CGRect(x: 0, y: 0, width: 765, height: 480)
        self.addSubview(firstWord)
        
        Timer.scheduledTimer(timeInterval: 0.55, target: self, selector: #selector(showTwentyFourthWord), userInfo: nil, repeats: false)
        
    }
    
    @objc func showTwentyFourthWord() {
        
        firstWord.removeFromSuperview()
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor(red:1.00, green:0.93, blue:0.00, alpha:1.0)
        
        firstWord.text = "GAME"
        firstWord.textColor = UIColor.white
        firstWord.font = UIFont.boldSystemFont(ofSize: 102)
        firstWord.textAlignment = .center
        firstWord.frame = CGRect(x: 0, y: 0, width: 765, height: 480)
        self.addSubview(firstWord)
        
        Timer.scheduledTimer(timeInterval: 0.55, target: self, selector: #selector(showTwentyFifthWord), userInfo: nil, repeats: false)
        
    }
    
    @objc func showTwentyFifthWord() {
        
        firstWord.removeFromSuperview()
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor(red:0.55, green:0.71, blue:0.89, alpha:1.0)
        
        firstWord.text = "RIGHT"
        firstWord.textColor = UIColor.white
        firstWord.font = UIFont.boldSystemFont(ofSize: 102)
        firstWord.textAlignment = .center
        firstWord.frame = CGRect(x: 0, y: 0, width: 765, height: 480)
        self.addSubview(firstWord)
        
        Timer.scheduledTimer(timeInterval: 0.55, target: self, selector: #selector(showTwentySixthWord), userInfo: nil, repeats: false)
        
    }
    
    @objc func showTwentySixthWord() {
        
        firstWord.removeFromSuperview()
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor(red:0.65, green:0.84, blue:0.44, alpha:1.0)
        
        firstWord.text = "NOW."
        firstWord.textColor = UIColor.white
        firstWord.font = UIFont.boldSystemFont(ofSize: 102)
        firstWord.textAlignment = .center
        firstWord.frame = CGRect(x: 0, y: 0, width: 765, height: 480)
        self.addSubview(firstWord)
        
        Timer.scheduledTimer(timeInterval: 0.55, target: self, selector: #selector(showTwentySeventhWord), userInfo: nil, repeats: false)
        
    }
    
    @objc func showTwentySeventhWord() {
        
        firstWord.removeFromSuperview()
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor(red:1.00, green:0.80, blue:0.76, alpha:1.0)
        
        firstWord.text = "FOLLOW"
        firstWord.textColor = UIColor.white
        firstWord.font = UIFont.boldSystemFont(ofSize: 102)
        firstWord.textAlignment = .center
        firstWord.frame = CGRect(x: 0, y: 0, width: 765, height: 480)
        self.addSubview(firstWord)
        
        Timer.scheduledTimer(timeInterval: 0.55, target: self, selector: #selector(showTwentyEighthWord), userInfo: nil, repeats: false)
        
    }
    
    @objc func showTwentyEighthWord() {
        
        firstWord.removeFromSuperview()
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor(red:0.99, green:0.53, blue:0.44, alpha:1.0)
        
        firstWord.text = "THE"
        firstWord.textColor = UIColor.white
        firstWord.font = UIFont.boldSystemFont(ofSize: 102)
        firstWord.textAlignment = .center
        firstWord.frame = CGRect(x: 0, y: 0, width: 765, height: 480)
        self.addSubview(firstWord)
        
        Timer.scheduledTimer(timeInterval: 0.55, target: self, selector: #selector(showTwentyNinthWord), userInfo: nil, repeats: false)
        
    }
    
    @objc func showTwentyNinthWord() {
        
        firstWord.removeFromSuperview()
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor.white
        
        firstWord.text = "RED"
        firstWord.textColor = UIColor(red:0.84, green:0.00, blue:0.00, alpha:1.0)
        firstWord.font = UIFont.boldSystemFont(ofSize: 102)
        firstWord.textAlignment = .center
        firstWord.frame = CGRect(x: 0, y: 0, width: 765, height: 480)
        self.addSubview(firstWord)
        
        Timer.scheduledTimer(timeInterval: 0.55, target: self, selector: #selector(showThirtythWord), userInfo: nil, repeats: false)
        
    }
    
    @objc func showThirtythWord() {
        
        firstWord.removeFromSuperview()
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor(red:0.84, green:0.00, blue:0.00, alpha:1.0)
        
        firstWord.text = "PATH"
        firstWord.textColor = UIColor.white
        firstWord.font = UIFont.boldSystemFont(ofSize: 102)
        firstWord.textAlignment = .center
        firstWord.frame = CGRect(x: 0, y: 0, width: 765, height: 480)
        self.addSubview(firstWord)
        
        Timer.scheduledTimer(timeInterval: 0.55, target: self, selector: #selector(showThirtyFirstWord), userInfo: nil, repeats: false)
        
    }
    
    @objc func showThirtyFirstWord() {
        
        firstWord.removeFromSuperview()
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor(red:0.84, green:0.56, blue:0.89, alpha:1.0)
        
        firstWord.text = "AND"
        firstWord.textColor = UIColor.white
        firstWord.font = UIFont.boldSystemFont(ofSize: 102)
        firstWord.textAlignment = .center
        firstWord.frame = CGRect(x: 0, y: 0, width: 765, height: 480)
        self.addSubview(firstWord)
        
        Timer.scheduledTimer(timeInterval: 0.55, target: self, selector: #selector(showThirtySecondWord), userInfo: nil, repeats: false)
        
    }
    
    @objc func showThirtySecondWord() {
        
        firstWord.removeFromSuperview()
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor(red:0.55, green:0.71, blue:0.89, alpha:1.0)
        
        firstWord.text = "COMPLETE"
        firstWord.textColor = UIColor.white
        firstWord.font = UIFont.boldSystemFont(ofSize: 102)
        firstWord.textAlignment = .center
        firstWord.frame = CGRect(x: 0, y: 0, width: 765, height: 480)
        self.addSubview(firstWord)
        
        Timer.scheduledTimer(timeInterval: 0.55, target: self, selector: #selector(showThirtyThirdWord), userInfo: nil, repeats: false)
        
    }
    
    @objc func showThirtyThirdWord() {
        
        firstWord.removeFromSuperview()
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor(red:0.65, green:0.84, blue:0.44, alpha:1.0)
        
        firstWord.text = "THE"
        firstWord.textColor = UIColor.white
        firstWord.font = UIFont.boldSystemFont(ofSize: 102)
        firstWord.textAlignment = .center
        firstWord.frame = CGRect(x: 0, y: 0, width: 765, height: 480)
        self.addSubview(firstWord)
        
        Timer.scheduledTimer(timeInterval: 0.55, target: self, selector: #selector(showThirtyFourthWord), userInfo: nil, repeats: false)
        
    }
    
    @objc func showThirtyFourthWord() {
        
        firstWord.removeFromSuperview()
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor(red:1.00, green:0.93, blue:0.00, alpha:1.0)
        
        firstWord.text = "ACTIVITIES"
        firstWord.textColor = UIColor.white
        firstWord.font = UIFont.boldSystemFont(ofSize: 102)
        firstWord.textAlignment = .center
        firstWord.frame = CGRect(x: 0, y: 0, width: 765, height: 480)
        self.addSubview(firstWord)
        
        Timer.scheduledTimer(timeInterval: 0.55, target: self, selector: #selector(showThirtyFifthWord), userInfo: nil, repeats: false)
        
    }
    
    @objc func showThirtyFifthWord() {
        
        firstWord.removeFromSuperview()
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor(red:1.00, green:0.80, blue:0.76, alpha:1.0)
        
        firstWord.text = "TO"
        firstWord.textColor = UIColor.white
        firstWord.font = UIFont.boldSystemFont(ofSize: 102)
        firstWord.textAlignment = .center
        firstWord.frame = CGRect(x: 0, y: 0, width: 765, height: 480)
        self.addSubview(firstWord)
        
        Timer.scheduledTimer(timeInterval: 0.55, target: self, selector: #selector(showThirtySixthWord), userInfo: nil, repeats: false)
        
    }
    
    @objc func showThirtySixthWord() {
        
        firstWord.removeFromSuperview()
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor(red:0.58, green:0.82, blue:0.31, alpha:1.0)
        
        firstWord.text = "UNLOCK"
        firstWord.textColor = UIColor.white
        firstWord.font = UIFont.boldSystemFont(ofSize: 102)
        firstWord.textAlignment = .center
        firstWord.frame = CGRect(x: 0, y: 0, width: 765, height: 480)
        self.addSubview(firstWord)
        
        Timer.scheduledTimer(timeInterval: 0.55, target: self, selector: #selector(showThirtySeventhWord), userInfo: nil, repeats: false)
        
    }
    
    @objc func showThirtySeventhWord() {
        
        firstWord.removeFromSuperview()
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor(red:0.99, green:0.53, blue:0.44, alpha:1.0)
        
        firstWord.text = "THE"
        firstWord.textColor = UIColor.white
        firstWord.font = UIFont.boldSystemFont(ofSize: 102)
        firstWord.textAlignment = .center
        firstWord.frame = CGRect(x: 0, y: 0, width: 765, height: 480)
        self.addSubview(firstWord)
        
        Timer.scheduledTimer(timeInterval: 0.55, target: self, selector: #selector(showThirtyEighthWord), userInfo: nil, repeats: false)
        
    }
    
    @objc func showThirtyEighthWord() {
        
        firstWord.removeFromSuperview()
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor(red:0.84, green:0.56, blue:0.89, alpha:1.0)
        
        firstWord.text = "REST!"
        firstWord.textColor = UIColor.white
        firstWord.font = UIFont.boldSystemFont(ofSize: 102)
        firstWord.textAlignment = .center
        firstWord.frame = CGRect(x: 0, y: 0, width: 765, height: 480)
        self.addSubview(firstWord)
        
        Timer.scheduledTimer(timeInterval: 0.55, target: self, selector: #selector(showThirtyNinthWord), userInfo: nil, repeats: false)
        
    }
    
    @objc func showThirtyNinthWord() {
        
        firstWord.removeFromSuperview()
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor(red:0.55, green:0.71, blue:0.89, alpha:1.0)
        
        firstWord.text = "REMEMBER,"
        firstWord.textColor = UIColor.white
        firstWord.font = UIFont.boldSystemFont(ofSize: 102)
        firstWord.textAlignment = .center
        firstWord.frame = CGRect(x: 0, y: 0, width: 765, height: 480)
        self.addSubview(firstWord)
        
        Timer.scheduledTimer(timeInterval: 0.55, target: self, selector: #selector(showFortythWord), userInfo: nil, repeats: false)
        
    }
    
    @objc func showFortythWord() {
        
        firstWord.removeFromSuperview()
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor(red:0.65, green:0.84, blue:0.44, alpha:1.0)
        
        firstWord.text = "X"
        firstWord.textColor = UIColor.white
        firstWord.font = UIFont.boldSystemFont(ofSize: 102)
        firstWord.textAlignment = .center
        firstWord.frame = CGRect(x: 0, y: 0, width: 765, height: 480)
        self.addSubview(firstWord)
        
        Timer.scheduledTimer(timeInterval: 0.55, target: self, selector: #selector(showFortyFirstWord), userInfo: nil, repeats: false)
        
    }
    
    @objc func showFortyFirstWord() {
        
        firstWord.removeFromSuperview()
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor(red:1.00, green:0.80, blue:0.76, alpha:1.0)
        
        firstWord.text = "MARKS"
        firstWord.textColor = UIColor.white
        firstWord.font = UIFont.boldSystemFont(ofSize: 102)
        firstWord.textAlignment = .center
        firstWord.frame = CGRect(x: 0, y: 0, width: 765, height: 480)
        self.addSubview(firstWord)
        
        Timer.scheduledTimer(timeInterval: 0.55, target: self, selector: #selector(showFortySecondWord), userInfo: nil, repeats: false)
        
    }
    
    @objc func showFortySecondWord() {
        
        firstWord.removeFromSuperview()
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor(red:0.99, green:0.53, blue:0.44, alpha:1.0)
        
        firstWord.text = "THE"
        firstWord.textColor = UIColor.white
        firstWord.font = UIFont.boldSystemFont(ofSize: 102)
        firstWord.textAlignment = .center
        firstWord.frame = CGRect(x: 0, y: 0, width: 765, height: 480)
        self.addSubview(firstWord)
        
        Timer.scheduledTimer(timeInterval: 0.55, target: self, selector: #selector(showFortyThirdWord), userInfo: nil, repeats: false)
        
    }
    
    @objc func showFortyThirdWord() {
        
        firstWord.removeFromSuperview()
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor(red:0.84, green:0.56, blue:0.89, alpha:1.0)
        
        firstWord.text = "SPOT."
        firstWord.textColor = UIColor.white
        firstWord.font = UIFont.boldSystemFont(ofSize: 102)
        firstWord.textAlignment = .center
        firstWord.frame = CGRect(x: 0, y: 0, width: 765, height: 480)
        self.addSubview(firstWord)
        
        Timer.scheduledTimer(timeInterval: 0.55, target: self, selector: #selector(showFortyFourthWord), userInfo: nil, repeats: false)
        
    }
    
    @objc func showFortyFourthWord() {
        
        firstWord.removeFromSuperview()
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = UIColor(red:1.00, green:0.93, blue:0.00, alpha:1.0)
        
        firstWord.text = "LETS \n GO!!"
        firstWord.numberOfLines = 2
        firstWord.textColor = UIColor.white
        firstWord.font = UIFont.boldSystemFont(ofSize: 102)
        firstWord.textAlignment = .center
        firstWord.frame = CGRect(x: 0, y: 0, width: 765, height: 480)
        self.addSubview(firstWord)
        
        Timer.scheduledTimer(timeInterval: 0.55, target: self, selector: #selector(nextScreen), userInfo: nil, repeats: false)
        
    }
    
    @objc func nextScreen() {
        
        self.removeFromSuperview()
        
        let goingToMap = MapToFirstActivity(scene: self)
        PlaygroundPage.current.liveView = goingToMap
        
    }
}
