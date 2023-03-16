class Api::V1::LentsController < Api::ApiController
  def index
    @lents = Lent.all
    render json: @lents
  end

  def show
    @lent = Lent.find(params[:id])
    render json: @lent
  end

  # def create
  #   @lent = Lent.new(lents_params)
    
  # end

  def update
    @lent = Lent.find(params[:id])
    if @lent.update(lents_params)
      render json: @lent
    else
      render json: { errors: @lent.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @lent = Lent.find(params[:id])
    @lent.destroy
    head :no_content
  end

  private

  def lents_params
    params.require(:lent)
          .permit(:staffs_id,
                  :assets_id
                 )
  end
end
