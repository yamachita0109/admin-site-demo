class WriterProfile < ApplicationRecord
  belongs_to :writer

  validates :profile_text, length: { maximum: 1000 }
  validates :wordpress_id, uniqueness: true, allow_nil: true
end