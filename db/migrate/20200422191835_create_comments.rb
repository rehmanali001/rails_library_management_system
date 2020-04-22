class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.resources :user
      t.resources :post

      t.timestamps
    end
  end
end
