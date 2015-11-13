class Rant < ActiveRecord::Base
  #self.default_scope order: 'created_at DESC'
  attr_accessor :content, :user_id
  belongs_to :user
  validates :content, length: {maximum: 140}
  acts_as_followable

  def self.timeline(user)
    following_ids = user.all_following.map(&:id)
    all_ids= following_ids << user.id
    Rant.where(user_id: all_ids).order("created_at DESC")
  end

end