class Actor < ApplicationRecord
  validates :first_name, presence: true
  belongs_to :user
  #validates :last_name, presence: true
  def friendly_created_at
    created_at.strftime("%b %e, %l:%M %p")
  end
end
