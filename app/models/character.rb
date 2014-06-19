class Character < ActiveRecord::Base
  belongs_to :television_show
  validates :actor, presence: true, uniqueness: { scope: :name }
  validates :name, presence: true
end
