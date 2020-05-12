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
require 'test_helper'

class ForumThreadTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
