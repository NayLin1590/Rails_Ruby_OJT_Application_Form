class CreateApplicants < ActiveRecord::Migration[6.1]
  def change
    create_table :applicants do |t|
      t.string :name, varchar: 100, null: false
      t.string :profile_photo, varchar: 250, null: false
      t.timestamp :dob
      t.integer :phone_no1, varchar: 30, null:false
      t.integer :phone_no2, varchar: 30
      t.string :email, varchar: 100
      t.string :current_address, varchar: 255, null: false
      t.string :hometown_address, varchar: 255
      t.string :bachelor_university
      t.string :bachelor_year, varchar: 100
      t.string :bachelor_degree, varchar: 100
      t.string :master_university, varchar: 100
      t.string :master_year, varchar: 100
      t.string :master_degree, varchar: 100
      t.string :diploma_name, varchar: 100
      t.string :certificate, varchar:255
      t.text :programming
      t.text :english
      t.text :japanese
      t.text :other
      t.text :internship_info
      t.text :job_experience
      t.integer :total_exp_year, nvarchar: 3
      t.text :comment
      t.timestamps
    end
  end
end
