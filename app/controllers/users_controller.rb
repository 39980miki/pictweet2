class UsersController < ApplicationController
  def show
    #クリックされたユーザーのidから情報を取得してビューに受け渡す
    user = User.find(params[:id]) #送られたidをparamsで取得、そのユーザーのレコードを変数userに代入
    @nickname = user.nickname #ユーザーのnicknameを取り出して@nicknameに代入
    @tweets = user.tweets #そのユーザーが投稿したツイートを取得して@tweetsに代入
  end
end
