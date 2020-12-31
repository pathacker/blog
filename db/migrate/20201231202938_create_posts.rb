class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title, :status, nil:false, default:''
      t.text :body, nil:false, default:''

      t.timestamps
    end
  end
end
