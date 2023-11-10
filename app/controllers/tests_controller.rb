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
        ]
    end
end
