import Foundation
import UIKit
import AVFoundation
import PlaygroundSupport
import CoreMotion

public class BasketballView: UIView {

    var gameTimer = 10
    
    var collision: UICollisionBehavior!
    var gravity: UIGravityBehavior!
    var animator: UIDynamicAnimator!
    
    var bottomText = UILabel()
    var bottomBar = UIView()
    
    var countdownTimer = Timer()
    var checkingThePlaceTimer = Timer()
    var winningGameOverTimer = Timer()
    
    var continueButton = UIButton()
    
    var basketball = UIImageView()
    var basketballHoop = UIImageView()
    var backboard = UIImageView()
    
    var oldVector = CGVector()
    
    var itemBehav = UIDynamicItemBehavior()
    var motionQeue = OperationQueue()
    var motionManager = CMMotionManager()
    
    var myPanGesture = UIPanGestureRecognizer()
    
    var shouldBeNextScreen = false
    
    public init(scene: UIView) { // Basically the viewDidLoad
        super.init(frame:CGRect(x: 0, y: 390, width: 1000, height: 520))
        
        setupView()
        addingBehavior()
        
        winningGameOverTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(winningGameOver), userInfo: nil, repeats: true)
        checkingThePlaceTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(checkingThePlace), userInfo: nil, repeats: true)
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
        Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(addContinueButton), userInfo: nil, repeats: false)
        
        continueButton.addTarget(self, action: #selector(endingTheGame), for: .touchUpInside)
 
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
        
        myPanGesture = UIPanGestureRecognizer(target: self, action: #selector(self.panning(pan:)))
        basketball.addGestureRecognizer(myPanGesture)
        
        bottomBar.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 80)
        self.bottomBar.backgroundColor = UIColor(red:0.75, green:0.92, blue:0.98, alpha:1.0)
        self.addSubview(bottomBar)
        
        bottomText.text = "Can You Make A Shot In \(gameTimer)"
        bottomText.numberOfLines = 2
        bottomText.frame = CGRect(x: 0, y: 0, width: 768, height: 80)
        bottomText.font = UIFont.boldSystemFont(ofSize: 32)
        bottomText.textAlignment = .center
        bottomText.textColor = UIColor.white
        self.addSubview(bottomText)
        
        basketball.frame = CGRect(x: 500, y: 0, width: 75, height: 75)
        basketball.image = #imageLiteral(resourceName: "Basketball.png")
        
        basketball.isUserInteractionEnabled = true
//        basketball.layer.cornerRadius = 75 / 2 -- Don't need these anymore lol, just exported my ball picture as a circle
//        basketball.layer.maskToBounds = true
        self.addSubview(basketball)
        
        basketballHoop.frame = CGRect(x: 100, y: 100, width: 120, height: 80)
        basketballHoop.image = #imageLiteral(resourceName: "BasketballHoop.png")
        self.addSubview(basketballHoop)
        
        backboard.frame = CGRect(x: 100, y: 100, width: 120, height: 20)
        backboard.image = #imageLiteral(resourceName: "Backboard.png")
        self.addSubview(backboard)
        
        //playBackgroundMusic()
        
    }
    
    func dragging(recognizer: UIPanGestureRecognizer) {
        
        let myPoint = recognizer.location(in: self)
        basketball.center.x = myPoint.x
        basketball.center.y = myPoint.y
        
    }
    
    func addingBehavior() {
        
        animator = UIDynamicAnimator(referenceView: self)
        gravity = UIGravityBehavior(items: [basketball])
        itemBehav.friction = 0.1
        itemBehav.elasticity = 0.5
        
        collision = UICollisionBehavior(items: [basketball])
        collision.translatesReferenceBoundsIntoBoundary = true
        
        animator.addBehavior(gravity)
        animator?.addBehavior(itemBehav)
        itemBehav.addItem(basketball)
        animator?.addBehavior(collision)
        
    }
    
    var attach: UIAttachmentBehavior?
    var tossingBehavior = UIDynamicItemBehavior()
    
    @objc func panning(pan: UIPanGestureRecognizer) {
        
        var theLocation = pan.location(in: self)
        var theTappedLocation = pan.location(in: pan.view)
        
        if pan.state == UIGestureRecognizerState.began {
            
            var offset = UIOffsetMake(theTappedLocation.x - pan.view!.bounds.midX, theTappedLocation.y - pan.view!.bounds.midY)
            self.attach = UIAttachmentBehavior(item: pan.view!, offsetFromCenter: offset, attachedToAnchor: theLocation)
            
            if animator.behaviors.contains(tossingBehavior) {
                
                animator.removeBehavior(tossingBehavior)
                
            }
            
            self.animator!.addBehavior(self.attach!)
            
        } else if pan.state == UIGestureRecognizerState.changed {
            
            self.attach!.anchorPoint = theTappedLocation
            
            if (pan.view?.center.y)! < self.center.y {
                
                pan.isEnabled = false
                pan.isEnabled = true
                
            }
            
        } else if (pan.state == UIGestureRecognizerState.ended) || (pan.state == UIGestureRecognizerState.cancelled) {
            
            self.animator!.removeBehavior(self.attach!)
            
            var yDir = CGFloat()
            var xDir = CGFloat()
            
            pan.velocity(in: self).x > 0 ? (xDir = 1) : (xDir = -1)
            pan.velocity(in: self).y > 0 ? (yDir = 1) : (yDir = -1)
            
            tossingBehavior = UIDynamicItemBehavior(items: [pan.view!])
            tossingBehavior.addLinearVelocity(CGPoint(x: xDir * 300, y: yDir * 600), for: pan.view!)
            //tossingBehavior.angularResistance = 4
            //tossingBehavior.elasticity = 0.1
            self.animator!.addBehavior(tossingBehavior)
        
        }
    }
    
    @objc func winningGameOver() {
        
        if basketball.frame.intersects(backboard.frame) {
            
            if abs(basketball.center.x - backboard.center.x) <= 10 {
                
                endingTheGame()
                
            }
        }
    }
    
    @objc func countdown() {
        
        gameTimer -= 1
        
        bottomText.text = "Can You Make A Shot In \(gameTimer)"
        
        if bottomText.text == "Can You Make A Shot In 0" {
            
            bottomText.text = "Game Over"
            
        }
        
    }
    
    @objc func checkingThePlace() {
        
        if basketball.center.x > 750 {
            
            basketball.center.x = 700
        }
        
    }
    
    @objc func addContinueButton() {
        
        countdownTimer.invalidate()
        checkingThePlaceTimer.invalidate()
        winningGameOverTimer.invalidate()
        
        continueButton.setTitle("Next", for: .normal)
        continueButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        continueButton.setTitleColor(UIColor(red:0.75, green:0.92, blue:0.98, alpha:1.0), for: .normal)
        continueButton.frame = CGRect(x: 658, y: 475, width: 105, height: 34)
        self.addSubview(continueButton)
        
        basketball.isUserInteractionEnabled = false
        
    }
    
    @objc func endingTheGame() {
        
        self.removeFromSuperview()
        
        let mapToSwimingMap = MapToSwimActivity(scene: self)
        PlaygroundPage.current.liveView = mapToSwimingMap
        
    }
}
