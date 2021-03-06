class Item < ActiveRecord::Base
  has_many :main_processes
  has_many :sub_processes
  has_many :tasks
  has_many :indicators
  has_many :sources
  has_many :summary_types
  has_many :total_indicator_types
end
