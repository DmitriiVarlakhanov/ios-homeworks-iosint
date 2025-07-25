//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Dmitrii Varlakhanov on 7/20/25.
//

import UIKit

class ProfileHeaderView: UIView {

    private var statusText: String = "Listening to music"

    // MARK: - Subviews

    private lazy var myImageView: UIImageView = {
        let myImageView = UIImageView(frame: CGRect(x: 16, y: 96, width: 128, height: 128))

        myImageView.image = UIImage(named: "ProfilePhoto")
        myImageView.contentMode = .scaleAspectFill
        myImageView.clipsToBounds = true

        myImageView.layer.cornerRadius = 64
        myImageView.layer.borderColor = UIColor.white.cgColor
        myImageView.layer.borderWidth = 3

        return myImageView
    }()

    private lazy var myProfileNameLabel: UILabel = {
        let myProfileNameLabel = UILabel(frame: CGRect(x: 160, y: 107, width: 200, height: 21))

        myProfileNameLabel.text = "Dmitrii Varlakhanov"
        myProfileNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        myProfileNameLabel.textColor = .black

        return myProfileNameLabel
    }()

    private lazy var myStatusLabel: UILabel = {
        let myStatusLabel = UILabel(frame: CGRect(x: 160, y: 163, width: 200, height: 21))

        myStatusLabel.text = "Waiting for something..."
        myStatusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        myStatusLabel.textColor = .gray

        return myStatusLabel
    }()

    private lazy var myShowStatusButton: UIButton = {
        let UIScreenMainBoundsWidth: CGFloat = UIScreen.main.bounds.width

        let myShowStatusButton = UIButton(frame: CGRect(x: 16, y: 240, width: Int(UIScreenMainBoundsWidth) - 32, height: 50))

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

        myCustomTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)

        return myCustomTextField
    }()

    // MARK: - Actions

    @objc func buttonPressed() {
        print(myStatusLabel.text!)
        myStatusLabel.text = statusText
    }

    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? ""
    }

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.addSubview(myImageView)
        self.addSubview(myProfileNameLabel)
        self.addSubview(myStatusLabel)
        self.addSubview(myShowStatusButton)
        self.addSubview(myCustomTextField)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
