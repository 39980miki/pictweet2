class Tweet < ApplicationRecord
  validates :text, presence: true
  belongs_to :user
  has_many :comments

  #テーブルとのやりとりに関するメソッドはモデルに置く
  def self.search(search)
    if search != "" #メソッド名はsearchメソッドとする
    #検索フォームに何か値が入力されていた場合
      Tweet.where('text LIKE(?)', "%#{search}%")
    else
    #検索フォームに何も入力せずに検索ボタンを押すと、引数で渡されるsearchの中身は空になる
      Tweet.all
      #その時のすべての投稿を取得して表示するためのもの
    end
  end
end