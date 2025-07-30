//
//  PostViewController.swift
//  Navigation
//
//  Created by Dmitrii Varlakhanov on 7/14/25.
//

import UIKit

class PostViewController: UIViewController {

    // MARK: - Properties

    var post: Post?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Post"
        self.view.backgroundColor = .lightGray
        self.title = post?.title

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(action))
    }

    // MARK: - Actions

    @objc func action() {
        let infoViewController = InfoViewController()

        infoViewController.modalPresentationStyle = .pageSheet
        infoViewController.modalTransitionStyle = .coverVertical

        present(infoViewController, animated: true)
    }
}
