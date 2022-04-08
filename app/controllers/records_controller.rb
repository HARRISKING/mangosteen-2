class RecordsController < ApplicationController
 def create
  render_resource Record.create create_params
 end

 private

 def create_params
  return params.permit(:amount, :category, :notes)
 end

end
