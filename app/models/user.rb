class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  VALID_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  VALID_KANA_REGEX = /\A[ァ-ヶー]+\z/
  VALID_PASSWORD_REGEX = /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/

  with_options presence: true do
    validates :nickname
    validates :birth_date
    validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'is invalid. Include both letters and numbers' },
                       if: :password_required?
    validates :last_name, format: { with: VALID_NAME_REGEX, message: 'is invalid. Input full-width characters' }
    validates :first_name, format: { with: VALID_NAME_REGEX, message: 'is invalid. Input full-width characters' }
    validates :last_name_kana,format: { with: VALID_KANA_REGEX, message: 'is invalid. Input full-width katakana characters' }
    validates :first_name_kana,format: { with: VALID_KANA_REGEX, message: 'is invalid. Input full-width katakana characters' }
  end
end
