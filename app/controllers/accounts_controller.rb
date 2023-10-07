# frozen_string_literal: true

class AccountsController < ApplicationController
  before_action :set_budget
  before_action :set_account, only: %i[show edit update destroy]
  before_action :authorize_model

  # GET /budgets/:budget_id/accounts/1 or /budgets/:budget_id/accounts/1.json
  def show; end

  # GET /budgets/:budget_id/accounts/new
  def new
    @account = @budget.accounts.build
  end

  # GET /budgets/:budget_id/accounts/1/edit
  def edit; end

  # POST /budgets/:budget_id/accounts or /budgets/:budget_id/accounts.json
  def create
    @account = @budget.accounts.create(account_params)

    respond_to do |format|
      if @account.save
        format.html { redirect_to budget_url(@budget), notice: t('.success') }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /budgets/:budget_id/accounts/1 or /budgets/:budget_id/accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to budget_account_url(@budget, @account), notice: t('.success') }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /budgets/:budget_id/accounts/1 or /budgets/:budget_id/accounts/1.json
  def destroy
    @account.destroy

    respond_to do |format|
      format.html { redirect_to budget_url(@budget), notice: t('.success') }
      format.json { head :no_content }
    end
  end

  private

  def set_budget
    @budget = Budget.find(params[:budget_id])
  end

  def set_account
    @account = Account.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def account_params
    params.require(:account).permit(:name, :credit)
  end

  def authorize_model
    authorize @account || Account
  end
end
