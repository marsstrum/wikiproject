class Collaborator < ActiveRecord::Base
  belongs_to :user
  belongs_to :wiki

  scope :for_user_and_wiki, -> (user, wiki) { where(user_id: user.id, wiki_id: wiki.id) }

end
