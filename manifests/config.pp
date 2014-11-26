class scala::config(
  $installPath = $scala::installPath
){
  # Set enviroment variables
  file { "/etc/profile.d/scala.sh":
    content => template("scala/etc/profile.d/scala.sh.erb"),
    mode => '0755',
    owner => 'root',
    group => 'root'
  }
}