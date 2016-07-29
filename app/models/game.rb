class Game < ActiveRecord::Base
  translates :description, fallbacks_for_empty_translations: true
  globalize_accessors
  belongs_to :category

  validates_presence_of :name, :description_en
  validates_uniqueness_of :sku

  after_initialize :set_sku
  before_create :set_sku

  scope :published, -> { where(published: true) }
  scope :with_category, -> (id) { where(category_id: id) unless id.empty? }
  scope :with_description_or_name, -> (desc) { with_translations.where('description like ? or name like ?', "%#{desc}%", "%#{desc}%") }

  def set_sku
    last_sku = Game.maximum(:sku)
    self.sku = last_sku.present? ? last_sku.to_i + 1 : 10_000 unless sku.present?
  end
end
