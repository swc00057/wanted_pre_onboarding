//
//  cityList.swift
//  WeatherApp
//
//  Created by 신동원 on 2022/09/13.
//

import Foundation

struct city {
    let name: String
    let id: String
    let state: String
    let country: String
}

class CityList {
    
    static let shared = CityList()
    
    
    let cityInfo = [
        city(name: "Seoul", id: "1835848", state: "", country: "KR"),
        city(name: "Gongju", id: "1842616", state: "", country: "KR"),
        city(name: "Gwangju", id: "1841811", state: "", country: "KR"),
        city(name: "Gumi", id: "1842225", state: "", country: "KR"),
        city(name: "Gunsan", id: "1842025", state: "", country: "KR"),
        city(name: "Daegu", id: "1835327", state: "", country: "KR"),
        city(name: "Daejeon", id: "1835224", state: "", country: "KR"),
        city(name: "Mokpo", id: "1841066", state: "", country: "KR"),
        city(name: "Busan", id: "1838519", state: "", country: "KR"),
        city(name: "Seosan", id: "1835895", state: "", country: "KR"),
        city(name: "Sokcho", id: "1836553", state: "", country: "KR"),
        city(name: "Suwon", id: "1835553", state: "", country: "KR"),
        city(name: "Suncheon", id: "1835648", state: "", country: "KR"),
        city(name: "Ulsan", id: "1833742", state: "", country: "KR"),
        city(name: "Iksan", id: "1843491", state: "", country: "KR"),
        city(name: "Jeonju", id: "1845457", state: "", country: "KR"),
        city(name: "Jeju City", id: "1846266", state: "", country: "KR"),
        city(name: "Cheonan", id: "1845759", state: "", country: "KR"),
        city(name: "Chungju", id: "1845033", state: "", country: "KR"),
        city(name: "Chuncheon", id: "1845136", state: "", country: "KR"),
    ]
}

