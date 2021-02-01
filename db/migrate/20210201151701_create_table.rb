class CreateTable < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.integer :status
      t.text :description
      t.references :user
      t.timestamps
    end

    create_table :comments do |t|
      t.string :content
      t.references :post
      t.timestamps
    end

    create_table :audio_clips do |t|
      t.integer :duration
      t.references :post
      t.timestamps
    end

    create_table :video_clips do |t|
      t.string :preview_url
      t.integer :resolution
      t.references :post
      t.timestamps
    end

    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.integer :role
      t.index :email, unique: true
      t.timestamps
    end
  end
end
