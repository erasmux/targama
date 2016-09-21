class Dialect < ApplicationRecord
  has_many :twords

  validates :name, presence: true, allow_blank: false
end
