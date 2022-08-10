//
//  ActivityIndicator.swift
//  SpaceX
//
//  Created by Julia on 26.07.2022.
//

import UIKit

class ActivityIndicator: UIView {
    
    private lazy var rocket1 = UIImageView(image: UIImage(named: "rocket")?.withTintColor(.sxItemColor))
    private lazy var rocket2 = UIImageView(image: UIImage(named: "rocket")?.withTintColor(.sxRed))
    private let positions: [CGRect] = [CGRect(x: 20, y: 10, width: 30, height: 30),
                               CGRect(x: 30, y: 7.5, width: 40, height: 40),
                               CGRect(x: 50, y: 10, width: 30, height: 30),
                               CGRect(x: 30, y: 12.5, width: 20, height: 20)]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(rocket1)
        addSubview(rocket2)
        rocket1.layer.zPosition = 2
        rocket2.layer.zPosition = 1
    }
    
    private func animate(_ rocket: UIImageView, counter: Int) {
        var counter = counter
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: { [weak self] in
            guard let strongSelf = self else { return }
            rocket.frame = strongSelf.positions[counter]
            
            switch counter {
            case 1:
                if rocket == strongSelf.rocket1 { strongSelf.rocket1.layer.zPosition = 2 }
            case 3:
                if rocket == strongSelf.rocket1 { strongSelf.rocket1.layer.zPosition = 1 }
            default:
                break
            }
        }) { [weak self] (completed) in
            guard let strongSelf = self else { return }
            switch counter {
            case 0...2:
                counter += 1
            case 3:
                counter = 0
                
            default:
                break
            }
            strongSelf.animate(rocket, counter: counter)
        }
    }
    
    func startAnimation() {
        animate(rocket1, counter: 1)
        animate(rocket2, counter: 3)
    }
}
