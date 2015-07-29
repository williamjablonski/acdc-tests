#Cucumber provides a number of hooks which allow us to run blocks at various points in the Cucumber test cycle

Before do
  # Do something before each scenario.
  if ENV['BROWSER']
    @browser = Watir::Browser.new ENV['BROWSER'].to_sym #to_sym converte uma string para um simbolo (ou seja, uma variavel)
  else
    @browser = Watir::Browser.new :firefox
  end

  DataMagic.yml_directory = nil
  DataMagic.yml = nil
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
    #Do something if scenario fails.

    time = Time.new
    filename = "./reports/error-#{time.strftime("%Y-%m-%d")}-#{@current_page.class}.png"
    @browser.screenshot.save (filename)
    embed(filename, 'image/png')

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