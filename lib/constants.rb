module Constants
    
    TESTS = {
        'fluency' => 'Verbal Fluency Test',
        'auditory' => 'Auditory Verbal Learning Test',
        'trail' => 'Trail Making Test'
      }.freeze


    TEST_INFO_COPY = {
      'auditory' => Faker::Lorem.paragraphs,
      'fluency' => Faker::Lorem.paragraphs,
      'trail' => Faker::Lorem.paragraphs,

    }.freeze



    OFFERED_TESTS = [
        {
          key: 'fluency',
          name: TESTS['fluency'],
          auth_url: '/lab/begin?key=fluency',
          url:'/info/fluency',
          description_short: 'Cognitive function'
        },
        {
          key: 'auditory',
          name: TESTS['auditory'],
          auth_url: '/lab/begin?key=auditory',
          url: '/info/auditory',
          description_short: 'Memory and recall'
        },
        {
          key: 'trail',
          name: TESTS['trail'],
          auth_url: '/lab/begin?key=trail',
          url: '/info/trail',
          description_short: 'Visual attention and task-switching'
        }
      ]


    EDUCATION_LEVELS = [
      'No schooling completed', 
      'Nursery school to 8th grade', 
      'Some high school, no diploma',
      'High school graduate, diploma or GED', 
      'Some college credit, no degree',
      'Trade/technical/vocational training',
      'Associate degree', 
      'Bachelor’s degree', 
      'Master\'s degree', 
      'Professional degree', 
      'Doctorate degree'
  ]
end