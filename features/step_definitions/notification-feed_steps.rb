session = Capybara::Session.new(:selenium)

Given(/^that user "([^"]*)" with password "([^"]*)" has logged in$/) do |arg1, arg2|
  visit("/session/new") do
    within('form') do
      session.fill_in 'Login', with: arg1
      session.fill_in 'Password', with: arg2
      session.click_button 'Login'
    end
  end
end

When(/^the admin user broadcasts "([^"]*)" to the notification feed$/) do |arg1|
  visit("/broadcasts/new") do
    within('form') do
      session.fill_in 'broadcast_content', with: arg1
      session.click_button 'Broadcast'
    end
  end
end

Then(/^the current page should contain the text: "([^"]*)"$/) do |arg1|
  # puts(session.find('.flash_notice').text)
  puts(session.find('h1').text)
  pending
end

Then(/^the current page should show the text "([^"]*)" in the notification feed$/) do |arg1|
  pending
end

