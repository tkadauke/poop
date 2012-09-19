Object=$(__alloc Class)
__set_instance_variable $Object __name Object
Class=$(__alloc Class)
__set_instance_variable $Class __name Class
__set_instance_variable $Class __superclass $Object

__set_instance_variable $Object __class $Class
__set_instance_variable $Class __class $Class
