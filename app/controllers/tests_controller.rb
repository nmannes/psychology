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
        new_test = ::Test.new(
            test_type: params.require(:key),
            age: params.require(:age),
            gender: params.require(:gender),
            user_id: current_user.id,
            data: {},
        )
        new_test.save!
        redirect_to new_test.url and return
    end


    def conduct
        @test = Test.find_by(id: params[:id].to_i, user_id: current_user.id)
        unless @test
            redirect_to '/lab' and return
        end
    end

    def add_word
        @test = Test.find_by(id: params[:id].to_i, user_id: current_user.id)
        unless @test
            redirect_to '/lab' and return
        end
        p '^^^'
        p params
        @test.data[params.require(:stage)] ||= []
        @test.data[params.require(:stage)] >> params.require(:word)
        @test.save!
    end

    def delete_entry
        @test = Test.find_by(id: params[:id].to_i, user_id: current_user.id)
        unless @test
            redirect_to '/lab' and return
        end
        @test.data[params.require(:stage)].delete(params.require(:word))
        @test.save!
        # this needs to trigger hotwire
    end
  
end
