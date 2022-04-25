class VagasController < ApplicationController
  before_action :set_vaga, only: %i[ show edit update destroy ]

  def index
    @vagas = Vaga.all
  end

  def show
  end

  def new
    @vaga = Vaga.new
  end

  def edit
  end

  def create
    @vaga = Vaga.new(vaga_params)

    respond_to do |format|
      if @vaga.save
        format.html { redirect_to vaga_url(@vaga), notice: "Vaga was successfully created." }
        format.json { render :show, status: :created, location: @vaga }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vaga.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @vaga.update(vaga_params)
        format.html { redirect_to vaga_url(@vaga), notice: "Vaga was successfully updated." }
        format.json { render :show, status: :ok, location: @vaga }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vaga.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @vaga.destroy

    respond_to do |format|
      format.html { redirect_to vagas_url, notice: "Vaga was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_vaga
      @vaga = Vaga.find(params[:id])
    end

    def vaga_params
      params.require(:vaga).permit(:estacionamento_id, :disponibilidade, :preco)
    end
end
