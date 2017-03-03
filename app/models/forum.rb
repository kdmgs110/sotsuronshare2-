class Forum < ActiveRecord::Base
    belongs_to :user
    has_many :comments
    acts_as_votable
    acts_as_taggable_on :labels # post.label_list が追加される
    acts_as_taggable            # acts_as_taggable_on :tags のエイリアス
    acts_as_ordered_taggable_on :keyword
      
end
