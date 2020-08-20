class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products
  has_one :order

  validates :nickname, presence: true

  VALID_PASS_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}\z/i.freeze
  validates :password, presence: true, format: { with: VALID_PASS_REGEX }

  # 全角ひらがな、カタカナ、漢字のバリデーション
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
  validates :family_name, presence: true, format: { with: VALID_NAME_REGEX }
  validates :first_name, presence: true, format: { with: VALID_NAME_REGEX }

  # 全角カタカナのバリデーション
  VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  validates :family_name_kana, presence: true, format: { with: VALID_KANA_REGEX }
  validates :first_name_kana, presence: true, format: { with: VALID_KANA_REGEX }

  validates :birthday, presence: true
end
