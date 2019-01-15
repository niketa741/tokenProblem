class Tokens::TokensController < ApplicationController

	skip_before_action :verify_authenticity_token, :only => [:create]
	def index

		@tokens = Token.all
		render json: @tokens, status: :ok	
	end

	def create
		# Token.connection
		token = Token.new
		@tokens = token.generate(token)
		puts @tokens
		respond_to do |format|
			if @tokens.save
				format.html { redirect_to @tokens, notice: 'Post was successfully created.' }
        		format.json { render json: @tokens, status: :created, location: @tokens }
      		else
        		format.html { render action: "new" }
        		format.json { render json: @tokens.errors, status: :unprocessable_entity }
      		end
   		end
	end

	def new

		token = Token.new.assign
		render json: @tokens, status: :ok
	end

end
