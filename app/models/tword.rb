class Tword < ApplicationRecord
  belongs_to :gram_form
  belongs_to :dialect

  validates :word, presence: true, allow_blank: false
end
