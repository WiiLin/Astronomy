//
//  CAstronomyDetailViewController.swift
//  cmomey
//
//  Created by Wii Lin on 2021/7/15.
//

import UIKit

class CAstronomyDetailViewController: UIViewController {
    // MARK: - IBOutlet

    @IBOutlet private var dateLabel: UILabel!
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var contentLabel: UILabel!
    private var imageRequest: Cancellable?

    // MARK: - Properties

    private let astronomy: Astronomy

    // MARK: - Life Cycle

    init(astronomy: Astronomy) {
        self.astronomy = astronomy
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        imageRequest?.cancel()
    }
}

// MARK: - Private

private extension CAstronomyDetailViewController {
    func setupSubviews() {
        dateLabel.text = astronomy.displayDate
        contentLabel.text = [astronomy.title, astronomy.copyright, astronomy.description].joined(separator: "\n\n")
        if let url = URL(string: astronomy.hdurl) {
            imageRequest = ImageHandler.shared.getImage(with: url) { [weak self] result in
                guard let self = self else { return }
                if case let .success(image) = result {
                    self.imageView.image = image
                }
            }
        }
    }
}
