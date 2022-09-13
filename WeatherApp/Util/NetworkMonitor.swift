//
//  NetworkMonitor.swift
//  WeatherApp
//
//  Created by 신동원 on 2022/09/13.
//

import Foundation
import Network

//연결타입
enum ConnectionType {
    case wifi
    case cellular
    case ethernet
    case unknown
}

final class NetworkMonitor{
    static let shared = NetworkMonitor()
    
    private let queue = DispatchQueue.global()
    private let monitor: NWPathMonitor
    public private(set) var isSatisfied:Bool = false
    public private(set) var connectionType: ConnectionType = .unknown
    
    private init(){
        print("init 호출")
        monitor = NWPathMonitor()
    }
    
    public func isConnected() -> Bool {
        
        if self.isSatisfied == true && self.connectionType != .unknown {
            
            print("연결이된 상태임!")
            return true
        }else{
            
            print("연결 안된 상태임!")
            return false
        }
    }
    
    public func startMonitoring(){
        print("startMonitoring 호출")
        monitor.start(queue: queue)
        monitor.pathUpdateHandler = { [weak self] path in
            print("path :\(path)")

            self?.isSatisfied = path.status == .satisfied
            self?.getConenctionType(path)
        }
    }
    
    public func stopMonitoring(){
        print("stopMonitoring 호출")
        monitor.cancel()
    }
    
    
    private func getConenctionType(_ path:NWPath) {
        print("getConenctionType 호출")
        if path.usesInterfaceType(.wifi){
            connectionType = .wifi
            print("wifi에 연결")

        }else if path.usesInterfaceType(.cellular) {
            connectionType = .cellular
            print("cellular에 연결")

        }else if path.usesInterfaceType(.wiredEthernet) {
            connectionType = .ethernet
            print("wiredEthernet에 연결")

        }else {
            connectionType = .unknown
            print("unknown ..")
        }
    }
}
