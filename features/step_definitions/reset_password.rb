Then /^I LogIn Branch/ do
  driver = $driver
  driver.get "https://dashboard.branch.io"
end

Then(/^I Click on Sign In link$/) do
  element = driver.find_element :xpath => "html/body/div[1]/div/div/div/div[3]/form/div[1]/div/span/a"
  element.click
end

Then(/^I Click on Forgot Password$/) do
  pending
end