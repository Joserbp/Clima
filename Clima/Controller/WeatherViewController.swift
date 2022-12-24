
import UIKit

class WeatherViewController: UIViewController{

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    let climaApi = ClimaApi()
    let climaModel : Clima? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
        climaApi.delagate = self
    }

    //}Funcion que escuche eventos textFiled
            // Llamar a ciertas funciones
    
    //Tener 1 funcion por cada evento
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
    }
}

extension WeatherViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Escribe algo"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        climaApi.GetClima(cityName: searchTextField.text!)
        searchTextField.text = ""
    }
}

extension WeatherViewController : ClimaApiDelegate {
    func updateView(_ climaApi: ClimaApi, climaModel: Clima) {  //EJECUCION DE LA FUNCION
        print(climaModel.description)
//        DispatchQueue.main.async {
//            self.conditionImageView.image = UIImage(systemName: climaModel.imageName)
//            self.temperatureLabel.text = String(climaModel.temp)
//            self.cityLabel.text = climaModel.description
//        }
    }
}
