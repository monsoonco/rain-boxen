class people::palimpsests {

  include people::palimpsests::params
  include people::palimpsests::files

  include people::palimpsests::applications::main
  include people::palimpsests::applications::gems
  include people::palimpsests::applications::npm
  include people::palimpsests::applications::sublime_text_3

  include people::palimpsests::config::dock
  include people::palimpsests::config::dotfiles
  include people::palimpsests::config::loginitems
  include people::palimpsests::config::osx

  notify { 'class people::palimpsests declared': }

}
