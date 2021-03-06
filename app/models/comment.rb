class Comment < ActiveRecord::Base

  acts_as_votable

  default_scope -> { order('created_at ASC') }

  # NOTE: install the acts_as_votable plugin if you
  # want user to vote on the quality of comments.
  #acts_as_voteable

  # NOTE: Comments belong to a user
  
  belongs_to :user  
  belongs_to :post
  belongs_to :forum
end
