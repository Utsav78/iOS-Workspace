//
//  ViewController.swift
//  JokesApp
//
//  Created by ebpearls on 6/17/22.
//

import UIKit

class ViewController: UIViewController {
    let button = UIButton(type: .system)
    let label = UILabel()
    
    let networker = Networker.shared

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
        
    }
}
extension ViewController {
    
    private func setup() {
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text =  "label"
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
//        label.adjustsFontSizeToFitWidth = true
        label.sizeToFit()
        label.textAlignment = .center
        

        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Random Quote", for: [])
        
        button.addTarget(self, action: #selector(randomTapped), for: .primaryActionTriggered)

        
        
    }
    private func layout() {
        view.addSubview(label)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: label.trailingAnchor, multiplier: 1),

            
            button.topAnchor.constraint(equalToSystemSpacingBelow: label.bottomAnchor, multiplier: 1),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        
    }
    
    @objc func randomTapped(_ sender: UIButton) {
        
        
        networker.getQuote { (kanye, error) -> (Void) in
            if let _ = error {
                self.label.text = "Error"
                return
            }
            
            self.label.text = kanye?.quote
        }
        
    }
    
    
    
    
}
