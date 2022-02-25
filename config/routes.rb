Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :restaurants do
    # collection, member are managed by the same controller
    collection do # collection porque no requiere un ID
      # top_restaurants GET    /restaurants/top(.:format)      restaurants#top
      get 'top'   # with collection we don't need->  , to: "restaurants#top", as: :top_restaurants
    end
    member do
      # chef_restaurant GET    /restaurants/:id/chef(.:format) restaurants#chef
      get 'chef'
    end

    # GET restaurants/:restauran_id/reviews/new  # Already in a restaurant, so just adding the path
    # POST restaurants/:restauran_id/reviews     #   restaurants/:restauran_id we get the ID
    # How can we do the below?
    resources :reviews, only: %i[new create]
    # restaurant_reviews POST   /restaurants/:restaurant_id/reviews(.:format)     reviews#create
    # new_restaurant_review GET    /restaurants/:restaurant_id/reviews/new(.:format) reviews#new
    # if [new create destroy]
    # restaurant_review DELETE /restaurants/:restaurant_id/reviews/:id(.:format) reviews#destroy
    # destroy requires "/restaurants/:restaurant_id" ? -> NO, only leopardice the path
    # so, destroy is generated outside resources :restaurants
  end
  resources :reviews, only: %i[destroy]
end
