//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Dmitrii Varlakhanov on 7/13/25.
//

import UIKit

class ProfileViewController: UIViewController {

    // MARK: - Properties

    private lazy var profileTableView: UITableView = {
        let profileTableView = UITableView(frame: .zero, style: .plain)

        profileTableView.translatesAutoresizingMaskIntoConstraints = false

        return profileTableView
    }()

    private enum CellReuseID: String {
        case firstCustom = "PostTableViewCell_ReuseID"
    }

    fileprivate let data = PostModel.make()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Profile"

        self.view.backgroundColor = .systemGray6

        self.view.addSubview(profileTableView)

        setupConstraints()
        setupTableView()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }

    // MARK: - Private

    private func setupConstraints() {
        let safeAreaGuide = self.view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            profileTableView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            profileTableView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 0),
            profileTableView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: 0),
            profileTableView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor)
        ])
    }

    private func setupTableView() {
        profileTableView.rowHeight = UITableView.automaticDimension

        let profileHeaderView = ProfileHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 230))
        profileTableView.tableHeaderView = profileHeaderView
        profileTableView.tableFooterView = UIView()

        profileTableView.register(
            PostTableViewCell.self,
            forCellReuseIdentifier: CellReuseID.firstCustom.rawValue
        )

        profileTableView.dataSource = self
        profileTableView.delegate = self
    }
}

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CellReuseID.firstCustom.rawValue,
            for: indexPath
        ) as? PostTableViewCell else {
            fatalError("could not dequeueReusableCell")
        }

        cell.update(data[indexPath.row])

        return cell
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
}

extension ProfileViewController: UITableViewDelegate { }
