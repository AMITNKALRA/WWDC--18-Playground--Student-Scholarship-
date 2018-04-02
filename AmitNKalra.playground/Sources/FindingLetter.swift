import Foundation
import UIKit
import PlaygroundSupport
import AVFoundation


public class FindingMap: UIView {
    
    var thisView = UIView()
    
    let background = UIImageView()
    
    let whatsThatMessage = UIImageView()
    let xButtonMessage = UIImageView()
    let mapButtonMessage = UIImageView()
    let guyRunning = UIButton()
    
    let xButton = UIButton()
    let mapButton = UIButton()
    
    
    public init(scene: UIView) { // Basically the viewDidLoad
        super.init(frame:CGRect(x: 0, y: 390, width: 1000, height: 520))
        
        setupView()
        
        xButton.addTarget(self, action: #selector(showMap), for: .touchUpInside)
        mapButton.addTarget(self, action: #selector(nextScreen), for: .touchUpInside)
        
    }
    
    required public init(coder aDecoder: NSCoder) {
        
        fatalError("Public Init Coder NOT working...")
        
    }
    
    func setupView() {
        
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        
        background.image = #imageLiteral(resourceName: "Sandy.png")
        background.frame = CGRect(x: 0, y: 0, width: 768, height: 520)
        self.addSubview(background)
        
        guyRunning.setTitle("🏃🏽‍♂️", for: .normal)
        guyRunning.transform = CGAffineTransform(scaleX: -1, y: 1)
        guyRunning.titleLabel?.font = UIFont.boldSystemFont(ofSize: 150)
        guyRunning.frame = CGRect(x: 10, y: 100, width: 168, height: 211)
        
        self.addSubview(guyRunning)
        
        whatsThatMessage.image = #imageLiteral(resourceName: "WhatsThatMessage.png")
        whatsThatMessage.frame = CGRect(x: 150, y: 100, width: 175, height: 49)
        
        self.addSubview(whatsThatMessage)
        
        Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(removeWhatsThat), userInfo: nil, repeats: false)
        
        UIView.animate(withDuration: 2.5, delay: 1, usingSpringWithDamping: 1.2, initialSpringVelocity: 1.2, options: UIViewAnimationOptions.curveEaseIn, animations: ({
            
            self.guyRunning.center.x = self.guyRunning.center.x + 400
            self.guyRunning.center.y = self.guyRunning.center.y + 175
            
        }), completion: nil)
        
        var xImage = #imageLiteral(resourceName: "XMap.png")
        xButton.setImage(xImage, for: .normal)
        //xButton.transform = CGAffineTransform(scaleX: -1, y: 1)
        xButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 150)
        xButton.frame = CGRect(x: 690, y: 340, width: 57, height: 56)
        
        self.addSubview(xButton)
        
        Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(showXMessage), userInfo: nil, repeats: false)
        
    }
    
    @objc func removeWhatsThat() {
        
        whatsThatMessage.isHidden = true
        
    }
    
    @objc func showXMessage() {
        
        xButtonMessage.image = #imageLiteral(resourceName: "TapXMessage.png")
        xButtonMessage.frame = CGRect(x: 540, y: 280, width: 175, height: 49)
        
        self.addSubview(xButtonMessage)
        
    }
    
    @objc func wowMap() {
        
        mapButtonMessage.image = #imageLiteral(resourceName: "TapMapMessage.png")
        
    }
    
    @objc func showMap() {
        
        xButton.isHidden = true
        xButtonMessage.isHidden = true
        
        var mapImage = #imageLiteral(resourceName: "MapButton.png")
        mapButton.setImage(mapImage, for: .normal)
        //mapButton.transform = CGAffineTransform(scaleX: -1, y: 1)
        mapButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 150)
        mapButton.frame = CGRect(x: 690, y: 340, width: 57, height: 56)
        
        self.addSubview(mapButton)
        
        mapButtonMessage.image = #imageLiteral(resourceName: "OuuMap.png")
        mapButtonMessage.frame = CGRect(x: 540, y: 280, width: 175, height: 49)
        
        self.addSubview(mapButtonMessage)
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(wowMap), userInfo: nil, repeats: false)
        
    }
    
    @objc func nextScreen() {
        
        self.removeFromSuperview()
        
        let moreFlashes = MoreMessages(scene: self)
        PlaygroundPage.current.liveView = moreFlashes
        
    }
        
}
