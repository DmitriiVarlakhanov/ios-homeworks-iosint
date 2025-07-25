//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Dmitrii Varlakhanov on 7/13/25.
//

import UIKit

class ProfileViewController: UIViewController {

    var profileHeaderView = ProfileHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Profile"

        self.view.backgroundColor = .lightGray

        self.view.addSubview(profileHeaderView)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        profileHeaderView.frame = self.view.frame
    }
}
