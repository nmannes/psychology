class TestsController < ApplicationController

    before_action :authenticate_user!


    TESTS = {
        'fluency' => 'Benton Verbal Fluency Test',
        'memory' =>'Rey Auditory Verbal Learning Test',
        'trail' => 'Trail Making Test',
    }

    def show
        @test_types = [
            {
                :name => 'Benton Verbal Fluency Test',
                :url => '/lab/begin?key=fluency'
            },
            {
                :name => 'Rey Auditory Verbal Learning Test',
                :url => '/lab/begin?key=memory'
            },
            {
                :name => 'Trail Making Test',
                :url => '/lab/begin?key=trail'
            },
        ]
    end

    def begin
        @test = params.require(:key)
        @title = TESTS[@test]
        unless @title
            redirect_to '/lab' and return
        end

    end

    def demographics
        data = ::Test.new(
            test_type: params.require(:key),
            age: params.require(:age),
            gender: params.require(:gender),
            user_id: current_user.id,
        )
        data.save!
        redirect_to data.url and return
    end


    def conduct
        @test = Test.find_by(id: params[:id].to_i, user_id: current_user.id)
        unless @test
            redirect_to '/lab' and return
        end
    end
end
