Then (/^I should see the Complete Profile pop-up$/) do
  on(ACDCInitialPage).isFirstAccess
end

When (/^I close the first access modal$/) do
  on(ACDCInitialPage).closeModalFirstAccess
end

Then (/^I should see "(.*?)" on menu bar$/) do |button|
  steps %Q{
            When I close the first access modal
          }
  on(ACDCInitialPage).checkMenuBar(button)
end

When (/^I hover A\/Z button$/) do
  on(ACDCInitialPage).hoverMenu
end

Then (/^I should see users that starts with chosen letter$/) do
  on(ACDCInitialPage).checkUsersName
end