//
//  AudioPlayerViewController.swift
//  Navigation
//
//  Created by Dmitrii Varlakhanov on 12/2/25.
//

import UIKit
import AVFoundation

class AudioPlayerViewController: UIViewController {

    // MARK: - Properties

    private var counter = 0

    private var audioURLs: [String] = [
        "Brad Paisley- Online",
        "Brad Paisley - Welcome To The Future (Official Video)",
        "Brad Paisley - Winter Wonderland",
        "Brenda Lee - Rockin' Around The Christmas Tree (1958)",
        "John Denver - Take Me Home, Country Roads Audio"
    ]

    private var audioPlayer: AVAudioPlayer!

    private lazy var playOrPauseButton: UIButton = {
        let playOrPauseButton = UIButton()

        playOrPauseButton.translatesAutoresizingMaskIntoConstraints = false

        playOrPauseButton.setImage(UIImage(systemName: "play.fill"), for: .normal)

        playOrPauseButton.addTarget(self, action: #selector(playOrPauseAudio), for: .touchUpInside)

        return playOrPauseButton
    }()

    private lazy var stopButton: UIButton = {
        let stopButton = UIButton()

        stopButton.translatesAutoresizingMaskIntoConstraints = false

        stopButton.setImage(UIImage(systemName: "stop.fill"), for: .normal)

        stopButton.addTarget(self, action: #selector(stopAudio), for: .touchUpInside)

        return stopButton
    }()

    private lazy var nextSongButton: UIButton = {
        let nextSongButton = UIButton()

        nextSongButton.translatesAutoresizingMaskIntoConstraints = false

        nextSongButton.setImage(UIImage(systemName: "forward.fill"), for: .normal)

        nextSongButton.addTarget(self, action: #selector(nextSong), for: .touchUpInside)

        return nextSongButton
    }()

    private lazy var previousSongButton: UIButton = {
        let stopButton = UIButton()

        stopButton.translatesAutoresizingMaskIntoConstraints = false

        stopButton.setImage(UIImage(systemName: "backward.fill"), for: .normal)

        stopButton.addTarget(self, action: #selector(previousSong), for: .touchUpInside)

        return stopButton
    }()

    private lazy var songNameLabel: UILabel = {
        let songNameLabel = UILabel()

        songNameLabel.translatesAutoresizingMaskIntoConstraints = false

        songNameLabel.text = self.audioURLs[0]
        songNameLabel.textColor = .black
        songNameLabel.numberOfLines = 2
        songNameLabel.textAlignment = .center

        return songNameLabel
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupRootView()
        self.setupAudioPlayer()
        self.addSubviews()
        self.setupConstraints()
    }

    // MARK: - Actions

    @objc func playOrPauseAudio() {
        if self.audioPlayer.isPlaying {
            audioPlayer.pause()

            playOrPauseButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        } else {
            audioPlayer.play()

            playOrPauseButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        }
    }

    @objc func stopAudio() {
        audioPlayer.stop()
        audioPlayer.currentTime = 0

        playOrPauseButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
    }

    @objc func nextSong() {
        audioPlayer.stop()
        audioPlayer.currentTime = 0

        if self.counter == audioURLs.count - 1 {
            self.counter = 0
        } else {
            self.counter += 1
        }

        guard let musicURL = Bundle.main.url(forResource: self.audioURLs[self.counter], withExtension: "mp3") else
            { return }

        do {
            try audioPlayer = AVAudioPlayer(contentsOf: musicURL)

            audioPlayer.prepareToPlay()
            audioPlayer.play()

            playOrPauseButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)

            songNameLabel.text = self.audioURLs[self.counter]
        } catch {
            print("Error creating AVAudioPlayer")
        }
    }

    @objc func previousSong() {
        audioPlayer.stop()
        audioPlayer.currentTime = 0

        if self.counter == 0 {
            self.counter = self.audioURLs.count - 1
        } else {
            self.counter -= 1
        }

        guard let musicURL = Bundle.main.url(forResource: self.audioURLs[self.counter], withExtension: "mp3") else
            { return }

        do {
            try audioPlayer = AVAudioPlayer(contentsOf: musicURL)

            audioPlayer.prepareToPlay()
            audioPlayer.play()

            playOrPauseButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)

            songNameLabel.text = self.audioURLs[self.counter]
        } catch {
            print("Error creating AVAudioPlayer")
        }
    }

    // MARK: - Private

    private func setupRootView() {
        self.view.backgroundColor = .white
    }

    private func addSubviews() {
        self.view.addSubview(self.playOrPauseButton)
        self.view.addSubview(self.stopButton)
        self.view.addSubview(self.nextSongButton)
        self.view.addSubview(self.previousSongButton)
        self.view.addSubview(self.songNameLabel)
    }

    private func setupConstraints() {
        let safeAreaGuide = self.view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            self.playOrPauseButton.leftAnchor.constraint(equalTo: safeAreaGuide.leftAnchor, constant: 100),
            self.playOrPauseButton.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 400),
            self.playOrPauseButton.widthAnchor.constraint(equalToConstant: 50),
            self.playOrPauseButton.heightAnchor.constraint(equalToConstant: 50),

            self.stopButton.rightAnchor.constraint(equalTo: safeAreaGuide.rightAnchor, constant: -100),
            self.stopButton.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 400),
            self.stopButton.widthAnchor.constraint(equalToConstant: 50),
            self.stopButton.heightAnchor.constraint(equalToConstant: 50),

            self.previousSongButton.leftAnchor.constraint(equalTo: safeAreaGuide.leftAnchor, constant: 120),
            self.previousSongButton.topAnchor.constraint(equalTo: playOrPauseButton.bottomAnchor, constant: 10),
            self.previousSongButton.widthAnchor.constraint(equalToConstant: 50),
            self.previousSongButton.heightAnchor.constraint(equalToConstant: 50),

            self.nextSongButton.rightAnchor.constraint(equalTo: safeAreaGuide.rightAnchor, constant: -120),
            self.nextSongButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 10),
            self.nextSongButton.widthAnchor.constraint(equalToConstant: 50),
            self.nextSongButton.heightAnchor.constraint(equalToConstant: 50),

            self.songNameLabel.centerYAnchor.constraint(equalTo: safeAreaGuide.centerYAnchor),
            self.songNameLabel.centerXAnchor.constraint(equalTo: safeAreaGuide.centerXAnchor),
            self.songNameLabel.widthAnchor.constraint(equalToConstant: 300),
            self.songNameLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    private func setupAudioPlayer() {
        guard let musicURL = Bundle.main.url(forResource: self.audioURLs[0], withExtension: "mp3") else
            { return }

        do {
            try audioPlayer = AVAudioPlayer(contentsOf: musicURL)
            audioPlayer.prepareToPlay()
        } catch {
            print("Error creating AVAudioPlayer")
        }
    }
}
