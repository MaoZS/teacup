# encoding : utf-8
class TeasController < ApplicationController
  before_action :set_tea, only: [:show, :edit, :update, :destroy]

  # GET /teas
  # GET /teas.json
  def index
    @tea = Tea.new
    @teas = Tea.where(deleted:false).all
  end

  # GET /teas/1
  # GET /teas/1.json
  def show
  end

  # GET /teas/new
  def new
    @tea = Tea.new
  end

  # GET /teas/1/edit
  def edit
  end

  # POST /teas
  # POST /teas.json
  def create
    @tea = Tea.new(tea_params)
    @tea[:date] = Time.now.strftime('%Y/%m/%d %H:%M:%S')
    respond_to do |format|
      if @tea.save
        #format.html { redirect_to @tea, notice: 'Tea was successfully created.' }
        format.html { redirect_to teas_url, notice: '書き込みありがとうございます' }
        format.json { render :show, status: :created, location: @tea }
      else
        format.html { render :new }
        format.json { render json: @tea.errors, status: :unprocessable_entity }
      end
    end
  end
  def hidden
    #render text: params
    #@code = 受け取ったparamsの削除コード
    #@tea = 受け取ったparamsのIDから検索したレコード
    @code = params[:tea][:code]
    @tea = Tea.find_by_id(params[:tea][:id])

    if @code == @tea.code then
      if @tea.update_attribute(:deleted,true)
        redirect_to :teas,notice: '削除成功'
      else
        redirect_to :teas,notice: 'error削除に失敗しました'
      end
    else
      flash[:notice] = '削除コードが間違っています'
      redirect_to :teas
    end

  end
  # PATCH/PUT /teas/1
  # PATCH/PUT /teas/1.json
  def update
    respond_to do |format|
      if @tea.update(tea_params)
        format.html { redirect_to @tea, notice: 'Tea was successfully updated.' }
        format.json { render :show, status: :ok, location: @tea }
      else
        format.html { render :edit }
        format.json { render json: @tea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teas/1
  # DELETE /teas/1.json
  def destroy
    @tea.destroy
    respond_to do |format|
      format.html { redirect_to teas_url, notice: 'Tea was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tea
      @tea = Tea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tea_params
      params.require(:tea).permit(:name, :title, :text, :date, :code)
    end
end
