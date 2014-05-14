class people::palimpsests::applications::sublime_text_3 (
  $my_sourcedir   = $people::palimpsests::params::my_sourcedir,
  $my_homedir     = $people::palimpsests::params::my_homedir,
  $my_username    = $people::palimpsests::params::my_username
) {

  notify { 'class people::palimpsests::applications::sublime_text_3 declared': }

  include sublime_text_3

  define addpkg {
    $packagedir = "Library/Application Support/Sublime Text 3/Packages/"
    $pkgarray = split($name, '[/]')
    $pkgname = $pkgarray[1]

    exec { "git clone https://github.com/${name}.git":
      cwd      => "/Users/${::luser}/${packagedir}",
      provider => 'shell',
      creates  => "/Users/${::luser}/${packagedir}${pkgname}",
      path     => "${boxen::config::homebrewdir}/bin",
      require  => [Package['SublimeText3'], Class['git']],
    }
  }

  $base = "/Users/${::luser}/Library/Application Support"
  file { [
      "${base}/Sublime Text 3",
      "${base}/Sublime Text 3/Packages",
    ]:
    ensure => "directory"
  }->

  file { "${base}/Sublime Text 3/Packages/User":
    ensure  => link,
    target  => "${my_sourcedir}/dotfiles/sublime-text-3/Packages/User",
    require => Repository["dotfiles"],
  }

  addpkg {
    [
      "wbond/sublime_package_control",
      "aponxi/sublime-better-coffeescript",
      "billymoon/Stylus",
      "danro/LESS-sublime",
      "facelessuser/ApplySyntax",
      "kemayo/sublime-text-2-git",
      "nathos/sass-textmate-bundle",
      "SublimeLinter/SublimeLinter",
      "SublimeText/TrailingSpaces",
      "ttscoff/MarkdownEditing",
    ]:
  }

}
