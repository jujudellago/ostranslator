class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  # GET /accounts
  # GET /accounts.json
  def index
    #@accounts = current_user.accounts.all
    @accounts = policy_scope(Account)

    #AccountPolicy::Scope.new(current_user, Account).resolve

  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
      authorize @account
  end
  def openorders
    @account = Account.find(params[:account_id])
    authorize @account
    set_bt_client
  end
  def buylimit
    @account = Account.find(params[:account_id])
    authorize @account
    set_bt_client

  @uuid=params[:uuid]
  @cancel=@client.credential_get("market/cancel", {
      uuid: @uuid
    })
  #  if @cancel[0]
      @order=@client.credential_get("market/buylimit", {
          market: params[:market],
          quantity: params[:quantity],
          rate: params[:rate]
        })

  #  end
  end
  def selllimit
    @account = Account.find(params[:account_id])
    authorize @account
    set_bt_client


    @uuid=params[:uuid]
    @cancel=@client.credential_get("market/cancel", {
        uuid: @uuid
      })
  #  if @cancel[0]
      @order=@client.credential_get("market/selllimit", {
          market: params[:market],
          quantity: params[:quantity],
          rate: params[:rate]
        })

  #  end
  end
  def orderhistory
    @account = Account.find(params[:account_id])
    authorize @account
    set_bt_client
  end
  def balance
    @account = Account.find(params[:account_id])
    authorize @account
    set_bt_client
  end
  def reorder
    @account = Account.find(params[:account_id])
    authorize @account
    set_bt_client
    @uuid=params[:uuid]
    @order=@client.credential_get("account/getorder", {
        uuid: @uuid
      })



  end
  
  def actions
    @account = Account.find(params[:account_id])
      authorize @account  
    @actions=@account.actions.order(created_at: 'asc').all
    
  end
  
  # GET /accounts/new
  def new
    @account = Account.new
    authorize @account
  end

  # GET /accounts/1/edit
  def edit

      if @account.present?
        authorize @account
      else
        skip_authorization
      end
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(account_params)
    @account.user=current_user
    authorize @account
    respond_to do |format|
      if @account.save
        format.html { redirect_to [current_user,@account], notice: 'Account was successfully created.' }
        format.json { render :show, status: :created, location: [current_user,@account] }
      else
        format.html { render [current_user,:new] }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        authorize @account
        format.html { redirect_to [current_user,@account], notice: 'Account was successfully updated.' }
        format.json { render :show, status: :ok, location: [current_user,@account] }
      else
        skip_authorization
        format.html { render [current_user,:edit] }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    authorize @account
    @account.destroy
    respond_to do |format|
      format.html { redirect_to user_accounts_url(current_user), notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end
    def set_bt_client
    #@client=Bittrex.config do |c|
    #  c.key = @account.api_key
    #  c.secret = @account.api_secret
    #
    #end
    @bc=Bittrex.configuration
    @bc.key = @account.api_key
    @bc.secret = @account.api_secret

    @client=Bittrex.client


    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:name, :api_key, :api_secret, :enabled, :comments)
    end
end
