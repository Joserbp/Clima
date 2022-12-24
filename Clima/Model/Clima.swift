//
//  Clima.swift
//  Clima
//
//  Created by MacbookMBA7 on 23/12/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

class Clima{
    let id: Int
    let temp : Double
    let description : String
    var imageName : String{
        switch id{
            case 200...232:
                 return "cloud.drizzle"
        case 800...832:
            return "trash"
        default:
                 return "none"
            }
        }
    
    init(id: Int, temp: Double, description: String) {
        self.id = id
        self.temp = temp
        self.description = description
    }
}
