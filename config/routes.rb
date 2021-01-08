Rails.application.routes.draw do
  devise_for :users
  root to: 'healths#index'
  # rootをログイン画面に設定
#  devise_scope :user do
#    root "users/sessions#new"
#  end

#  devise_for :users, :controllers => {
#    sessions: 'users/sessions'
#  }

  resources :healths, only: [:new, :create] do
    collection do
      get 'check'
      post 'approval'
      get 'top'
      get 'search'
      get 'result'
  end
 end
  resources :markets, only: [:new, :create] do
    collection do
      get 'search'
      get 'result'
      get 'stock_graph'
      get 'exchange_graph'
    end
  end
  resources :comments, only: [:create]
end