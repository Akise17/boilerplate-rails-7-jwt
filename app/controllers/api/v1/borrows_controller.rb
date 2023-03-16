class Api::V1::BorrowsController < Api::ApiController
  def index
    @borrows = Borrow.all
    render json: @borrows
  end

  def create
    @borrow = Borrow.new(permitted_params)
    if @borrow.save
      render json: @borrow
    end
  end

  private

  def permitted_params
    params.require(:borrow)
          .permit(:assets_id,
                  :staffs_id
          )
  end
end
