class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    validates :email, presence: true
	validates :password, presence: true
	validates_uniqueness_of :pseudo, presence: true
	validates :sexe, presence: true
	validates :prenom, presence: true
	validates :nom, presence: true
end
