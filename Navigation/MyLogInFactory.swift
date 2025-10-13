//
//  MyLogInFactory.swift
//  Navigation
//
//  Created by Dmitrii Varlakhanov on 10/12/25.
//

import UIKit

struct MyLogInFactory: LogInFactory {
    func makeLogInInspector() -> LogInInspector {
        return LogInInspector()
    }
}
