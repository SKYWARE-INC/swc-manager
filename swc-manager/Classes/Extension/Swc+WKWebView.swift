//
//  WKWebView.swift
//  swc-manager
//
//  Created by JayKim on 2022/08/04.
//

import WebKit


public protocol WebViewEvent {
    func webViewPullToRefreshHandler(source: UIRefreshControl)
    func webViewPullToCustomHandler(source: UIRefreshControl)
}
extension WKWebView: WebViewEvent {
    
    public func load(_ path: String) {
        guard let url = URL(string: path) else {return}
        load(URLRequest(url: url))
    }
    
    public var refreshControl: UIRefreshControl? { (scrollView.getAllSubviews() as [UIRefreshControl]).first }

    public enum PullToRefreshType {
        case none
        case embed
        case custom
    }

    public func setPullToRefresh(type: PullToRefreshType) {
        (scrollView.getAllSubviews() as [UIRefreshControl]).forEach { $0.removeFromSuperview() }
        switch type {
            case .none: break
            case .embed: _setPullToRefresh(target: self, selector: #selector(webViewPullToRefreshHandler(source:)))
            case .custom: _setPullToRefresh(target: self, selector: #selector(webViewPullToCustomHandler(source:)))
        }
    }

    private func _setPullToRefresh(target: Any, selector: Selector) {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(target, action: selector, for: .valueChanged)
        scrollView.addSubview(refreshControl)
    }

    @objc public func webViewPullToRefreshHandler(source: UIRefreshControl) {
        guard let url = self.url else { source.endRefreshing(); return }
        load(URLRequest(url: url))
    }
    
    @objc public func webViewPullToCustomHandler(source: UIRefreshControl) {
        
    }
}
