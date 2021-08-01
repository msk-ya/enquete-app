class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :enquetes, dependent: :destroy
  validates :name, presence: true,  length: {maximum: 10}
  
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
