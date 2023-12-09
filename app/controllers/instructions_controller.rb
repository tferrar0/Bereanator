class InstructionsController < ApplicationController
  def index
    matching_instructions = Instruction.all

    @list_of_instructions = matching_instructions.order({ :created_at => :desc })

    render({ :template => "instructions/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_instructions = Instruction.where({ :id => the_id })

    @the_instruction = matching_instructions.at(0)

    render({ :template => "instructions/show" })
  end

  def create
    the_instruction = Instruction.new
    the_instruction.title = params.fetch("query_title")
    the_instruction.explanation = params.fetch("query_explanation")

    if the_instruction.valid?
      the_instruction.save
      redirect_to("/instructions", { :notice => "Instruction created successfully." })
    else
      redirect_to("/instructions", { :alert => the_instruction.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_instruction = Instruction.where({ :id => the_id }).at(0)

    the_instruction.title = params.fetch("query_title")
    the_instruction.explanation = params.fetch("query_explanation")

    if the_instruction.valid?
      the_instruction.save
      redirect_to("/instructions/#{the_instruction.id}", { :notice => "Instruction updated successfully."} )
    else
      redirect_to("/instructions/#{the_instruction.id}", { :alert => the_instruction.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_instruction = Instruction.where({ :id => the_id }).at(0)

    the_instruction.destroy

    redirect_to("/instructions", { :notice => "Instruction deleted successfully."} )
  end
end
