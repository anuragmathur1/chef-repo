# admin Credentials

default[jenkins-master][admin][username] = 'admin'
default[jenkins-master][admin][password] = 'admin'
default['jenkins-server']['security']['strategy'] = 'generate'
default['jenkins-server']['security']['chef-vault']['data_bag'] = 'jenkins-users'


# Plugins

default[jenkins-master][plugins] = {
  'git'
  'Bitbucket'
}
