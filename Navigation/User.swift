//
//  User.swift
//  Navigation
//
//  Created by Dmitrii Varlakhanov on 10/4/25.
//

import UIKit

class User {

    let login: String
    var fullName: String
    var avatar: UIImage
    var status: String

    init(login: String, fullName: String, avatar: UIImage, status: String) {
        self.login = login
        self.fullName = fullName
        self.avatar = avatar
        self.status = status
    }
}
