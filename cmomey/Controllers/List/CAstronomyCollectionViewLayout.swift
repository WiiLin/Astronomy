//
//  CAstronomyCollectionViewLayout.swift
//  cmomey
//
//  Created by Wii Lin on 2021/7/13.
//

import UIKit

class CAstronomyCollectionViewLayout: UICollectionViewFlowLayout {
    // MARK: - Override

    override func prepare() {
        super.prepare()
        configure()
    }
}

// MARK: - Private

private extension CAstronomyCollectionViewLayout {
    func configure() {
        guard let collectionView = collectionView else { return }
        scrollDirection = .vertical
        let column: CGFloat = 4.0
        minimumInteritemSpacing = 1
        minimumLineSpacing = 1
        sectionInset = .zero
        let totalPading: CGFloat = minimumInteritemSpacing * (column - 1)
        let width = (collectionView.frame.width - totalPading - sectionInset.left - sectionInset.right) / column
        itemSize = CGSize(width: width, height: width)
    }
}
