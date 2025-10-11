//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Dmitrii Varlakhanov on 7/20/25.
//

import UIKit
import SnapKit

class ProfileHeaderView: UIView {

    // MARK: - Properties

    private var statusText: String? = nil

    private lazy var myImageView: UIImageView = {
        let myImageView = UIImageView()
        
        myImageView.image = UIImage(named: "ProfilePhoto")
        myImageView.contentMode = .scaleAspectFill
        myImageView.clipsToBounds = true

        myImageView.layer.cornerRadius = 64
        myImageView.layer.borderColor = UIColor.white.cgColor
        myImageView.layer.borderWidth = 3

        myImageView.isUserInteractionEnabled = true

        let tapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(profileImageTapped)
        )
        myImageView.addGestureRecognizer(tapGestureRecognizer)

        return myImageView
    }()

    private lazy var myProfileNameLabel: UILabel = {
        let myProfileNameLabel = UILabel()

        myProfileNameLabel.text = "Dmitrii Varlakhanov"
        myProfileNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        myProfileNameLabel.textColor = .black

        return myProfileNameLabel
    }()

    private lazy var myStatusLabel: UILabel = {
        let myStatusLabel = UILabel()

        myStatusLabel.text = "Waiting for something..."
        myStatusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        myStatusLabel.textColor = .gray

        return myStatusLabel
    }()

    private lazy var myShowStatusButton: UIButton = {
        let myShowStatusButton = UIButton()

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

    private lazy var semitransperentView: UIView = {
        let semitransperentView = UIView(frame: ProfileViewController().view.frame)

        semitransperentView.backgroundColor = .white
        semitransperentView.alpha = 0

        return semitransperentView
    }()

    private lazy var buttonX: UIButton = {
        let buttonX = UIButton(frame: CGRect(
            x: Int(ProfileViewController().view.frame.width) - 50,
            y: Int(ProfileViewController().view.frame.minY),
            width: 50,
            height: 50
        ))

        buttonX.setImage(UIImage(systemName: "xmark"), for: .normal)
        buttonX.tintColor = .black
        buttonX.alpha = 0
        buttonX.addTarget(self, action: #selector(quitProfileImageTapped), for: .touchUpInside)

        return buttonX
    }()

    private lazy var globalCenterMyImageView: CGPoint? = nil

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.addSubview(myProfileNameLabel)
        self.addSubview(myStatusLabel)
        self.addSubview(myShowStatusButton)
        self.addSubview(myCustomTextField)
        self.addSubview(semitransperentView)
        self.addSubview(buttonX)
        self.addSubview(myImageView)

        setupView()
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

    @objc func profileImageTapped() {
        let centerMyImageView = myImageView.center
        globalCenterMyImageView = centerMyImageView

        UIView.animateKeyframes(
            withDuration: 0.8,
            delay: 0,
            animations: {
                UIView.addKeyframe(
                    withRelativeStartTime: 0,
                    relativeDuration: 0.625,
                    animations: {
                        self.bringSubviewToFront(self.myImageView)
                        self.myImageView.center = CGPoint(
                            x: ProfileViewController().view.bounds.midX,
                            y: ProfileViewController().view.bounds.midY - 100
                        )
                        self.myImageView.transform = CGAffineTransform(
                            scaleX: UIScreen.main.bounds.width / self.myImageView.bounds.width,
                            y: UIScreen.main.bounds.width / self.myImageView.bounds.width
                        )
                        self.myImageView.layer.cornerRadius = 0

                        self.semitransperentView.alpha = 0.5
                    }
                )
                UIView.addKeyframe(
                    withRelativeStartTime: 0.625,
                    relativeDuration: 0.375,
                    animations: {
                        self.buttonX.alpha = 1
                    }
                )
            }
        )
    }

    @objc func quitProfileImageTapped() {
        UIView.animateKeyframes(
            withDuration: 0.8,
            delay: 0,
            animations: {
                UIView.addKeyframe(
                    withRelativeStartTime: 0,
                    relativeDuration: 0.375,
                    animations: {
                        self.buttonX.alpha = 0
                    }
                )
                UIView.addKeyframe(
                    withRelativeStartTime: 0.375,
                    relativeDuration: 0.625,
                    animations: {
                        self.myImageView.center = self.globalCenterMyImageView!
                        self.myImageView.transform = .identity
                        self.myImageView.layer.cornerRadius = 64

                        self.semitransperentView.alpha = 0
                    }
                )
            }
        )
    }

    // MARK: - Private

    private func setupView() {
        self.backgroundColor = .systemGray6
    }

    private func setupConstraints() {
        myImageView.snp.makeConstraints({
            $0.top.left.equalTo(self).inset(16)
            $0.width.height.equalTo(128)
        })

        myProfileNameLabel.snp.makeConstraints({
            $0.top.equalTo(self).inset(27)
            $0.left.equalTo(self.myImageView.snp.right).offset(27)
        })

        myShowStatusButton.snp.makeConstraints({
            $0.left.right.equalTo(self).inset(16)
            $0.top.equalTo(self.myImageView.snp.bottom).offset(36)
            $0.height.equalTo(50)
            $0.bottom.equalTo(self)
        })

        myStatusLabel.snp.makeConstraints({
            $0.left.equalTo(self.myImageView.snp.right).offset(27)
            $0.bottom.equalTo(self.myShowStatusButton.snp.top).inset(-74)
        })

        myCustomTextField.snp.makeConstraints({
            $0.left.equalTo(self.myImageView.snp.right).offset(27)
            $0.right.equalTo(self).offset(-16)
            $0.top.equalTo(self.myStatusLabel.snp.bottom).offset(10)
            $0.height.equalTo(40)
        })
    }

    // MARK: - Public

    func update(user: User?) {
        self.myProfileNameLabel.text = user?.fullName ?? ""
        self.myImageView.image = user?.avatar ?? UIImage()
        self.myStatusLabel.text = user?.status ?? ""
    }
}
