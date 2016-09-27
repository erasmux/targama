class Language < ApplicationRecord
  validates :name, presence: true, allow_blank: false
   has_and_belongs_to_many :garm_forms;
   has_many :dialects, dependent: :destroy, #,inverse_of: :language
   has_many :words #,inverse_of: :language
end

class Dialect < ApplicationRecord
  validates :name, presence: true, allow_blank: false
  belongs_to :language #,inverse_of: :dialects
# has_and_belongs_to_many :dialects
end

class GramForm < ApplicationRecord
  validates :name, presence: true, allow_blank: false
  has_and_belongs_to_many :languages;
  has_many :inflection_types #,inverse_of: :gram_form
  # probably not needed?  has_many :words
end

class InflectionType < ApplicationRecord
  validates :name, presence: true, allow_blank: false
  belongs_to :gram_form #,inverse_of: :inflection_types
end

class Word < ApplicationRecord
  belongs_to :language #,inverse_of: :words
  belongs_to :gram_form
  has_and_belongs_to_many :dialects
  has_many :inflected_forms #,inverse_of: :word
  has_one :default_inflection, class_name: "InflectedForm"  # this is how you do it?
  has_and_belongs_to_many :interpretations

  # LATER: belongs_to :homonym_group
end

# LATER:
# class HomonymGroup < ApplicationRecord
# has_many :words
#end

class InflectedForm < ApplicationRecord
  validates :inf_word, presence: true, allow_blank: false
#  validates :inf_word_view, presence: true, allow_blank: false
  belongs_to :inflection_type
  belongs_to :word #,inverse_of: :inflected_forms
end

class Interpretation < ApplicationRecord
  has_and_belongs_to_many: words  # should be more or less one word in each language
  belongs_to :synonym_group #,inverse_of: :interpretations
end

class SynonymGroup < ApplicationRecord
  has_many :interpretations  #,inverse_of: :synonym_group
  has_one :antonym_group, class_name: "SynonymGroup" # probably should do this differently to keep reciprocicity,
  # see: http://tinyurl.com/zmksl3r
  # has_many :related, class_name:"SynonymGroup" # not reciprocal
  has_and_belongs_to_many :tags
end

class Tag < ApplicationRecord
  validates :name, presence: true, allow_blank: false

  has_and_belongs_to_many :synonym_groups

  # ADD: tags_below, tags_above, tags_related, using something like http://tinyurl.com/p98n54c
  # such that each tag can be below many other tags and above many other tags
  # not like this, which is just sub_tags
  has_many :sub_tags, class_name: "Tag", foreign_key: "father_tag_id"
  belongs_to :father_tag, class_name: "Tag"
end


REM batch file to generate models for database, now without references clauses (not sure excatly for what they are needed
REM if already have class definitions)

ruby bin/rails generate model Language name:string
ruby bin/rails generate model GramForm name:string
ruby bin/rails generate model Dialect name:string
ruby bin/rails generate model InflectionType name:string
ruby bin/rails generate model Word additional_info:string
ruby bin/rails generate model InflectedForm inf_word: string inf_word_view: string
ruby bin/rails generate model Interpretation description:text use_cases:text links:text
ruby bin/rails generate model SynonymGroup
ruby bin/rails generate model Tag name:string
