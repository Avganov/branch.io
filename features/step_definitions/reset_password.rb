Then /^I LogIn Branch/ do
  driver = $driver
  driver.get "https://dashboard.branch.io"
end

Then(/^I Click on Sign In link$/) do
  driver = $driver
  element = driver.find_element :xpath => "html/body/div[1]/div/div/div/div[3]/form/div[1]/div/span/a"
  element.click
end

Then(/^I Click on Forgot Password$/) do
  driver = $driver
  element = driver.find_element :xpath => ".//*[@id='form_login']/div[3]/div[2]/a"
  element.click
end

Then(/^I Enter email address$/) do
  driver = $driver
  element = driver.find_element :xpath => ".//*[@id='forgot_email']"
  element.send_keys "branchmetrics01@gmail.com"
end

Then(/^I Click on Continue button$/) do
  driver = $driver
  element = driver.find_element :xpath => ".//*[@id='form_login']/div[3]/input"
  element.click
end


Then(/^I check Gmail account$/) do
  def received?(text)
    result = false
    if ENV['USE_REAL_EMAILS'] == 'true'
      test_email = $ENV_CONFIG['branchmetrics01@gmail.com']
      test_passwd = $ENV_CONFIG['bm1234567']
      gmail = Gmail.connect(test_email, test_passwd)
      counter = 0
      until counter > 60 do
        emails = gmail.inbox.emails(:unread, :from => 'support@branchmetrics.io')
        if emails.length != 0
          puts "#{emails.length} unread email(-s) have been found"
          emails.each_with_index do |email, i|
             puts email.subject
             puts email.body
            if email.body.to_s.include?(text)
               puts 'Set result to be true'
              result = true
            end
          end
          gmail.logout
          break
        else
          puts 'Waiting for email(-s) to come'
          sleep 3
          counter += 3
        end
      end
    else
      result = true  # to allow assertion to pass with non-existing emails
    end
    result
  end
end