notify { 'ensure apt update runs': } -> Exec[apt_update] -> Package <||>

hiera_include('classes')
