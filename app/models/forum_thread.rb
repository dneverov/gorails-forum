# == Schema Information
#
# Table name: forum_threads
#
#  id         :integer          not null, primary key
#  deleted_at :datetime
#  subject    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_forum_threads_on_deleted_at  (deleted_at)
#
class ForumThread < ApplicationRecord
  acts_as_paranoid

  belongs_to :user
  has_many :forum_posts
  has_many :users, through: :forum_posts

  accepts_nested_attributes_for :forum_posts

  validates :subject, presence: true
  validates_associated :forum_posts
end
