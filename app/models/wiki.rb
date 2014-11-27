class Wiki < ActiveRecord::Base
  
  has_many :collaborators
  has_many :users, through: :collaborators
  belongs_to :user

  #scope :visible_to, -> (user) { user ? where("user_id = ? OR private IS NULL OR private = ?", user.id, false) : where(private: false) }
  #scope :visible_to, -> (user) { user ? all : where(private: false) }  

end