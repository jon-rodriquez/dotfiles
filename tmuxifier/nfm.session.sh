# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/Documents/GitHub/nfm-lending"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "nfm"; then

  # window to select project and open neovim
  new_window "dev"


  # start the crm backend and frontend. most used servers
  new_window "crm-servers"
  split_h
  select_pane 0
  run_cmd "cd crm/backend"
  run_cmd "npm run dev"
  select_pane 1
  run_cmd "cd crm/frontend"
  run_cmd "npm start"
 
  #split the window into 4 panes in grid layout
  new_window "microservices"
  split_h 
  select_pane 0
  split_v 
  select_pane 2
  split_v 

  #start a microservice in each pane
  select_pane 0
  run_cmd "cd user-server/backend"
  run_cmd "npm run dev"
  select_pane 1
  run_cmd "cd workflow"
  run_cmd "npm run dev"
  select_pane 2
  run_cmd "cd lead"
  run_cmd "npm start"
  select_pane 3


  #select the dev window
  select_window "dev"



fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
