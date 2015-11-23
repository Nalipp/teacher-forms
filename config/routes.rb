Rails.application.routes.draw do
  devise_for :users

  resources :time_threads do
    resources :time_posts, module: :time_threads
  end

  resources :users do
    collection do
      post :import
    end
  end

  root to: "time_threads#index"
end
