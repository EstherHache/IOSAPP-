

import UIKit

class RegisterUserViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    var message : String = ""
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func displayMessage(userMessage:String) -> Void {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title : "Alerta", message: userMessage, preferredStyle: .alert)
            
            let OKAction = UIAlertAction (title : "OK", style: .default) {
                (action:UIAlertAction!) in
                print("Ok button tapped")
                DispatchQueue.main.async {
                    self.dismiss(animated:true, completion: nil)
                }
            }
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        
        
        
        if (firstNameTextField.text?.isEmpty)! || (passwordTextField.text?.isEmpty)! || (repeatPasswordTextField.text?.isEmpty)! {
            displayMessage(userMessage: "Todos los campos deben estar rellenos")
            return
        }
        
        //validar contraseña
        
       if (passwordTextField.text! != repeatPasswordTextField.text!){
            displayMessage(userMessage: "Las contraseñas no coinciden")
            return
        }
        
        //Crear actividad Indicator
        let myActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        
        
        // Posicionar la Actividad Indicator en el centro de la vista principal
        myActivityIndicator.center = view.center
        
        // cuando stopAnimating() es llamado, si lo necesitas, puedes hacer una vista previa de la Actividad Indicator al esconderse
        myActivityIndicator.hidesWhenStopped = false
        
        // Iniciar Actividad Indicator
        myActivityIndicator.startAnimating()
        
        
        view.addSubview(myActivityIndicator)
        
        //Enviar HTTP request para registrar un usuario
        
        let request = NSMutableURLRequest(url: NSURL(string: "http://iesayala.ddns.net/Crazy/add.php")! as URL)
        request.httpMethod = "POST"
        
        let postString = "a=\(firstNameTextField.text!)&b=\(passwordTextField.text!)"
        
        
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            
            if error != nil {
                self.message = "Error 1"
                return
            }
            
            
            
            // resultado (valor del echo de php)
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            if ((responseString?.isEqual(to: "1")))! {
                self.message = "Añadido"
                
            }
            else {
                self.message = "Error al añadir"
                
            }
            
            
        }
        task.resume()
    }
    

}

