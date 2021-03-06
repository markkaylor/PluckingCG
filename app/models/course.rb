class Course < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  def should_generate_new_friendly_id?
    name_changed?
  end

  has_many :lessons

  has_many :subscriptions
  has_many :users, through: :subscriptions

  validates :name, presence: true, length: { maximum: 50 }
  validates :content, presence: true
  validates :price, presence: true, numericality: { only_integer: true }

  has_attached_file :image, styles: { medium: "680x300>", thumb: "170x75>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def price_in_cents
    price*100
  end
end
