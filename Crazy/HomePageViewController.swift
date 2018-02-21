//
//  HomePageViewController.swift
//  Crazy
//
//  Created by usuario on 9/2/18.
//  Copyright © 2018 usuario. All rights reserved.
//

import UIKit

struct cellData {
    let cell: Int!
    let text: String!
    let image: UIImage!
}

class HomePageViewController: UIViewController, UITableViewDataSource {

    
    @IBOutlet weak var tendenciasLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var arrayOfCellData = [cellData(cell : 1, text : "Camiseta Mujer", image : #imageLiteral(resourceName: "camisetas")),
                                             cellData(cell : 2, text : "Camiseta Hombre", image : #imageLiteral(resourceName: "camisetas2")),
                                             cellData(cell : 3, text : "Sudadera Mujer", image : #imageLiteral(resourceName: "sudaderas")),
                                             cellData(cell : 4, text : "Sudadera Hombre", image : #imageLiteral(resourceName: "sudaderas2")),
                                             cellData(cell : 5, text : "Chaqueta Mujer", image : #imageLiteral(resourceName: "chaquetas")),
                                             cellData(cell : 6, text : "Chaqueta Hombre", image : #imageLiteral(resourceName: "chaquetas2"))]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonCargar(_ sender: Any) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func signOutButtonTapped(_ sender: Any) {
        
    }

    @IBAction func loadTendenciasButtonTapped(_ sender: Any) {
        
        arrayOfCellData = [cellData(cell : 1, text : "Camiseta Mujer", image : #imageLiteral(resourceName: "camisetas")),
                           cellData(cell : 2, text : "Camiseta Hombre", image : #imageLiteral(resourceName: "camisetas2")),
                           cellData(cell : 3, text : "Sudadera Mujer", image : #imageLiteral(resourceName: "sudaderas")),
                           cellData(cell : 4, text : "Sudadera Hombre", image : #imageLiteral(resourceName: "sudaderas2")),
                           cellData(cell : 5, text : "Chaqueta Mujer", image : #imageLiteral(resourceName: "chaquetas")),
                           cellData(cell : 6, text : "Chaqueta Hombre", image : #imageLiteral(resourceName: "chaquetas2"))]
        tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return arrayOfCellData.count
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrayOfCellData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("Parte 1")
        if arrayOfCellData[indexPath.row].cell == 1{
            print("Row 1")
            let cell = Bundle.main.loadNibNamed("TableViewCell1", owner: self, options: nil)?.first as! TableViewCell1
            
            cell.mainImageView.image = arrayOfCellData[indexPath.row].image
            cell.mainLabel.text = arrayOfCellData[indexPath.row].text
            
            return cell
            
        }
        else if arrayOfCellData[indexPath.row].cell == 2{
            let cell = Bundle.main.loadNibNamed("TableViewCell1", owner: self, options: nil)?.first as! TableViewCell1
            
            cell.mainImageView.image = arrayOfCellData[indexPath.row].image
            cell.mainLabel.text = arrayOfCellData[indexPath.row].text
            
            return cell
            
        } else if arrayOfCellData[indexPath.row].cell == 3{
            let cell = Bundle.main.loadNibNamed("TableViewCell1", owner: self, options: nil)?.first as! TableViewCell1
            
            cell.mainImageView.image = arrayOfCellData[indexPath.row].image
            cell.mainLabel.text = arrayOfCellData[indexPath.row].text
            
            return cell
            
        } else if arrayOfCellData[indexPath.row].cell == 4{
            let cell = Bundle.main.loadNibNamed("TableViewCell1", owner: self, options: nil)?.first as! TableViewCell1
            
            cell.mainImageView.image = arrayOfCellData[indexPath.row].image
            cell.mainLabel.text = arrayOfCellData[indexPath.row].text
            
            return cell
            
        } else if arrayOfCellData[indexPath.row].cell == 5{
            let cell = Bundle.main.loadNibNamed("TableViewCell1", owner: self, options: nil)?.first as! TableViewCell1
            
            cell.mainImageView.image = arrayOfCellData[indexPath.row].image
            cell.mainLabel.text = arrayOfCellData[indexPath.row].text
            
            return cell
            
        }else {
            let cell = Bundle.main.loadNibNamed("TableViewCell1", owner: self, options: nil)?.first as! TableViewCell1
            
            cell.mainImageView.image = arrayOfCellData[indexPath.row].image
            cell.mainLabel.text = arrayOfCellData[indexPath.row].text
            
            return cell
            
        }
    
    }
    
    /*func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
    }*/
  
    

}
