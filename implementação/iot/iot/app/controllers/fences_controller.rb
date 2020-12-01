class FencesController < ApplicationController
  before_action :set_fence, only: [:show, :edit, :update, :destroy]

  # GET /fences
  # GET /fences.json
  def index
    @fences = Fence.all
    registra_log
    submete_logs

  end

  # GET /fences/1
  # GET /fences/1.json
  def show
    @logs=Log.where(fence_id: @fence.id)
  end

  # GET /fences/new
  def new
    @fence = Fence.new

  end

  # GET /fences/1/edit
  def edit
  end

  # POST /fences
  # POST /fences.json
  def create
    @fence = Fence.new(fence_params)

    respond_to do |format|
      if @fence.save
        format.html { redirect_to fences_url, notice: 'Fence was successfully created.' }
        format.json { render :show, status: :created, location: @fence }
      else
        format.html { render :new }
        format.json { render json: @fence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fences/1
  # PATCH/PUT /fences/1.json
  def update
    respond_to do |format|
      if @fence.update(fence_params)
        format.html { redirect_to fences_url, notice: 'Fence was successfully updated.' }
        format.json { render :show, status: :ok, location: @fence }
      else
        format.html { render :edit }
        format.json { render json: @fence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fences/1
  # DELETE /fences/1.json
  def destroy
    @fence.destroy
    respond_to do |format|
      format.html { redirect_to fences_url, notice: 'Fence was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fence
      @fence = Fence.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fence_params
      params.require(:fence).permit(:name, :status, :position)
    end
    def registra_log
      @fences=Fence.all
      @fences.each do |fence|
        log=Log.new
        log.status=fence.status
        log.fence_id=fence.id
        log.enviado= false
        log.save
      end
    end
    def submete_logs
      fences=Fence.all
      fences.each do |fence|
          logs=Log.where(fence_id:fence.id)
          logs.each do |log|
            if log.enviado == false
              data= gerar_data log
              post_log  data
              log.enviado=true
              log.save
            end
          end
      end
    end
    def gerar_data log
      data = { status:log.status, fence_id: log.fence_id ,hora:log.created_at}
    end
    def post_log data
      require 'net/http'
      puts "rodou tudo"
      uri = URI.parse('http://localhost:3000/events')
      http = Net::HTTP.new(uri.host, uri.port)
      http.post(uri, data.to_json)
    end

end
