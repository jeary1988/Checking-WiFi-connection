//
//  ViewController.swift
//  wifiTest
//
//  Created by Nasser Jeary on 2020-06-19.


import UIKit

let reachability = try! Reachability()


class ViewController: UIViewController {


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        reachability.whenReachable = { reachability in
            if reachability.connection == .wifi {
                print("Reachable via wifi")
            }else{
                print("Reachable via cellular")
            }
            
        }
        reachability.whenUnreachable = { _ in
            print("Not reachable")
            self.showAlert()
            
        }
        do{
            try reachability.startNotifier()
        }catch{
            print("unable to start notifier")
        }
        
        
    }
    
    
    
    
    func showAlert(){
        
        let alert = UIAlertController(title: "no Internet", message: "This App Requires wifi/internet connection!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: {_ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }


}

