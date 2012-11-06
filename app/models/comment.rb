class Comment < ActiveRecord::Base
  belongs_to :article
  attr_accessible :description, :name, :c_approval_status
  belongs_to :article
end
