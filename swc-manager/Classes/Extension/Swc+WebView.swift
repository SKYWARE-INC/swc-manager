//
//  WKWebView.swift
//  swc-manager
//
//  Created by JayKim on 2022/08/04.
//

import WebKit

extension WKWebView {
    
    public func load(_ path: String) {
        guard let url = URL(string: path) else {return}
        load(URLRequest(url: url))
    }
    
    public var refreshControl: UIRefreshControl? { (scrollView.getAllSubviews() as [UIRefreshControl]).first }

    public enum PullToRefreshType {
        case none
        case embed
        case custom(target: Any, selector: Selector)
    }

    public func setPullToRefresh(type: PullToRefreshType) {
        (scrollView.getAllSubviews() as [UIRefreshControl]).forEach { $0.removeFromSuperview() }
        switch type {
            case .none: break
            case .embed: _setPullToRefresh(target: self, selector: #selector(webViewPullToRefreshHandler(source:)))
            case .custom(let params): _setPullToRefresh(target: params.target, selector: params.selector)
        }
    }

    private func _setPullToRefresh(target: Any, selector: Selector) {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(target, action: selector, for: .valueChanged)
        scrollView.addSubview(refreshControl)
    }

    @objc func webViewPullToRefreshHandler(source: UIRefreshControl) {
        guard let url = self.url else { source.endRefreshing(); return }
        load(URLRequest(url: url))
    }
}
