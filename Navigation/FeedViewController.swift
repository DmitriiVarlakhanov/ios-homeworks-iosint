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

    private lazy var firstButton: CustomButton = {
        let firstButton = CustomButton(
            title: "First Button",
            titleColor: .white,
            backgroundColor: .systemBlue,
            closureForAction: {
                let postViewController = PostViewController()
                postViewController.post = self.post
                self.navigationController?.pushViewController(postViewController, animated: true)
            }
        )
        return firstButton
    }()

    private lazy var secondButton: CustomButton = {
        let secondButton = CustomButton(
            title: "Second Button",
            titleColor: .white,
            backgroundColor: .systemRed,
            closureForAction: {
                let postViewController = PostViewController()
                postViewController.post = self.post
                self.navigationController?.pushViewController(postViewController, animated: true)
            }
        )
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

    private lazy var textField: MyCustomTestField = {
        let textField = MyCustomTestField(insets: UIEdgeInsets(
            top: 0,
            left: 12,
            bottom: 0,
            right: 12
        ))

        textField.translatesAutoresizingMaskIntoConstraints = false

        textField.placeholder = "Введите загаданное слово"
        textField.backgroundColor = .white
        textField.backgroundColor = .systemGray6
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.autocapitalizationType = .none
        textField.textColor = .black

        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10

        return textField
    }()

    private lazy var checkGuessButton: CustomButton = {
        let checkGuessButton = CustomButton(
            title: "Проверить",
            titleColor: .white,
            backgroundColor: .systemBlue,
            closureForAction: {
                let feedModel = FeedModel()
                if feedModel.check(wordToCheck: self.textField.text ?? "") {
                    self.checkingResultLabel.backgroundColor = .systemGreen
                } else {
                    self.checkingResultLabel.backgroundColor = .systemRed
                }
            }
        )

        checkGuessButton.translatesAutoresizingMaskIntoConstraints = false

        checkGuessButton.layer.cornerRadius = 10

        return checkGuessButton
    }()

    private lazy var checkingResultLabel: UILabel = {
        let checkingResultLabel = UILabel()
        
        checkingResultLabel.translatesAutoresizingMaskIntoConstraints = false

        checkingResultLabel.backgroundColor = .none

        checkingResultLabel.clipsToBounds = true
        checkingResultLabel.layer.cornerRadius = 20

        return checkingResultLabel
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(stackView)
        self.view.addSubview(textField)
        self.view.addSubview(checkGuessButton)
        self.view.addSubview(checkingResultLabel)

        setupConstraints()
    }

    // MARK: - Private

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 200),
            stackView.heightAnchor.constraint(equalToConstant: 200),

            textField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            textField.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 40),
            textField.widthAnchor.constraint(equalToConstant: 250),
            textField.heightAnchor.constraint(equalToConstant: 50),

            checkGuessButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            checkGuessButton.topAnchor.constraint(equalTo: self.textField.bottomAnchor, constant: 20),
            checkGuessButton.widthAnchor.constraint(equalToConstant: 200),
            checkGuessButton.heightAnchor.constraint(equalToConstant: 30),

            checkingResultLabel.leftAnchor.constraint(equalTo: self.textField.rightAnchor, constant: 10),
            checkingResultLabel.topAnchor.constraint(equalTo: self.textField.topAnchor, constant: 5),
            checkingResultLabel.widthAnchor.constraint(equalToConstant: 40),
            checkingResultLabel.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}
