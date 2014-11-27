class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :collaborators
  has_many :wikis, through: :collaborators

  after_initialize :set_default_role

  def set_default_role
  	self.role ||= 'standard'
  end

  def role?(base_role)
    role == base_role.to_s
  end

  def admin?
  	role == 'admin'
  end

  def premium?
  	role == 'premium'
  end

end
