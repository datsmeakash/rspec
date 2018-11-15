require_relative '../scripts/browserstack.rb'

describe "Browserstack Inception" do
  it "open a browserstack instance within a browserstack instance" do

    wait = Selenium::WebDriver::Wait.new(:timeout => 30)
    @driver.navigate.to "https://www.browserstack.com/live"
    @driver.find_element(:link, 'Sign in').click
    email = @driver.find_element(:css, 'input#user_email_login')
    email.send_keys "a.kas.h.dutta90@gmail.com"
    password = @driver.find_element(:css, 'input#user_password')
    password.send_keys "p@ssw0rd!"
    @driver.find_element(:id, 'user_submit').click
    wait.until { @driver.find_element(:css, 'a#skip-local-installation.smalltext').displayed? }
    svg = @driver.find_element(:css, 'a#skip-local-installation.smalltext')
    @driver.action.click(svg).perform
    @driver.find_element(:css, 'li.os-item.rf-win10-os-ico').click
    sleep 1
    @driver.find_element(:partial_link_text, '70').click
    sleep 5
    
    element = @driver.switch_to.active_element
    element.send_keys "BrowserStack"
    @driver.action.send_keys(:enter).perform
    @driver.action.send_keys(:return).perform
    sleep 2
  end
end
