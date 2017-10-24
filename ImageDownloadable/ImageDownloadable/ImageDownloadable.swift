//
//  ImageDownloadable.swift
//  ImageDownloadable
//
//  Created by Diego Cavalcante on 23/10/17.
//  Copyright © 2017 Diego Cavalcante. All rights reserved.
//

import Foundation
import UIKit



fileprivate struct ImageDownloadableManager {
    static var tasks : [URLSessionTask] = []
}

extension UIImageView {
    
    func downloadImage(url : String, completion : @escaping (UIImage?)-> Swift.Void) {
        guard let url = URL(string : url) else {
            fatalError("Url not valid")
        }
        
        guard ImageDownloadableManager.tasks.index(where: { $0.originalRequest?.url == url}) == nil else {
            return
        }
        
        let session  = URLSession.shared
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            
            DispatchQueue.main.async {
                if let data = data, let image = UIImage(data: data) {
                    
                    guard let index = ImageDownloadableManager.tasks.index(where: {$0.originalRequest?.url == response?.url}) else {
                        return
                    }
                    
                    let indexPath = IndexPath(row: index, section: 0)
                    print(indexPath.item)
                    self.setNeedsDisplay()
                    completion(image)
                }
            }
        }
        self.setNeedsDisplay()
        dataTask.resume()
        ImageDownloadableManager.tasks.append(dataTask)
    }
    
    func cancelDownloadingImage(url : String) {
        
        guard let url = URL(string : url) else {
            fatalError("Url not valid")
        }
        
        guard let taskIndex = ImageDownloadableManager.tasks.index(where: { $0.originalRequest?.url == url}) else {
            return
        }
        
        let task = ImageDownloadableManager.tasks[taskIndex]
        task.cancel()
        ImageDownloadableManager.tasks.remove(at: taskIndex)
    }
}
