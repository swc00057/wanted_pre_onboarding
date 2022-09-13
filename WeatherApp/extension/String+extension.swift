//
//  String+extension.swift
//  WeatherApp
//
//  Created by 신동원 on 2022/09/14.
//

import Foundation

var korCity = ["Seoul": "서울", "Gongju" : "공주", "Gwangju": "광주", "Gumi" : "구미", "Gunsan": "군산", "Daegu": "대구", "Daejeon": "대전",
             "Mokpo": "목포", "Busan" : "부산", "Seosan City":"서산", "Sokcho":"속초", "Suwon-si":"수원", "Suncheon":"순천", "Ulsan":"울산", "Iksan":"익산",
             "Jeonju":"전주", "Jeju City":"제주", "Cheonan":"천안", "Chungju":"청주", "Chuncheon":"춘천"]

extension String {
    
    
    var kor: String {
        
        return korCity[self] ?? self
    }
}
