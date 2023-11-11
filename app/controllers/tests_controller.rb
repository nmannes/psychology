class TestsController < ApplicationController

    before_action :authenticate_user!

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

        if !['trail','memory','fluency'].include?(@test)
            redirect_to '/lab' and return
        end
        
    end
end
