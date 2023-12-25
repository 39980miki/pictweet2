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

  def destroy
    #ビューファイルへツイート情報を受け渡す必要が無いため、インスタンス変数は使用しない。
    tweet = Tweet.find(params[:id])
    #パラメーターとして受け取ったparams[:id]をもとに、削除したいツイートをfindメソッドを用いて取得
    tweet.destroy
    redirect_to root_path
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    #destroyアクション同様、インスタンス変数は使用しない。
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params)
    redirect_to root_path
  end

  def show
    #showアクションでは、詳細表示したいツイートの情報をビューに受け渡すだけ
    @tweet = Tweet.find(params[:id])
  end

  private
  def tweet_params
    params.require(:tweet).permit(:name, :image, :text)
    #tweesテーブルへ保存できるように
  end

end
