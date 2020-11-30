//
//  UpdateAppService.swift
//  CheckVersion
//
//  Created by Vlad on 30.11.2020.
//

import Foundation

class UpdateAppService{
    
    var versionAppStore:String = ""
    
    func isDeffirentVersion()->Bool{
        guard let infoVersion = Bundle.main.infoDictionary else {return false}
        
        let currentVersion = infoVersion["CFBundleShortVersionString"] as? String
        guard  let url = URL(string: "https://itunes.apple.com/lookup?id=1492822055") else {return false}
        
        do{
            let data = try Data(contentsOf: url)
            let json = try JSONDecoder().decode(AppModel.self, from: data)
            
            if let jsonData = json.results.first{
                self.versionAppStore = jsonData.version
            }else{
                print("empty data")
            }
            
        }catch{
            print("error in block")
        }
        
        return currentVersion != versionAppStore
    }
}
