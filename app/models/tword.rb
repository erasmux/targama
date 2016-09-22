class Tword < ApplicationRecord
  belongs_to :gram_form
  belongs_to :dialect

  validates :word, presence: true, allow_blank: false
  validates :gram_form_id, presence: true
  validates :dialect_id, presence: true
end
