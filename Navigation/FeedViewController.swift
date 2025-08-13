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

    // MARK: - Properties

    var post = Post(title: "New post")

    private lazy var firstButton: UIButton = {
        let firstButton = UIButton()

        firstButton.setTitle("First Button", for: .normal)
        firstButton.setTitleColor(.white, for: .normal)
        firstButton.backgroundColor = .systemBlue

        firstButton.addTarget(self, action: #selector(showPost), for: .touchUpInside)

        return firstButton
    }()

    private lazy var secondButton: UIButton = {
        let secondButton = UIButton()

        secondButton.setTitle("Second Button", for: .normal)
        secondButton.setTitleColor(.white, for: .normal)
        secondButton.backgroundColor = .systemRed

        secondButton.addTarget(self, action: #selector(showPost), for: .touchUpInside)

        return secondButton
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()

        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fillEqually

        stackView.addArrangedSubview(firstButton)
        stackView.addArrangedSubview(secondButton)

        return stackView
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(stackView)

        setupConstraints()
    }

    // MARK: - Actions

    @objc func showPost() {
        let postViewController = PostViewController()
        postViewController.post = self.post
        self.navigationController?.pushViewController(postViewController, animated: true)
    }

    // MARK: - Private

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 200),
            stackView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}
