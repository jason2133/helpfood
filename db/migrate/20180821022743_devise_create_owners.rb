# frozen_string_literal: true

class DeviseCreateOwners < ActiveRecord::Migration[5.0]
  def change
    create_table :owners do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      
      #이름/폰번호
      t.string :name, null:false, default: ""
      t.integer :phonenum, null:false  
      t.string :registerimg  
      #가게정보(이름,번호,간단설명)/메뉴등록은(restaurants에서)
      t.string :shop_name
      t.integer :shop_num
      t.text :shop_info
      t.boolean :is_Shop, default:false
      #is_Brand 사업자번호확인

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :owners, :email,                unique: true
    add_index :owners, :reset_password_token, unique: true
    # add_index :owners, :confirmation_token,   unique: true
    # add_index :owners, :unlock_token,         unique: true
  end
end
