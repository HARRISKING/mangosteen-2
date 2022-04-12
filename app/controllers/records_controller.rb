class RecordsController < ApplicationController
 def create
  render_resource Record.create create_params
 end
 

 def destroy
  record = Record.find params[:id]
  head record.destroy ? :ok : :bad_request
 end

 def show
  render_resource Record.find(params[:id])
 end

 def index 
  render_resources Record.page(params[:page])
 end


 private
 def create_params
  return params.permit(:amount, :category, :notes)
 end

end
