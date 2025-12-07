//
//  FeedViewModel.swift
//  Navigation
//
//  Created by Dmitrii Varlakhanov on 11/4/25.
//

import Foundation
import UIKit

class FeedViewModel {

    weak var feedViewController: FeedViewController?

    func toPostViewController() {
        let postViewController = PostViewController()
        postViewController.post = self.feedViewController!.post
        self.feedViewController!.navigationController?.pushViewController(postViewController, animated: true)
    }

    func toAudioPlayerViewController() {
        let audioPlayerViewController = AudioPlayerViewController()
        self.feedViewController!.navigationController?.pushViewController(audioPlayerViewController, animated: true)
    }

    func toFeedModel() {
        let feedModel = FeedModel()
        if feedModel.check(wordToCheck: self.feedViewController!.textField.text ?? "") {
            self.feedViewController!.checkingResultLabel.backgroundColor = .systemGreen
        } else {
            self.feedViewController!.checkingResultLabel.backgroundColor = .systemRed
        }
    }
}
