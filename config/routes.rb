Rails.application.routes.draw do
  post 'contact', :to => 'ffcrm_freshbooks/contact#create', :as => 'ffcrm_freshbooks'
end