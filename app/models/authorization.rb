# == Schema Information
#
# Table name: authorizations
#
#  id         :bigint           not null, primary key
#  provider   :string
#  secret     :string
#  token      :string
#  uid        :string
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  member_id  :integer
#
class Authorization < ApplicationRecord
  belongs_to :member
end
