class EmployeesController < ApplicationController
	def show
		@employee = Unirest.get("http://localhost:3000/employees/#{params[:id]}.json").body
		puts "EMPlouee"
		puts @employee

	end

	def index
		@employees = Unirest.get("http://localhost:3000/employees.json").body
		puts @employee
	end

  	def new

  	end

  	def create
    	@employee = Unirest.post("http://localhost:3000/employees.json",
              headers:{ "Accept" => "application/json" },
              parameters: { :employee => 
                            {
                              :first_name => params[:first_name],
                              :middle_name => params[:middle_name],
                              :last_name => params[:last_name],
                              :suffix => params[:suffix],
                              :email => params[:email],
                              :phone => params[:phone]
                            }
                          }
              ).body

    	redirect_to employee_path(@employee["id"])
  	end

  	def edit
    	@employee = Unirest.get("http://localhost:3000/employees/#{params[:id]}.json", 
                  headers:{ "Accept" => "application/json" }).body
  	end

  	def update
    	@employee = Unirest.patch("http://localhost:3000/employees/#{params[:id]}.json",
              headers:{ "Accept" => "application/json" },
              parameters: { :employee => 
                            {
                              :first_name => params[:first_name],
                              :middle_name => params[:middle_name],
                              :last_name => params[:last_name],
                              :suffix => params[:suffix],
                              :email => params[:email],
                              :phone => params[:phone]
                            }
                          }
              ).body

    	redirect_to "/employees/#{@employee['id']}"  #person_path(@employee["id"])
  	end

  	def destroy
    	Unirest.delete("http://localhost:3000/employees/#{params[:id]}.json",
      	headers:{ "Accept" => "application/json"})

    	redirect_to employee_path
  	end
end
