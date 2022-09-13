//
//  LaunchViewController.swift
//  WeatherApp
//
//  Created by 신동원 on 2022/09/13.
//

import UIKit

class LaunchViewController: UIViewController {
    
    static let identifier = "LaunchViewController"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if !NetworkMonitor.shared.isConnected() {
            self.normalAlert(title: "", message: "네트워크 연결이 원활하지 않습니다\n연결상태를 확인 후 다시 시도해 주세요!")
            return
        }
        
        Thread.sleep(forTimeInterval: 1.0)
        branch()
    }
    
    @objc func branch() {
        print("메인 화면 이동")
//        DispatchQueue.main.async {
//            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
//            let vc = WeatherViewController()
//            windowScene.windows.first?.rootViewController = vc
//            windowScene.windows.first?.makeKeyAndVisible()
//            UIView.transition(with: windowScene.windows.first!, duration: 0.5, options: [.transitionCrossDissolve], animations: {}, completion: nil)
//        }
        
        let story = UIStoryboard(name: "Weather", bundle:nil)
        let vc = story.instantiateViewController(withIdentifier: "WeatherViewController") as! WeatherViewController
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
        windowScene.windows.first?.rootViewController = UINavigationController(rootViewController: vc)
        windowScene.windows.first?.makeKeyAndVisible()
        UIView.transition(with: windowScene.windows.first!, duration: 0.5, options: [.transitionCrossDissolve], animations: {}, completion: nil)
    }

}
