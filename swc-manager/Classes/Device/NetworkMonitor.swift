//
//  NetworkMonitor.swift
//  swc-manager
//
//  Created by JayKim on 2022/08/17.
//

import Foundation
import Network

@available(iOS 13.0, *)
public class NetworkMonitor {
    
    public static let shared = NetworkMonitor()
    
    private let queue = DispatchQueue.global()
    private let monitor: NWPathMonitor
    
    public var isConnected: Bool = false
    public var connectionType: ConnectionType = .unknown
    public enum ConnectionType {
        case wifi
        case cellular
        case ethernet
        case unknown
    }
    
    private init() {
        monitor = NWPathMonitor()
    }
    
    public func startMonitoring() {
        monitor.start(queue: queue)
        monitor.pathUpdateHandler = { [weak self] path in
            self?.isConnected = path.status != .unsatisfied
            self?.getConnectionType(path)
            //NSLog("%@", self?.isConnected ?? "N/A")
            SkyLog.i(tag: "Network", logLevel: .info, message: "\(String(describing: self?.isConnected))")
        }
    }
    
    public func stopMonitoring() {
        monitor.cancel()
    }
    
    private func getConnectionType(_ path: NWPath) {
        if path.usesInterfaceType(.wifi) {
            connectionType = .wifi
        }
        else if path.usesInterfaceType(.cellular) {
            connectionType = .cellular
        }
        else if path.usesInterfaceType(.wiredEthernet) {
            connectionType = .ethernet
        }
        else {
            connectionType = .unknown
        }
    }
    
}
