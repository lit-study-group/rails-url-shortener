# == Schema Information
#
# Table name: sites
#
#  id         :integer          not null, primary key
#  url        :string(255)      not null
#  token      :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Site < ActiveRecord::Base
  before_create :generate_token

  def generate_token
    token_length = Site.token_length
    self.token = loop do
      token = SecureRandom.urlsafe_base64(token_length)
      break token unless Site.where(token: token).exists?
    end
  end

  def self.token_length
    possible_chars_num = 64 # A-Za-z0-9_-
    min_needed_length = Math.log(self.count, possible_chars_num).ceil
    min_needed_length + 2 # use a longer token to avoid clashes
  end
end
