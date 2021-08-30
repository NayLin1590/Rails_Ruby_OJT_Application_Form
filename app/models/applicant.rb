class Applicant < ApplicationRecord
  validates :name, presence: true,  length: {maximum: 100 } 
  validates :dob, presence:true
  validate :validate_age 
  validates :phone_no1, presence: true, length: { maximum: 13 }
  validates :phone_no2, length: { maximum:13 }
  validates :email, presence: true, uniqueness: true, length: { maximum: 255 },
  format: { with: Constants::VALID_EMAIL_REGEX }
  validates :current_address, presence: true, length: { maximum: 255 }
  validates :hometown_address, length: { maximum: 255 }
  validates :bachelor_university , presence: true , length: { maximum: 100 }
  validates :bachelor_year, length: { maximum: 20 }
  validates :bachelor_degree, length: { maximum: 100 }
  validates :master_university, length: { maximum: 100 }
  validates :master_year, length: { maximum: 20 }
  validates :master_degree, length: { maximum: 100 }
  # validates :diploma_name, length: { maximum: 100 }
  validates :certificate, length: { maximum: 255 }
  validates :total_exp_year, length: { maximum: 3 }
  validate :validate_tey


  private
  def validate_age
      if dob.present? && dob.to_i > 16.years.ago.to_i
          errors.add(:dob, 'You should be over 16 years old.')
      end
  end
  def validate_tey
    if total_exp_year.present? && total_exp_year > 10
      errors.add(:total_exp_year , 'U R GOT!')
    end
  end
end
