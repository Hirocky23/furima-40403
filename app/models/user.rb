class User < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :purchases
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角（漢字・ひらがな・カタカナ）で入力してください' }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角（漢字・ひらがな・カタカナ）で入力してください' }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角（カタカナ）で入力してください' }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角（カタカナ）で入力してください' }
  validates :birth_date, presence: true

  validate :password_complexity

  private

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze

  def password_complexity
    return if password.blank? || password =~ PASSWORD_REGEX

    errors.add :password, 'には英字と数字の両方を含めて設定してください'
  end
end