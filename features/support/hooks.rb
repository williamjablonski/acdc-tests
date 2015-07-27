#Cucumber provides a number of hooks which allow us to run blocks at various points in the Cucumber test cycle

Before do
  # Do something before each scenario.
  if ENV['BROWSER']
    @browser = Watir::Browser.new ENV['BROWSER'].to_sym #to_sym converte uma string para um simbolo (ou seja, uma variavel)
  else
    @browser = Watir::Browser.new :firefox
  end
 # @browser.driver.manage.timeouts.implicit_wait = 10
end

Before do |scenario|
  # The +scenario+ argument is optional, but if you use it, you can get the title,
  # description, or name (title + description) of the scenario that is about to be
  # executed.
end

After do
  # Do something after each scenario.
  @browser.quit
end

After do |scenario|
  # Do something after each scenario.
  # The +scenario+ argument is optional, but
  # if you use it, you can inspect status with
  # the #failed?, #passed? and #exception methods.
  

  if(scenario.failed?)
    time = Time.new
    #Do something if scenario fails.
    #page.driver.browser.save_screenshot("./reports/#{time.strftime("%Y-%m-%d")}-#{scenario.__id__}.png")
    #@browser.driver.save_screenshot("./reports/#{time.strftime("%Y-%m-%d")}-#{scenario.__id__}.png")
    @current_page.driver.browser.save_screenshot("./reports/#{time.strftime("%Y-%m-%d")}-#{scenario.__id__}.png")
    embed("#{time.strftime("%Y-%m-%d")}-#{scenario.__id__}.png", "image/png", "SCREENSHOT")
  end

  @browser.close
end

#Tagged hooks

Before('@Ex_tag1, @Ex_tag2') do
  # This will only run before scenarios tagged
  # with @cucumis OR @sativus.
end

AfterStep('@Ex_tag1, @Ex_tag2') do
  # This will only run after steps within scenarios tagged
  # with @cucumis AND @sativus.
end