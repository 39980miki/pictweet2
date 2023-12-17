class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all 
    #allメソッドで、tweetsテーブル全てのレコードをインスタンス変数に代入
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

  private
  def tweet_params
    params.require(:tweet).permit(:name, :image, :text)
    #tweesテーブルへ保存できるように
  end

end
