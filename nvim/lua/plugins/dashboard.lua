return {
  {
    'goolord/alpha-nvim',
    config = function()
      math.randomseed(os.time())

      local alpha = require 'alpha'
      local dashboard = require 'alpha.themes.dashboard'

      -- Function to center quotes
      local function center_quote(quote)
        local max_width = 0
        for _, str in ipairs(quote) do
          max_width = math.max(max_width, #str)
        end

        local centered_strings = {}
        for _, str in ipairs(quote) do
          local leading_spaces = math.floor((max_width - #str) / 2)
          local trailing_spaces = max_width - leading_spaces - #str
          local centered_str = string.rep(' ', leading_spaces) .. str .. string.rep(' ', trailing_spaces)
          table.insert(centered_strings, centered_str)
        end

        -- Insert blank strings at start of table yea ik its scuffed
        table.insert(centered_strings, 1, '')
        table.insert(centered_strings, 1, '')
        return centered_strings
      end

      -- Set header
      dashboard.section.header.val = {
        [[       ,                              ]],
        [[       \`-._           __             ]],
        [[        \\  \-..____,.'  `.           ]],
        [[         :  )       :      :\         ]],
        [[          ;'        '   ;  | :        ]],
        [[          )..      .. .:.`.; :        ]],
        [[         /::...  .:::...   ` ;        ]],
        [[         `:o>   /\o_>        : `.     ]],
        [[        `-`.__ ;   __..--- /:.   \    ]],
        [[        === \_/   ;=====_.':.     ;   ]],
        [[         ,/'`--'...`--....        ;   ]],
        [[              ;                    ;  ]],
        [[          . '                       ; ]],
        [[        .'     ..     ,      .       ;]],
        [[       :       ::..  /      ;::.     |]],
        [[      /      `.;::.  |       ;:..    ;]],
        [[     :         |:.   :       ;:.    ; ]],
        [[     :         ::     ;:..   |.    ;  ]],
        [[      :       :;      :::....|     |  ]],
        [[      /\     ,/ \      ;:::::;     ;  ]],
        [[    .:. \:..|    :     ; '.--|     ;  ]],
        [[   ::.  :''  `-.,,;     ;'   ;     ;  ]],
        [[.-'. _.'\      / `;      \,__:      \ ]],
        [[`---'    `----'   ;      /    \,.,,,/ ]],
        [[                   `----`             ]],
        [[                                      ]]
      }

      local quotes = {
        { 'As seen on TV!' },
        { 'Awesome!' },
        { '100% pure!' },
        { 'May contain nuts!' },
        { 'More polygons!' },
        { 'Sexy!' },
        { 'Limited edition!' },
        { 'Flashing letters!' },
        { 'Made by Notch!' },
        { "It's here!" },
        { 'Best in class!' },
        { "It's finished!" },
        { 'Kind of dragon free!' },
        { 'Excitement!' },
        { 'More than 500 sold!' },
        { 'One of a kind!' },
        { 'Heaps of hits on YouTube!' },
        { 'Indev!' },
        { 'Spiders everywhere!' },
        { 'Check it out!' },
        { 'Holy cow, man!' },
        { "It's a game!" },
        { 'Made in Sweden!' },
        { 'Uses LWJGL!' },
        { 'Reticulating splines!' },
        { 'Minecraft!' },
        { 'Yaaay!' },
        { 'Singleplayer!' },
        { 'Keyboard compatible!' },
        { 'Undocumented!' },
        { 'Ingots!' },
        { 'Exploding creepers!' },
        { "That's no moon!" },
        { 'l33t!' },
        { 'Create!' },
        { 'Survive!' },
        { 'Dungeon!' },
        { 'Exclusive!' },
        { "The bee's knees!" },
        { 'Down with O.P.P.!' },
        { 'Closed source!' },
        { 'Classy!' },
        { 'Wow!' },
        { 'Not on steam!' },
        { 'Oh man!' },
        { 'Awesome community!' },
        { 'Pixels!' },
        { 'Teetsuuuuoooo!' },
        { 'Kaaneeeedaaaa!' },
        { 'Now with difficulty!' },
        { 'Enhanced!' },
        { '90% bug free!' },
        { 'Pretty!' },
        { '12 herbs and spices!' },
        { 'Fat free!' },
        { 'Absolutely no memes!' },
        { 'Free dental!' },
        { 'Ask your doctor!' },
        { 'Minors welcome!' },
        { 'Cloud computing!' },
        { 'Legal in Finland!' },
        { 'Hard to label!' },
        { 'Technically good!' },
        { 'Bringing home the bacon!' },
        { 'Indie!' },
        { 'GOTY!' },
        { "Ceci n'est pas une title screen!" },
        { 'Euclidian!' },
        { 'Now in 3D!' },
        { 'Inspirational!' },
        { 'Herregud!' },
        { 'Complex cellular automata!' },
        { 'Yes, sir!' },
        { 'Played by cowboys!' },
        { 'OpenGL 2.1 (if supported)!' },
        { 'Thousands of colors!' },
        { 'Try it!' },
        { 'Age of Wonders is better!' },
        { 'Try the mushroom stew!' },
        { 'Sensational!' },
        { 'Hot tamale, hot hot tamale!' },
        { 'Play him off, keyboard cat!' },
        { 'Guaranteed!' },
        { 'Macroscopic!' },
        { 'Bring it on!' },
        { 'Random splash!' },
        { 'Call your mother!' },
        { 'Monster infighting!' },
        { 'Loved by millions!' },
        { 'Ultimate edition!' },
        { 'Freaky!' },
        { "You've got a brand new key!" },
        { 'Water proof!' },
        { 'Uninflammable!' },
        { 'Whoa, dude!' },
        { 'All inclusive!' },
        { 'Tell your friends!' },
        { 'NP is not in P!' },
        { 'Music by C418!' },
        { 'Livestreamed!' },
        { 'Haunted!' },
        { 'Polynomial!' },
        { 'Terrestrial!' },
        { 'All is full of love!' },
        { 'Full of stars!' },
        { 'Scientific!' },
        { 'Not as cool as Spock!' },
        { 'Collaborate and listen!' },
        { 'Never dig down!' },
        { 'Take frequent breaks!' },
        { 'Not linear!' },
        { 'Han shot first!' },
        { 'Nice to meet you!' },
        { 'Buckets of lava!' },
        { 'Ride the pig!' },
        { 'Larger than Earth!' },
        { 'sqrt(-1) love you!' },
        { 'Phobos anomaly!' },
        { 'Punching wood!' },
        { 'Falling off cliffs!' },
        { '1% sugar!' },
        { '150% hyperbole!' },
        { 'Synecdoche!' },
        { "Let's dance!" },
        { 'Seecret Friday update!' },
        { 'Reference implementation!' },
        { 'Lewd with two dudes with food!' },
        { 'Kiss the sky!' },
        { '20 GOTO 10!' },
        { 'Verlet integration!' },
        { 'Peter Griffin!' },
        { 'Do not distribute!' },
        { 'Cogito ergo sum!' },
        { '4815162342 lines of code!' },
        { 'A skeleton popped out!' },
        { 'The Work of Notch!' },
        { 'The sum of its parts!' },
        { 'BTAF used to be good!' },
        { 'I miss ADOM!' },
        { 'umop-apisdn!' },
        { 'OICU812!' },
        { 'Bring me Ray Cokes!' },
        { 'Finger-licking!' },
        { 'Thematic!' },
        { 'Pneumatic!' },
        { 'Sublime!' },
        { 'Octagonal!' },
        { 'Une baguette!' },
        { 'Gargamel plays it!' },
        { 'Rita is the new top dog!' },
        { 'SWM forever!' },
        { 'Representing Edsbyn!' },
        { 'Matt Damon!' },
        { 'Supercalifragilisticexpialidocious!' },
        { 'Consummate V’s!' },
        { 'Cow Tools!' },
        { 'Double buffered!' },
        { 'Fan fiction!' },
        { 'Flaxkikare!' },
        { 'Jason! Jason! Jason!' },
        { 'Hotter than the sun!' },
        { 'Internet enabled!' },
        { 'Autonomous!' },
        { 'Engage!' },
        { 'Fantasy!' },
        { 'DRR! DRR! DRR!' },
        { 'Kick it root down!' },
        { 'Regional resources!' },
        { 'Woo, facepunch!' },
        { 'Woo, somethingawful!' },
        { 'Woo, /v/!' },
        { 'Woo, tigsource!' },
        { 'Woo, minecraftforum!' },
        { 'Woo, worldofminecraft!' },
        { 'Woo, reddit!' },
        { 'Woo, 2pp!' },
        { 'Google analyticsed!' },
        { 'Now supports åäö!' },
      }
    

      -- Set random quote
      dashboard.section.footer.val = center_quote(quotes[math.random(#quotes)])

      -- Set menu
      dashboard.section.buttons.val = {
        dashboard.button('f', '  > Find file', ':Telescope find_files<CR>'),
        dashboard.button('s', '  > Settings', ':Oil --float C:/Users/Lenovo/AppData/Local/nvim<CR>'),
        dashboard.button('q', '  > Quit NVIM', ':qa<CR>'),
      }

      -- Send config to alpha
      alpha.setup(dashboard.opts)

      -- Disable folding on alpha buffer
      vim.cmd [[
          autocmd FileType alpha setlocal nofoldenable
      ]]

      -- Keymap
      -- Open dashboard
      vim.api.nvim_set_keymap('n', '<leader>h', ':Alpha<CR>', { noremap = true, silent = true })
    end,
  },
}