from ConfigParser import SafeConfigParser
config = SafeConfigParser()
config.read('config.ini')
print config.get('main','username')
print config.get('main','password') 
