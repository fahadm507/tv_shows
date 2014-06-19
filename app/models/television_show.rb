class TelevisionShow < ActiveRecord::Base
  has_many :characters
  validates :title,
    presence: true,
    uniqueness: { scope: :network }
end
