//
//  LogInInspector.swift
//  Navigation
//
//  Created by Dmitrii Varlakhanov on 10/12/25.
//

import UIKit

class LogInInspector: LogInViewControllerDelegate {

    func check(login: String, password: String) -> Bool {
        return Checker.shared.check(login: login, password: password)
    }
}
