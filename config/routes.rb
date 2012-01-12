Checkin::Application.routes.draw do
  get "attendees/new"
  post "attendees/create"

  resources :events, :attendees
  devise_for :users

  get  "checkin" => "events#checkin_page"
  post "checkin" => "events#checkin"

  get "gift/:gift" => "events#gift"

  root :to => "home#index"
end
