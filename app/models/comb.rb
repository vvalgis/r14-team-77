class Comb < ActiveRecord::Base
  belongs_to :author, class_name: 'Bee', foreign_key: :author_id
  belongs_to :hive

  enum visibility: %i(draft personal hive_shared world_shared)

  def author?(bee)
    author_id == bee.id
  end

end
