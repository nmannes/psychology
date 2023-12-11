# frozen_string_literal: true

class ClientsController < ApplicationController
    before_action :authenticate_user!
  
    def new_client
        @education_levels = ::Constants::EDUCATION_LEVELS

    end

    def show
        @client = Client.find_by(id: params.require(:id))
        redirect_to '/' and return unless @client && current_user == @client.user
    end

    def create
        g = params.require(:gender)
        first_name = case g
        when 'Man'
            Faker::Name.male_first_name
        when 'Woman'
            Faker::Name.female_first_name
        when 'Non-binary'
            Faker::Name.neutral_first_name
        else
            raise "unidentified gender"
        end

        Client.create!(
            user: current_user,
            age: params.require(:age),
            gender: params.require(:gender),
            education: params.require(:education),
            pseudonym: "#{first_name} #{Faker::Name.last_name}",
        )

        redirect_to '/'
    end

    def update

    end
  
  end
  