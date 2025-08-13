//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Dmitrii Varlakhanov on 7/20/25.
//

import UIKit

class ProfileHeaderView: UIView {

    // MARK: - Properties

    private var statusText: String? = nil

    private lazy var myImageView: UIImageView = {
        let myImageView = UIImageView()
        
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        myImageView.image = UIImage(named: "ProfilePhoto")
        myImageView.contentMode = .scaleAspectFill
        myImageView.clipsToBounds = true

        myImageView.layer.cornerRadius = 64
        myImageView.layer.borderColor = UIColor.white.cgColor
        myImageView.layer.borderWidth = 3

        return myImageView
    }()

    private lazy var myProfileNameLabel: UILabel = {
        let myProfileNameLabel = UILabel()

        myProfileNameLabel.translatesAutoresizingMaskIntoConstraints = false
        myProfileNameLabel.text = "Dmitrii Varlakhanov"
        myProfileNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        myProfileNameLabel.textColor = .black

        return myProfileNameLabel
    }()

    private lazy var myStatusLabel: UILabel = {
        let myStatusLabel = UILabel()

        myStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        myStatusLabel.text = "Waiting for something..."
        myStatusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        myStatusLabel.textColor = .gray

        return myStatusLabel
    }()

    private lazy var myShowStatusButton: UIButton = {
        let myShowStatusButton = UIButton()

        myShowStatusButton.translatesAutoresizingMaskIntoConstraints = false
        myShowStatusButton.setTitle("Show status", for: .normal)
        myShowStatusButton.setTitleColor(.white, for: .normal)
        myShowStatusButton.backgroundColor = .blue

        myShowStatusButton.layer.cornerRadius = 14
        myShowStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        myShowStatusButton.layer.shadowRadius = 4
        myShowStatusButton.layer.shadowColor = UIColor.black.cgColor
        myShowStatusButton.layer.shadowOpacity = 0.7

        myShowStatusButton.clipsToBounds = false

        myShowStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)

        return myShowStatusButton
    }()

    private lazy var myCustomTextField: MyCustomTestField = {
        let myCustomTextField: MyCustomTestField = MyCustomTestField(insets: UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12))

        myCustomTextField.translatesAutoresizingMaskIntoConstraints = false
        myCustomTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)

        return myCustomTextField
    }()

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.addSubview(myImageView)
        self.addSubview(myProfileNameLabel)
        self.addSubview(myStatusLabel)
        self.addSubview(myShowStatusButton)
        self.addSubview(myCustomTextField)

        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Actions

    @objc func buttonPressed() {
        print(myStatusLabel.text!)
        myStatusLabel.text = statusText ?? ""
    }

    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? ""
    }

    // MARK: - Private

    private func setupConstraints() {
        let safeAreaGuide = self.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            myImageView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 16),
            myImageView.leftAnchor.constraint(equalTo: safeAreaGuide.leftAnchor, constant: 16),
            myImageView.widthAnchor.constraint(equalToConstant: 128),
            myImageView.heightAnchor.constraint(equalToConstant: 128),

            myProfileNameLabel.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 27),
            myProfileNameLabel.leftAnchor.constraint(equalTo: myImageView.rightAnchor, constant: 27),

            myShowStatusButton.leftAnchor.constraint(equalTo: safeAreaGuide.leftAnchor, constant: 16),
            myShowStatusButton.rightAnchor.constraint(equalTo: safeAreaGuide.rightAnchor, constant: -16),
            myShowStatusButton.topAnchor.constraint(equalTo: myImageView.bottomAnchor, constant: 36),
            myShowStatusButton.heightAnchor.constraint(equalToConstant: 50),

            myStatusLabel.leftAnchor.constraint(equalTo: myImageView.rightAnchor, constant: 27),
            myStatusLabel.bottomAnchor.constraint(equalTo: myShowStatusButton.topAnchor, constant: -74),

            myCustomTextField.leftAnchor.constraint(equalTo: myImageView.rightAnchor, constant: 27),
            myCustomTextField.rightAnchor.constraint(equalTo: safeAreaGuide.rightAnchor, constant: -16),
            myCustomTextField.topAnchor.constraint(equalTo: myStatusLabel.bottomAnchor, constant: 10),
            myCustomTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
