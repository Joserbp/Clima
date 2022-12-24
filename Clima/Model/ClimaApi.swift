//
//  ClimaApi.swift
//  Clima
//
//  Created by MacbookMBA7 on 23/12/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

protocol ClimaApiDelegate {
    func updateView(_ climaApi: ClimaApi, climaModel: Clima)
}

class ClimaApi{
    
    var delagate : ClimaApiDelegate?  //CLIMA API TIENE LA CAPACIDAD DE UTILIZAR UPDATEVIEW
    
    func GetClima(cityName : String){
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?appid=6929d9813fdbacb34c8a957dd2d8d22a&q=" + cityName )
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url!) { data, respose, error in
            if error != nil {
                print(error!.localizedDescription)
            }
            if let safeData = data {
                let clima = self.parseJson(data: safeData)
                if let climaData = clima{
                    self.delagate?.updateView(self, climaModel: climaData) //MANDA A LLAMAR LA FUNCION
                }

            }
        }
        task.resume()
    }
    func parseJson(data : Data) -> Clima?{
        let decoble = JSONDecoder()
        do{
            let climaModel = try decoble.decode(ClimaModel.self, from: data)
            let clima = Clima(id: climaModel.weather[0].id, temp: climaModel.main.temp, description: climaModel.weather[0].description)
            return clima
        }catch let error{
            print(error.localizedDescription)
            return nil
        }
    }
}
