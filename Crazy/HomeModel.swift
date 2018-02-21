//
//  HomeModel.swift
//  Crazy
//
//  Created by usuario on 16/2/18.
//  Copyright © 2018 usuario. All rights reserved.
//
import Foundation


protocol HomeModelProtocol: class {
    func itemsDownloaded(items: NSArray)
}


class HomeModel: NSObject, URLSessionDataDelegate {
    
    //properties
    
    weak var delegate: HomeModelProtocol!
    
    let urlPath = "http://iesayala.ddns.net/Crazy/select.php"
    func downloadItems() {
        
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                print("Failed to download data")
            }else {
                print("Data downloaded")
                self.parseJSON(data!)
            }
            
        }
        
        task.resume()
    }
    
    func parseJSON(_ data:Data) {
        
        var jsonResult = NSArray()
        
        do{
            jsonResult = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.allowFragments) as! NSArray
            
        } catch let error as NSError {
            print(error)
            print("Error aqui")
            
            
        }
        
        var jsonElement = NSDictionary()
        let locations = NSMutableArray()
        print("sssssss")
        print("elementos\(jsonResult.count)")
        for i in 0 ..< jsonResult.count
        {
            
            jsonElement = jsonResult[i] as! NSDictionary
            
            let location = LocationModel()
            
            //the following insures none of the JsonElement values are nil through optional binding
            if let descripcion = jsonElement["Descripcion"] as? String{
                
                location.descripcion = descripcion
                
                print(descripcion)
                
            }
            if let url = jsonElement["Foto"] as? String{
                location.url = url
            }
            print("hhhhhh")
            
            locations.add(location)
            
        }
        print(locations)
        
        DispatchQueue.main.async(execute: { () -> Void in
            
            self.delegate.itemsDownloaded(items: locations)
            
        })
    }
}
