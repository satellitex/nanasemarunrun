class FavoritesController < ApplicationController
  before_action :set_favorite, only: [:show, :edit, :update, :destroy]

  # GET /favorites
  # GET /favorites.json
  def index
    @favorites = Favorite.all
  end

  # GET /favorites/1
  # GET /favorites/1.json
  def show
  end

  # GET /favorites/new
  def new
    @favorite = Favorite.new
  end

  # GET /favorites/1/edit
  def edit
  end

  # POST /favorites
  # POST /favorites.json
  def create
    @favorite = Favorite.new(favorite_params)

    respond_to do |format|
      if @favorite.save
        format.html { redirect_to @favorite, notice: 'Favorite was successfully created.' }
        format.json { render :show, status: :created, location: @favorite }
      else
        format.html { render :new }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /favorites/1
  # PATCH/PUT /favorites/1.json
  def update
    respond_to do |format|
      if @favorite.update(favorite_params)
        format.html { redirect_to @favorite, notice: 'Favorite was successfully updated.' }
        format.json { render :show, status: :ok, location: @favorite }
      else
        format.html { render :edit }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favorites/1
  # DELETE /favorites/1.json
  def destroy
    @favorite.destroy
    respond_to do |format|
      format.html { redirect_to favorites_url, notice: 'Favorite was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  

  # POST /favorites
  # POST /favorites.json
  USER_ID="user_id"
  ROOM_ID="room_id"
  SENDDATE="senddate"
  def make
    favorite = Favorite.new(fav_param)
    fav_param
    if favorite.save
      render json: { id:favorite.id }
    else
      render json: { id:favorite.id }
    end
  end
  
  def count
    nums = get_fav_num
    username = get_user_name
    render json:{ count_fav: nums, user_name: username }
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite
      @favorite = Favorite.find(params[:id])
    end
    
    #ユーザー名を部屋の名前からとる
    def get_user_name
      if room = Room.find( params[ROOM_ID] )
        User.find( room.user_id ).accountname
      else
        "none"
      end
    end
    
    # number of fav room_id
    def get_fav_num
      if params[ROOM_ID].nil?
        0
      else
        Favorite.count( ROOM_ID: params[ROOM_ID] )
      end
    end

    def fav_param
      if params[USER_ID].nil?
        nil
      elsif params[ROOM_ID].nil?
        nil
      elsif params[SENDDATE].nil?
        nil
      else
        ret = {}
        ret[USER_ID] = params[USER_ID]
        ret[ROOM_ID] = params[ROOM_ID]
        ret[SENDDATE] = params[SENDDATE] 
        ret
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def favorite_params
      params.require(:favorite).permit(:room_id, :user_id, :senddate)
    end
end
