class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :wikis

  after_initialize :defrole

  def defrole
  	self.role ||= 'standard'
  end

  def admin?
  	role == 'admin'
  end

  def premium?
  	role == 'premium'
  end

end
