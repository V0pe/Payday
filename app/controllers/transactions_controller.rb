class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[show edit update destroy]

  # GET /transactions or /transactions.json
  def index
    @category_id = params[:category_id]
    @transactions = Transaction.where(category_id: @category_id).order(created_at: :desc)
    @total_amount = 0
    @transactions.each do |transaction|
      @total_amount += transaction.amount
    end
  end

  # GET /transactions/1 or /transactions/1.json
  def show
    @category_id = params[:category_id]
    @transactions = Transaction.all
    @transaction = Transaction.where(id: params[:id])
    @transaction_cat_id = @transaction.first.category_id
    @category = Category.where(id: @category_id)
    @total_amount = 0
    @transactions.each do |transaction|
      @total_amount += transaction.amount
    end
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
    @categories = Category.all
  end

  # GET /transactions/1/edit
  def edit; end

  # POST /transactions or /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.user = current_user
    @category_id = params[:category_id]

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to category_transactions_url(@transaction.category_id) }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1 or /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to transaction_url(@transaction), notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1 or /transactions/1.json
  def destroy
    @transaction.destroy

    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def transaction_params
    params.require(:transaction).permit(:name, :amount, :user_id, :category_id)
  end
end
