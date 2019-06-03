class ResultsController < ApplicationController
  
  def create
    @result = Result.new(result_params)
    
    if @result.save
      render json: 
        {
          message: 'Result added',
          result: ResultSerializer.new(@result)
        },
        status: :ok
    else
      render json: { message: 'Result not created', errors: @result.errors}, status: :bad_request
    end
  end
  
  private
  
  def result_params
    params.require(:result).permit(:competition_id, :athlete, :value, :unit)
  end
end
