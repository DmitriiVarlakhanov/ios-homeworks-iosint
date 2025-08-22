//
//  Post.swift
//  Navigation
//
//  Created by Dmitrii Varlakhanov on 8/17/25.
//

import UIKit

struct PostModel {

    let author: String
    let description: String
    let image: String
    let likes: Int
    let views: Int
}

extension PostModel {

    static func make() -> [PostModel] {
        return [
            PostModel(author: "Jack", description: "In botany, a tree is a perennial plant with an elongated stem, or trunk, usually supporting branches and leaves. In some usages, the definition of a tree may be narrower, e.g., including only woody plants with secondary growth, only plants that are usable as lumber, or only plants above a specified height. Wider definitions include taller palms, tree ferns, bananas, and bamboos.", image: "JackImage", likes: 23, views: 1034),
            PostModel(author: "Dmitrii", description: "Dmitrii", image: "DmitriiImage", likes: 44, views: 2223),
            PostModel(author: "Julia", description: "Julia", image: "JuliaImage", likes: 75, views: 2332),
            PostModel(author: "Marco", description: "Marco", image: "MarcoImage", likes: 44, views: 1098)
        ]
    }
}
