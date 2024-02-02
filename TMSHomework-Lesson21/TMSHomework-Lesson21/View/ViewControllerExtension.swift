//
//  ViewControllerExtension.swift
//  TMSHomework-Lesson21
//
//  Created by Наталья Мазур on 2.02.24.
//

import UIKit

extension ViewController {
    
    func makeLabel(size: CGFloat) -> UILabel {
        let label = UILabel()
        
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: size)
        label.numberOfLines = 3
        
        view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 40).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        return label
    }
    
    func makeAttriutedLabel() {
        
    }
}
