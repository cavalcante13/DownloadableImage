//
//  DownloadCell.swift
//  ImageDownloadable
//
//  Created by Diego Cavalcante on 23/10/17.
//  Copyright © 2017 Diego Cavalcante. All rights reserved.
//

import UIKit

class DownloadCell: UITableViewCell {

    @IBOutlet weak var myImageView : UIImageView?
    

    func loadImage(url : String) {
        imageView?.downloadImage(url: url, completion: { image in 
            self.myImageView?.image = image
        })
    }
}
