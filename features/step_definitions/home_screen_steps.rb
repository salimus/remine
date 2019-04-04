
Given("I land on Home screen") do
  sleep 10
  puts "Home screen"
  find_element(xpath: "//android.widget.ImageView[@bounds='[302,384][1138,640]']")     # logo
end

Then(/^I check Logo and "([^"]*)" question$/) do |question|
  find_element(xpath: "//android.widget.TextView[@text='#{question}']")                # "Are you an agent?" question
end

Then(/^I check the existence of "([^"]*)" and "([^"]*)" buttons$/) do |yes, no|
  yes_btn_text = find_element(xpath: "//android.widget.TextView[@text='YES']").text    # "YES" button text from the app
  no_btn_text = find_element(xpath: "//android.widget.TextView[@text='NO']").text      # "NO" button text from the app

  if yes_btn_text != yes && no_btn_text != no                                          # if both conditions is "false" then if will print fail message
    fail("Expected text is '#{yes}', actual text is '#{yes_btn_text}' and Expected text is '#{no}' for NO, actual text is '#{no_btn_text}'")
  end
  sleep 5
end

When(/^I click on "([^"]*)" button$/) do |button|
  find_element(xpath: "//android.widget.TextView[@text='#{button}']").click
  sleep 5
end

Then(/^I will navigate to the Agent screen$/) do
  find_element(xpath: "//android.widget.TextView[@text='Having trouble logging in?']")
  find_element(xpath: "//android.widget.TextView[@text='CONTACT US']")
end

And(/^I will enter "([^"]*)" as MLS email$/) do |mls_email|
  find_element(xpath: "//android.widget.TextView[@text='Enter your MLS email']").click
  sleep 1
  find_element(xpath: "//android.widget.EditText[@bounds='[270,294][1130,548]']").send_keys(mls_email)
end

And(/^I will enter "([^"]*)" as Agent ID$/) do |agent_id|
  find_element(xpath: "//android.widget.TextView[@text='Enter your agent ID']").click
  sleep 1
  find_element(xpath: "//android.widget.EditText[@bounds='[270,686][1130,940]']").send_keys(agent_id)
end

And(/^I should navigate to my profile page$/) do
  puts "Profile page"
  sleep 3
end


Then(/^I will navigate to the Log In screen$/) do
  puts "Login screen"
end

And(/^I will enter "([^"]*)" as email$/) do |email|
  find_element(xpath: "//android.widget.TextView[@text='Enter email']").click
  sleep 1
  find_element(xpath: "//android.widget.EditText[@bounds='[270,254][1130,508]']").send_keys(email)
end

And(/^I will enter "([^"]*)" as password$/) do |password|
  find_element(xpath: "//android.widget.TextView[@text='Enter password']").click
  sleep 1
  find_element(xpath: "//android.widget.EditText[@bounds='[270,646][1130,900]']").send_keys(password)
end


And(/^I should navigate to "([^"]*)" page$/) do |page_name|
  puts "#{page_name}"
end

Then(/^I will type my name "([^"]*)" in name field$/) do |name|
  find_element(xpath: "//android.widget.TextView[@text='Enter name']").click
  sleep 1
  find_element(xpath: "//android.widget.EditText[@bounds='[228,324][1172,580]']").send_keys(name)
end

And(/^I will type "([^"]*)" as email$/) do |email|
  find_element(xpath: "//android.widget.TextView[@text='Enter email']").click
  sleep 1
  find_element(xpath: "//android.widget.TextView[@text='Enter email']").click
  sleep 1
  find_element(xpath: "//android.widget.EditText[@bounds='[228,716][1172,972]']").send_keys(email)
end

And(/^I will type "([^"]*)" as password$/) do |password|
  find_element(xpath: "//android.widget.TextView[@text='Enter password']").click
  sleep 1
  find_element(xpath: "//android.widget.TextView[@text='Enter password']").click
  sleep 1
  find_element(xpath: "//android.widget.EditText[@bounds='[228,1108][1172,1364]']").send_keys(password)
  sleep 1
  Appium::TouchAction.new.swipe(start_x: 0.1, start_y: 0.4, end_x: 0.1, end_y: 0.2, duration:700).perform
end

And(/^I will type my phone number "([^"]*)"$/) do |phone|
  sleep 2
  find_element(xpath: "//android.widget.TextView[@text='Phone number (optional)']").click
  sleep 1
  find_element(xpath: "//android.widget.TextView[@text='Phone number (optional)']").click
  sleep 1
  Appium::TouchAction.new.swipe(start_x: 0.1, start_y: 0.5, end_x: 0.1, end_y: 0.2, duration:700).perform
  find_element(xpath: "//android.widget.EditText[@bounds='[228,771][1172,1027]']").send_keys(phone)
end

Then(/^I mark checkbox to accept terms$/) do
  sleep 1
  find_element(xpath: "//android.widget.TextView[@text='NEXT']").click
  find_element(xpath: "//android.view.ViewGroup[@bounds='[224,1860][296,1932]']").click
  puts "Checkbox checked"
end

Then(/^I should navigate to Enter Referral Code page$/) do
  puts "Enter Referral Code page"
end


And(/^I should see an error message "([^"]*)"$/) do |message|
  alert = find_element(id: "android:id/alertTitle").text

  if message != alert                                          # if conditions is "false" then if will print fail message
    fail("Expected text is '#{message}', actual text is '#{alert}'")
  end

end

And(/^I will click on "([^"]*)" link$/) do |link|
  find_element(xpath: "//android.widget.TextView[@text='#{link}']").click
end
