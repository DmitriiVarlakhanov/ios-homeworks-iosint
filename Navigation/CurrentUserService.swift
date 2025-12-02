//
//  CurrentUserService.swift
//  Navigation
//
//  Created by Dmitrii Varlakhanov on 10/4/25.
//

import UIKit

class CurrentUserService: UserService {

    var currentUser: User? = User(
        login: "varldmit",
        fullName: "Dmitrii Varlakhanov",
        avatar: UIImage(named: "ProfilePhoto")!,
        status: "Status"
    )

    func loginCheck(login: String) -> User? {
        if login == self.currentUser?.login {
            return self.currentUser
        } else {
            return nil
        }
    }
}
