class Category < ActiveRecord::Base
  translates :name, fallbacks_for_empty_translations: true
  globalize_accessors

  validates_presence_of :name_en
end
