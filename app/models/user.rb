class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:confirmable

  #Relations
  has_many :levels
  has_one :address, as: :entity
  has_one :user_detail

  def full_name
    "#{self.first_name}" " " "#{self.last_name}"
  end

end
