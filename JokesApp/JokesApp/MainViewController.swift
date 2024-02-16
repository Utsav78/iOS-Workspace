//
//  ViewController.swift
//  JokesApp
//
//  Created by ebpearls on 6/17/22.
//

import UIKit

class MainViewController: UIViewController {
    let button = UIButton(type: .system)
    let label = UILabel()
    
    let networker = Networker.shared

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
        getQuoteFromApi()
        
    }
}
extension MainViewController {
    
    private func setup() {
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.adjustsFontSizeToFitWidth = true
        label.sizeToFit()
        label.textAlignment = .center
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("New Quote", for: [])
        
        button.layer.cornerRadius = 12
        button.backgroundColor = .brown
        button.tintColor = .white
        button.titleEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        
        
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
            button.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 6),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: button.trailingAnchor, multiplier: 6),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func randomTapped(_ sender: UIButton) {
        getQuoteFromApi()
    }
    
    func getQuoteFromApi() {
        networker.getQuote { (kanye, error) -> (Void) in
            if let _ = error {
                self.label.text = "Error"
                return
            }
            
            self.label.text = kanye?.quote
        }
    }
}

