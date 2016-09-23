class Tword < ApplicationRecord
  belongs_to :gram_form
  belongs_to :dialect, optional: true

  validates :word, presence: true, allow_blank: false
  validates :gram_form_id, presence: true

  def dialect_name
    dialect ? dialect.name : ""
  end

  def short_additional_info(max_length = 40)
    info = additional_info
    if info.length > max_length || info.index("\n")
      info = info.split("\n").first
      if info.length > max_length-4
        info = info[0..max_length-4]
      end
      info = info + " ..."
    end
    info
  end
end
