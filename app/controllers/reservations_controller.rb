class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :update, :destroy]

  # GET /reservations
  def index
    @reservations = Reservation.all

    render json: @reservations
  end

  # GET /reservations/1
  def show
    render json: @reservation
  end

  # POST /reservations
  def create

    if Reservation.reservations(params[:date], params[:movie_id]) < 10
      @reservation = Reservation.new(reservation_params)
      if @reservation.save
        render json: @reservation, status: :created, location: @reservation
      else
        render json: @reservation.errors, status: :unprocessable_entity
      end
    else
      render json: {message: "No hay reservas disponibles para esta pelicula"}
    end
  end

  # PATCH/PUT /reservations/1
  def update
    if @reservation.update(reservation_params)
      render json: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reservations/1
  def destroy
    @reservation.destroy
  end

  #reservations

  def reservations
    reservations = Reservation.reservations(params[:date], params[:movie_id])
    render json: reservations
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def reservation_params
      params.require(:reservation).permit(:email, :name, :identification, :date, :phone, :movie_id, :block)
    end
end
