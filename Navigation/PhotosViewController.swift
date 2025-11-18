//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Dmitrii Varlakhanov on 8/30/25.
//

import UIKit
import iOSIntPackage

class PhotosViewController: UIViewController {

    // MARK: - Properties

    fileprivate let images = Image.make()

    fileprivate var imagesAsImages: [UIImage] = []

    private enum CellReuseID: String {
        case first = "PhotosCollectionViewCell_ReuseID"
    }

    private lazy var collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)

        collectionView.translatesAutoresizingMaskIntoConstraints = false

        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: CellReuseID.first.rawValue)

        collectionView.dataSource = self
        collectionView.delegate = self

        return collectionView
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        createImagesAsImages()
        addSubviews()
        setupConstraints()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.view.backgroundColor = .white

        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.title = "Photo Gallery"

        createImagesAsFilteredImages()

        self.collectionView.reloadData()
    }

    // MARK: - Private

    private func setupConstraints() {
        let safeAreaGuide = self.view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            collectionView.rightAnchor.constraint(equalTo: safeAreaGuide.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: safeAreaGuide.leftAnchor)
        ])
    }

    private func addSubviews() {
        self.view.addSubview(collectionView)
    }

    private func createImagesAsImages() {
        imagesAsImages = images.map { UIImage(named: $0.name)! }
    }

    private func createImagesAsFilteredImages() {
        let start = CFAbsoluteTimeGetCurrent()

        ImageProcessor().processImagesOnThread(
            sourceImages: imagesAsImages,
            filter: .noir,
            qos: .default,
            completion: {
                self.imagesAsImages = $0.map { UIImage(cgImage: $0!) }
            }
        )

        let difference = CFAbsoluteTimeGetCurrent() - start

        print("Time: \(difference) sec")

        // MARK: 1) Filter: noir;    QoS: background;        Time: 2.5033950805664062e-05   sec
        // MARK: 2) Filter: noir;    QoS: default;           Time: 2.09808349609375e-05     sec
        // MARK: 3) Filter: noir;    QoS: userInitiated;     Time: 2.8014183044433594e-05   sec
        // MARK: 4) Filter: noir;    QoS: userInteractive;   Time: 2.6941299438476562e-05   sec
        // MARK: 5) Filter: noir;    QoS: utility;           Time: 4.7087669372558594e-05   sec
    }
}

extension PhotosViewController: UICollectionViewDataSource {

    // MARK: - UICollectionViewDataSource Implementation

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CellReuseID.first.rawValue,
            for: indexPath
        ) as? PhotosCollectionViewCell else {
            fatalError("could not dequeueReusableCell")
        }

        cell.update(model: imagesAsImages[indexPath.item])

        return cell
    }
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {

    // MARK: - UICollectionViewDelegateFlowLayout Implementation

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width - 4 * 8) / 3

        return CGSize(width: width, height: width)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        8
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        8
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
}
