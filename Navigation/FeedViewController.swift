//
//  FeedViewController.swift
//  Navigation
//
//  Created by Dmitrii Varlakhanov on 7/13/25.
//

import UIKit

struct Post {

    let title: String
}

class FeedViewController: UIViewController {

    var post = Post(title: "New post")

    override func viewDidLoad() {
        super.viewDidLoad()

        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Post", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(showPost), for: .touchUpInside)

        self.view.addSubview(button)

        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }

    @objc func showPost() {
        let postViewController = PostViewController()
        postViewController.post = self.post
        self.navigationController?.pushViewController(postViewController, animated: true)
    }
}
