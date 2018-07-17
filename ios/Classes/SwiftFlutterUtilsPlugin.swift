import Flutter
import UIKit

let getUUID = "getUUID"
let getAppVersionName = "getAppVersionName"
let getAppVersionCode = "getAppVersionCode"
let isAppDebug = "isAppDebug"

public class SwiftFlutterUtilsPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_utils", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterUtilsPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    let method = call.method
    switch method {
    case getUUID:
        result(UIDevice.current.identifierForVendor?.uuidString)
    case getAppVersionName:
        result(Bundle.main.infoDictionary?["CFBundleShortVersionString"])
    case getAppVersionCode:
        result(Bundle.main.infoDictionary?["CFBundleVersion"])
    case isAppDebug:
        result(true)
    default:
        result(FlutterError.init(code: "未实现", message: "未实现", details: "未实现"))
    }
  }
}
