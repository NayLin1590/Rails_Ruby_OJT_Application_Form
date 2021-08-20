class Applicant < ApplicationRecord
  # serialize :plang
  # serialize :programming, Array  

  validates :name, presence: true,  length: {maximum: 100 } 
  validates :profile_photo, presence: true
  validates :dob, presence: true
  validates :phone_no1, presence: true, length: { minimum:11 , maximum:11 }
  validates :phone_no2, length: { maximum:11 }
  validates :email, presence: true, uniqueness: true, length: { maximum: 100 }
  validates :current_address, presence: true, length: { maximum: 255 }
  validates :hometown_address, length: { maximum: 255 }
  validates :bachelor_university, length: { maximum: 100 }
  validates :bachelor_year, length: { maximum: 100 }
  validates :bachelor_degree, length: { maximum: 100 }
  validates :master_university, length: { maximum: 100 }
  validates :master_year, length: { maximum: 100 }
  validates :master_degree, length: { maximum: 100 }
  validates :diploma_name, length: { maximum: 100 }
  validates :certificate, length: { maximum: 255 }
  validates :total_exp_year, length: { maximum: 3 }
end
