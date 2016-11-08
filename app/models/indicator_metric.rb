class IndicatorMetric < ActiveRecord::Base
  belongs_to :indicator
  belongs_to :metric
  belongs_to :entry_indicator

  has_many :total_indicator, :dependent => :destroy

   def copy(i_id)
     IndicatorMetric.create(self.attributes.merge(id: nil, indicator_id: i_id))
  end
end

