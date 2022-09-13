//
//  ViewController.swift
//  WeatherApp
//
//  Created by 신동원 on 2022/09/13.
//

import UIKit

class WeatherViewController: UIViewController {
    
    static let identifier = "WeatherViewController"
    @IBOutlet weak var WeatherTableView: UITableView!
    let cityInfo = CityList.shared.cityInfo
    var cityCnt = 0
    var cityData = responseCity(cnt: 0, list: [])
    
    override func viewWillAppear(_ animated: Bool) {
        setup()
        requestWeather()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func setup() {
        self.navigationItem.title = "날씨"
        //nib 파일 등록
        let nibName = UINib(nibName: WeatherTableViewCell.identifier, bundle: nil)
        WeatherTableView.register(nibName, forCellReuseIdentifier: WeatherTableViewCell.identifier)
        WeatherTableView.delegate = self
        WeatherTableView.dataSource = self
        WeatherTableView.backgroundColor = UIColor.clear
    }
    
    func requestWeather() {
        var cityNameList: String = ""
        
        for city in cityInfo {
            cityNameList += city.id + ","
        }
        cityNameList.removeLast()
        
        print(cityNameList)
        
        APIService.requestCityList(cityNameList) { weatherData, error in
            guard let weatherData = weatherData else {
                return
            }
            self.cityData = weatherData
            //도시의 총 개수
            self.cityCnt = self.cityData.cnt
            //테이블뷰 리로드
            self.WeatherTableView.reloadData()
        }
    }


}

extension WeatherViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityCnt
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = WeatherTableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier, for: indexPath) as? WeatherTableViewCell else {
            return UITableViewCell()
        }
        let row = indexPath.row
        cell.cityName.text = String(cityData.list[row].name.kor)
        //섭씨로 변환하여 출력
        cell.temp.text = String(format: "%.f",cityData.list[row].main.temp - 273.15) + "℃"
        cell.humidity.text = "습도 : " + String(cityData.list[row].main.humidity ?? 0) + "%"
        cell.icon.setImageUrl("http://openweathermap.org/img/wn/\(cityData.list[row].weather.first!.icon)@2x.png")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        //let id = tasks[row]._id
        let sb = UIStoryboard(name: "Detail", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: DetailViewController.identifier) as! DetailViewController
        
        //선택된 책의 id값 넘겨줌
        vc.cityId = cityData.list[row].id
        self.navigationController?.navigationBar.topItem?.backButtonTitle = "뒤로"
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

