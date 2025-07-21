//
//  InfoViewController.swift
//  Navigation
//
//  Created by Dmitrii Varlakhanov on 7/15/25.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white

        let infoVCButton = UIButton()
        infoVCButton.translatesAutoresizingMaskIntoConstraints = false
        infoVCButton.setTitle("Alert Button", for: .normal)
        infoVCButton.setTitleColor(.black, for: .normal)
        infoVCButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)

        self.view.addSubview(infoVCButton)

        NSLayoutConstraint.activate([
            infoVCButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            infoVCButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }

    @objc func showAlert() {
        let alertController = UIAlertController(title: "Alert", message: "This is my first alert", preferredStyle: .alert)

        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in print("The user tapped OK") }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in print("The user tapped Cancel") }))

        self.present(alertController, animated: true, completion: nil)
    }
}
