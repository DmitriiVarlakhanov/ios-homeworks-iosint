//
//  StringExtension.swift
//  Navigation
//
//  Created by Dmitrii Varlakhanov on 11/24/25.
//

import UIKit

extension String {

    // MARK: - Properties

    var digits:      String { return "0123456789" }
    var lowercase:   String { return "abcdefghijklmnopqrstuvwxyz" }
    var uppercase:   String { return "ABCDEFGHIJKLMNOPQRSTUVWXYZ" }
    var letters:     String { return lowercase + uppercase }
    var printable:   String { return digits + letters }

    // MARK: - Public

    mutating func replace(at index: Int, with character: Character) {
        var stringArray = Array(self)
        stringArray[index] = character
        self = String(stringArray)
    }
}
