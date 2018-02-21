//
//  LogInViewController.swift
//  Crazy
//
//  Created by usuario on 7/2/18.
//  Copyright © 2018 usuario. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var conexion: UILabel!
    
    var variable : Bool = false
    var message : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func parseJSON(_ data:Data) {
        
        var jsonResult = NSArray()
        
        do{
            jsonResult = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.allowFragments) as! NSArray
            
        } catch let error as NSError {
            print(error)
            
        }
        
        variable = false
        if (jsonResult.count > 0) {
            variable = true
                        }
        
        
        
    }
    @IBAction func button(_ sender: Any) {
        let viewController = self.storyboard!.instantiateViewController(withIdentifier: "TendenciasViewController")
        
        self.present(viewController,animated: true, completion:nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destino = segue.destination as! TendenciasViewController
        
        destino.info = "Bienvenido/a: \(userNameTextField.text!)"
    }
    
    
    @IBAction func signinButtonTapped(_ sender: Any) {
        
        let request = NSMutableURLRequest(url: NSURL(string: "http://iesayala.ddns.net/Crazy/login.php")! as URL)
        request.httpMethod = "POST"
        
        let postString = "nom=\(userNameTextField.text!)&pass=\(userPasswordTextField.text!)"
        
        
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            
            if error != nil {
                self.message = "Error 1"
                return
            }
            
            
            
            self.parseJSON(data!)
            
            
        }
        task.resume()
      
    }
    
    @IBAction func registerNewAccountButtonTapped(_ sender: Any) {
        //Este boton solo envia a la pagina de registro
       
    }
    @IBAction func login(_ sender: Any) {
        print("pulsar login")
        print(variable)
        
        /*if(variable){
            let viewController = self.storyboard!.instantiateViewController(withIdentifier: "TendenciasViewController")
            
            self.present(viewController,animated: true, completion:nil)
        }*/
        
      
        
    }

   
    
 
}
