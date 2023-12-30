Rails.application.routes.draw do
  devise_for :users
  root to: 'tweets#index'
  resources :tweets do
  #どのツイートに対するコメントなのかをパスから判断できるようにルーティングのネストを利用do~end
    resources :comments, only: :create #コメント情報を作る機能=createアクション
  end
  resources :users, only: :show
end
