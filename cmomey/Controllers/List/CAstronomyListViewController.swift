//
//  CAstronomyListViewController.swift
//  cmomey
//
//  Created by Wii Lin on 2021/7/13.
//

import UIKit

class CAstronomyListViewController: UIViewController {
    // MARK: - IBOutlet

    @IBOutlet private var collectionView: UICollectionView!

    // MARK: - Properties

    private lazy var viewModel: CAstronomyListViewModel = CAstronomyListViewModel(apiRequestable: APIHandler())

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubViews()
        initBinding()
        viewModel.loadData()
    }

    override func viewWillAppear(_: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

// MARK: - Privaite

private extension CAstronomyListViewController {
    func setupSubViews() {
        collectionView.register(UINib(nibName: "\(CAstronomyCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(CAstronomyCell.self)")
    }

    func initBinding() {
        viewModel.delegate = self
        viewModel.$errorMessage(bind: self) { _, errorMessage in
            print(errorMessage)
        }

        viewModel.$isLoading(bind: self) { _, isLoading in
            print(isLoading)
        }
    }
}

// MARK: - ATMainViewModelDelegate

extension CAstronomyListViewController: CAstronomyListViewModelDelegate {
    func loadCompleted() {
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDelegate

extension CAstronomyListViewController: UICollectionViewDelegate {
    func collectionView(_: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(CAstronomyDetailViewController(astronomy: viewModel.dataSource[indexPath.row]), animated: true)
    }
}

// MARK: - UICollectionViewDataSource

extension CAstronomyListViewController: UICollectionViewDataSource {
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return viewModel.dataSource.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CAstronomyCell.self)", for: indexPath) as! CAstronomyCell
        cell.configure(astronomy: viewModel.dataSource[indexPath.row])
        return cell
    }
}
