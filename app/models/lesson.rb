class Lesson < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  def should_generate_new_friendly_id?
    title_changed?
  end

  belongs_to :course

  validates :title, presence: true, length: { maximum: 50 }
  validates :video, presence: true
  validates :tag, presence: true
  validates :course, presence: true

  def next
    course.lessons.where("tag > ? AND header = ?", tag, false ).order(:tag).first
  end

  def prev
    course.lessons.where("tag < ? AND header = ?", tag, false ).order(:tag).last
  end

end
