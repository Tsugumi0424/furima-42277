class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥々ー]+\z/
  VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  VALID_PASSWORD_REGEX = /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/


  validates :nickname, presence: true
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: "is invalid. Include both letters and numbers" }, if: :password_required?
  validates :first_name, presence: true, format: { with: VALID_NAME_REGEX,message: "is invalid. Input full-width characters" }
  validates :last_name, presence: true, format: { with: VALID_NAME_REGEX,message: "is invalid. Input full-width characters" }
  validates :first_name_kana, presence: true, format: { with: VALID_KANA_REGEX,message: "is invalid. Input full-width katakana characters" }
  validates :last_name_kana, presence: true, format: { with: VALID_KANA_REGEX,message: "is invalid. Input full-width katakana characters" }
  validates :birth_date, presence: true


end
