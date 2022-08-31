Rails.application.routes.draw do

  scope module: :public do
  root to: 'homes#top'
  resources :posts do
    collection do
      get 'search'
    end
    resources :comments
    resource :likes, only: [:create, :destroy]
  end
  resources :post_details
  end

  namespace :admin do
    resources :users, only: [:index, :edit, :update, :destroy]
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
