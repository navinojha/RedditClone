class Post < ApplicationRecord
  validates_presence_of :title, :body, :account_id, :community_id
  belongs_to :account
  belongs_to :community
  has_many :comments

  def score
    #difference between upvotes and downvotes
    if self.upvotes > 0 || self.downvotes > 0
      self.upvotes > 0 ? (self.upvotes - self.downvotes) : (self.downvotes * -1)
    else
      0
    end
  end
  searchkick
  def search_data
    {
      title: title,
      body: body
    }
  end
end
