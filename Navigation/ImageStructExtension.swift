//
//  ImageStructExtension.swift
//  Navigation
//
//  Created by Dmitrii Varlakhanov on 8/31/25.
//

import Foundation

extension Image {

    static func make() -> [Image] {
        return (1...20).map { Image(name: "PhotoCollectionView\($0)") }
    }
}
