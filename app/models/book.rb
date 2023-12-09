# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
#  position   :integer
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Book < ApplicationRecord
  has_many  :occurrences, class_name: "Occurrence", foreign_key: "book_id", dependent: :destroy
end
