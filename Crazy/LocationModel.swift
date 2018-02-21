//
//  LocationModel.swift
//  Crazy
//
//  Created by usuario on 16/2/18.
//  Copyright © 2018 usuario. All rights reserved.
//

import Foundation


class LocationModel: NSObject {
    
    //properties
    
    var descripcion: String?
    var url: String?
    
    //empty constructor
    
    override init()
    {
        
    }
    
    //construct with @descripcion parameters
    
    init(descripcion: String, url: String) {
        
        self.descripcion = descripcion
        self.url = url
    
        
    }
    
    
    

    
    
}
