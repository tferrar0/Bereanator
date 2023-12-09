# == Schema Information
#
# Table name: instructions
#
#  id          :integer          not null, primary key
#  explanation :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Instruction < ApplicationRecord
  has_many  :occurrences, class_name: "Occurrence", foreign_key: "instruction_id", dependent: :destroy
end
