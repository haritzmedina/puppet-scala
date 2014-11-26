class scala::package (
  $installPath = $scala::installPath
){

  include wget

  Exec {
    path    => ['/usr/bin', '/bin'],
  }

  # Get scala package
  wget::fetch { "download scala":
    source => $scala::packageURL,
    destination => "/tmp/scala.tgz",
    before => Exec['create install folder']
  }

  # Create install folder
  exec { 'create install folder':
    command => "mkdir -p $scala::destination",
    unless => "test -d $scala::destination",
    before => Exec['extract scala package']
  }

  exec { 'extract scala package':
    cwd => "/tmp",
    command => "tar xf /tmp/scala.tgz -C $scala::destination",
    unless => "test -d $installPath",
  }
}