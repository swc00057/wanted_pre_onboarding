//
//  Alert+extension.swift
//  WeatherApp
//
//  Created by 신동원 on 2022/09/13.
//

import UIKit

extension UIViewController {
//    func addBookAlert(title: String, message: String, result: @escaping() ->() ) {
//        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//
//        let OK = UIAlertAction(title: "확인", style: .default){_ in
//            result()
//        }
//        let cancel = UIAlertAction(title: "취소", style: .cancel)
//        alert.addAction(OK)
//        alert.addAction(cancel)
//
//        self.present(alert, animated: true)
//    }
    func normalAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let OK = UIAlertAction(title: "확인", style: .default)
        alert.addAction(OK)
        
        self.present(alert, animated: true)
    }
//    func deleteBookAlert(title: String, message: String, result: @escaping() ->() ) {
//        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//
//        let delete = UIAlertAction(title: "삭제", style: .destructive){_ in
//            result()
//        }
//        let cancel = UIAlertAction(title: "취소", style: .cancel)
//        alert.addAction(delete)
//        alert.addAction(cancel)
//
//        self.present(alert, animated: true)
//    }
}
