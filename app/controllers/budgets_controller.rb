# frozen_string_literal: true

class BudgetsController < ApplicationController
  before_action :set_budget, only: %i[show edit update destroy]
  before_action :authorize_model

  # GET /budgets or /budgets.json
  def index
    @budgets = policy_scope Budget
  end

  # GET /budgets/1 or /budgets/1.json
  def show; end

  # GET /budgets/new
  def new
    @budget = Budget.new
  end

  # GET /budgets/1/edit
  def edit; end

  # POST /budgets or /budgets.json
  def create
    @budget = current_user.budgets.new(budget_params)

    respond_to do |format|
      if @budget.save
        format.html { redirect_to budget_url(@budget), notice: t('.success') }
        format.json { render :show, status: :created, location: @budget }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /budgets/1 or /budgets/1.json
  def update
    respond_to do |format|
      if @budget.update(budget_params)
        format.html { redirect_to budget_url(@budget), notice: t('.success') }
        format.json { render :show, status: :ok, location: @budget }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /budgets/1 or /budgets/1.json
  def destroy
    @budget.destroy

    respond_to do |format|
      format.html { redirect_to budgets_url, notice: t('.success') }
      format.json { head :no_content }
    end
  end

  private

  def budget_params
    params.require(:budget).permit(:name)
  end

  def set_budget
    @budget = policy_scope(Budget).find(params[:id])
  end

  def authorize_model
    logger.error "foo bar"
    logger.error @budget
    authorize @budget || Budget
  end
end
