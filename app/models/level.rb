class Level < ActiveRecord::Base

  #scopes
  scope :top_levels, lambda{|id=0| where("level_id = ?", id)}

  #Relations
  has_many :sub_levels, class_name: "Level", foreign_key: "level_id"
  belongs_to :level, class_name: "Level"

  belongs_to :user


  def get_sub_levels(list=[])
    sub_unit = []
    self.sub_levels.each do |tree|
      sub_unit<< tree
      if tree.sub_levels.count >= 1
        tree.get_sub_levels(list)
      end
    end
    list << sub_unit
    return list.reverse
  end




end
