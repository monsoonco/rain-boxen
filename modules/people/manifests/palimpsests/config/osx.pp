class people::palimpsests::config::osx {

  notify { 'class people::palimpsests::config::osx declared': }

  exec { 'Show the ~/Library folder':
    command => "chflags nohidden ${my_homedir}/Library",
  }

  exec { 'Restart automatically if OS X freezes':
    command => 'systemsetup -setrestartfreeze on',
  }

  # include osx::animations
  include osx::dashboard
  include osx::desktop
  include osx::disable_gatekeeper
  include osx::disable_naturalscroll
  include osx::diskutility
  include osx::dock
  include osx::finder
  include osx::keyboard
  include osx::missioncontrol
  include osx::mouse
  include osx::safari
  include osx::screen
  include osx::system
  include osx::terminal
  include osx::textedit
  include osx::timemachine

}
