Object=$(__alloc Class)
__set_instance_variable $Object name Object
Class=$(__alloc Class)
__set_instance_variable $Class name Class
__set_instance_variable $Class superclass $Object

__set_instance_variable $Object class $Class
__set_instance_variable $Class class $Class
