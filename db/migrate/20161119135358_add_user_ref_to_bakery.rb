class AddUserRefToBakery < ActiveRecord::Migration[5.0]
  def change
    add_reference :bakeries, :user, foreign_key: true
  end
end
