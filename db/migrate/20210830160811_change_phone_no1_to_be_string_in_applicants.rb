class ChangePhoneNo1ToBeStringInApplicants < ActiveRecord::Migration[6.1]
  def change
    change_column :applicants, :phone_no1, :string
  end
end
