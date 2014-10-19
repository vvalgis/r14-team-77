class Hive < ActiveRecord::Base
  has_many :hive_memberships
  has_many :bees, through: :hive_memberships
  has_many :combs

  validates :name, presence: true

  def owner?(bee)
    # need collection of hive_memberships includes
    hive_memberships.select {|hm| hm.bee_id == bee.id && hm.is_owner? }.any?
  end

  def combs_visible_for(bee, comb_id: nil)
    rel = combs.where(<<-SQL, *Comb.visibilities.values, bee.id)
      (visibility = ? or visibility = ?)
      or ((visibility = ? or visibility = ?) and author_id = ?)
    SQL
    comb_id.nil? ? rel : rel.find(comb_id)
  end

  protected

end
