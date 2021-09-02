class Applicant < ApplicationRecord

  # has_one_attached :profile_photo

  validates :name, presence: true,  length: {maximum: 100 } 
  # validates :profile_photo , blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..5.megabytes }
  # validate :correct_document_mime_type
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
  validates :programming , length: { maximum: 100 }
  validates :certificate, length: { maximum: 255 }
  validates :english, length: { maximum: 255 }
  validates :japanese , length: { maximum: 255 }
  validates :other , length: { maximum: 255 }
  validates :total_exp_year , length: { maximum: 3 }
  validate :validate_tey
  private
  def validate_age
      if dob.present? && dob.to_i > 16.years.ago.to_i
          errors.add(:dob, 'You should be over 16 years old.')
      end
  end
  def validate_tey
    if total_exp_year.present? && total_exp_year > 10
      errors.add(:total_exp_year , 'Ur position is not here ! Ur Experience is greater than \'GOD!\'')
    end
  end
  # def correct_document_mime_type 
  #   if profile_photo.present? && !profile_photo.content_type.in?(%('image/png image/jpg image/jpeg'))
  #     errors.add(:profile_photo, 'Must be image file')
  #   end
  # end
end
