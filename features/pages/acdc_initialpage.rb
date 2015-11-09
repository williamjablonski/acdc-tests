class ACDCInitialPage
  include PageObject

  a       :banner_image,       :class => 'navbar-brand'
  div     :modal_first_access, :id =>    'fill-profile-modal'
  a       :my_profile_button,  :href =>  '/#!/profile/'
  a       :signout_button,     :href =>  '/auth/signout/'
  span    :a_z_dropdown,       :class => 'dropdown-toggle'
  a       :letter_m_button,    :class =>  'ng-binding'
  button  :not_now_button,     :class => 'md-warn'
  div     :user_name,          :class => 'user-name'

  #Global variable
  @@filter_letter = nil

  #expected_element :banner_image

  def initialize_page
    #has_expected_element?
    wait_until(20, "ERROR: Initial page did not load"){banner_image_element.visible?}
  end


  def isFirstAccess
    wait_until(20, "ERROR: Complete profile pop-up was not displayed."){modal_first_access_element.visible?}
  end


  def checkMenuBar(button)
    case
      when 'A/Z'
        wait_until(20, "ERROR: button A/Z not displayed"){a_z_dropdown_element.exists?}
    end
  end

  def closeModalFirstAccess
    if modal_first_access_element.visible?
      not_now_button
    end
  end

  def getUsers
    wait_until(30, 'ERROR: User list was not displayed'){user_name_element.visible?}
    return user_name
  end

  def hoverMenu
    a_z_dropdown_element.hover
    wait_until(20, "ERROR: A/Z button not hovered"){a_z_dropdown_element.visible?}
    sleep(3)
  end

  def clickLetterMenu(letter)
    @@filter_letter = letter
    binding.pry
    @browser.elements(:class => 'ng-binding').each do | element |
      if element.text == letter
        element.click
        break
      end
    end
  end

  def checkUsersName
    user = getUsers
    if(!(user).start_with? @@filter_letter)
      raise('ERROR: Wrong User displayed')
    end
  end


end