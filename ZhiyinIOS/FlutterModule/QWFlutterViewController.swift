//
//  QWFlutterViewController.swift
//  ZhiyinIOS
//
//  Created by Lambert on 2023/5/23.
//

import Flutter
import FlutterPluginRegistrant
import Foundation

class QWFlutterViewController: FlutterViewController {
    //MARK: - Property
    private var route:String? = nil
    private var channel: FlutterMethodChannel?
    
    //MARK: -
    convenience init(entryPoint: String? = nil) {
        let newEngine = DYFlutterModule.shared.engines.makeEngine(withEntrypoint: entryPoint, libraryURI: nil)
        self.init(engine: newEngine)
    }
    
    convenience init(route:String) {
        let newEngine = DYFlutterModule.shared.engines.makeEngine(withEntrypoint: nil, libraryURI: nil, initialRoute: route)
        self.init(engine: newEngine)
        self.route = route
    }
    
    internal init(engine:FlutterEngine) {
        GeneratedPluginRegistrant.register(with: engine)
        super.init(engine: engine, nibName: nil, bundle: nil)
    }
    
    deinit {
        if let route = self.route {
            print("deinit - \(type(of: self)) - route = \(route)")
        } else {
            print("deinit - \(type(of: self))")
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        
        self.channel = FlutterMethodChannel(
            name: "multiple-flutters", binaryMessenger: self.binaryMessenger)
        self.channel?.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
            print("你干嘛 - 哎哟")
            if call.method == "jumpScheme" {
                let arguments:[String:Any] = call.arguments as? [String:Any] ?? [:]
                let url:String = arguments["url"] as? String ?? ""
                if let naviVC = UIApplication.shared.dy_rootViewController as? UINavigationController {
                    let flutterVC:QWFlutterViewController = .init(route: url)
                    naviVC.pushViewController(flutterVC, animated: true)
                }
                result(nil)
                return
            }
            // 不支持的方法调用
            result(FlutterMethodNotImplemented)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
}

