class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]

  def index
    @tweets = Tweet.includes(:user).order("created_at DESC")
    #allメソッドで、tweetsテーブル全てのレコードをインスタンス変数に代入
    #N+1問題解消のためincludesメソッド
    #orderメソッドの引数として、レコードが作成された日時情報created_atカラムを新しいものから古いものDESC(ASCは古いものから新しいもの)
  end

  def new
    @tweet = Tweet.new 
    #Tweetクラスのインスタンス変数を生成 ツイート投稿画面new.html.erbのform_withヘルパーメソッドで使用するため
  end

  def create
    Tweet.create(tweet_params)
    #ストロングパラメーターを定義、createメソッドの引数に使用
    redirect_to '/' #保存後はトップページが表示されるように
  end

  def destroy
    #ビューファイルへツイート情報を受け渡す必要が無いため、インスタンス変数は使用しない。
    tweet = Tweet.find(params[:id])
    #パラメーターとして受け取ったparams[:id]をもとに、削除したいツイートをfindメソッドを用いて取得
    tweet.destroy
    redirect_to root_path
  end

  def edit
  end

  def update
    #destroyアクション同様、インスタンス変数は使用しない。
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params)
    redirect_to root_path
  end

  def show
    #showアクションでは、詳細表示したいツイートの情報をビューに受け渡すだけ
    @comment = Comment.new #コメントを新規作成する場合
  end

  private
  def tweet_params
    params.require(:tweet).permit(:image, :text).merge(user_id: current_user.id)
    #tweesテーブルへ保存できるように
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
