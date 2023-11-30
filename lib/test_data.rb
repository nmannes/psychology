module TestData

    def self.fetch_words(key)
        @@cache ||= {}
        return [] if !['animal','f','a','s'].include?(key)
        return @@cache[key] if @@cache[key]
        fn = {
            'animal' => :animal,
            'f' => :f_words,
            's' => :s_words,
            'a' => :a_words,
        }[key]

        @@cache[key] = self.method(fn).call.split("\n").map(&:strip).map(&:downcase)
        @@cache[key]
    end


    def self.animal
    <<-TEXT
        Aardvark
        Abyssinian
        Adelie Penguin
        Affenpinscher
        Afghan Hound
        African Bush Elephant
        African Civet
        African Clawed Frog
        African Forest Elephant
        African Palm Civet
        African Penguin
        African Tree Toad
        African Wild Dog
        Ainu Dog
        Airedale Terrier
        Akbash
        Akita
        Alaskan Malamute
        Albatross
        Aldabra Giant Tortoise
        Alligator
        Alpaca
        Alpine Dachsbracke
        Amazon River Dolphin (Pink Dolphin)
        American Alsatian
        American Bulldog
        American Cocker Spaniel
        American Coonhound
        American Eskimo Dog
        American Foxhound
        American Pit Bull Terrier
        American Staffordshire Terrier
        American Water Spaniel
        Amur Leopard
        Anatolian Shepherd Dog
        Anchovies
        Angelfish
        Ant
        Anteater
        Antelope
        Appenzeller Dog
        Arapaima
        Arctic Fox
        Arctic Hare
        Arctic Wolf
        Armadillo
        Asian Elephant
        Asian Giant Hornet
        Asian Palm Civet
        Asiatic Black Bear
        Aurochs
        Australian Cattle Dog
        Australian Kelpie Dog
        Australian Mist
        Australian Shepherd
        Australian Terrier
        Avocet
        Axolotl
        Aye Aye
        Baboon
        Bactrian Camel
        Badger
        Baiji
        Balinese
        Banded Palm Civet
        Bandicoot
        Barb
        Barn Owl
        Barnacle
        Barracuda
        Barramundi Fish
        Basenji Dog
        Basking Shark
        Basset Fauve de Bretagne
        Basset Hound
        Bat
        Bavarian Mountain Hound
        Beagle
        Bear
        Bearded Collie
        Bearded Dragon
        Beaver
        Bedlington Terrier
        Beetle
        Beluga Sturgeon
        Bengal Tiger
        Bernese Mountain Dog
        Bichir
        Bichon Frise
        Biewer Terrier
        Binturong
        Bird
        Birds Of Paradise
        Birman
        Bison
        Black Marlin
        Black Rhinoceros
        Black Russian Terrier
        Black Widow Spider
        Blobfish
        Bloodhound
        Blue Jay
        Blue Lacy Dog
        Blue Whale
        Bluetick Coonhound
        Bobcat
        Bolognese Dog
        Bombay
        Bongo
        Bonito Fish
        Bonobo
        Booby
        Border Collie
        Border Terrier
        Bornean Orang-utan
        Borneo Elephant
        Boston Terrier: Complete Pet Guide
        Bottlenose Dolphin
        Bowfin
        Bowhead Whale
        Boxer Dog
        Boykin Spaniel
        Brazilian Terrier
        British Timber
        Brown Bear
        Budgerigar
        Buffalo
        Bull Shark
        Bull Terrier
        Bulldog
        Bullfrog
        Bullmastiff
        Bumblebee
        Burmese
        Burrowing Frog
        Butterfly
        Butterfly Fish
        Caiman
        Caiman Lizard
        Cairn Terrier
        Camel
        Camel Spider
        Canaan Dog
        Canadian Eskimo Dog
        Capybara
        Caracal
        Carolina Dog
        Carp
        Cassowary
        Cat
        Caterpillar
        Catfish
        Cavalier King Charles Spaniel
        Centipede
        Cesky Fousek
        Chameleon
        Chamois
        Cheetah
        Chesapeake Bay Retriever
        Chicken
        Chihuahua
        Chimaera
        Chimpanzee
        Chinchilla
        Chinese Crested Dog
        Chinook
        Chinstrap Penguin
        Chipmunk
        Chow Chow
        Cichlid
        Clouded Leopard
        Clownfish
        Clumber Spaniel
        Coati
        Cockatoo
        Cockroach
        Coelacanth
        Collared Peccary
        Collie
        Colossal Squid
        Common Buzzard
        Common Frog
        Common Loon
        Common Toad
        Cooper’s Hawk
        Coral
        Cotton-top Tamarin
        Cougar
        Cow
        Coyote
        Crab
        Crab-Eating Macaque
        Crane
        Crested Penguin
        Crocodile
        Cross River Gorilla
        Curly Coated Retriever
        Cuscus
        Cuttlefish
        Dachshund
        Dalmatian
        Darwin's Frog
        Deer
        Desert Tortoise
        Deutsche Bracke
        Dhole
        Dingo
        Discus
        Doberman Pinscher
        Dodo
        Dog
        Dogo Argentino
        Dogue De Bordeaux
        Dolphin
        Donkey
        Dormouse
        Dragonfish
        Dragonfly
        Drever
        Drum Fish
        Duck
        Dugong
        Dunker
        Dusky Dolphin
        Dwarf Crocodile
        Eagle
        Earwig
        Eastern Gorilla
        Eastern Lowland Gorilla
        Echidna
        Edible Frog
        Eel
        Egyptian Mau
        Electric Eel
        Elephant
        Elephant Seal
        Elephant Shrew
        Emperor Penguin
        Emperor Tamarin
        Emu
        English Cocker Spaniel
        English Shepherd
        English Springer Spaniel
        Entlebucher Mountain Dog
        Epagneul Pont Audemer
        Ermine
        Eskimo Dog
        Estrela Mountain Dog
        Falcon
        False Killer Whale
        Fangtooth
        Fennec Fox
        Ferret
        Field Spaniel
        Fin Whale
        Finnish Spitz
        Fire-Bellied Toad
        Fish
        Fishing Cat
        Flamingo
        Flat Coat Retriever
        Flounder
        Fluke Fish
        Fly
        Flying Squirrel
        Fossa
        Fox
        Fox Terrier
        French Bulldog
        Frigatebird
        Frilled Lizard
        Frilled Shark
        Frog
        Fur Seal
        Galapagos Penguin
        Galapagos Tortoise
        Gar
        Gecko
        Gentoo Penguin
        Geoffroys Tamarin
        Gerbil
        German Pinscher
        German Shepherd Guide
        Gharial
        Giant African Land Snail
        Giant Clam
        Giant Panda Bear
        Giant Schnauzer
        Gibbon
        Gila Monster
        Giraffe
        Glass Lizard
        Glow Worm
        Goat
        Goblin Shark
        Golden Lion Tamarin
        Golden Masked Owl
        Golden Oriole
        Golden Retriever Complete Pet Guide
        Golden-Crowned Flying Fox
        Goose
        Gopher
        Gorilla
        Grasshopper
        Great Dane
        Great Pyrenees
        Great White Shark
        Greater Swiss Mountain Dog
        Green Anole
        Green Bee-Eater
        Greenland Dog
        Grey Mouse Lemur
        Grey Reef Shark
        Grey Seal
        Greyhound
        Grizzly Bear
        Grouse
        Guinea Fowl
        Guinea Pig
        Guppy
        Hagfish
        Hammerhead Shark
        Hamster
        Hare
        Harpy Eagle
        Harrier
        Havanese
        Hawaiian Crow
        Hedgehog
        Hercules Beetle
        Hermit Crab
        Heron
        Herring
        Highland Cattle
        Himalayan
        Hippopotamus
        Honey Badger
        Honey Bee
        Hoopoe
        Horn Shark
        Hornbill
        Horned Frog
        Horse
        Horseshoe Crab
        Howler Monkey
        Human
        Humboldt Penguin
        Hummingbird
        Humpback Whale
        Hyena
        Ibis
        Ibizan Hound
        Iguana
        Immortal Jellyfish
        Impala
        Indian Elephant
        Indian Palm Squirrel
        Indian Rhinoceros
        Indian Star Tortoise
        Indochinese Tiger
        Indri
        Insects
        Irish Setter Complete Pet Guide
        Irish WolfHound
        Italian Greyhound
        Jack Russel
        Jackal
        Jaguar
        Japanese Chin
        Japanese Macaque
        Javan Rhinoceros
        Javanese
        Jellyfish
        Jerboa
        Kakapo
        Kangaroo
        Keel-Billed Toucan
        Keeshond
        Killer Whale
        King Cobra
        King Crab
        King Penguin
        Kingfisher
        Kiwi
        Koala
        Komodo Dragon
        Krill
        Kudu
        Labradoodle
        Labrador Retriever
        Ladybug
        Lamprey
        Leaf-Tailed Gecko
        Lemming
        Lemur
        Leopard
        Leopard Cat
        Leopard Seal
        Leopard Tortoise
        Liger
        Lion
        Lionfish
        Little Penguin
        Lizard
        Llama
        Lobster
        Long-Eared Owl
        Lungfish
        Lynx
        Macaroni Penguin
        Macaw
        Magellanic Penguin
        Magpie
        Maine Coon
        Malayan Civet
        Malayan Tiger
        Maltese
        Mammals
        Manatee
        Mandrill
        Maned Wolf
        Manta Ray
        Marine Toad
        Markhor
        Marmot
        Marsh Frog
        Masked Palm Civet
        Mastiff
        Mayfly
        Meerkat
        Megalodon
        Mexican Free-Tailed Bat
        Milkfish
        Millipede
        Mink
        Minke Whale
        Mole
        Molly
        Monarch Butterfly
        Mongoose
        Mongrel
        Monitor Lizard
        Monkey
        Monkfish
        Monte Iberia Eleuth
        Moorhen
        Moose
        Moray Eel
        Moth
        Mountain Gorilla
        Mountain Lion
        Mouse
        Mule
        Muskrat
        Narwhal
        Neanderthal
        Neapolitan Mastiff
        Newfoundland
        Newt
        Nightingale
        Norfolk Terrier
        North American Black Bear
        Northern Inuit Dog
        Norwegian Forest
        Numbat
        Nurse Shark
        Ocelot
        Octopus
        Okapi
        Old English Sheepdog
        Olm
        Opossum
        Orang-utan
        Ostrich
        Otter
        Oyster
        Paddlefish
        Pademelon
        Pangolin
        Panther
        Parrot
        Patas Monkey
        Peacock
        Pekingese
        Pelican
        Penguin
        Pere Davids Deer
        Peregrine Falcon
        Persian
        Petit Basset Griffon Vendéen
        Pheasant
        Pied Tamarin
        Pig
        Pika
        Pike Fish
        Pink Fairy Armadillo
        Piranha
        Platypus
        Pointer
        Poison Dart Frog
        Polar Bear
        Pond Skater
        Poodle
        Pool Frog
        Porcupine
        Porpoise
        Possum
        Prawn
        Proboscis Monkey
        Pufferfish
        Puffin
        Pug
        Puma
        Purple Emperor Butterfly
        Puss Moth
        Pygmy Hippopotamus
        Pygmy Marmoset
        Quail
        Quetzal
        Quokka
        Quoll
        Rabbit
        Raccoon
        Raccoon Dog
        Radiated Tortoise
        Ragdoll
        Rat
        Rattlesnake
        Red Finch
        Red Fox
        Red Knee Tarantula
        Red Panda
        Red Wolf
        Red-handed Tamarin
        Reindeer
        Rhinoceros
        River Turtle
        Robin
        Rock Hyrax
        Rockfish
        Rockhopper Penguin
        Roseate Spoonbill
        Rottweiler
        Royal Penguin
        Russian Blue
        Saarloos Wolfdog
        Saber-Toothed Tiger
        Sable
        Saiga
        Saint Bernard
        Salamander
        Salmon
        Samoyed
        Sand Lizard
        Saola
        Sardines
        Sawfish
        Scimitar-horned Oryx
        Scorpion
        Scorpion Fish
        Sea Dragon
        Sea Lion
        Sea Otter
        Sea Slug
        Sea Squirt
        Sea Turtle
        Sea Urchin
        Seahorse
        Seal
        Serval
        Shark
        Sheep
        Shiba Inu
        Shih Tzu
        Shrimp
        Siamese
        Siamese Fighting Fish
        Siberian
        Siberian Husky
        Siberian Tiger
        Silver Dollar
        Skate Fish
        Skunk
        Sloth
        Slow Worm
        Snail
        Snake
        Snapping Turtle
        Snowshoe
        Snowy Owl
        Somali
        South China Tiger
        Spadefoot Toad
        Sparrow
        Spectacled Bear
        Sperm Whale
        Spider Monkey
        Spiny Dogfish
        Spixs Macaw
        Sponge
        Squid
        Squirrel
        Squirrel Monkey
        Sri Lankan Elephant
        Staffordshire Bull Terrier
        Stag Beetle
        Starfish
        Steller’s Sea Cow
        Stick Insect
        Stingray
        Stoat
        Striped Rocket Frog
        Sturgeon
        Sucker Fish
        Sugar Glider
        Sumatran Elephant
        Sumatran Orang-utan
        Sumatran Rhinoceros
        Sumatran Tiger
        Sun Bear
        Swai Fish
        Swan
        Swedish Vallhund
        Tamaskan
        Tang
        Tapanuli Orang-utan
        Tapir
        Tarpon
        Tarsier
        Tasmanian Devil
        Tawny Owl
        Teddy Roosevelt Terrier
        Termite
        Tetra
        Thorny Devil
        Tibetan Mastiff
        Tiffany
        Tiger
        Tiger Salamander
        Tiger Shark
        Tortoise
        Toucan
        Tree Frog
        Tropicbird
        Tuatara
        Turkey
        Turkish Angora
        Uakari
        Uguisu
        Umbrellabird
        Utonagan
        Vampire Bat
        Vampire Squid
        Vaquita
        Vervet Monkey
        Vulture
        Wallaby
        Walleye Fish
        Walrus
        Wandering Albatross
        Warthog
        Wasp
        Water Buffalo
        Water Dragon
        Water Vole
        Weasel
        Welsh Corgi: The Complete Pet Guide
        West Highland Terrier
        Western Gorilla
        Western Lowland Gorilla
        Whale Shark
        Whippet
        White Rhinoceros
        White Tiger
        White-Faced Capuchin
        Wild Boar
        Wildebeest
        Wolf
        Wolf Eel
        Wolf Spider
        Wolffish
        Wolverine
        Wombat
        Woodlouse
        Woodpecker
        Woolly Mammoth
        Woolly Monkey
        Wrasse
        Wyoming Toad
        X-Ray Tetra
        Xerus
        Yak
        Yellow-Eyed Penguin
        Yorkshire Terrier
        Zebra
        Zebra Shark
        Zebu
        Zonkey
        Zorse
    TEXT
    end

    def self.a_words
        <<-TEXT
        a
        aa
        aaa
        aaron
        ab
        abandoned
        abc
        aberdeen
        abilities
        ability
        able
        aboriginal
        abortion
        about
        above
        abraham
        abroad
        abs
        absence
        absent
        absolute
        absolutely
        absorption
        abstract
        abstracts
        abu
        abuse
        ac
        academic
        academics
        academy
        acc
        accent
        accept
        acceptable
        acceptance
        accepted
        accepting
        accepts
        access
        accessed
        accessibility
        accessible
        accessing
        accessories
        accessory
        accident
        accidents
        accommodate
        accommodation
        accommodations
        accompanied
        accompanying
        accomplish
        accomplished
        accordance
        according
        accordingly
        account
        accountability
        accounting
        accounts
        accreditation
        accredited
        accuracy
        accurate
        accurately
        accused
        acdbentity
        ace
        acer
        achieve
        achieved
        achievement
        achievements
        achieving
        acid
        acids
        acknowledge
        acknowledged
        acm
        acne
        acoustic
        acquire
        acquired
        acquisition
        acquisitions
        acre
        acres
        acrobat
        across
        acrylic
        act
        acting
        action
        actions
        activated
        activation
        active
        actively
        activists
        activities
        activity
        actor
        actors
        actress
        acts
        actual
        actually
        acute
        ad
        ada
        adam
        adams
        adaptation
        adapted
        adapter
        adapters
        adaptive
        adaptor
        add
        added
        addiction
        adding
        addition
        additional
        additionally
        additions
        address
        addressed
        addresses
        addressing
        adds
        adelaide
        adequate
        adidas
        adipex
        adjacent
        adjust
        adjustable
        adjusted
        adjustment
        adjustments
        admin
        administered
        administration
        administrative
        administrator
        administrators
        admission
        admissions
        admit
        admitted
        adobe
        adolescent
        adopt
        adopted
        adoption
        adrian
        ads
        adsl
        adult
        adults
        advance
        advanced
        advancement
        advances
        advantage
        advantages
        adventure
        adventures
        adverse
        advert
        advertise
        advertisement
        advertisements
        advertiser
        advertisers
        advertising
        advice
        advise
        advised
        advisor
        advisors
        advisory
        advocacy
        advocate
        adware
        ae
        aerial
        aerospace
        af
        affair
        affairs
        affect
        affected
        affecting
        affects
        affiliate
        affiliated
        affiliates
        affiliation
        afford
        affordable
        afghanistan
        afraid
        africa
        african
        after
        afternoon
        afterwards
        ag
        again
        against
        age
        aged
        agencies
        agency
        agenda
        agent
        agents
        ages
        aggregate
        aggressive
        aging
        ago
        agree
        agreed
        agreement
        agreements
        agrees
        agricultural
        agriculture
        ah
        ahead
        ai
        aid
        aids
        aim
        aimed
        aims
        air
        aircraft
        airfare
        airline
        airlines
        airplane
        airport
        airports
        aj
        ak
        aka
        al
        ala
        alabama
        alan
        alarm
        alaska
        albania
        albany
        albert
        alberta
        album
        albums
        albuquerque
        alcohol
        alert
        alerts
        alex
        alexander
        alexandria
        alfred
        algebra
        algeria
        algorithm
        algorithms
        ali
        alias
        alice
        alien
        align
        alignment
        alike
        alive
        all
        allah
        allan
        alleged
        allen
        allergy
        alliance
        allied
        allocated
        allocation
        allow
        allowance
        allowed
        allowing
        allows
        alloy
        almost
        alone
        along
        alot
        alpha
        alphabetical
        alpine
        already
        also
        alt
        alter
        altered
        alternate
        alternative
        alternatively
        alternatives
        although
        alto
        aluminium
        aluminum
        alumni
        always
        am
        amanda
        amateur
        amazing
        amazon
        amazoncom
        amazoncouk
        ambassador
        amber
        ambien
        ambient
        amd
        amend
        amended
        amendment
        amendments
        amenities
        america
        american
        americans
        americas
        amino
        among
        amongst
        amount
        amounts
        amp
        ampland
        amplifier
        amsterdam
        amy
        an
        ana
        anaheim
        anal
        analog
        analyses
        analysis
        analyst
        analysts
        analytical
        analyze
        analyzed
        anatomy
        anchor
        ancient
        and
        andale
        anderson
        andorra
        andrea
        andreas
        andrew
        andrews
        andy
        angel
        angela
        angeles
        angels
        anger
        angle
        angola
        angry
        animal
        animals
        animated
        animation
        anime
        ann
        anna
        anne
        annex
        annie
        anniversary
        annotated
        annotation
        announce
        announced
        announcement
        announcements
        announces
        annoying
        annual
        annually
        anonymous
        another
        answer
        answered
        answering
        answers
        ant
        antarctica
        antenna
        anthony
        anthropology
        anti
        antibodies
        antibody
        anticipated
        antigua
        antique
        antiques
        antivirus
        antonio
        anxiety
        any
        anybody
        anymore
        anyone
        anything
        anytime
        anyway
        anywhere
        aol
        ap
        apache
        apart
        apartment
        apartments
        api
        apnic
        apollo
        app
        apparatus
        apparel
        apparent
        apparently
        appeal
        appeals
        appear
        appearance
        appeared
        appearing
        appears
        appendix
        apple
        appliance
        appliances
        applicable
        applicant
        applicants
        application
        applications
        applied
        applies
        apply
        applying
        appointed
        appointment
        appointments
        appraisal
        appreciate
        appreciated
        appreciation
        approach
        approaches
        appropriate
        appropriations
        approval
        approve
        approved
        approx
        approximate
        approximately
        apps
        apr
        april
        apt
        aqua
        aquarium
        aquatic
        ar
        arab
        arabia
        arabic
        arbitrary
        arbitration
        arc
        arcade
        arch
        architect
        architects
        architectural
        architecture
        archive
        archived
        archives
        arctic
        are
        area
        areas
        arena
        arg
        argentina
        argue
        argued
        argument
        arguments
        arise
        arising
        arizona
        arkansas
        arlington
        arm
        armed
        armenia
        armor
        arms
        armstrong
        army
        arnold
        around
        arrange
        arranged
        arrangement
        arrangements
        array
        arrest
        arrested
        arrival
        arrivals
        arrive
        arrived
        arrives
        arrow
        art
        arthritis
        arthur
        article
        articles
        artificial
        artist
        artistic
        artists
        arts
        artwork
        aruba
        as
        asbestos
        ascii
        ash
        ashley
        asia
        asian
        aside
        asin
        ask
        asked
        asking
        asks
        asn
        asp
        aspect
        aspects
        aspnet
        ass
        assault
        assembled
        assembly
        assess
        assessed
        assessing
        assessment
        assessments
        asset
        assets
        assign
        assigned
        assignment
        assignments
        assist
        assistance
        assistant
        assisted
        assists
        associate
        associated
        associates
        association
        associations
        assume
        assumed
        assumes
        assuming
        assumption
        assumptions
        assurance
        assure
        assured
        asthma
        astrology
        astronomy
        asus
        at
        ata
        ate
        athens
        athletes
        athletic
        athletics
        ati
        atlanta
        atlantic
        atlas
        atm
        atmosphere
        atmospheric
        atom
        atomic
        attach
        attached
        attachment
        attachments
        attack
        attacked
        attacks
        attempt
        attempted
        attempting
        attempts
        attend
        attendance
        attended
        attending
        attention
        attitude
        attitudes
        attorney
        attorneys
        attract
        attraction
        attractions
        attractive
        attribute
        attributes
        au
        auburn
        auckland
        auction
        auctions
        aud
        audi
        audience
        audio
        audit
        auditor
        aug
        august
        aurora
        aus
        austin
        australia
        australian
        austria
        authentic
        authentication
        author
        authorities
        authority
        authorization
        authorized
        authors
        auto
        automated
        automatic
        automatically
        automation
        automobile
        automobiles
        automotive
        autos
        autumn
        av
        availability
        available
        avatar
        ave
        avenue
        average
        avg
        avi
        aviation
        avoid
        avoiding
        avon
        aw
        award
        awarded
        awards
        aware
        awareness
        away
        awesome
        awful
        axis
        aye
        az
        azerbaijan
        TEXT
    end

    def self.f_words
        <<-TEXT
        fa
        fabric
        fabrics
        fabulous
        face
        faced
        faces
        facial
        facilitate
        facilities
        facility
        facing
        fact
        factor
        factors
        factory
        facts
        faculty
        fail
        failed
        failing
        fails
        failure
        failures
        fair
        fairfield
        fairly
        fairy
        faith
        fake
        fall
        fallen
        falling
        falls
        false
        fame
        familiar
        families
        family
        famous
        fan
        fancy
        fans
        fantastic
        fantasy
        faq
        faqs
        far
        fare
        fares
        farm
        farmer
        farmers
        farming
        farms
        fascinating
        fashion
        fast
        faster
        fastest
        fat
        fatal
        fate
        father
        fathers
        fatty
        fault
        favor
        favorite
        favorites
        favors
        favour
        favourite
        favourites
        fax
        fbi
        fc
        fcc
        fd
        fda
        fe
        fear
        fears
        feat
        feature
        featured
        features
        featuring
        feb
        february
        fed
        federal
        federation
        fee
        feed
        feedback
        feeding
        feeds
        feel
        feeling
        feelings
        feels
        fees
        feet
        fell
        fellow
        fellowship
        felt
        female
        females
        fence
        feof
        ferrari
        ferry
        festival
        festivals
        fetish
        fever
        few
        fewer
        ff
        fg
        fi
        fiber
        fibre
        fiction
        field
        fields
        fifteen
        fifth
        fifty
        fig
        fight
        fighter
        fighters
        fighting
        figure
        figured
        figures
        fiji
        file
        filed
        filename
        files
        filing
        fill
        filled
        filling
        film
        filme
        films
        filter
        filtering
        filters
        fin
        final
        finally
        finals
        finance
        finances
        financial
        financing
        find
        findarticles
        finder
        finding
        findings
        findlaw
        finds
        fine
        finest
        finger
        fingering
        fingers
        finish
        finished
        finishing
        finite
        finland
        finnish
        fioricet
        fire
        fired
        firefox
        fireplace
        fires
        firewall
        firewire
        firm
        firms
        firmware
        first
        fiscal
        fish
        fisher
        fisheries
        fishing
        fist
        fisting
        fit
        fitness
        fits
        fitted
        fitting
        five
        fix
        fixed
        fixes
        fixtures
        fl
        fla
        flag
        flags
        flame
        flash
        flashers
        flashing
        flat
        flavor
        fleece
        fleet
        flesh
        flex
        flexibility
        flexible
        flickr
        flight
        flights
        flip
        float
        floating
        flood
        floor
        flooring
        floors
        floppy
        floral
        florence
        florida
        florist
        florists
        flour
        flow
        flower
        flowers
        flows
        floyd
        flu
        fluid
        flush
        flux
        fly
        flyer
        flying
        fm
        fo
        foam
        focal
        focus
        focused
        focuses
        focusing
        fog
        fold
        folder
        folders
        folding
        folk
        folks
        follow
        followed
        following
        follows
        font
        fonts
        foo
        food
        foods
        fool
        foot
        footage
        football
        footwear
        for
        forbes
        forbidden
        force
        forced
        forces
        ford
        forecast
        forecasts
        foreign
        forest
        forestry
        forests
        forever
        forge
        forget
        forgot
        forgotten
        fork
        form
        formal
        format
        formation
        formats
        formatting
        formed
        former
        formerly
        forming
        forms
        formula
        fort
        forth
        fortune
        forty
        forum
        forums
        forward
        forwarding
        fossil
        foster
        foto
        fotos
        fought
        foul
        found
        foundation
        foundations
        founded
        founder
        fountain
        four
        fourth
        fox
        fp
        fr
        fraction
        fragrance
        fragrances
        frame
        framed
        frames
        framework
        framing
        france
        franchise
        francis
        francisco
        frank
        frankfurt
        franklin
        fraser
        fraud
        fred
        frederick
        free
        freebsd
        freedom
        freelance
        freely
        freeware
        freeze
        freight
        french
        frequencies
        frequency
        frequent
        frequently
        fresh
        fri
        friday
        fridge
        friend
        friendly
        friends
        friendship
        frog
        from
        front
        frontier
        frontpage
        frost
        frozen
        fruit
        fruits
        fs
        ft
        ftp
        fu
        fuck
        fucked
        fucking
        fuel
        fuji
        fujitsu
        full
        fully
        fun
        function
        functional
        functionality
        functioning
        functions
        fund
        fundamental
        fundamentals
        funded
        funding
        fundraising
        funds
        funeral
        funk
        funky
        funny
        fur
        furnished
        furnishings
        furniture
        further
        furthermore
        fusion
        future
        futures
        fuzzy
        TEXT
    end

    def self.s_words
        <<-TEXT
        sacramento
        sacred
        sacrifice
        sad
        saddam
        safari
        safe
        safely
        safer
        safety
        sage
        sagem
        said
        sail
        sailing
        saint
        saints
        sake
        salad
        salaries
        salary
        sale
        salem
        sales
        sally
        salmon
        salon
        salt
        salvador
        salvation
        sam
        samba
        same
        samoa
        sample
        samples
        sampling
        samsung
        samuel
        san
        sand
        sandra
        sandwich
        sandy
        sans
        santa
        sanyo
        sao
        sap
        sapphire
        sara
        sarah
        sas
        saskatchewan
        sat
        satellite
        satin
        satisfaction
        satisfactory
        satisfied
        satisfy
        saturday
        saturn
        sauce
        saudi
        savage
        savannah
        save
        saved
        saver
        saves
        saving
        savings
        saw
        say
        saying
        says
        sb
        sbjct
        sc
        scale
        scales
        scan
        scanned
        scanner
        scanners
        scanning
        scary
        scenario
        scenarios
        scene
        scenes
        scenic
        schedule
        scheduled
        schedules
        scheduling
        schema
        scheme
        schemes
        scholar
        scholars
        scholarship
        scholarships
        school
        schools
        sci
        science
        sciences
        scientific
        scientist
        scientists
        scoop
        scope
        score
        scored
        scores
        scoring
        scotia
        scotland
        scott
        scottish
        scout
        scratch
        screen
        screening
        screens
        screensaver
        screensavers
        screenshot
        screenshots
        screw
        script
        scripting
        scripts
        scroll
        scsi
        scuba
        sculpture
        sd
        se
        sea
        seafood
        seal
        sealed
        sean
        search
        searchcom
        searched
        searches
        searching
        seas
        season
        seasonal
        seasons
        seat
        seating
        seats
        seattle
        sec
        second
        secondary
        seconds
        secret
        secretariat
        secretary
        secrets
        section
        sections
        sector
        sectors
        secure
        secured
        securely
        securities
        security
        see
        seed
        seeds
        seeing
        seek
        seeker
        seekers
        seeking
        seeks
        seem
        seemed
        seems
        seen
        sees
        sega
        segment
        segments
        select
        selected
        selecting
        selection
        selections
        selective
        self
        sell
        seller
        sellers
        selling
        sells
        semester
        semi
        semiconductor
        seminar
        seminars
        sen
        senate
        senator
        senators
        send
        sender
        sending
        sends
        senegal
        senior
        seniors
        sense
        sensitive
        sensitivity
        sensor
        sensors
        sent
        sentence
        sentences
        seo
        sep
        separate
        separated
        separately
        separation
        sept
        september
        seq
        sequence
        sequences
        ser
        serbia
        serial
        series
        serious
        seriously
        serum
        serve
        served
        server
        servers
        serves
        service
        services
        serving
        session
        sessions
        set
        sets
        setting
        settings
        settle
        settled
        settlement
        setup
        seven
        seventh
        several
        severe
        sewing
        sex
        sexcam
        sexo
        sexual
        sexuality
        sexually
        sexy
        sf
        sg
        sh
        shade
        shades
        shadow
        shadows
        shaft
        shake
        shakespeare
        shakira
        shall
        shame
        shanghai
        shannon
        shape
        shaped
        shapes
        share
        shared
        shareholders
        shares
        shareware
        sharing
        shark
        sharon
        sharp
        shaved
        shaw
        she
        shed
        sheep
        sheer
        sheet
        sheets
        sheffield
        shelf
        shell
        shelter
        shemale
        shemales
        shepherd
        sheriff
        sherman
        shield
        shift
        shine
        ship
        shipment
        shipments
        shipped
        shipping
        ships
        shirt
        shirts
        shit
        shock
        shoe
        shoes
        shoot
        shooting
        shop
        shopper
        shoppercom
        shoppers
        shopping
        shoppingcom
        shops
        shopzilla
        shore
        short
        shortcuts
        shorter
        shortly
        shorts
        shot
        shots
        should
        shoulder
        show
        showcase
        showed
        shower
        showers
        showing
        shown
        shows
        showtimes
        shut
        shuttle
        si
        sic
        sick
        side
        sides
        sie
        siemens
        sierra
        sig
        sight
        sigma
        sign
        signal
        signals
        signature
        signatures
        signed
        significance
        significant
        significantly
        signing
        signs
        signup
        silence
        silent
        silicon
        silk
        silly
        silver
        sim
        similar
        similarly
        simon
        simple
        simplified
        simply
        simpson
        simpsons
        sims
        simulation
        simulations
        simultaneously
        sin
        since
        sing
        singapore
        singer
        singh
        singing
        single
        singles
        sink
        sip
        sir
        sister
        sisters
        sit
        site
        sitemap
        sites
        sitting
        situated
        situation
        situations
        six
        sixth
        size
        sized
        sizes
        sk
        skating
        ski
        skiing
        skill
        skilled
        skills
        skin
        skins
        skip
        skirt
        skirts
        sku
        sky
        skype
        sl
        slave
        sleep
        sleeping
        sleeps
        sleeve
        slide
        slides
        slideshow
        slight
        slightly
        slim
        slip
        slope
        slot
        slots
        slovak
        slovakia
        slovenia
        slow
        slowly
        slut
        sluts
        sm
        small
        smaller
        smart
        smell
        smile
        smilies
        smith
        smithsonian
        smoke
        smoking
        smooth
        sms
        smtp
        sn
        snake
        snap
        snapshot
        snow
        snowboard
        so
        soa
        soap
        soc
        soccer
        social
        societies
        society
        sociology
        socket
        socks
        sodium
        sofa
        soft
        softball
        software
        soil
        sol
        solar
        solaris
        sold
        soldier
        soldiers
        sole
        solely
        solid
        solo
        solomon
        solution
        solutions
        solve
        solved
        solving
        soma
        somalia
        some
        somebody
        somehow
        someone
        somerset
        something
        sometimes
        somewhat
        somewhere
        son
        song
        songs
        sonic
        sons
        sony
        soon
        soonest
        sophisticated
        sorry
        sort
        sorted
        sorts
        sought
        soul
        souls
        sound
        sounds
        soundtrack
        soup
        source
        sources
        south
        southampton
        southeast
        southern
        southwest
        soviet
        sox
        sp
        spa
        space
        spaces
        spain
        spam
        span
        spanish
        spank
        spanking
        sparc
        spare
        spas
        spatial
        speak
        speaker
        speakers
        speaking
        speaks
        spears
        spec
        special
        specialist
        specialists
        specialized
        specializing
        specially
        specials
        specialties
        specialty
        species
        specific
        specifically
        specification
        specifications
        specifics
        specified
        specifies
        specify
        specs
        spectacular
        spectrum
        speech
        speeches
        speed
        speeds
        spell
        spelling
        spencer
        spend
        spending
        spent
        sperm
        sphere
        spice
        spider
        spies
        spin
        spine
        spirit
        spirits
        spiritual
        spirituality
        split
        spoke
        spoken
        spokesman
        sponsor
        sponsored
        sponsors
        sponsorship
        sport
        sporting
        sports
        spot
        spotlight
        spots
        spouse
        spray
        spread
        spreading
        spring
        springer
        springfield
        springs
        sprint
        spy
        spyware
        sq
        sql
        squad
        square
        squirt
        squirting
        sr
        src
        sri
        ss
        ssl
        st
        stability
        stable
        stack
        stadium
        staff
        staffing
        stage
        stages
        stainless
        stakeholders
        stamp
        stamps
        stan
        stand
        standard
        standards
        standing
        standings
        stands
        stanford
        stanley
        star
        starring
        stars
        starsmerchant
        start
        started
        starter
        starting
        starts
        startup
        stat
        state
        stated
        statement
        statements
        states
        statewide
        static
        stating
        station
        stationery
        stations
        statistical
        statistics
        stats
        status
        statute
        statutes
        statutory
        stay
        stayed
        staying
        stays
        std
        ste
        steady
        steal
        steam
        steel
        steering
        stem
        step
        stephanie
        stephen
        steps
        stereo
        sterling
        steve
        steven
        stevens
        stewart
        stick
        sticker
        stickers
        sticks
        sticky
        still
        stock
        stockholm
        stockings
        stocks
        stolen
        stomach
        stone
        stones
        stood
        stop
        stopped
        stopping
        stops
        storage
        store
        stored
        stores
        stories
        storm
        story
        str
        straight
        strain
        strand
        strange
        stranger
        strap
        strategic
        strategies
        strategy
        stream
        streaming
        streams
        street
        streets
        strength
        strengthen
        strengthening
        strengths
        stress
        stretch
        strict
        strictly
        strike
        strikes
        striking
        string
        strings
        strip
        stripes
        strips
        stroke
        strong
        stronger
        strongly
        struck
        struct
        structural
        structure
        structured
        structures
        struggle
        stuart
        stuck
        stud
        student
        students
        studied
        studies
        studio
        studios
        study
        studying
        stuff
        stuffed
        stunning
        stupid
        style
        styles
        stylish
        stylus
        su
        sub
        subaru
        subcommittee
        subdivision
        subject
        subjects
        sublime
        sublimedirectory
        submission
        submissions
        submit
        submitted
        submitting
        subscribe
        subscriber
        subscribers
        subscription
        subscriptions
        subsection
        subsequent
        subsequently
        subsidiaries
        subsidiary
        substance
        substances
        substantial
        substantially
        substitute
        subtle
        suburban
        succeed
        success
        successful
        successfully
        such
        suck
        sucking
        sucks
        sudan
        sudden
        suddenly
        sue
        suffer
        suffered
        suffering
        sufficient
        sufficiently
        sugar
        suggest
        suggested
        suggesting
        suggestion
        suggestions
        suggests
        suicide
        suit
        suitable
        suite
        suited
        suites
        suits
        sullivan
        sum
        summaries
        summary
        summer
        summit
        sun
        sunday
        sunglasses
        sunny
        sunrise
        sunset
        sunshine
        super
        superb
        superintendent
        superior
        supervision
        supervisor
        supervisors
        supplement
        supplemental
        supplements
        supplied
        supplier
        suppliers
        supplies
        supply
        support
        supported
        supporters
        supporting
        supports
        suppose
        supposed
        supreme
        sur
        sure
        surely
        surf
        surface
        surfaces
        surfing
        surge
        surgeon
        surgeons
        surgery
        surgical
        surname
        surplus
        surprise
        surprised
        surprising
        surrey
        surround
        surrounded
        surrounding
        surveillance
        survey
        surveys
        survival
        survive
        survivor
        survivors
        susan
        suse
        suspect
        suspected
        suspended
        suspension
        sussex
        sustainability
        sustainable
        sustained
        suzuki
        sv
        sw
        swap
        sweden
        swedish
        sweet
        swift
        swim
        swimming
        swing
        swingers
        swiss
        switch
        switched
        switches
        switching
        switzerland
        sword
        sydney
        symantec
        symbol
        symbols
        sympathy
        symphony
        symposium
        symptoms
        sync
        syndicate
        syndication
        syndrome
        synopsis
        syntax
        synthesis
        synthetic
        syracuse
        syria
        sys
        system
        systematic
        systems
        TEXT
    end 
end