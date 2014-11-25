class Wiki < ActiveRecord::Base
   attr_reader :user

   def initialize(user)
       @user = user
     end

  belongs_to :user

  scope :visible_to, -> (user) { user ? all : where(private: false) }

end