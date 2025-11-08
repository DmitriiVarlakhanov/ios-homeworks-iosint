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

    private var feedViewModel: FeedViewModel

    private lazy var firstButton: CustomButton = {
        let firstButton = CustomButton(
            title: "First Button",
            titleColor: .white,
            backgroundColor: .systemBlue,
            closureForAction: {
                self.feedViewModel.toPostViewController()
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
                self.feedViewModel.toPostViewController()
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

    lazy var textField: MyCustomTestField = {
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
                self.feedViewModel.toFeedModel()
            }
        )

        checkGuessButton.translatesAutoresizingMaskIntoConstraints = false

        checkGuessButton.layer.cornerRadius = 10

        return checkGuessButton
    }()

    lazy var checkingResultLabel: UILabel = {
        let checkingResultLabel = UILabel()
        
        checkingResultLabel.translatesAutoresizingMaskIntoConstraints = false

        checkingResultLabel.backgroundColor = .none

        checkingResultLabel.clipsToBounds = true
        checkingResultLabel.layer.cornerRadius = 20

        return checkingResultLabel
    }()

    // MARK: - Lifecycle

    init(feedViewModel: FeedViewModel) {
        self.feedViewModel = feedViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
