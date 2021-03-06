//
//  LoginViewController.swift
//  armarioViewing
//
//  Created by Group 4: Carolina Santos on 11/15/21.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func onSignIn(_ sender: Any) {
        let username = usernameField.text!;
        let password = passwordField.text!;
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = main.instantiateViewController(identifier: "MainTabBarController") as UITabBarController?
            
        
        PFUser.logInWithUsername(inBackground: username, password: password) {
            (user, error) in
            if user != nil {
                (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController!)
            } else {
                print("Error: \(String(describing: error?.localizedDescription))")
            }
        }

    }
    
    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = usernameField.text;
        user.password = passwordField.text;
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = main.instantiateViewController(identifier: "MainTabBarController") as UITabBarController?
        
        user.signUpInBackground { (success, error) in
            if success {
                (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController!)
            } else {
                print("Error: \(String(describing: error?.localizedDescription))")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

