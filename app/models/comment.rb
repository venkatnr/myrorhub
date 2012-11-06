class Comment < ActiveRecord::Base
  belongs_to :article
  attr_accessible :description, :name
  belongs_to :article
end
