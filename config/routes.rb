Rails.application.routes.draw do

  scope module: :public do
    root to: 'homes#top'
    get 'my_page', to: 'users#show'
    post '/homes/guest_sign_in', to: 'homes#guest_sign_in'

    resource :user, only: [:edit, :update] do
      collection do
        get 'unsubscribe'
        patch 'withdraw'
      end
    end

    resources :posts do
      collection do
        get 'search'
        get 'ranking'
      end
      resources :comments
      resource :likes, only: [:create, :destroy]
    end

    resources :post_details
  end


  namespace :admin do

    resources :users, only: [:index, :edit, :update, :destroy]
    resources :genres

  end

  # 顧客用
  # URL /users/sign_in ...
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
