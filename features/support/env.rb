require 'appium_lib'

def caps
  { caps: {
      deviceName: "GalaxyS7",
      platformName: "Android",
      app: (File.join(File.dirname(__FILE__), "base.apk")),
      appPackage: "com.remine",
      appActivitity: "MainActivity",
      automationName: "uiautomator2",
      newCommandTimeout: "3600"
    }
  }
end

Appium::Driver.new(caps, true)
Appium.promote_appium_methods Object












































