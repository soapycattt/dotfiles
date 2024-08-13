return {
  {
    "goolord/alpha-nvim",
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      -- Set header
      -- dashboard.section.header.val = {
      --   "                                                     ",
      --   "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
      --   "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
      --   "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
      --   "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      --   "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      --   "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      --   "                                                     ",
      -- }

      dashboard.section.header.val = {
        "",
        "",
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣤⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣶⡶⣶⣶⣤⣀⣤⣤⣤⣤⡴⡶⢶⢶⣚⢿⣩⢳⡍⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣾⣿⣷⣻⡝⣿⣿⣿⣿⣻⢷⡹⣏⢷⡹⣎⢷⣣⣟⡆⢷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⣿⣗⡿⣿⠿⣷⣹⣳⡟⣧⢿⣏⢷⡻⣜⢏⠷⣙⡞⣻⣿⣿⡀⢟⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣷⢮⣿⣛⣾⣿⣳⢿⡽⣾⣹⢞⡷⢍⢎⡱⢣⣜⡱⣊⠷⣌⠃⠨⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣾⣿⣿⣿⣳⢯⣳⢏⣷⡯⠿⢞⣺⣒⣷⣋⡜⢧⢎⣕⠚⡠⣸⣿⣿⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⡂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⡿⣾⡷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⡿⣟⣿⣿⣿⣿⢿⣟⡷⢯⡻⠼⣯⣷⣦⣿⣿⣿⣿⣿⣷⣌⣎⢣⣜⣧⡔⢻⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠠⡏⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣻⡽⢛⣴⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⡹⢯⣷⢯⡟⣞⣯⢾⡹⢣⠍⡘⠉⠈⠙⠿⣿⣿⣿⣿⠟⣿⣿⣿⣿⣶⣿⣷⣟⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠺⣦⡀⣧⣄⣀⣀⣀⡀⠀⠀⠀⢠⣾⡿⣯⡿⣟⣶⡾⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⣟⡾⣟⣧⢻⣾⢽⣺⡼⢣⢣⠁⠄⠀⠀⠀⠀⠀⠞⠯⠟⠁⠂⠸⢿⡿⣿⣿⣿⣿⣿⣾⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢠⡀⠀⠀⠈⠻⣷⡈⠉⠩⠉⠄⠀⢀⣼⣿⢯⣷⢟⣽⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣶⡿⣟⣯⣟⡾⣟⣿⣞⡿⣞⣯⣷⢻⣍⠦⢩⠐⡀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣥⢻⢍⠻⣹⢾⣽⣿⣿⣿⣿⣦⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠊⠳⣄⠀⠀⠀⠈⠛⠃⠀⠀⢀⣴⣿⣿⡟⣟⣵⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⢿⣹⢟⣯⢷⢯⢿⡽⣾⣟⣿⣽⡶⣯⡟⣼⢫⢆⠳⣀⠐⠀⠀⠠⠄⠀⣀⣴⡀⢞⣮⢦⢃⡜⢋⡿⣿⣿⣿⣿⣿⣧⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠚⢷⡶⠶⢤⣬⣷⣄⡀⠀⠀⠀⢀⣴⣿⣿⢏⣟⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣛⣾⣹⡞⣽⣚⢿⣺⣽⣳⢿⣻⣿⣟⡷⣿⢯⣟⣮⢻⡡⣙⠀⠀⡗⢀⣿⢭⣿⣷⡾⢟⡂⢏⢣⢳⢿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠹⢦⡀⠀⠈⠉⠀⠀⠀⣠⣾⣿⣛⣞⣯⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⣾⣿⣿⣿⣿⣼⣳⢽⣣⢯⢷⣣⢯⡝⣯⠿⣽⢿⣻⣽⣯⣟⣾⣳⢿⡬⣍⠂⢅⡎⢿⣿⣿⣿⣿⣷⡿⣼⣏⣧⣋⣿⣿⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢠⣾⠛⠳⢦⡀⠀⠀⠈⠛⠁⠠⠂⠀⣠⣾⣿⢟⣧⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⢀⣸⣿⣿⣿⣿⣿⣿⣭⣷⡹⢎⢷⣊⠶⡹⢎⢻⡹⢞⣳⢛⢾⡹⣞⠽⣎⠳⠆⠂⠀⠘⠣⢞⡽⢻⠿⣿⣿⣿⣿⣾⣿⠿⠛⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢸⡌⠀⠀⠈⢻⡄⠀⠀⠀⠀⠀⢀⣶⣿⡿⢮⣿⠿⠋⠀⠀⠀⠀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⣾⣿⣿⣿⣿⣾⢿⣻⣿⣿⣿⣝⣎⠧⡓⢭⡘⠤⡑⢊⠔⠩⠆⠱⢌⠛⡌⠓⡌⠀⠀⠀⠀⠀⠈⠣⢟⡶⡹⢜⡩⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⡀⠀⠀⠀⠙⢶⣤⣤⠞⠀⠀⠀⠀⢀⣴⣿⡟⣵⣟⣯⣿⣶⣶⣶⣶⣾⣿⣿⣷⣤⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⣰⣿⢧⡿⣿⣿⣿⣿⣟⣿⣽⣻⢿⡾⣯⡝⢦⡘⢤⠉⠄⠠⢀⠐⠀⠂⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠁⠐⠓⠈⠑⣗⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢄⣠⡿⠉⢹⣗⣀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⢟⣧⣟⣻⣾⣿⣻⣯⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⢠⣿⣿⢯⡿⣽⢿⣿⣿⣿⣿⢾⣯⡻⣵⢣⡛⢦⡙⢦⠙⡢⢑⠢⠄⠠⠀⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢷⣴⠟⠉⢹⡏⠀⠀⠀⠀⠀⢀⣴⡿⣋⣿⣾⢻⡴⣫⣟⣾⣷⣯⣿⣿⣾⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⢀⣿⣿⣿⡿⣾⣽⣻⢿⣿⣿⣿⣿⣳⢿⣽⡖⡩⢆⠈⢂⠱⠀⢃⠐⠈⠁⠈⠀⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠀⢷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢷⣦⡿⠁⠀⠀⠀⠀⢰⣿⢫⣵⣿⡿⣼⣳⣿⣿⣿⢟⠻⠍⠀⢻⣞⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⢀⣾⣿⣿⣿⣟⣷⣻⣞⡿⣿⣿⣿⣷⣿⣻⣾⣿⡱⣀⠈⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⡄⠆⡄⠀⣻⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⣰⡟⣧⢿⣽⣷⣿⣿⣿⣿⠿⡍⠄⠂⠀⠀⠢⢝⣾⣻⣿⣿⣿⣿⣿⣿⣿⣿⣻⣽⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⢸⣿⣿⣿⣿⣿⣿⡷⣯⣟⣿⣻⣿⣽⣾⣟⡾⣽⣻⣶⣌⠄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⢀⠁⡄⡠⢀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡾⣿⣼⣿⣿⣿⣿⣿⡿⣟⢯⡟⣘⢦⠡⡀⠀⠐⡈⢶⢻⡷⣟⣿⣾⣟⣿⣯⣿⢿⣟⣿⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⢸⣿⣿⣿⣿⣿⣿⣽⡿⣽⣳⣟⣿⣯⣷⣿⣻⣗⣯⣿⣻⡴⢐⡀⠀⠀⠀⠀⠀⠀⡀⠠⠀⠀⠀⡠⠀⠀⠀⢠⠦⢏⠠⢑⢠⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣼⣟⣳⣿⣿⣿⣿⣿⣟⢯⡽⣹⢮⡽⣽⣎⠇⡔⠀⢂⠱⢌⡳⣽⣻⣞⡷⣿⣯⣷⡿⣿⣻⣿⢿⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀]],
        [[⢸⣿⣯⣿⣿⣿⣾⣟⡿⣷⣟⣾⢯⣿⣿⣿⢷⣻⣾⣳⣿⣹⣧⡜⢧⣌⢀⠃⠌⡐⢀⠂⠌⠐⠀⠁⢀⠄⠚⢀⠂⠄⠂⣌⠸⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣽⣿⣿⣿⣿⣿⣳⢏⡾⣱⢯⣷⣿⣿⣏⠖⠀⠈⡀⢊⠲⣹⢖⡿⣞⣿⣟⣾⣯⣿⣟⣯⣿⣿⣿⣿⣿⣀⠀⠀⠀⠀⠀⠀]],
        [[⠸⣿⣿⣷⣿⣷⣿⣯⣿⡷⣯⣿⣻⣽⣿⣿⣿⢯⣟⡷⣯⢷⡻⣞⣧⢞⣦⡉⢂⠐⠠⠈⢄⠂⡔⡈⢤⠈⠄⠁⠀⠀⠡⠀⢃⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⠏⣽⣿⣿⣿⣿⣿⣧⣛⢮⡳⢯⣿⣿⣿⡿⢎⠄⠀⠠⠐⡈⡕⣣⢏⡿⣽⢿⣾⣿⣽⣷⣿⣻⣿⣯⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀]],
        [[⠀⢻⣿⣿⣿⣿⣯⣿⣿⣿⣟⣷⣿⣽⣿⣿⣿⣿⣿⡿⣽⣫⠷⣯⢷⡋⡔⣳⠀⣦⠇⡱⢈⢆⣗⣫⣶⣯⠑⠀⠀⠐⠀⠁⣸⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⠟⠁⠀⣿⣿⣿⣿⣿⣿⢶⣫⣞⣽⣿⣿⣿⣿⡻⢌⠀⠀⠀⠡⡒⢥⣋⠾⣽⢯⣿⣯⣿⣿⣾⣿⡿⣿⣽⣷⣿⣻⣿⣿⣆⡀⠀⠀⠀]],
        [[⠀⠀⢻⣿⣷⣟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣳⣏⢿⡜⣧⢓⠰⣀⣾⢯⠲⣭⢷⡺⣼⣿⣿⣟⣦⠀⠀⠀⠀⠁⠰⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⡟⠁⠀⠀⠀⢻⣿⣿⣿⣿⣿⣿⣶⣿⣿⣿⣿⣿⢿⡑⢂⠀⠀⠈⡐⢡⢓⡼⣻⣭⣟⣷⡿⣯⣷⣿⣿⣿⣿⣿⣯⣿⢿⣽⡿⣿⡄⠀⠀⠀]],
        [[⠀⠀⠀⠘⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣳⡽⣎⡜⡳⢌⠂⣼⣿⢎⡱⡎⣖⣻⣿⣿⣿⣿⣿⢸⠀⠀⡆⠀⠂⣷⣘⡳⢶⡤⢤⣄⣀⡀⠀⠀⠀⠀⠀⠀⣠⣾⣿⡿⠁⠀⠀⠀⠀⠀⠈⠛⠿⠿⠿⢿⣿⣿⣿⣿⡟⡿⡜⠣⠘⠀⠀⢈⠀⢌⡱⢎⡵⣳⣻⢾⣽⣿⣿⣿⣿⣿⣿⡿⣷⡿⣯⣿⣯⣿⢿⣿⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣻⣟⡾⣱⢎⠵⣹⠀⢼⡗⢪⠱⢹⠹⠿⣿⣿⣿⣿⣿⢿⡀⠀⢄⡀⢄⣸⠷⠯⣷⣽⣧⣶⣤⣘⣍⡑⣲⡄⢀⣾⣿⡿⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡿⣽⡞⣝⠒⠩⠄⠂⠁⡀⠂⢌⢢⣙⢮⣳⢯⣿⣿⣟⣿⣾⣿⣿⣿⢿⣿⡿⣽⢯⣷⣻⡾⣿⣿⡀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠉⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣻⣿⣝⢮⣒⠹⡀⠋⢌⠐⠡⢂⡙⠒⢡⠘⡽⣿⣻⣿⣵⡠⣸⡇⠀⢼⡀⠀⠀⠀⠀⠉⠉⠛⠟⠓⢻⣿⣿⡿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⡟⡰⠙⡄⢉⠐⡐⡀⢂⠡⣉⠤⣓⢮⣳⢯⣿⣿⣿⣿⣿⣿⣿⣿⢿⡿⣯⣿⢯⣿⢾⣽⣟⣿⣿⣷⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠿⣿⣿⣿⣿⣿⣿⣷⣿⣯⣿⢾⣃⡓⠤⢉⠀⠈⠀⠀⠀⠀⠁⠌⠐⢣⢿⣽⣾⣳⡏⢠⠱⠘⣷⣄⡀⠀⠀⠀⠀⠀⣀⣴⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⢆⠭⢡⠐⡈⡐⢠⠐⣡⠲⣌⠶⣭⢿⣻⣿⣿⣯⣿⣟⣿⣿⣟⣿⡿⣟⣿⡽⣟⣾⣟⣾⣽⣷⣿⣿⡄⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠙⠻⢿⣿⣿⣻⣿⣿⣫⠷⣉⠖⠡⣾⣄⣄⣰⣂⣤⠅⠀⠀⢀⠠⠿⠿⠗⠻⣽⡂⢂⡐⡏⢿⢷⡶⣶⢦⣴⣿⣿⣋⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡈⢎⢂⠡⠄⡑⠂⠉⠤⡓⢼⣙⣾⣻⢿⣽⣾⢿⣻⡿⣯⢿⡽⣯⣟⡿⣞⣽⣻⢾⣽⣾⣿⣿⣿⣿⡇⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿⣽⣏⠶⡉⣽⠟⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠻⣤⡉⣀⠂⠈⠹⠿⠦⣀⠒⠼⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣻⡐⡀⠢⡐⡀⠂⠉⠄⠃⠜⡱⢺⡜⣯⢻⠷⣯⢿⡝⣿⢽⣫⡝⡧⢏⡷⣫⢾⣽⣻⣾⣿⣿⣿⣿⣿⣧⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿⢺⡏⡔⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⢷⣄⣠⠐⢊⠄⣄⡋⢾⣵⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠁⡄⠡⠐⠡⠀⠁⠀⠂⢈⠒⡡⠞⣥⡛⢿⡸⢣⡛⣬⠓⡶⠹⡜⡭⣞⣽⣻⣾⢿⣿⣿⣿⣿⣿⣿⣿⡄]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣯⢧⣻⠔⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⠯⠽⠿⠤⠿⠿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⠀⠄⠡⠈⠄⠡⠈⠀⠀⠂⢌⠰⣉⠖⡙⢎⡱⢃⠱⡂⡝⡰⢩⢳⡹⡼⣞⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣎⠗⣚⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣭⣤⣥⣬⣤⣥⣣⢬⡤⣤⣆⣴⣤⢎⣭⢦⣴⣥⣶⣵⣬⣵⣻⣮⣷⣿⣽⣯⡿⣿⣿⣿⣿⣿⣿⣿⣿⡇]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⡷⢾⡱⠬⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      }
      alpha.setup(dashboard.opts)
    end,
  },
  {
    "folke/edgy.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>ue",
        function()
          require("edgy").toggle()
        end,
        desc = "Edgy Toggle",
      },
      -- stylua: ignore
      { "<leader>uE", function() require("edgy").select() end, desc = "Edgy Select Window" },
    },
    opts = function()
      local opts = {
        left = {
          {
            ft = "minifiles",
            pinned = true,
            size = { width = 1.0 },
            title = "Explorer",
            filter = function(buf, win)
              return vim.api.nvim_win_get_config(win).relative == ""
            end,
          },
        },
        right = {
          -- {
          --   ft = "aerial",
          --   pinned = true,
          --   open = "AerialOpen",
          --   title = "Outline",
          --   size = { width = 1.0 },
          --   filter = function(buf, win)
          --     return vim.api.nvim_win_get_config(win).relative == ""
          --   end,
          -- },
          {
            ft = "mini.map",
            pinned = true,
            title = "MiniMap",
            size = { width = 1.0 },
            filter = function(buf, win)
              return vim.api.nvim_win_get_config(win).relative == ""
            end,
          },
        },
        bottom = {
          {
            ft = "toggleterm",
            size = { height = 0.4 },
            filter = function(buf, win)
              return vim.api.nvim_win_get_config(win).relative == ""
            end,
          },
          {
            ft = "noice",
            size = { height = 0.4 },
            filter = function(buf, win)
              return vim.api.nvim_win_get_config(win).relative == ""
            end,
          },
          {
            ft = "lazyterm",
            title = "LazyTerm",
            size = { height = 0.4 },
            filter = function(buf)
              return not vim.b[buf].lazyterm_cmd
            end,
          },
          "Trouble",
          { ft = "qf", title = "QuickFix" },
          {
            ft = "help",
            size = { height = 20 },
            -- don't open help files in edgy that we're editing
            filter = function(buf)
              return vim.bo[buf].buftype == "help"
            end,
          },
          { title = "Spectre", ft = "spectre_panel", size = { height = 0.4 } },
          { title = "Neotest Output", ft = "neotest-output-panel", size = { height = 15 } },
        },
      }
      return opts
    end,
  },
  {
    "nvim-zh/colorful-winsep.nvim",
    event = { "WinLeave" },
    config = true,
  },
}
