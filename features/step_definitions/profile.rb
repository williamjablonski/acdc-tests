Then (/^I should see the Complete Profile pop-up$/) do
  on(SuperStarsInitialPage).isFirstAccess
end

When (/^I close the first access modal$/) do
  on(SuperStarsInitialPage).closeModalFirstAccess
end

Then (/^I should see "(.*?)" on menu bar$/) do |button|
  steps %Q{
            When I close the first access modal
          }
  on(SuperStarsInitialPage).checkMenuBar(button)
end

When (/^I hover A\/Z button$/) do
  on(SuperStarsInitialPage).hoverMenu
end

Then (/^I should see users that starts with chosen letter$/) do
  on(SuperStarsInitialPage).checkUsersName
end