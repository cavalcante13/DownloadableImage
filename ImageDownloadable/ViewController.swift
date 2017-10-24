//
//  ViewController.swift
//  ImageDownloadable
//
//  Created by Diego Cavalcante on 23/10/17.
//  Copyright © 2017 Diego Cavalcante. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView : UITableView? {
        didSet {
            tableView?.delegate = self
            tableView?.dataSource = self
            tableView?.estimatedRowHeight = 300
            tableView?.rowHeight = UITableViewAutomaticDimension
            tableView?.reloadData()
        }
    }

    let images : [String] = ["http://www.gstatic.com/webp/gallery/1.jpg", "http://www.gstatic.com/webp/gallery/2.jpg",
                             "http://www.gstatic.com/webp/gallery/3.jpg", "http://www.gstatic.com/webp/gallery/4.jpg",
                             "http://www.gstatic.com/webp/gallery/5.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DownloadCell", for: indexPath) as! DownloadCell
        cell.loadImage(url: images[indexPath.item])
        return cell
    }

}

