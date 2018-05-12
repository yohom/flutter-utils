package me.yohom.flutterutils

import android.util.Log
import com.blankj.utilcode.util.AppUtils
import com.blankj.utilcode.util.DeviceUtils
import com.blankj.utilcode.util.Utils
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

const val getAndroidID = "getAndroidId"
const val getAppVersionName = "getAppVersionName"
const val getAppVersionCode = "getAppVersionCode"
const val isAppDebug = "isAppDebug"

class FlutterUtilsPlugin : MethodCallHandler {
    companion object {
        lateinit var REGISTRAR: Registrar

        @JvmStatic
        fun registerWith(registrar: Registrar) {
            REGISTRAR = registrar
            val channel = MethodChannel(registrar.messenger(), "flutter_utils")
            channel.setMethodCallHandler(FlutterUtilsPlugin())
        }
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        Utils.init(REGISTRAR.context().applicationContext)

        val method = call.method
        Log.d("call.method", "method: $method")
        when (method){
            getAppVersionName -> result.success(AppUtils.getAppVersionName())
            getAndroidID -> result.success(DeviceUtils.getAndroidID())
            getAppVersionCode -> result.success(AppUtils.getAppVersionCode().toString())
            isAppDebug -> result.success(AppUtils.isAppDebug())
            else -> result.notImplemented()
        }
    }

}
