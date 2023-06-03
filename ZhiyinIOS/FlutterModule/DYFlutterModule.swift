//
//  DYFlutterModule.swift
//  ZhiyinIOS
//
//  Created by Lambert on 2023/5/23.
//

import Foundation
import Flutter
import FlutterPluginRegistrant

class DYFlutterModule {
    static let shared:DYFlutterModule = .init()
    
    let engines:FlutterEngineGroup = .init(name: "ZhiyinIOSFlutter", project: nil)
    
    private init() {
//        let newEngine = self.engines.makeEngine(withEntrypoint: nil, libraryURI: nil)
//        GeneratedPluginRegistrant.register(with: newEngine)
//
//        // 获取一个FlutterBinaryMessenger对象
//        let messenger = newEngine.binaryMessenger
//        // 创建一个FlutterMethodChannel对象，并设置方法名和回调函数
//        let channel = FlutterMethodChannel(name: "my_channel", binaryMessenger: messenger)
//
//        channel.setMethodCallHandler { (call, result) in
//            if call.method == "jumpScheme" {
//                print("哎哟你干嘛")
//                if let naviVC = UIApplication.shared.dy_rootViewController as? UINavigationController {
//                    let flutterVC:QWFlutterViewController = .init(route: "niganma://rap")
//                    naviVC.pushViewController(flutterVC, animated: true)
//                }
//                result(nil)
//                return
//            }
//            // 不支持的方法调用
//            result(FlutterMethodNotImplemented)
//        }
        
        //        override func viewDidLoad() {
        //            super.viewDidLoad()
        //            channel = FlutterMethodChannel(
        //                name: "multiple-flutters", binaryMessenger: self.binaryMessenger)
        
        //            channel!.invokeMethod("setCount", arguments: DataModel.shared.count)
        //            let navController = self.navigationController!
        //            channel!.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
        //                if call.method == "incrementCount" {
        //                    DataModel.shared.count = DataModel.shared.count + 1
        //                    result(nil)
        //                } else if call.method == "next" {
        //                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //                    let vc = storyboard.instantiateViewController(withIdentifier: "NativeViewCount")
        //                    navController.pushViewController(vc, animated: true)
        //                    result(nil)
        //                } else {
        //                    result(FlutterMethodNotImplemented)
        //                }
        //            }
    }
}

extension UIApplication {
    var dy_rootViewController:UIViewController? {
        guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return nil
        }
        guard let window = scene.windows.first else {
            return nil
        }
        return window.rootViewController
    }
}
