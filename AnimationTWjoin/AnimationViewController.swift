//
//  AnimationViewController.swift
//  AnimationTWjoin
//
//  Created by Andre on 2023/6/2.
//

import UIKit

class AnimationViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    
    let type: AnimationType
    let _width: CGFloat = 100
    let _height: CGFloat = 100
    let redView = UIView()
    
    init(type: AnimationType) {
        self.type = type
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("We got \(self.type) type")
        setupView()
    }
    
    private func setupView() {
        titleLabel.text = type.rawValue
        
        redView.frame = CGRect(x: view.bounds.midX - _width / 2, y: view.bounds.midY - _height / 2, width: _width, height: _height)
        redView.backgroundColor = .red
        view.addSubview(redView)
        
        switch type {
        case .MOVE:
            let animation = CABasicAnimation()
            animation.keyPath = "position.x"
            animation.fromValue = 20 + 100/2
            animation.toValue = 300
            animation.duration = 1
                
            redView.layer.add(animation, forKey: "basic")
            redView.layer.position = CGPoint(x: 300, y: 100 + 100/2)
        case .SCALE:
            let animation = CABasicAnimation()
            animation.keyPath = "transform.scale"
            animation.fromValue = 1
            animation.toValue = 2
            animation.duration = 0.4
                
            redView.layer.add(animation, forKey: "basic")
            redView.layer.transform = CATransform3DMakeScale(2, 2, 1)
        case .ROTATE:
            let animation = CABasicAnimation()
            animation.keyPath = "transform.rotation.z" // Note: z-axis
            animation.fromValue = 0
            animation.toValue = CGFloat.pi / 4
            animation.duration = 1
                
            redView.layer.add(animation, forKey: "basic")
            redView.layer.transform = CATransform3DMakeRotation(CGFloat.pi / 4, 0, 0, 1)
        case .SHAKE:
            let animation = CAKeyframeAnimation()
            animation.keyPath = "position.x"
            animation.values = [0, 10, -10, 10, 0]
            animation.keyTimes = [0, 0.16, 0.5, 0.83, 1]
            animation.duration = 0.4

            animation.isAdditive = true
            redView.layer.add(animation, forKey: "shake")
        }
    }
}

// MARK: - Animation Types
enum AnimationType: String {
    case MOVE = "Move"
    case SCALE = "Scale"
    case ROTATE = "Rotate"
    case SHAKE = "Shake"
    
    static let allValues = [MOVE, SCALE, ROTATE, SHAKE]
}
