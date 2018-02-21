//
//  TendenciasViewController.swift
//  Crazy
//
//  Created by usuario on 16/2/18.
//  Copyright © 2018 usuario. All rights reserved.
//

import UIKit

class TendenciasViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, HomeModelProtocol {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var miLabel: UILabel!
    var info = ""
    @IBAction func logOut(_ sender: Any) {
    }
    
    @IBOutlet weak var tableView: UITableView!
    var feedItems: NSArray = NSArray()
    var imagen: String?
    var selectedLocation : LocationModel = LocationModel()
    
     override func viewDidLoad() {
        super.viewDidLoad()
        print("Tendencias")
        miLabel.text = info
                // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let homeModel = HomeModel()
        homeModel.delegate = self
        homeModel.downloadItems()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func itemsDownloaded(items: NSArray) {
        print(items)
        feedItems = items
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of feed items
        return feedItems.count
        
    }
    func downloadImage(_ uri : String, inView: UIImageView){
        
        let url = URL(string: uri)
        
        let task = URLSession.shared.dataTask(with: url!) {responseData,response,error in
            if error == nil{
                if let data = responseData {
                    
                    DispatchQueue.main.async {
                        inView.image = UIImage(data: data)
                    }
                    
                }else {
                    print("no data")
                }
            }else{
                print("no funciona")
            }
        }
        
        task.resume()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath.row)
        // Retrieve cell
        let cellIdentifier: String = "cell1"
        let myCell: ViewControllerImage = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! ViewControllerImage
        // Get the location to be shown
        let item: LocationModel = feedItems[indexPath.row] as! LocationModel
        // Get references to labels of cell
        
        myCell.textView!.text = item.descripcion
        imagen = item.url
        print(item.descripcion!)
        print(item.url)
        downloadImage(imagen!, inView: myCell.imageview! )
        return myCell
    }
    
}
