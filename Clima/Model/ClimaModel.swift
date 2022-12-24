//
//  ClimaModel.swift
//  Clima
//
//  Created by MacbookMBA7 on 23/12/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation
import Foundation

class ClimaModel : Codable{
    let name: String
    let main: Main
    let weather: [Weather]
}

class Main : Codable{
    let temp: Double
}

class Weather : Codable {
    let description: String
    let id: Int
}
