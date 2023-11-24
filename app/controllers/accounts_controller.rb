# frozen_string_literal: true

class AccountsController < ApplicationController
    before_action :authenticate_user!
  
 
    def show
        @tests = Test.where(user_id: current_user.id)
    end
  
  end
  