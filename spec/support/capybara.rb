# capybaraの:selenium_chrome_headlessは必ずsandboxモードで起動してしまう
# Docker環境でsandboxモードでsystem specを実行すると落ちるため、非sandboxモードで動くようdriverを登録し、それを使用
Capybara.register_driver :selenium_chrome_headless_no_sandbox do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--headless')
  options.add_argument('--no-sandbox')
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end
