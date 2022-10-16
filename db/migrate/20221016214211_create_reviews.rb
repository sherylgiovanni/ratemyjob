class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :job_id
      t.integer :user_id
      t.string :work_hours
      t.text :pros
      t.text :cons
      t.string :hiring_manager_name
      t.boolean :anonymous

      t.timestamps
    end
  end
end
