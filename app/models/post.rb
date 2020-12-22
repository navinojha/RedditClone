class Post < ApplicationRecord
    validates_presence_of :title, :body, :account_id, :community_id
    belongs_to :account
    belongs_to :community
    has_many :comments
end