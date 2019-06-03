class CompetitionsController < ApplicationController
  
  def create
    @competition = Competition.ongoing.new(name: competition_params[:name])
    if @competition.save
      render json: 
        {
          message: 'Competition created',
          competition: CompetitionSerializer.new(@competition)
        },
        status: :ok
    else
      render json: { message: 'Competition not created', errors: @competition.errors }, status: :bad_request
    end
  end
  
  def end_competition
    @competition = Competition.find(competition_params[:id])
    if @competition
      @competition.finished!
      render json: 
        {
          message: 'Competition finished',
          competition: CompetitionSerializer.new(@competition)
        },
        status: :ok
    else
      render json: { message: 'Competition not found' }, status: :not_found
    end
  end
  
  def ranking
    competition = Competition.find(competition_params[:id])
    if competition
      render json: 
        {
          message: 'Ranking',
          competition: CompetitionSerializer.new(competition),
          ranking: competition.ranking.map { |result| ResultSerializer.new(result) }
        },
        status: :ok
    else
      render json: { message: 'Competition not found' }, status: :not_found
    end
  end
  
  private
  
  def competition_params
    params.require(:competition).permit(:name, :id)
  end
end
