class AddTables < ActiveRecord::Migration
  def change
  	create_table :members do |t|
  		t.string :name
  		t.integer :room_id
  	end

  	create_table :rooms do |t|
  		t.string :room_name
  		t.integer :rent
  		t.integer :member_id
  	end

  	create_table :purchases do |t|
  		t.string :description
  		t.integer :cost
  		t.integer :member_id
  	end
  end
end
