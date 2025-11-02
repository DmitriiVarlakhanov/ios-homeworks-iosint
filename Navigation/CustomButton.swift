//
//  CustomButton.swift
//  Navigation
//
//  Created by Dmitrii Varlakhanov on 10/25/25.
//

import UIKit

class CustomButton: UIButton {

    // MARK: - Properties

    var title: String = ""
    var titleColor: UIColor = .white
    var closureForAction: () -> Void = {}

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    convenience init(title: String, titleColor: UIColor, backgroundColor: UIColor, closureForAction: @escaping () -> Void) {
        self.init(frame: .zero)
        self.title = title
        self.titleColor = titleColor
        self.backgroundColor = backgroundColor
        self.closureForAction = closureForAction
        self.setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Action

    @objc private func buttonTapped() {
        self.closureForAction()
    }

    // MARK: - Private

    private func setupButton() {
        self.setTitle(self.title, for: .normal)
        self.setTitleColor(self.titleColor, for: .normal)
        self.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
}
