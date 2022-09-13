//
//  DetailViewController.swift
//  WeatherApp
//
//  Created by 신동원 on 2022/09/14.
//

import UIKit

class DetailViewController: UIViewController {
    
    static let identifier = "DetailViewController"
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var currentTemp: UILabel!
    @IBOutlet weak var currentWeather: UILabel!
    @IBOutlet weak var maxTemp: UILabel!
    @IBOutlet weak var minTemp: UILabel!
    @IBOutlet weak var feelsLikeTemp: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var pressure: UILabel!
    @IBOutlet weak var windSpeed: UILabel!
    @IBOutlet weak var weatherScript: UILabel!
    
    var cityId = 0
    
    override func viewWillAppear(_ animated: Bool) {
        
        APIService.requestCityList("\(cityId)") { weatherData, error in
            guard let weatherData = weatherData else {
                return
            }
            let cityInfo = weatherData.list.first!
            self.icon.setImageUrl("http://openweathermap.org/img/wn/\(cityInfo.weather.first!.icon)@2x.png")
            self.cityName.text = cityInfo.name.kor
            self.currentTemp.text = String(format: "%.f℃",cityInfo.main.temp - 273.15)
            self.currentWeather.text = cityInfo.weather.first!.main
            print(cityInfo.main.temp_max)
            self.maxTemp.text = String(format: "최고기온 : %.f℃",cityInfo.main.temp_max - 273.15)
            self.minTemp.text = String(format: "최저기온 : %.f℃",cityInfo.main.temp_min - 273.15)
            self.feelsLikeTemp.text = String(format: "체감기온 : %.f℃",cityInfo.main.feels_like - 273.15)
            self.humidity.text = "습도 : " + String(cityInfo.main.humidity!) + "%"
            self.pressure.text = "기압 : " + String(cityInfo.main.pressure!) + "hPa"
            self.windSpeed.text = "풍속 : " + String(cityInfo.wind.speed) + "m/s"
            self.weatherScript.text = cityInfo.weather.first?.weatherDescription
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundView.layer.cornerRadius = 25
        backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.5)

        // Do any additional setup after loading the view.
    }

}
