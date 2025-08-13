//
//  LogInViewController.swift
//  Navigation
//
//  Created by Dmitrii Varlakhanov on 8/8/25.
//

import UIKit

class LogInViewController: UIViewController {

    // MARK: - Properties

    private lazy var iconImageView: UIImageView = {
        let iconImageView = UIImageView()

        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.image = UIImage(named: "VKIcon")

        return iconImageView
    }()

    private lazy var emailOrPhoneTextField: MyCustomTestField = {
        let emailOrPhoneTextField = MyCustomTestField(insets: UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12))

        emailOrPhoneTextField.placeholder = "Email or phone"
        emailOrPhoneTextField.backgroundColor = .systemGray6
        emailOrPhoneTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        emailOrPhoneTextField.textColor = .black
        emailOrPhoneTextField.autocapitalizationType = .none
        emailOrPhoneTextField.keyboardType = UIKeyboardType.default
        emailOrPhoneTextField.returnKeyType = UIReturnKeyType.done
        emailOrPhoneTextField.clearButtonMode = UITextField.ViewMode.whileEditing

        emailOrPhoneTextField.layer.cornerRadius = 0
        emailOrPhoneTextField.layer.borderWidth = 0
        emailOrPhoneTextField.layer.borderColor = .none

        emailOrPhoneTextField.delegate = self

        return emailOrPhoneTextField
    }()

    private lazy var passwordTextField: MyCustomTestField = {
        let passwordTextField = MyCustomTestField(insets: UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12))

        passwordTextField.placeholder = "Password"
        passwordTextField.backgroundColor = .systemGray6
        passwordTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        passwordTextField.textColor = .black
        passwordTextField.autocapitalizationType = .none
        passwordTextField.keyboardType = UIKeyboardType.default
        passwordTextField.returnKeyType = UIReturnKeyType.done
        passwordTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        passwordTextField.isSecureTextEntry = true

        passwordTextField.layer.cornerRadius = 0
        passwordTextField.layer.borderWidth = 0
        passwordTextField.layer.borderColor = .none

        passwordTextField.delegate = self

        return passwordTextField
    }()

    private lazy var logInStackView: UIStackView = {
        let logInStackView = UIStackView()

        logInStackView.translatesAutoresizingMaskIntoConstraints = false
        logInStackView.axis = .vertical
        logInStackView.spacing = 0.5
        logInStackView.backgroundColor = .lightGray
        logInStackView.alignment = .fill
        logInStackView.distribution = .fillEqually

        logInStackView.clipsToBounds = true

        logInStackView.layer.borderColor = UIColor.lightGray.cgColor
        logInStackView.layer.borderWidth = 0.5
        logInStackView.layer.cornerRadius = 10

        logInStackView.addArrangedSubview(emailOrPhoneTextField)
        logInStackView.addArrangedSubview(passwordTextField)

        return logInStackView
    }()

    private lazy var logInButton: UIButton = {
        let logInButton = UIButton()

        logInButton.translatesAutoresizingMaskIntoConstraints = false
        logInButton.setTitle("Log In", for: .normal)
        logInButton.setTitleColor(.white, for: .normal)
        logInButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        logInButton.setBackgroundImage(UIImage(named: "PixelVKColor"), for: .normal)
        logInButton.alpha = 1.0

        logInButton.clipsToBounds = true

        logInButton.layer.cornerRadius = 10

        logInButton.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)

        return logInButton
    }()

    private lazy var logInScrollView: UIScrollView = {
        let logInScrollView = UIScrollView()

        logInScrollView.translatesAutoresizingMaskIntoConstraints = false
        logInScrollView.showsHorizontalScrollIndicator = false
        logInScrollView.showsVerticalScrollIndicator = true
        logInScrollView.backgroundColor = .white

        return logInScrollView
    }()

    private lazy var contentView: UIView = {
        let contentView = UIView()

        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .white

        return contentView
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        addSubviews()
        setupConstraints()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        setupKeyboardObservers()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        removeKeyboardObservers()
    }

    // MARK: - Actions

    @objc func logInButtonTapped() {
        let profileViewController = ProfileViewController()
        self.navigationController?.pushViewController(profileViewController, animated: true)
    }

    @objc func keyboardWillShow (_ notification: NSNotification) {
        let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height

        logInScrollView.contentInset.bottom += keyboardHeight ?? 0.0
    }

    @objc func keyboardWillHide (_ notification: NSNotification) {
        logInScrollView.contentInset.bottom = 0.0
    }

    // MARK: - Private

    private func setupConstraints() {
        let safeAreaGuide = self.view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            logInScrollView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            logInScrollView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
            logInScrollView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            logInScrollView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),

            contentView.trailingAnchor.constraint(equalTo: logInScrollView.trailingAnchor),
            contentView.leadingAnchor.constraint(equalTo: logInScrollView.leadingAnchor),
            contentView.topAnchor.constraint(equalTo: logInScrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: logInScrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: logInScrollView.widthAnchor),

            iconImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            iconImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            iconImageView.widthAnchor.constraint(equalToConstant: 100),
            iconImageView.heightAnchor.constraint(equalToConstant: 100),

            logInStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            logInStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            logInStackView.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 120),
            logInStackView.heightAnchor.constraint(equalToConstant: 100),

            logInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            logInButton.topAnchor.constraint(equalTo: logInStackView.bottomAnchor, constant: 16),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    private func addSubviews() {
        self.view.addSubview(logInScrollView)

        logInScrollView.addSubview(contentView)

        contentView.addSubview(iconImageView)
        contentView.addSubview(logInStackView)
        contentView.addSubview(logInButton)
    }

    private func setupView() {
        self.view.backgroundColor = .white
    }

    private func setupKeyboardObservers() {
        let notificationCenter = NotificationCenter.default

        notificationCenter.addObserver(
            self,
            selector: #selector(self.keyboardWillShow(_:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )

        notificationCenter.addObserver(
            self,
            selector: #selector(self.keyboardWillHide(_:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }

    private func removeKeyboardObservers() {
        let notificationCenter = NotificationCenter.default

        notificationCenter.removeObserver(self)
    }
}

// MARK: - UITextFieldDelegate Protocol

extension LogInViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()

        return true
    }
}
