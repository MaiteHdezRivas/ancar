class Indicator < ActiveRecord::Base
  resourcify
  has_many :indicator_sources, :dependent => :destroy
  has_many :indicator_metrics, :dependent => :destroy

  has_many :metrics, through: :indicator_metrics
  has_many :entry_indicators, through: :indicator_metrics
  has_many :total_indicators, through: :indicator_metrics
  has_many :summary_types, through: :total_indicators

  has_many :sources, through: :indicator_sources

  belongs_to :task
  belongs_to :item, -> { where item_type: "indicator" }

  validates :item_id, presence: true
  validates :order, presence: true

  validates_associated :indicator_metrics
  validates_associated :indicator_sources

  def copy(tk_id, current_user_login)
    i = Indicator.create(self.attributes.merge(id: nil, task_id: tk_id, updated_by: current_user_login))
    indicator_metrics.each do |im|
      im.copy(i.id)
    end
  end

  def is_empty?
    true
  end

  def sub_process
    task.sub_process
  end

  def main_process
    sub_process.main_process
  end

  def period
    main_process.period
  end

  def modifiable?
    period.modifiable?
  end

  def eliminable?
    period.eliminable?
  end
end
