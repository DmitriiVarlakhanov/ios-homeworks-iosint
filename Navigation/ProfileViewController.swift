//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Dmitrii Varlakhanov on 7/13/25.
//

import UIKit

class ProfileViewController: UIViewController {

    // MARK: - Properties

    private lazy var profileHeaderView: ProfileHeaderView = {
        let profileHeaderView = ProfileHeaderView()

        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false

        return profileHeaderView
    }()

    private lazy var randomButton: UIButton = {
        let randomButton = UIButton()

        randomButton.translatesAutoresizingMaskIntoConstraints = false
        randomButton.setTitle("Random button", for: .normal)
        randomButton.setTitleColor(.white, for: .normal)
        randomButton.backgroundColor = .blue

        randomButton.layer.cornerRadius = 14

        return randomButton
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Profile"

        self.view.backgroundColor = .lightGray

        self.view.addSubview(profileHeaderView)
        self.view.addSubview(randomButton)

        setupConstraints()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }

    // MARK: - Constraints

    func setupConstraints() {
        let safeAreaGuide = self.view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 0),
            profileHeaderView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: 0),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),

            randomButton.leftAnchor.constraint(equalTo: safeAreaGuide.leftAnchor, constant: 0),
            randomButton.rightAnchor.constraint(equalTo: safeAreaGuide.rightAnchor, constant: 0),
            randomButton.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor)
        ])
    }
}
