class OccurrencesController < ApplicationController
  def index
    matching_occurrences = Occurrence.all

    @list_of_occurrences = matching_occurrences.order({ :created_at => :desc })

    render({ :template => "occurrences/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_occurrences = Occurrence.where({ :id => the_id })

    @the_occurrence = matching_occurrences.at(0)

    render({ :template => "occurrences/show" })
  end

  def create
    the_occurrence = Occurrence.new
    the_occurrence.instruction_id = params.fetch("query_instruction_id")
    the_occurrence.text = params.fetch("query_text")
    the_occurrence.book_id = params.fetch("query_book_id")
    the_occurrence.chapter = params.fetch("query_chapter")
    the_occurrence.verse = params.fetch("query_verse")

    if the_occurrence.valid?
      the_occurrence.save
      redirect_to("/occurrences", { :notice => "Occurrence created successfully." })
    else
      redirect_to("/occurrences", { :alert => the_occurrence.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_occurrence = Occurrence.where({ :id => the_id }).at(0)

    the_occurrence.instruction_id = params.fetch("query_instruction_id")
    the_occurrence.text = params.fetch("query_text")
    the_occurrence.book_id = params.fetch("query_book_id")
    the_occurrence.chapter = params.fetch("query_chapter")
    the_occurrence.verse = params.fetch("query_verse")

    if the_occurrence.valid?
      the_occurrence.save
      redirect_to("/occurrences/#{the_occurrence.id}", { :notice => "Occurrence updated successfully."} )
    else
      redirect_to("/occurrences/#{the_occurrence.id}", { :alert => the_occurrence.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_occurrence = Occurrence.where({ :id => the_id }).at(0)

    the_occurrence.destroy

    redirect_to("/occurrences", { :notice => "Occurrence deleted successfully."} )
  end
end
