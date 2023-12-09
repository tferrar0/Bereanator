Rails.application.routes.draw do
  devise_for :users

  root to: "instructions#index"

  # Routes for the Book resource:

  # CREATE
  post("/insert_book", { :controller => "books", :action => "create" })
          
  # READ
  get("/books", { :controller => "books", :action => "index" })
  
  get("/books/:path_id", { :controller => "books", :action => "show" })
  
  # UPDATE
  
  post("/modify_book/:path_id", { :controller => "books", :action => "update" })
  
  # DELETE
  get("/delete_book/:path_id", { :controller => "books", :action => "destroy" })

  #------------------------------

  # Routes for the Occurrence resource:

  # CREATE
  post("/insert_occurrence", { :controller => "occurrences", :action => "create" })
          
  # READ
  get("/occurrences", { :controller => "occurrences", :action => "index" })
  
  get("/occurrences/:path_id", { :controller => "occurrences", :action => "show" })
  
  # UPDATE
  
  post("/modify_occurrence/:path_id", { :controller => "occurrences", :action => "update" })
  
  # DELETE
  get("/delete_occurrence/:path_id", { :controller => "occurrences", :action => "destroy" })

  #------------------------------

  # Routes for the Instruction resource:

  # CREATE
  post("/insert_instruction", { :controller => "instructions", :action => "create" })
          
  # READ
  get("/instructions", { :controller => "instructions", :action => "index" })
  
  get("/instructions/:path_id", { :controller => "instructions", :action => "show" })
  
  # UPDATE
  
  post("/modify_instruction/:path_id", { :controller => "instructions", :action => "update" })
  
  # DELETE
  get("/delete_instruction/:path_id", { :controller => "instructions", :action => "destroy" })

  #------------------------------

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
