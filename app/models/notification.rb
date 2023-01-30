# == Schema Information
#
# Table name: notifications
#
#  id                :bigint           not null, primary key
#  notification_type :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  member_id         :bigint           not null
#
# Indexes
#
#  index_notifications_on_member_id  (member_id)
#
# Foreign Keys
#
#  fk_rails_...  (member_id => members.id)
#
class Notification < ApplicationRecord
end
