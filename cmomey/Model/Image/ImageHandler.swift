//
//  ImageHandler.swift
//  cmomey
//
//  Created by Wii Lin on 2021/7/15.
//

import UIKit

typealias ImageCompletionHandler = (Result<UIImage, APIError>) -> Void

class ImageHandler {
    //MARK: - Properties
    static let shared = ImageHandler()
    private let imageCache = NSCache<NSString, UIImage>()
    
    //MARK: - Init
    private init() {}
    
    //MARK: - Interfice
    func getImage(with url: URL, completionHandler: ImageCompletionHandler?)-> Cancellable? {
        let key: NSString = url.absoluteString as NSString
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
            completionHandler?(.success(cachedImage))
            return nil
        } else {
            let dataTask = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
                guard let self = self else { return }
                if let error = error {
                    completionHandler?(.failure(.custom(error.localizedDescription)))
                } else if let data = data, let image = UIImage(data: data) {
                    self.imageCache.setObject(image, forKey: key)
                    DispatchQueue.main.async {
                        completionHandler?(.success(image))
                    }
                } else {
                    completionHandler?(.failure(.apiResponseSourceError))
                }
            }
            dataTask.resume()
            return dataTask
        }
    }
    
    
}
