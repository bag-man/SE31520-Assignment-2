require 'database_cleaner'
require 'database_cleaner/cucumber'
DatabaseCleaner.strategy = :truncation

Before do
  DatabaseCleaner.start
  user = User.create!(surname: 'Admin', firstname: 'Admin', email: 'admin@aber.ac.uk', phone: '07000 000000', grad_year: 2016)
  UserDetail.create!(login: 'admin', password: 'admin', user: user)
end

After do |scenario|
  DatabaseCleaner.clean
end


Given(/^that user "([^"]*)" with password "([^"]*)" has logged in$/) do |arg1, arg2|
  visit("/session/new")
  within('.session-form') do
    fill_in 'login', with: arg1
    fill_in 'password', with: arg2
    click_button 'Login'
  end
  puts(find('.flash_message').text)
end

When(/^the admin user broadcasts "([^"]*)" to the notification feed$/) do |arg1|
  visit("/broadcasts/new")
  within('.broadcast-form') do
    fill_in 'broadcast_content', with: arg1
    click_button 'Broadcast'
  end
end

Then(/^the current page should contain the text: "([^"]*)"$/) do |arg1|
  puts(find('.flash_message').text)
  pending
end

Then(/^the current page should show the text "([^"]*)" in the notification feed$/) do |arg1|
  # pending
end

