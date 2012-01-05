Checkin::Application.routes.draw do
  resources :events, :attendees
  devise_for :users

  get  "checkin" => "events#checkin_page"
  post "checkin" => "events#checkin"

  root :to => "home#index"
end
