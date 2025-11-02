//
//  FeedModel.swift
//  Navigation
//
//  Created by Dmitrii Varlakhanov on 10/27/25.
//

import Foundation
import UIKit

class FeedModel {

    let secretWord: String = "test"

    func check(wordToCheck: String) -> Bool {
        if wordToCheck == secretWord {
            return true
        } else {
            return false
        }
    }
}
