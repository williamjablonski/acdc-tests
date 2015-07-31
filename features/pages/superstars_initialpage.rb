class SuperStarsInitialPage
  include PageObject

  #page_url 'http://192.168.0.7:3030/auth/google/callback?code=4/HyeJn5vSb1LwJhYp0zZ-V0GByTvqKBo5-YAshciShbI#'

  a   :banner_image,       :class => 'navbar-brand'
  div :modal_first_access, :id => 'fill-profile-modal'
  a   :my_profile_button,  :href => '/#!/profile/'
  a   :signout_button,     :href => '/auth/signout/'

  #expected_element :banner_image

  def initialize_page
    #has_expected_element?
    wait_until(20, "ERROR: Initial page did not load"){banner_image_element.visible? | modal_first_access_element.visible?}
  end


end