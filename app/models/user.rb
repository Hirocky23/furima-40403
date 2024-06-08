class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true
         validates :last_name, presence: true
         validates :first_name, presence: true
         validates :last_name_kana, presence: true
         validates :first_name_kana, presence: true
         validates :birth_date, presence: true

         validate :password_complexity

         private
       
         def password_complexity
           return if password.blank? || password =~ /(?=.*\d)(?=.*[a-zA-Z])/
       
           errors.add :password, 'は半角英数字混合で入力してください'
         end
       end
