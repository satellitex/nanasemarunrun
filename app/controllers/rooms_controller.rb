class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = Room.all
    respond_to do | format |
      format.html
      format.json
    end
    
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: 'Room was successfully created.' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  # room make API /api/makeroom
  PREFECTURES = "prefectures"
  COUNTRY = "country"
  CITY = "city"
  USER_ID = "user_id"
  def make
    if address = make_params
      addr = Address.new( address )
      if addr.save
        userid = params[USER_ID]
        addrid = addr.id
        room = Room.new(user_id:userid,address_id:addrid)
        if room.save
          render json: { id: room.id }
          return
        end
      end
    end  
    render json: { id:nil }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:user_id, :address_id)
    end
    
    def make_params
      if params[USER_ID].nil?
        nil
      elsif params[COUNTRY].nil?
        nil
      elsif params[CITY].nil?
        nil
      elsif params[PREFECTURES].nil?
        nil
      else
        address = {}
        address[COUNTRY] = params[COUNTRY]
        address[CITY] = params[CITY]
        address[PREFECTURES] = params[PREFECTURES]
        address
      end
    end
end
