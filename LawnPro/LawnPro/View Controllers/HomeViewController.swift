//
//  HomeViewController.swift
//  LawnServicePro
//
//  Created by 90304588 on 2/28/22.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import FirebaseFirestore


class HomeViewController: UIViewController {
    
    
    
    
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var signoutButton: UIButton!
    
    
    override func viewDidLoad() {
        let defaults = UserDefaults.standard
        defaults.set("coley", forKey: "firstnameKey")
        welcomeLabel.text = "hello"
        print("hello")
        Utilities.getUserInfo {
           print(defaults.string(forKey: "firstnameKey")!)
            self.welcomeLabel.text = "Welcome, \(defaults.string(forKey: "firstnameKey")!)"
            return
        } onError: { error in
            defaults.set("nah", forKey: "firstnameKey")
            print(defaults.string(forKey: "firstnameKey")!)
            self.welcomeLabel.text = "Welcome, \(defaults.string(forKey: "firstnameKey")!)"
            return
            
        }
        setUpElements()
    }
        
       
        
        
        
        
        
        

        // Do any additional setup after loading the view.
        
        
    
    func setUpElements(){
        Utilities.styleFilledButton(signoutButton)
        //defaults.set("Cole", forKey: "firstnameKey")
        //print(defaults.string(forKey: "firstnameKey"))
    }
    @IBAction func signoutTapped(_ sender: Any) {
        let defaults = UserDefaults.standard
        let signUp = self.storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homePageViewController) as? ViewController
        
        self.view.window?.rootViewController = signUp
        self.view.window?.makeKeyAndVisible()
        defaults.set(false, forKey: "isSignedIn")
            
            
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
