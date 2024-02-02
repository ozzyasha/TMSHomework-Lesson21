//
//  ViewControllerExtension.swift
//  TMSHomework-Lesson21
//
//  Created by Наталья Мазур on 2.02.24.
//

import UIKit

extension ViewController {
    
    func makeLabel(size: CGFloat, text: String) -> UILabel {
        let label = UILabel()
        
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: size)
        label.numberOfLines = 3
        label.text = text
        
        view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 40).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        return label
    }
    
    func makeButton(buttonTitle: String, action: Selector, otherElementBottomAnchor: NSLayoutYAxisAnchor) -> UIButton {
        let button = UIButton()
        
        button.backgroundColor = UIColor.systemBlue
        button.layer.cornerRadius = 20
        button.setTitle(buttonTitle, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: action, for: .touchUpInside)
        
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalToSystemSpacingBelow: otherElementBottomAnchor, multiplier: 10).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        return button
    }
    
}
