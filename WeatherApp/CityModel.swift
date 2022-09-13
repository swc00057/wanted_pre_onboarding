//
//  CityModel.swift
//  WeatherApp
//
//  Created by 신동원 on 2022/09/13.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let chatData = try? newJSONDecoder().decode(ChatData.self, from: jsonData)

import Foundation

// MARK: - responseCity
struct responseCity: Codable {
    let cnt: Int
    let list: [List]
}

// MARK: - List
struct List: Codable {
    let coord: Coord
    let sys: Sys
    let weather: [Weather]
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt, id: Int
    let name: String
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int
}

// MARK: - Coord
struct Coord: Codable {
    let lon, lat: Double
}

// MARK: - Main
struct Main: Codable {
    let temp, feels_like, temp_min, temp_max: Double
    let pressure,
        humidity: Int?
}

// MARK: - Sys
struct Sys: Codable {
    let country: String
    let timezone, sunrise, sunset: Int
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main, weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
}
