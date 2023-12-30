Rails.application.routes.draw do
  devise_for :users
  root to: 'tweets#index'
  resources :tweets do
  #どのツイートに対するコメントなのかをパスから判断できるようにルーティングのネストを利用do~end
    resources :comments, only: :create #コメント情報を作る機能=createアクション
    collection do
    #検索機能の場合、詳細ページのような:idを指定して特定のページに行く必要がないため、collectionを使用してルーティング
    # :idありの場合、menber
      get 'search'
    end
  end
  resources :users, only: :show
end
