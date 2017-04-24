class AddNicknameToReviewsTable < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :nickname, :string
  end
end
