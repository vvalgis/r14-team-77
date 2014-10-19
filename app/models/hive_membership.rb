class HiveMembership < ActiveRecord::Base
  belongs_to :hive
  belongs_to :bee
end
