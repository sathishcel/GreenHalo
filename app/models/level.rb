class Level < ActiveRecord::Base

  #scopes
  scope :top_levels, lambda{|id=0| where("level_id = ?", id)}

  #Relations
  has_many :sub_levels, class_name: "Level", foreign_key: "level_id"
  belongs_to :level, class_name: "Level"
  has_many :wgus
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

  def parent_list_counts(level_obj)
    sequence_number = 1
    obj = level_obj
    parent_check = Proc.new {|new_obj| new_obj.try(:level)}
    parent_level = parent_check.call(obj)
    if parent_level
      sequence_number = sequence_number + 1
      if parent_check.call(obj.level)
        sequence_number = sequence_number + 1
        if parent_check.call(obj.level.level)
          sequence_number = sequence_number + 1
        end
      end
    end
    return sequence_number
  end





end
