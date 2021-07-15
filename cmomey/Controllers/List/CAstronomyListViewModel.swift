//
//  CAstronomyListViewModel.swift
//  cmomey
//
//  Created by Wii Lin on 2021/7/15.
//

import Foundation

protocol CAstronomyListViewModelDelegate: AnyObject {
    func loadCompleted()
}

class CAstronomyListViewModel {
    // MARK: - Properties

    private let apiRequestable: APIRequestable
    weak var delegate: CAstronomyListViewModelDelegate?

    private(set) var dataSource: [Astronomy] = []
    @Observable private(set) var isLoading: Bool = false
    @Observable private(set) var errorMessage: String = ""

    // MARK: - Init

    init(apiRequestable: APIRequestable) {
        self.apiRequestable = apiRequestable
    }

    // MARK: - Interfice

    func loadData() {
        apiRequestable.getAstronomyList { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(dataSource):
                self.dataSource = dataSource
                self.delegate?.loadCompleted()
            case let .failure(error):
                self.errorMessage = error.description
            }
        }
    }
}
