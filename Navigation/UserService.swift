//
//  UserService.swift
//  Navigation
//
//  Created by Dmitrii Varlakhanov on 10/4/25.
//

import UIKit

protocol UserService {

    func loginCheck(login: String) -> User?
}
