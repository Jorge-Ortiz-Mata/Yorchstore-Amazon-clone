class ProfilesController < ApplicationController

  before_action :user?
  before_action :set_profile, only: %i[ show edit update ]

  # GET /profiles/1 or /profiles/1.json
  def show
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles or /profiles.json
  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    @profile.bank_money = 4950.00

      respond_to do |format|
        if @profile.save
          format.html { redirect_to profile_url(@profile), notice: "Profile was successfully created. Card: #{@user_card_valid}" }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    # end
  end

  # PATCH/PUT /profiles/1 or /profiles/1.json
  def update
      respond_to do |format|
        if @profile.update(profile_params)
          format.html { redirect_to profile_url(@profile), notice: "Profile was successfully updated." }
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :location, :genre, :cellphone, :bank_account, :birth, :avatar, :user_card)
    end
end
