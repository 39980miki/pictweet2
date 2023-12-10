class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all #allメソッドで、tweetsテーブル全てのレコードをインスタンス変数に代入
  end
end
