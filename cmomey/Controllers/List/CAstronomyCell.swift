//
//  CAstronomyCell.swift
//  cmomey
//
//  Created by Wii Lin on 2021/7/13.
//

import UIKit

class CAstronomyCell: UICollectionViewCell {
    //MARK: - IBOutlet
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    //MARK: - Properties
    private var imageRequest: Cancellable?

    //MARK: - Override
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        imageRequest?.cancel()
    }
    
    //MARK: - Interfice
    func configure(astronomy: Astronomy) {
        titleLabel.text = astronomy.title
        imageRequest = ImageHandler.shared.getImage(with: astronomy.url) { [weak self] result in
            guard let self = self else { return }
            if case let .success(image) = result {
                self.imageView.image = image
            }
        }
    }
}

