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
end
