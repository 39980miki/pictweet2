class CommentsController < ApplicationController
  def create
    Comment.create(comment_params)
    #createメソッドの引数では、ストロングパロメーターを用いて保存できるカラムを指定している
  end

  private
  def comment_params
    #paramsの中にcommentというハッシュがある二重構造になっているため、requireメソッドの引数に指定してtextを取り出す
    params.require(:comment).permit(:text).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
    #user_idカラムには、ログインしているユーザーのidとなるcurrent_user.idを保存
    #tweet_idカラムには、paramsで渡されるようにするので、params[:tweet_id]として保存
  end
end
