class Question < ApplicationRecord
  belongs_to :subject, counter_cache: true, inverse_of: :questions
  has_many :answers
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true

  #Callback
  after_create :set_statistic

  #kaminari
  paginates_per 5

  def self.search_subject(page, subject_id)
    includes(:answers, :subject)
    .where(subject_id: subject_id)
    .page(page)
  end

  def self.search(page, term)
    includes(:answers, :subject)
    .where("lower(description) LIKE ?", "%#{term.downcase}%")
    .page(page)
  end

  def self.last_questions(page)
    includes(:answers, :subject).order('created_at desc').page(page)
  end

  private
  
  def set_statistic
    AdminStatistic.set_event(AdminStatistic::EVENTS[:total_questions])
  end
end
