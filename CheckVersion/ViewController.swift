//
//  ViewController.swift
//  CheckVersion
//
//  Created by Vlad on 30.11.2020.
//

import UIKit

class ViewController: UIViewController {
    
    private let updateAppService = UpdateAppService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.global().async {
            let update = self.updateAppService.isDeffirentVersion()
            DispatchQueue.main.async {
                if update{
                    self.updateAlert();
                }
            }
        }
        
    }

    
    func updateAlert(){
        
        let alertMessage = "A new version of Bluefy Application is available,Please update to version "+self.updateAppService.versionAppStore;
        let alert = UIAlertController(title: "New Version Available", message: alertMessage, preferredStyle: UIAlertController.Style.alert)
        
        let updateButton = UIAlertAction(title: "Update", style: .default, handler: {(_ action: UIAlertAction) -> Void in
            
            if let url = URL(string:"https://apps.apple.com/ua/app/bluefy-web-ble-browser/id1492822055?l=ru"){
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        })
        
        let skipButton = UIAlertAction(title: "Skip this Version", style: .destructive, handler: nil)
        
        alert.addAction(updateButton)
        alert.addAction(skipButton)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
}
