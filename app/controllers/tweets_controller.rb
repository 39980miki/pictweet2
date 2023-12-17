class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all 
    #allメソッドで、tweetsテーブル全てのレコードをインスタンス変数に代入
  end

  def new
    @tweet = Tweet.new 
    #Tweetクラスのインスタンス変数を生成 ツイート投稿画面new.html.erbのform_withヘルパーメソッドで使用するため
  end
end
