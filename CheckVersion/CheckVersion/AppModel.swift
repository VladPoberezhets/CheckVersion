//
//  AppModel.swift
//  CheckVersion
//
//  Created by Vlad on 30.11.2020.
//

import Foundation
class AppModel:Decodable{
    var results:[Results]
}

class Results:Decodable{
    var version:String
}
