class people::palimpsests::files (
  $my_sourcedir   = $people::palimpsests::params::my_sourcedir,
  $my_homedir     = $people::palimpsests::params::my_homedir,
  $my_username    = $people::palimpsests::params::my_username
) {

  file { "${my_homedir}/bin":
    ensure  => directory,
  }

  file { "${my_homedir}/tmp":
    ensure  => link,
    target  => "/tmp",
  }

  file { "${my_homedir}/ephemeral":
    ensure  => directory,
  }

}
