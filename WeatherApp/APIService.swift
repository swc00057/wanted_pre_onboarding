//
//  APIService.swift
//  WeatherApp
//
//  Created by 신동원 on 2022/09/13.
//

import Foundation

enum APIError: Error {
    case invalid
    case noData
    case failed
    case invalidData
}

class APIService {
    
    static func requestCityList(_ id: String, completion: @escaping(responseCity?,APIError?) -> Void) {
        let url = URL(string: "http://api.openweathermap.org/data/2.5/group?id=\(id)&units;=metric&appid=3201b52e62e38ea53565992bece794cc")
        URLSession.shared.dataTask(with: url!) { data, response, error in
            DispatchQueue.main.async {
                guard error == nil else {
                    completion(nil, .failed)
                    return
                }
                
                guard let data = data else {
                    completion(nil, .noData)
                    return
                }
                
                guard let response = response as? HTTPURLResponse else {
                    print(response)
                    completion(nil, .invalidData)
                    return
                }
                
                guard response.statusCode == 200 else {
                    print(response.statusCode)
                    completion(nil, .failed)
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let weatherData = try decoder.decode(responseCity.self, from: data)
                    completion(weatherData, nil)
                } catch {
                    completion(nil, .invalidData)
                }
            }
            
        }.resume()
        
    }
    
}

