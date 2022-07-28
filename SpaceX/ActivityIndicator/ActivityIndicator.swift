//
//  ActivityIndicator.swift
//  SpaceX
//
//  Created by Julia on 26.07.2022.
//

import UIKit

class ActivityIndicator: UIImageView {
    var rocket1 = UIImageView(image: UIImage(named: "rocket")?.withTintColor(.sxItemColor))
    var rocket2 = UIImageView(image: UIImage(named: "rocket")?.withTintColor(.sxRed))
    let positions: [CGRect] = [CGRect(x: 20, y: 10, width: 30, height: 30),
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
        rocket1.layer.zPosition = 2
        self.addSubview(rocket1)
        self.addSubview(rocket2)
        rocket2.layer.zPosition = 1
    }
    
    func animate(_ rocket: UIImageView, counter: Int) {
        var counter1 = counter
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: { [weak self] in
            guard let strongSelf = self else { return }
            rocket.frame = strongSelf.positions[counter1]
            
            switch counter1 {
            case 1:
                if rocket == strongSelf.rocket1 { strongSelf.rocket1.layer.zPosition = 2 }
            case 3:
                if rocket == strongSelf.rocket1 { strongSelf.rocket1.layer.zPosition = 1 }
            default:
                break
            }
        }) { [weak self] (completed) in
            guard let strongSelf = self else { return }
            switch counter1 {
            case 0...2:
                counter1 += 1
            case 3:
                counter1 = 0
                
            default:
                break
            }
            strongSelf.animate(rocket, counter: counter1)
        }
    }
    
    func startAnimation() {
        self.animate(self.rocket1, counter: 1)
        self.animate(self.rocket2, counter: 3)
    }
}
