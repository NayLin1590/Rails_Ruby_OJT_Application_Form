class AddFileUploadToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :file_upload, :string
  end
end
