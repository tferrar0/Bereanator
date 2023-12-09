# == Schema Information
#
# Table name: occurrences
#
#  id             :integer          not null, primary key
#  chapter        :integer
#  text           :text
#  verse          :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  book_id        :integer
#  instruction_id :integer
#
class Occurrence < ApplicationRecord
  belongs_to :instruction, required: true, class_name: "Instruction", foreign_key: "instruction_id"
  belongs_to :book, required: true, class_name: "Book", foreign_key: "book_id"
end
